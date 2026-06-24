# FRMCS arcKit — project memory

This repo is a living architecture-decision record set for the GSM-R → FRMCS transition and an agentic AI autonomous-oversight engagement, run with the arcKit method: outcome-anchored, ADR-recorded, evidence-logged, frozen to a daily baseline.

## Layout

- `current/` — the live working set. Edit these.
  - `ADR-001-gsmr-to-frmcs.md`, `ADR-002-agentic-governance.md` — decisions.
  - `traceability-matrix.md` — requirements ↔ decisions ↔ status (the spine).
  - `evidence-log.md` — dated evidence with trust tiers.
  - `incident-annex.md` — DB GSM-R outage, 23–24 Jun 2026.
  - `project/` — the engagement workspace (charter, governance/RACI, phase-gate, risks, ADR log).
  - `diagrams/`, `project/diagrams/` — svg + png.
- `baselines/<date>/` — frozen daily snapshots. **Never edit by hand** — they are the audit trail.
- `scripts/baseline.sh` — the freeze.

## Always

- Hold the outcome first: "safe, continuous rail operations." If a change no longer traces to it, cut it.
- Keep trust tiers honest (A primary · B vendor-promotional · C trade press · D aggregator). Mark opinion as opinion.
- Paraphrase source material in the evidence log; cite, never paste copyrighted text.
- Record every material decision as an ADR (use `current/project/04-adr-log.md` template) before acting on it.

## Never

- Never assert the EU AI Act high-risk classification as fact until verified vs Annex I + CCS TSI (it is seeded `watch`).
- Never blur the guardrail: this is autonomous **oversight, not control** — safety-critical actuation stays human-in-command.
- Never edit files under `baselines/`.

## Daily loop

1. Evidence arrives → append a row to `current/evidence-log.md` (next `E-YYYY-MM-DD-NN` id, trust tier, affected `Rn`, action: revise/validate/watch).
2. If it moves a decision → update the status column in `current/traceability-matrix.md` and the relevant ADR.
3. End of day → freeze: `bash scripts/baseline.sh` (writes `baselines/<date>/` with MANIFEST, a status snapshot, and a diff vs the previous baseline).

## Commands

- `bash scripts/baseline.sh` — cut today's baseline.
- `bash scripts/baseline.sh 2026-06-25` — cut for a specific date.
- Compare two days: open the two `baselines/<date>/BASELINE.md` files, or `diff` the matrices.
