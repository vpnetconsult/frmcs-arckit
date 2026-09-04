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
cp -r "$SRC/." "$DST/"

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
  o=$(grep -c '^[0-9]\{1,\}\. \[ \]' "$a" 2>/dev/null) || o=0
  d=$(grep -c '^[0-9]\{1,\}\. \[x\]' "$a" 2>/dev/null) || d=0
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
