# ADR-011: Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run

**Status:** Proposed
**Date:** 2026-06-28
**Deciders:** Architecture Review Board · Infrastructure Manager (DB InfraGO interface) · NSA / safety authority liaison · Vpnet engagement lead
**Depends on:** ADR-001 (bridged dual-network parallel run), ADR-004 (SIL-4 boundary), ADR-007 (testing & canary); governs risks PR11–PR14
**Affects requirements:** R2 (no break in live service), R3 (eliminate central SPOF), R4 (fail-soft)

## Context

The bridged route (ADR-001) requires **sustained change activity on live, legacy, proprietary, safety-critical systems** for a decade-plus parallel run (see `migration-change-risk-assessment.md`). The 23 June outage is the worked example and is DB-confirmed at primary tier (E-2026-06-27-03): a *planned* change to a live legacy component triggered a singular software fault that **raised no alarm**, so automatic failover to the functional redundancy never engaged → nationwide standstill, ~90 min manual recovery.

DB responded with operational countermeasures — component-swap freeze pending a manufacturer fix; maintenance restricted to **00:00–04:00** and performed **only on the inactive redundancy**; manufacturer to fix the component (E-2026-06-27-02/-03). Those are sound but were applied **reactively**. PR12 (change-on-live-legacy) is the dominant migration-execution risk and is currently governed only by that reactive practice. This ADR records a **standing change-control policy** so the risk is governed by decision, not reaction.

## Decision

Adopt a **migration change-control policy** of five binding rules for any change to a live bearer/core element during the parallel run:

1. **Change classification.** Every change is classed by **blast radius × safety-criticality**:
   - **Class A** — central/shared element (core, registers, signalling-transfer/routing, anything network-wide).
   - **Class B** — node- or segment-scoped element.
   - **Class C** — edge / non-vital.
   The class drives the mandatory controls and gate (below).
2. **Inactive-redundancy-only rule.** No change to the **active** safety-carrying side. Class A/B changes are performed only on the **currently inactive** redundancy, then validated **before** switchover (DB countermeasure, E-2026-06-27-02/-03).
3. **Maintenance window.** Class A/B changes only in the low-traffic window (**00:00–04:00**), per the DB countermeasure.
4. **Pre-change test gate (ties ADR-007 / ADR-004).** No Class A/B change proceeds without: (a) **silent-fault / failover injection** proving detection-driven failover actually engages; (b) **canary-by-segment** with a manual safety gate — **no probabilistic canary on safety-critical traffic**; (c) a **per-change safety-impact analysis at the SIL-4 boundary** (ADR-004).
5. **Blast-radius limit + rollback.** Each change is bounded to one segment/element with a defined **rollback to GSM-R / parallel-run**. Class A (central/shared) changes require the **highest gate (ARB + NSA)** because there is no SIL-4 rollback tolerance once safety-critical traffic is exposed.

**Two preconditions** carried with the policy:
- **Detection precondition (PR5/R12).** No Class A change on a system that lacks fault detection capable of surfacing a *silent* fault — that absence is exactly what caused 23 June.
- **Vendor change-evidence (PR13).** For proprietary/closed code, require the supplier's test and Safety Application Condition evidence; do not accept change on a closed element without it (and flag end-of-life/defunct-vendor elements for support/escrow or replacement).

**Core principle: treat every change to live legacy safety-critical code as the primary migration hazard — class it, isolate it (inactive side), prove failover triggers, bound the blast radius, and never rely on a silent system to alarm itself.**

## Options considered

### Option A — Operational countermeasures only (status quo)
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | Low |
| Safety/assurance | Weak — reactive, ungoverned |
| Reversibility | n/a |
Pros: already in place (DB's freeze/windows/inactive-side). Cons: reactive, no classification or test gate, the silent-fault detection gap persists; PR12 ungoverned. **Rejected as insufficient alone.**

### Option B — Formal migration change-control policy (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | Medium (process) |
| Cost | Medium — reuses DB countermeasures + ADR-007 surfaces |
| Safety/assurance | Strong — governs the dominant proven risk |
| Reversibility | High — per-change segment rollback |
Pros: governs PR12/PR13 by decision; protects R2/R3/R4 across the route; elevates DB's countermeasures to standing policy. Cons: per-change overhead; central changes are slow (highest gate).

### Option C — Freeze all legacy changes until FRMCS cutover
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | High (deferred) |
| Safety/assurance | False comfort |
| Reversibility | — |
Cons: undeliverable — the bridge **requires** changes (interworking, retrofit, safety/obsolescence fixes); you cannot defer for a decade. **Rejected.**

## Trade-off analysis

The governing trade is **control rigour vs migration velocity**. Option A is cheapest and is precisely the reactive posture that failed on 23 June. Option C is undeliverable because the route is defined by change activity. Option B adds per-change overhead but governs the dominant, evidenced risk — and it largely reuses controls that must exist anyway (DB's countermeasures, the ADR-007 test surfaces, the ADR-004 boundary), so the marginal cost is the classification + gate process, not new machinery.

## Consequences

- **Easier:** PR12/PR13 governed by a recorded policy; R2/R3/R4 protected during the route; change impact traceable to gates; DB's reactive countermeasures elevated to a standing decision.
- **Harder:** per-change process overhead; depends on the ADR-007 test surfaces and the ADR-002/007 detection layer actually existing; Class A changes are deliberately slow.
- **To revisit:** class thresholds as FRMCS matures; extend the policy to **FRMCS-core** changes — PR11 reappears in the 5GC/IMS/UDM/HSS, so the same rules apply post-cutover.

## Action items
1. [ ] Define the change-classification scheme (A/B/C by blast radius × safety-criticality) and the per-class control/gate matrix.
2. [ ] Codify the inactive-redundancy-only rule + maintenance window as binding (from DB countermeasures, E-2026-06-27-02/-03).
3. [ ] Tie the pre-change test gate to ADR-007 (failover injection + canary-by-segment) and ADR-004 (per-change safety-impact analysis).
4. [ ] Add the detection precondition (PR5/R12) and the vendor change-evidence requirement (PR13) as entry conditions.
5. [ ] ARB + NSA ratify; link from PR12 in the risk register; extend the policy to FRMCS-core changes (PR11). Flip to Accepted.
