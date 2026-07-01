# ADR-007: Testing & canary strategy — prove R3/R4 by test, not assertion

**Status:** Proposed
**Date:** 2026-06-27
**Deciders:** Architecture Review Board · Infrastructure Manager (DB InfraGO interface) · NSA / safety authority liaison · Vpnet engagement lead (test & assurance)
**Depends on:** ADR-001 (FRMCS transition; R3/R4 resilience), ADR-002 (agentic oversight layer; autonomy ladder), ADR-004 (SIL-4 boundary — no actuation); relates to ADR-008 (autonomy-ladder authorisation)
**Affects requirements:** R3 (eliminate central SPOF), R4 (fail-soft), with bearing on R12 (awareness/detection) and R9/R10/R11 (the oversight agents under test)

## Context

The 23 June outage is now DB-confirmed (E-2026-06-27-01, corroborated by -02/-03): during planned maintenance a network-distribution component was swapped, which triggered a single software fault that **raised no alarm** — so the automatic failover to the (fully functional) redundant GSM-R **never engaged**, and recovery took ~90 minutes of manual work. The redundancy existed and worked; its **trigger had never been exercised against a fault that stays silent**.

That is the whole lesson for assurance: **R3 (no central SPOF) and R4 (fail-soft) cannot be asserted — they must be proven by test.** Specifically, the test must show that redundancy *triggers* under a hidden fault, not merely that it *exists*. Calculated availability is not evidence: DB's own 2019 Stuttgart study showed very high calculated GSM-R availability (E-2026-06-25-02 §2.2.4, Tables 27–28) for the same estate that then failed on an untriggered failover.

A second force: the agentic oversight agents (ADR-002; R9–R12) must be validated before they touch anything. The autonomy ladder's lowest rung — **shadow / observe-only** — is realisable on GSM-R/2G **today**, so the agents can accrue evidence before FRMCS exists, within the ADR-004 no-actuation boundary.

## Decision

Adopt a **four-surface testing strategy feeding Gate G3**:

**(a) Incident-replay.** Offline replay of the silent-fault cascade (component swap → silent software fault → no alarm → failover not triggered). Proves the Risk Sentinel would flag it and the proposed FRMCS failover design triggers. Non-production. *Caveat (PR8): replay is inference-based until DB/EBA publish full telemetry — broaden the corpus when it lands.*

**(b) Shadow-on-legacy.** Oversight agents run **read-only** on the live GSM-R network/NMS; their outputs are **compared against reality, not acted on**. This is the autonomy ladder's **shadow rung**, available on 2G today — agents earn evidence with no actuation and no control (R9/R11 boundary; ADR-004).

**(c) Silent-fault / failover injection.** Deliberately inject **alarm-less** faults and verify that **detection-driven failover actually engages** — the exact gap from 23 June. Run in lab / test-ring; on production **only on the inactive redundancy side** (mirroring DB's own countermeasure: maintenance 00:00–04:00 on inactive redundancy, E-2026-06-27-02/-03). This is the core test: prove the trigger fires, not that the backup exists.

**(d) Canary-by-segment.** Staged **geographic** rollout of the bearer with a **manual safety gate per segment**; advance only on green criteria; rollback = revert that segment to GSM-R / parallel-run (ADR-001).

**Explicit constraint — no probabilistic canary on safety-critical traffic.** Classic percentage-of-traffic canary is **not permitted**: there is no SIL-4 rollback tolerance (you cannot expose a fraction of live movement-authority traffic to an unproven path and "roll back" after harm), and the central blast radius means a "small" probabilistic exposure is not small. **Canary here means canary-by-segment** with manual gates, under the parallel run so every segment retains its GSM-R fallback.

**Core principle: test that redundancy *triggers* under a hidden fault — not that it *exists*.**

## Options considered

### Option A — Assert resilience from design / availability calculations (status quo)
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | Low |
| Safety/assurance | Weak — this *is* the failure that occurred |
| Reversibility | n/a |
Pros: no test programme. Cons: exactly the 23 June mode — high calculated availability (E-2026-06-25-02 §2.2.4), but the silent-fault trigger never fired. **Rejected.**

### Option B — Four-surface test strategy feeding G3 (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | High |
| Cost | Medium–High |
| Safety/assurance | Strong — produces evidence the safety case + NSA can rely on |
| Reversibility | High — segment-level rollback to GSM-R parallel-run |
Pros: proves R3/R4 by test; shadow rung accrues agent evidence on 2G now; fault-injection-on-inactive-redundancy is live-compatible. Cons: build effort; replay fidelity limited until telemetry is published (PR8).

### Option C — Probabilistic canary (percentage of live traffic)
| Dimension | Assessment |
|---|---|
| Complexity | Medium |
| Cost | Medium |
| Safety/assurance | Unacceptable — no SIL-4 rollback tolerance; central blast radius |
| Reversibility | False — harm to live movement-authority traffic cannot be "rolled back" |
Pros: familiar from IT/cloud. Cons: impermissible for safety-critical traffic. **Rejected.**

## Trade-off analysis

The governing trade is **assurance strength vs cost/lead-time**. Asserting resilience (A) is cheapest and is precisely what failed on 23 June. Probabilistic canary (C) is operationally familiar but unacceptable for SIL-4 traffic. The four-surface strategy (B) costs more but is the only one that yields evidence a safety case and the NSA can rely on — and it front-loads value: the **shadow rung lets the agents earn evidence on 2G now**, and **fault-injection borrows DB's own inactive-redundancy safeguard**, so it is compatible with live infrastructure rather than waiting for FRMCS.

## Consequences

- **Easier:** R3/R4 move from *asserted* to *test-evidenced*; Gate G3 gets concrete entry/exit criteria; oversight agents (R9–R12) accrue evidence safely via shadow on 2G; aligns with ADR-004 (no actuation) and ADR-008 (autonomy ladder).
- **Harder:** building a representative replay corpus (PR8 — inference-based until DB/EBA telemetry); fault-injection needs a lab/test-ring plus strict inactive-redundancy discipline; canary-by-segment is slower than probabilistic rollout.
- **To revisit:** replay fidelity once DB/EBA publish telemetry; per-rung promotion criteria (ADR-008); the former ADR-007 *eval scope* (accuracy/drift/automation-bias) is now homed in **ADR-010** (drift → PR6; automation-bias → ADR-004/PR4; accuracy → ADR-010).

## Action items
1. [ ] Build the incident-replay corpus from the confirmed mechanism (E-2026-06-27-01/-02/-03); flag inference gaps (PR8); broaden when DB/EBA telemetry lands.
2. [ ] Stand up shadow-on-legacy: read-only agents on the GSM-R NMS + output-compare harness; define the shadow-rung exit criteria (dissent rate, accuracy) — links ADR-008.
3. [ ] Define the silent-fault / failover-injection catalogue (alarm-less fault classes); lab/test-ring first; production only on the inactive redundancy side (per DB countermeasure).
4. [ ] Define canary-by-segment gates: per-segment green criteria, manual safety gate, segment-level rollback to GSM-R parallel-run; record the no-probabilistic-canary rule as binding.
5. [ ] Set G3 entry/exit criteria from the four surfaces; ARB + NSA to ratify; flip ADR-007 to Accepted.
