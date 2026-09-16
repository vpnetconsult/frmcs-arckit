#!/usr/bin/env bash
# Freeze current/ into a dated baseline under baselines/<date>/.
# Writes a MANIFEST (sha256 + line counts), a BASELINE.md header with
# requirement-status counts, and a diff summary vs the previous baseline.
# Usage: scripts/baseline.sh [YYYY-MM-DD]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/current"
DATE="${1:-$(date +%F)}"
DST="$ROOT/baselines/$DATE"

# Allow re-baselining the same day without clobbering: suffix with time,
# and with seconds if even that collides. A baseline is never overwritten.
if [ -e "$DST" ]; then
  DST="$ROOT/baselines/${DATE}_$(date +%H%M)"
  if [ -e "$DST" ]; then
    DST="$ROOT/baselines/${DATE}_$(date +%H%M%S)"
  fi
  # stderr, not stdout: this redirection notice must survive `baseline.sh >/dev/null`.
  # Silenced on stdout it once caused the freeze to be read from the WRONG directory
  # (the earlier same-day baseline), and the stale numbers to be mistaken for a script
  # defect. The note is the only thing telling you where the freeze actually went.
  echo "Note: $DATE baseline exists; writing $DST instead." >&2
fi
if [ -e "$DST" ]; then
  echo "Refusing to overwrite existing baseline: $DST" >&2
  exit 1
fi

mkdir -p "$DST"
# Copy structure first, then every file byte-for-byte with `cat` (added 2026-09-04).
# NOT `cp -r`: on this workspace cp silently produced correct-SIZE, all-NUL files for
# anything recently rewritten — cp and `cp --sparse=never` both yielded 0 non-NUL
# bytes from a 29 kB source, while cat and tar yielded it intact. That points at cp's
# copy_file_range/reflink fast path reporting success without moving data. tar was
# tried and trips its own "Directory renamed before its status could be extracted"
# quirk here, so the copy is done explicitly with the one method proven to work.
( cd "$SRC" && find . -mindepth 1 -type d -print ) | while IFS= read -r d; do
  mkdir -p "$DST/${d#./}"
done
( cd "$SRC" && find . -type f -print ) | while IFS= read -r f; do
  cat "$SRC/${f#./}" > "$DST/${f#./}"
done
sync 2>/dev/null || true

# --- Verify the copy before anything is computed over it (added 2026-09-04) ---
# On 2026-09-04 thirteen files across six baselines were frozen as the correct SIZE
# but entirely NUL bytes: the copy's metadata landed and its data did not. The
# corruption was NON-DETERMINISTIC, survived `sync`, and hit whichever files had just
# been rewritten. It was invisible because every counter below reads the FROZEN copy —
# so a zeroed ADR silently scored zero action items and no status, and the decision-
# health block reported drift that had not happened.
# A silently corrupt baseline is worse than no baseline: this verifies, retries, and
# ABORTS rather than freezing bad data.
VERIFY_TRIES=3
attempt=1
MISMATCH=""
while [ "$attempt" -le "$VERIFY_TRIES" ]; do
  MISMATCH=$( cd "$SRC" && find . -type f | sed 's|^\./||' | sort | while IFS= read -r rel; do
      cmp -s "$SRC/$rel" "$DST/$rel" 2>/dev/null || printf '%s\n' "$rel"
    done )
  [ -z "$MISMATCH" ] && break
  echo "Note: baseline copy verification failed for $(printf '%s\n' "$MISMATCH" | grep -c .) file(s); re-copying (attempt $attempt/$VERIFY_TRIES)." >&2
  printf '%s\n' "$MISMATCH" | while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    mkdir -p "$DST/$(dirname "$rel")"
    cat "$SRC/$rel" > "$DST/$rel"   # not cp — see the note above the tar copy
  done
  sync 2>/dev/null || true
  attempt=$((attempt+1))
done

if [ -n "$MISMATCH" ]; then
  {
    echo "ERROR: baseline copy could not be verified after $VERIFY_TRIES attempts."
    echo "Files still differing from $SRC:"
    printf '%s\n' "$MISMATCH" | sed 's/^/  /'
    echo "Refusing to write a corrupt baseline. $DST is left in place for inspection —"
    echo "delete it once you have looked, then re-run. current/ is unaffected."
  } >&2
  exit 2
fi

# --- Manifest: file, sha256, lines, bytes ---
MAN="$DST/MANIFEST.tsv"
printf "file\tsha256\tlines\tbytes\n" > "$MAN"
( cd "$DST" && find . -type f ! -name MANIFEST.tsv ! -name BASELINE.md | sort | while read -r f; do
    h=$(sha256sum "$f" | cut -d' ' -f1)
    l=$(wc -l < "$f" | tr -d ' ')
    b=$(wc -c < "$f" | tr -d ' ')
    printf "%s\t%s\t%s\t%s\n" "${f#./}" "$h" "$l" "$b" >> "$MAN"
  done )

# --- Decision-health counters (added 2026-08-15) ---
# Deliberately computed over the FROZEN copy so the numbers match the snapshot.
ADR_TOTAL=0; ADR_ACC=0; ADR_PROP=0; AI_OPEN=0; AI_DONE=0
while IFS= read -r a; do
  [ -n "$a" ] || continue
  ADR_TOTAL=$((ADR_TOTAL+1))
  st=$(grep -m1 '^\*\*Status:\*\*' "$a" 2>/dev/null || true)
  case "$st" in *Accepted*) ADR_ACC=$((ADR_ACC+1)) ;; *Proposed*) ADR_PROP=$((ADR_PROP+1)) ;; esac
  # Lettered items (0b, 0c, 2b, 9b …) are real action items and were invisible to
  # the original pattern, which under-reported BOTH columns. Found 2026-09-04 when
  # closing item 0c moved the true count but not the reported one.
  # Indented items ("  1. [ ]" — ADR-014 writes its list two spaces in) were likewise
  # invisible; found 2026-09-16 when a hand count read 27 open against the block's 25.
  # Leading whitespace is now allowed. Only numbered items count — "- [ ]" bullets are
  # sub-notes, not action items, and stay excluded.
  o=$(grep -c '^[[:space:]]*[0-9]\{1,\}[a-z]\{0,1\}\. \[ \]' "$a" 2>/dev/null) || o=0
  d=$(grep -c '^[[:space:]]*[0-9]\{1,\}[a-z]\{0,1\}\. \[x\]' "$a" 2>/dev/null) || d=0
  AI_OPEN=$((AI_OPEN+o)); AI_DONE=$((AI_DONE+d))
done <<EOF
$(find "$DST" -type f -name 'ADR-0*.md' | sort)
EOF

EVF="$DST/evidence-log.md"
EV_TOTAL=$(grep -c '^| E-' "$EVF" 2>/dev/null) || EV_TOTAL=0
# Tolerate bold/whitespace around the action value: rows are hand-written and
# "| **revise** |" is as common as "| revise |". The 2026-08-18 baseline missed
# five rows for exactly this reason and under-reported the revise rate.
N_REV=$(grep -cE '\| *\*{0,2}revise\*{0,2} *\|' "$EVF" 2>/dev/null) || N_REV=0
N_VAL=$(grep -cE '\| *\*{0,2}validate\*{0,2} *\|' "$EVF" 2>/dev/null) || N_VAL=0
N_WAT=$(grep -cE '\| *\*{0,2}watch\*{0,2} *\|' "$EVF" 2>/dev/null) || N_WAT=0
N_ACT=$((N_REV+N_VAL+N_WAT))
RATE=0
[ "$N_ACT" -gt 0 ] && RATE=$((N_REV*100/N_ACT))

# --- Requirement-status counts (watch these shift day to day) ---
# Read only the status column (field 6) of requirement rows, not the whole row.
MX="$DST/traceability-matrix.md"
ROWS=$(awk -F'|' '$2 ~ /R[0-9]/ {print $6}' "$MX" 2>/dev/null || true)
count() { printf '%s\n' "$ROWS" | grep -c "$1" 2>/dev/null || true; }

{
  echo "# Baseline $DATE"
  echo
  echo "Frozen (UTC): $(date -u +'%Y-%m-%dT%H:%M:%SZ')"
  echo "Files: $(($(wc -l < "$MAN") - 1))"
  echo
  echo "## Requirement status snapshot"
  echo
  echo "| Status | Count |"
  echo "|---|---|"
  echo "| Accepted | $(count 'Accepted') |"
  echo "| Strengthened post-incident | $(count 'Strengthened') |"
  echo "| Open | $(count 'Open') |"
  echo "| Proposed | $(count 'Proposed') |"
  echo "| Recommended | $(count 'Recommended') |"
  echo
  echo "Evidence entries logged: $EV_TOTAL"
  echo
  echo "## Decision health"
  echo
  echo "The register's failure mode is decision drift: evidence accumulates while"
  echo "decisions stand still. These counters make that visible in every baseline"
  echo "instead of needing an audit to discover it. See evidence-log.md rule 4."
  echo
  echo "| Metric | Value |"
  echo "|---|---|"
  echo "| ADRs Accepted | $ADR_ACC of $ADR_TOTAL |"
  echo "| ADRs Proposed | $ADR_PROP of $ADR_TOTAL |"
  echo "| ADR action items closed / open | $AI_DONE / $AI_OPEN |"
  echo "| Evidence rows: revise | $N_REV |"
  echo "| Evidence rows: validate | $N_VAL |"
  echo "| Evidence rows: watch | $N_WAT |"
  echo "| **Revise rate** | **${RATE}%** |"
  if [ "$N_ACT" -ne "$EV_TOTAL" ]; then
    echo
    echo "> **⚠️ COUNTER RECONCILIATION FAILED: $N_ACT actioned rows vs $EV_TOTAL evidence rows.**"
    echo "> $((EV_TOTAL - N_ACT)) row(s) carry an action value this parser did not match."
    echo "> The revise rate above is UNDER-REPORTED — fix the parser before trusting it."
  fi
  echo
  if [ "$ADR_ACC" -eq 0 ] && [ "$ADR_TOTAL" -gt 0 ]; then
    echo "> **No ADR has ever been ratified.** Every decision in this register is still provisional."
  fi
  if [ "$RATE" -lt 10 ]; then
    echo "> **Revise rate below 10%.** Incoming evidence is almost never changing a decision."
    echo "> That is either a settled question or a disconnected wire — check which."
  fi
} > "$DST/BASELINE.md"

# --- Diff vs previous baseline (most recent dated dir before this one) ---
PREV=$(find "$ROOT/baselines" -mindepth 1 -maxdepth 1 -type d ! -path "$DST" \
        | sort | awk -v d="$(basename "$DST")" '$0 !~ d' | tail -1 || true)

if [ -n "${PREV:-}" ] && [ -f "$PREV/MANIFEST.tsv" ]; then
  {
    echo
    echo "## Changes vs $(basename "$PREV")"
    echo
    # added / removed / changed by comparing manifests (file + hash)
    join -t$'\t' -a1 -a2 -e MISSING -o '0,1.2,2.2' \
      <(tail -n +2 "$PREV/MANIFEST.tsv" | cut -f1,2 | sort) \
      <(tail -n +2 "$MAN"            | cut -f1,2 | sort) \
      | while IFS=$'\t' read -r f old new; do
          if   [ "$old" = MISSING ]; then echo "- added:   $f"
          elif [ "$new" = MISSING ]; then echo "- removed: $f"
          elif [ "$old" != "$new" ]; then echo "- changed: $f"
          fi
        done
    echo
    echo "### Living-doc diffs"
    for f in traceability-matrix.md evidence-log.md; do
      if [ -f "$PREV/$f" ] && ! diff -q "$PREV/$f" "$DST/$f" >/dev/null 2>&1; then
        echo
        echo "#### $f"
        echo '```diff'
        diff -u "$PREV/$f" "$DST/$f" | sed '1,2d' || true
        echo '```'
      fi
    done
  } >> "$DST/BASELINE.md"
fi

echo "Baseline written: $DST"
echo "See $DST/BASELINE.md"
