# ⚠️ THIS BASELINE CONTAINS CORRUPTED FILES — read before trusting anything in it

**Marker added 2026-09-04**, after the fault was found and fixed. **Nothing in this
directory has been modified.** This file is additive: the corrupt artifacts are left
exactly as frozen, because this register records its defects rather than tidying them
away, and because a baseline that was quietly repaired is no longer a baseline.

## What is wrong

The following file(s) were frozen at the **correct size** but consist **entirely of NUL
bytes** — zero content:

- `project/ADR-010-eval-strategy.md` — 31052 bytes, all NUL

## ⚠️ The MANIFEST does not help you — it attests the corruption

`MANIFEST.tsv` in this directory records the sha256 of the **corrupt** bytes, so the
manifest and the file agree. For a 31,052-byte all-NUL file that hash is
`7d2c027fb41522c6b81047ae0665a543bd3ef5128d4faa11225c6336e1862e7b`.
**Verifying this baseline against its own manifest will therefore PASS. The manifest is
internally consistent and attests to garbage.** That is the trap this marker exists to
spring.

## What it means for the numbers in BASELINE.md

Every decision-health counter is computed over the **frozen copy**. A zeroed ADR scores
**zero action items and no status**, silently. **The "ADRs Accepted" and "action items
closed / open" figures in this directory's `BASELINE.md` are therefore WRONG and must
not be quoted.** Across the affected freezes the reported figure drifted 9 → 7 → 8 of
11 ADRs Accepted; the true figure never moved from **9 of 11**. The requirement-status
snapshot and the evidence-row counts are unaffected, as those read files that were not
corrupted.

## Nothing was lost

The authoritative content is `current/` in this repository **at commit `37a3cc0`**,
which introduced this directory. `current/` was verified free of NUL corruption
throughout. To recover the true content of any file listed above:

```
git show 37a3cc0:current/<path> 
```

## Cause and fix

`cp -r` on this workspace silently produced correct-size, all-NUL files for anything
recently rewritten — its `copy_file_range`/reflink fast path reporting success without
moving data. Measured on a 29 kB source: `cp` and `cp --sparse=never` both yielded 0
non-NUL bytes; `cat` and `tar` yielded it intact. Non-deterministic, and it survived
`sync`.

Fixed in `scripts/baseline.sh` at commit **b551f4b**: the copy is now done with
`cat` per file, and a verification pass `cmp`s every file against `current/`,
re-copies mismatches up to three times, and **aborts rather than writing a baseline it
cannot vouch for**. The first clean freeze after the fix is `baselines/2026-09-04_143335`.

**Affected range: `2026-09-04_1319` through `2026-09-04_1407` — seven freezes, 15
zeroed files. Every earlier and later baseline is clean.**
