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

# Allow re-baselining the same day without clobbering: suffix with time.
if [ -e "$DST" ]; then
  DST="$ROOT/baselines/${DATE}_$(date +%H%M)"
  echo "Note: $DATE baseline exists; writing $DST instead."
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
  echo "Evidence entries logged: $(($(grep -c '^| E-' "$DST/evidence-log.md" 2>/dev/null || echo 0)))"
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
