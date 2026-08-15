# Baseline 2026-08-15

Frozen (UTC): 2026-08-15T15:56:19Z
Files: 67

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 3 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 338

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 0 of 9 |
| ADRs Proposed | 9 of 9 |
| ADR action items closed / open | 5 / 54 |
| Evidence rows: revise | 17 |
| Evidence rows: validate | 219 |
| Evidence rows: watch | 98 |
| **Revise rate** | **5%** |

> **No ADR has ever been ratified.** Every decision in this register is still provisional.
> **Revise rate below 10%.** Incoming evidence is almost never changing a decision.
> That is either a settled question or a disconnected wire — check which.

## Changes vs 2026-08-15

- changed: ADR-001-gsmr-to-frmcs.md
- changed: ADR-002-agentic-governance.md
- changed: evidence-log.md
- added:   project/06-ratification-readiness.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -354,9 +354,15 @@
 1. Add a row with the next `E-` id.
 2. Set the trust tier honestly (A–D). Discount vendor superlatives; mark opinion as opinion.
 3. Note which requirement(s) it touches and the action.
-4. If it changes a decision or status, also edit traceability-matrix.md and the relevant ADR, then note "revise" here.
+4. **Answer the decision question explicitly — MANDATORY, no row is complete without it (rule added 2026-08-15).** Every row must end with either:
+   - **`MOVES:`** — name the decision it changes (requirement status, ADR, action item), make that edit in `traceability-matrix.md` and/or the ADR **in the same sitting**, and set the action to `revise`; or
+   - **`NO DECISION MOVED — because …`** — and give the reason in one clause. "Corroborates an existing position", "below the evidence bar", "informational only", "plan not outcome" are all legitimate. **What is not legitimate is leaving the question unanswered**, because that is indistinguishable from not having asked it.
 5. At end of day, run `scripts/baseline.sh` to freeze the state.
 
+**Why rule 4 exists.** By 2026-08-15 this log held 338 rows against **0 of 9 ratified ADRs**, 55 open action items and 4 closed. Only **5%** of rows were actioned `revise`. The two founding ADRs had gone seven weeks without a read-back and had silently drifted — ADR-001 carried a switch-off date this log had itself marked superseded on day one, and ADR-002 asserted an EU AI Act high-risk posture that ADR-003 had disproved the same day it was written. Both defects were **visible in the evidence log the whole time**; nothing forced anyone to look. Written up in `linkedin-post-decision-drift.md`; repaired 2026-08-15.
+
+**The health metric.** `scripts/baseline.sh` now emits a decision-health block in every `BASELINE.md`: ADRs by status, action items open vs closed, and the **revise rate**. **Watch the revise rate.** If it sits near 5% while intake continues, the wire between evidence and decisions is disconnected — however good the log looks. A high `validate` share is not a sign of health; it is the signature of a register confirming what it already believed.
+
 ## Open threads to validate (carried forward)
 
 - ~~EU AI Act high-risk classification for rail-control AI (R10) — verify against Annex I and the CCS TSI interface.~~ **Resolved 2026-06-24** (E-2026-06-24-07): conditional, not automatic high-risk. Residual: confirm the Art 3(14) safety-component boundary holds in detailed design (ADR-003 action #5, ADR-004).
```
