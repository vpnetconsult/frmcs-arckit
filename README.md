# FRMCS arcKit — GSM-R → FRMCS transition assessment

A living architecture-decision record set with a daily-baseline workflow, so that as
feedback and news arrive the evidence can be revised and validated, and each day's
state is frozen to make the evolution visible.

## Structure

```
frmcs-arckit/
├── README.md                         this file
├── current/                          the live working set — edit during the day
│   ├── ADR-001-gsmr-to-frmcs.md      transition decision + arcKit assessment
│   ├── ADR-002-agentic-governance.md agentic decision & oversight layer
│   ├── traceability-matrix.md        requirements ↔ decisions ↔ status (the spine)
│   ├── evidence-log.md               dated evidence, trust tiers, affected requirements
│   ├── incident-annex.md             DB GSM-R outage, 23–24 Jun 2026
│   └── diagrams/                     agentic-governance + as-is/to-be/how (svg + png, light/dark)
├── baselines/                        frozen daily snapshots (created by the script)
│   └── <YYYY-MM-DD>/                 copy of current/ + MANIFEST.tsv + BASELINE.md
└── scripts/
    └── baseline.sh                   freeze current/ → baselines/<date>/ with diff
```

## Daily workflow

During the day — when feedback or news arrives:
1. Add a row to `current/evidence-log.md` (next `E-` id, trust tier A–D, affected requirement, action).
2. If it changes a decision or status, edit `current/traceability-matrix.md` (status column) and the relevant ADR.
3. Keep the trust tier honest: discount vendor superlatives, mark opinion as opinion.

End of day — freeze a baseline:
```
bash scripts/baseline.sh            # uses today's date
bash scripts/baseline.sh 2026-06-25 # or pass a date
```
This copies `current/` into `baselines/<date>/` and writes:
- `MANIFEST.tsv` — every file with sha256, line and byte counts.
- `BASELINE.md` — a requirement-status snapshot (counts of Accepted / Open / Proposed …), the number of evidence entries, and — from the second baseline onward — a diff vs the previous day: which files were added/removed/changed, plus a unified diff of the two living docs (`traceability-matrix.md`, `evidence-log.md`).

Over time, `baselines/` becomes the audit trail: open any two `BASELINE.md` files to see how the evidence and the requirement statuses moved.

## Two ways to run the loop

- **Self-service (recommended):** keep this folder locally (or in `ibn-core`), edit `current/`, run `scripts/baseline.sh` each evening.
- **Bring-it-back:** re-upload this folder (or the zip) at the end of the day; updates get applied to `current/` and a fresh baseline is cut.

## Git alternative

If kept under version control, a tag is an equivalent freeze:
```
git add -A && git commit -m "evidence update <date>"
git tag baseline-<date>
```
`git diff baseline-2026-06-24 baseline-2026-06-25 -- current/traceability-matrix.md`
shows the same evolution. The script and git tags can coexist.

## Conventions

- ADR numbers are placeholders — renumber to fit the `ibn-core` sequence before circulating.
- Registered address and contact (sales@vpnet.cloud) per house style; company no. 1650064-D.
- Status legend and trust tiers are defined in `traceability-matrix.md` and `evidence-log.md`.

## Project workspace (current/project/)

If the agentic-oversight engagement is awarded, `current/project/` holds the arcKit project setup — it is baselined daily alongside the assessment:

```
current/project/
├── 00-charter.md               outcome, mandate, scope (in/out), accountabilities
├── 01-governance-and-raci.md   cadence, boards, decision-class oversight, RACI, standards
├── 02-phase-gate-plan.md       P0–P5 phases, gate criteria, the autonomy ladder
├── 03-risk-register.md         seeded project risks tied to gates
├── 04-adr-log.md               ADR index + template (ADR-003+ open as phases begin)
└── diagrams/                   phase-gate flow (svg + png)
```

The traceability matrix and evidence log in `current/` are shared between the assessment and the project — the same spine carries both.
