# Counter note — additive annotation, files untouched

**This freeze's decision-health block reads "ADRs Accepted: 8 of 11". The true value is 9 of 11.**

The frozen files are correct and verified (MANIFEST matches, no zeroed files, `diff -rq` against `current/` empty at cut time). The error is in the *computed* block only: `scripts/baseline.sh` reads each ADR's Status line with `grep -m1`, and on this host `grep` is ugrep 7.8.4, which classifies a file as binary when a line longer than ~9 KB sits in its first buffer and stdout is not a terminal. `ADR-012`'s Status line — amended by ARB-2026-09-17 to 9,531 characters — tripped it, `grep` returned nothing, and ADR-012 was counted as neither Accepted nor Proposed. `grep -c` was unaffected, so 60 / 27 action items is right.

Fixed in `scripts/baseline.sh` (all register reads now `grep -a`), commit following `b118e96`. The recut `2026-09-19_1146/` carries the correct block over identical files. Per `CLAUDE.md` §Never, this freeze is not edited; this marker is the additive annotation the 2026-09-04 `CORRUPTED.md` precedent allows.

*2026-09-19*
