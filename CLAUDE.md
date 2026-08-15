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
- **Give load-bearing ADRs a review date and honour it.** A decision record that never changes is not stable, it is unattended — and "settled" and "stale" look identical from outside. ADR-001 and ADR-002 carry `Next review due`; quarterly.
- **Ratification is the ARB's act, not the author's.** Never flip an ADR Status to `Accepted` without a board decision to point at — a fabricated governance event in an audit trail is worse than an unratified decision. Separate **decision-shaped** action items (which block ratification) from **implementation** items (which do not); see `current/project/06-ratification-readiness.md`.

## Never

- Never assert the EU AI Act high-risk classification as fact until verified vs Annex I + CCS TSI (it is seeded `watch`).
- Never blur the guardrail: this is autonomous **oversight, not control** — safety-critical actuation stays human-in-command.
- Never edit files under `baselines/`.

## Daily loop

1. Evidence arrives → append a row to `current/evidence-log.md` (next `E-YYYY-MM-DD-NN` id, trust tier, affected `Rn`, action: revise/validate/watch).
2. **Answer the decision question explicitly — every row, no exceptions.** End the row with either `MOVES:` (name the decision, make the edit in `current/traceability-matrix.md` and/or the ADR **in the same sitting**, action = `revise`) or `NO DECISION MOVED — because …` with the reason in one clause. Legitimate reasons: corroborates an existing position, below the evidence bar, informational, plan-not-outcome. **Leaving it unanswered is not legitimate** — it is indistinguishable from never having asked.
3. End of day → freeze: `bash scripts/baseline.sh` (writes `baselines/<date>/` with MANIFEST, a status snapshot, a **decision-health block**, and a diff vs the previous baseline).
4. **Read the decision-health block.** If `revise rate` sits near 5%, or `ADRs Accepted` stays at 0, the wire between evidence and decisions is disconnected — a full log is not evidence of health.

**Why (2026-08-15).** At 338 rows the register had **0 of 9 ADRs ratified**, 55 open action items, 4 closed, and a 5% revise rate. Both founding ADRs had drifted: ADR-001 carried a GSM-R switch-off date the evidence log had itself marked superseded **on day one**, and ADR-002 asserted an EU AI Act high-risk posture that ADR-003 disproved **the same day it was written**. Both were visible in the log the entire time; nothing forced anyone to look. See `current/linkedin-post-decision-drift.md` and `current/project/06-ratification-readiness.md`.

## Commands

- `bash scripts/baseline.sh` — cut today's baseline.
- `bash scripts/baseline.sh 2026-06-25` — cut for a specific date.
- Compare two days: open the two `baselines/<date>/BASELINE.md` files, or `diff` the matrices.
