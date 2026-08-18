# ADR-011: Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run

**Status:** Proposed
**Date:** 2026-06-28
**Deciders:** Architecture Review Board · Infrastructure Manager (DB InfraGO interface) · NSA / safety authority liaison · Vpnet engagement lead
**Depends on:** ADR-001 (bridged dual-network parallel run), ADR-004 (SIL-4 boundary), ADR-007 (testing & canary); governs risks PR11–PR14
**Affects requirements:** R2 (no break in live service), R3 (eliminate central SPOF), R4 (fail-soft)
**Legal basis:** Common Safety Method for Risk Evaluation & Assessment — Commission Implementing Reg (EU) 402/2013, Art 4(2) significance test + Arts 5/6 (mandatory independent assessment by an assessment body / AsBo where a change is significant), under the Railway Safety Directive (Dir (EU) 2016/798). Verified vs primary law — E-2026-06-28-06. **Cadence skeleton (E-2026-08-01-16 / E-2026-08-01-11):** the CCS TSI — **base Reg (EU) 2023/1695, Appendix B (transition regimes)**, as refined by Reg (EU) 2026/693 — puts **error-correction implementation deadlines into binding EU law** — where registered errors (RINF) require a new authorisation, the CCS subsystem must implement the corrections **≤6 months** after the interoperability-constituent update; in-operation subsystems **≤1 year**; with legal releases distinguished pre/post 1 June 2026 (partial vs full maintenance package). This is the legal deadline structure the policy below operates within — the significance test governs *how* a change is assessed, Appendix B governs *by when* error corrections must land.

## Context

The bridged route (ADR-001) requires **sustained change activity on live, legacy, proprietary, safety-critical systems** for a decade-plus parallel run (see `migration-change-risk-assessment.md`). The 23 June outage is the worked example and is DB-confirmed at primary tier (E-2026-06-27-03): a *planned* change to a live legacy component triggered a singular software fault that **raised no alarm**, so automatic failover to the functional redundancy never engaged → nationwide standstill, ~90 min manual recovery.

DB responded with operational countermeasures — component-swap freeze pending a manufacturer fix; maintenance restricted to **00:00–04:00** and performed **only on the inactive redundancy**; manufacturer to fix the component (E-2026-06-27-02/-03). Those are sound but were applied **reactively**. PR12 (change-on-live-legacy) is the dominant migration-execution risk and is currently governed only by that reactive practice. This ADR records a **standing change-control policy** so the risk is governed by decision, not reaction.

This policy is **not a bespoke invention — it operationalises existing EU rail-safety law.** The CSM-RA (Reg (EU) 402/2013, verified vs primary law in E-2026-06-28-06) already requires the proposer to assess every change for **significance** against six Art 4(2) criteria — failure consequence, novelty, complexity, monitoring, reversibility, additionality — and, where a change is **significant**, to run a structured risk assessment with **independent assessment by an assessment body (AsBo)** (Arts 5/6); where **not significant**, to keep adequate documentation justifying that decision (Art 2(2)(b)). The failure this ADR guards against is therefore a **mis-classification** — treating a significant change as routine maintenance. The rules below bind that legal significance test into the migration's change classes and gates.

## Decision

Adopt a **migration change-control policy** of five binding rules for any change to a live bearer/core element during the parallel run:

1. **Change classification.** Every change is classed by **blast radius × safety-criticality**:
   - **Class A** — central/shared element (core, registers, signalling-transfer/routing, anything network-wide).
   - **Class B** — node- or segment-scoped element.
   - **Class C** — edge / non-vital.
   The class drives the mandatory controls and gate (below). Classification **applies the CSM-RA Art 4(2) significance test**: a change assessed **significant** (typically Class A, and Class B where the criteria bite) triggers the **full CSM RA process** — structured risk assessment + **independent AsBo assessment** (Arts 5/6); a change assessed **not significant** must still carry **documented justification** for that decision (Art 2(2)(b)). By the failure-consequence and reversibility criteria, a change to a central/shared element is hard to defend as "routine maintenance."
2. **Inactive-redundancy-only rule.** No change to the **active** safety-carrying side. Class A/B changes are performed only on the **currently inactive** redundancy, then validated **before** switchover (DB countermeasure, E-2026-06-27-02/-03).
3. **Maintenance window.** Class A/B changes only in the low-traffic window (**00:00–04:00**), per the DB countermeasure.
4. **Pre-change test gate (ties ADR-007 / ADR-004).** No Class A/B change proceeds without: (a) **silent-fault / failover injection** proving detection-driven failover actually engages; (b) **canary-by-segment** with a manual safety gate — **no probabilistic canary on safety-critical traffic**; (c) a **per-change safety-impact analysis at the SIL-4 boundary** (ADR-004); (d) for any change assessed **significant** under CSM-RA, an **independent assessment by an assessment body (AsBo)** with a safety assessment report (Reg (EU) 402/2013 Arts 5/6) — internal sign-off is not sufficient.
5. **Blast-radius limit + rollback.** Each change is bounded to one segment/element with a defined **rollback to GSM-R / parallel-run**. Class A (central/shared) changes require the **highest gate (ARB + NSA)** because there is no SIL-4 rollback tolerance once safety-critical traffic is exposed.

**Two preconditions** carried with the policy:
- **Detection precondition (PR5/R12).** No Class A change on a system that lacks fault detection capable of surfacing a *silent* fault — that absence is exactly what caused 23 June. Detection must be **independent of the element's self-report** — e.g. out-of-band passive signalling monitoring per ITU-T Q.752 (E-2026-06-30-03).
- **Vendor change-evidence (PR13).** For proprietary/closed code, require the supplier's test and Safety Application Condition evidence; do not accept change on a closed element without it (and flag end-of-life/defunct-vendor elements for support/escrow or replacement).

**Core principle: treat every change to live legacy safety-critical code as the primary migration hazard — class it, isolate it (inactive side), prove failover triggers, bound the blast radius, and never rely on a silent system to alarm itself.**

**Target-architecture mitigation the legacy estate lacks (E-2026-08-01-15, primary + mandated).** The FRMCS-era CCS architecture builds in a structural answer to the hardest change-control problem — patching security without re-certifying safety. UNISIG **SUBSET-146 "ERTMS End-to-End Security" §3.1.1.6** (mandated in the CCS TSI, Table A2 index 10d) separates the **safety layer** (SS-037 Euroradio) from the **security layer** (TLS) precisely so that *"security of the communication [can be] updated without the need to re-approve any safety rating of the application."* This is the ERTMS-native, standardised resolution of the CRA-update-vs-safety-case tension: on the FRMCS target, a security patch runs on its own cadence and does **not** re-trigger the CSM-RA significance test for the safety function. The legacy GSM-R/proprietary estate has **no such separation** — security and safety are entangled in the same closed component, which is exactly why a change there (23 June) is a whole-system safety event. Consequence for this policy: **Class-A significance is asymmetric across the estate** — a security-layer change on the FRMCS target may be defensibly *not significant* (documented per Art 2(2)(b)) where the safety layer is provably untouched, whereas the same functional change on the entangled legacy element is Class-A significant by default. The policy should credit the SUBSET-146 layer separation as a mitigating design fact on the target, and treat its **absence** as an aggravating factor on the legacy side.

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
- **Design lever (E-2026-08-01-15):** where the target architecture provides the SUBSET-146 safety/security-layer separation, prefer designs that keep security-relevant change **inside the security layer** so it stays out of the safety re-approval scope — the cheapest lawful way to sustain a fast security-patch cadence under CRA/NIS-2 without repeatedly re-running the CSM-RA significance process.

## Action items
1. [ ] Define the change-classification scheme (A/B/C by blast radius × safety-criticality) **mapped onto the CSM-RA Art 4(2) significance test**, and the per-class control/gate matrix (significant → full CSM RA + independent AsBo; not significant → documented justification per Art 2(2)(b)). **Credit the SUBSET-146 safety/security-layer separation (E-2026-08-01-15):** a security-layer-only change on the FRMCS target with a provably untouched safety layer may be classed *not significant*; the same functional change on an entangled legacy element defaults to Class-A significant.
2. [ ] Codify the inactive-redundancy-only rule + maintenance window as binding (from DB countermeasures, E-2026-06-27-02/-03).
3. [ ] Tie the pre-change test gate to ADR-007 (failover injection + canary-by-segment) and ADR-004 (per-change safety-impact analysis).
4. [ ] Add the detection precondition (PR5/R12) and the vendor change-evidence requirement (PR13) as entry conditions.
5. [ ] Reconcile the per-change gate cadence with the **CCS TSI Appendix-B error-correction deadlines** (Reg (EU) 2026/693: ≤6 months for new-authorisation changes / ≤1 year in-operation; pre/post-1-June-2026 legal-release split) — the policy's classification+gate overhead must fit inside these binding windows (E-2026-08-01-11); tension to watch: a Class-A change needing the highest ARB+NSA gate vs a 6-month legal deadline.
6. [ ] **Establish the NATIONAL authorisation trigger and reconcile it with the CSM-RA significance test (NEW 2026-08-18, E-2026-08-18-03/-04).** This ADR models the EU-level **CSM-RA Art 4(2) significance** test. German interoperability law carries a **second, separate** test — whether works constitute **"major upgrading or renewal" of a structural subsystem**, which triggers an **authorisation for putting into service granted by the safety authority**, on written notification, with a **statutory determination window** (ten weeks in the 2007 text). **Two tests, two authorities, one change — and this ADR currently models one.** **Do NOT rely on the 2007 texts on file: they are superseded** (their TSI definition still points at Directives 96/48/EC and 2001/16/EC, recast twice since, latterly by Dir (EU) 2016/797). Obtain the **current** interoperability order and ESiV from the Bundesgesetzblatt, determine whether an **FRMCS retrofit** is "major upgrading" — decisive for R13/ADR-009, since it would put an EBA authorisation and its clock on the critical path of a ~16-21k-vehicle programme — and fold the answer into the change-classification scheme at item 1.
7. [ ] ARB + NSA ratify; link from PR12 in the risk register; extend the policy to FRMCS-core changes (PR11). Flip to Accepted.
