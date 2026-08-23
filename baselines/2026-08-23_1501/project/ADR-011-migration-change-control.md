# ADR-011: Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run

**Status:** Accepted (ARB 2026-08-20/2) — settled internally; no external validation sought or available. See `07-arb-minute-2026-08-20-2.md` Resolution 2 (working session, engagement lead sole participant; NSA named in Deciders was not party — no such relationship exists; not usable in a safety case, a conformance submission, or any statement to a regulator). Ratified **with** two named travelling residuals: the Reg (EU) 2026/693 ch.-7 delta check, and the NeGSt-2013-as-applied-2026 citation discipline on the AUM — both before any external use.
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

## The classification scheme and gate matrix — the item-1 artefact

**Written 2026-08-20. Discharges action item 1 and ARB-2026-08-15 §Outstanding item 6 ("write the artefact"). This is the scheme the Decision above commits to; it operationalises, it does not extend.**

**Step 1 — class by blast radius × safety-criticality.** The proposer classes every change to a live bearer/core element before any work is scheduled:

- **Class A** — central/shared element: core network, registers (HLR/HSS/UDM), signalling-transfer/routing, network management, anything whose failure propagates network-wide. *The 23-June component was Class A.*
- **Class B** — node- or segment-scoped element: a BSC/RNC-equivalent, a regional aggregation element, a single interlocking's bearer interface.
- **Class C** — edge / non-vital: a single cab radio, a dispatcher terminal, a non-vital monitoring probe.

Safety-criticality overrides blast radius upward, never downward: a physically small element on the safety-carrying path (e.g. an interface into ETCS data transport) classes at least B regardless of scope.

**Step 2 — CSM-RA Art 4(2) significance determination.** Classification does not replace the legal test; it presumes its outcome and forces the documentation either way. The proposer assesses the six criteria — failure consequence, novelty, complexity, monitoring, reversibility, additionality — and records the determination (Reg (EU) 402/2013 Art 4; the proposer decides, E-2026-06-28-06):

- **Class A → presumed significant.** Rebutting the presumption requires the Step-3 estate asymmetry to apply, documented per Art 2(2)(b). Significant → full CSM RA + independent AsBo assessment (Arts 5/6).
- **Class B → assessed case-by-case**; the failure-consequence and additionality criteria decide. Either outcome is documented.
- **Class C → presumed not significant**; Art 2(2)(b) justification on file.

**Step 3 — estate asymmetry check (SUBSET-146, E-2026-08-01-15).** On the **FRMCS target**, a security-layer-only change (TLS layer) with a provably untouched safety layer (SS-037) may be classed *not significant* with the proof attached — the layer separation exists precisely for this. On the **legacy estate** there is no separation: the same functional change on an entangled element **defaults to Class-A significant**, and the absence of separation is recorded as an aggravating factor, never argued away.

**Step 4 — gate matrix.** Controls are cumulative downward (A includes B's, B includes C's):

| | Class A | Class B | Class C |
|---|---|---|---|
| **Timing** | 00:00–04:00 window only | 00:00–04:00 window only | normal maintenance |
| **Side** | inactive redundancy only, validate before switchover | inactive redundancy only | n/a |
| **Pre-change tests (ADR-007)** | silent-fault/failover injection + canary-by-segment, manual safety gate | failover injection on the touched segment | regression per element |
| **Safety-impact (ADR-004)** | per-change analysis at the SIL-4 boundary | per-change analysis where the safety path is touched | record-only |
| **Assessment** | full CSM RA + independent AsBo report | AsBo if significant; else Art 2(2)(b) documentation | Art 2(2)(b) documentation |
| **Approval gate** | highest gate — ARB + NSA | change board + test authority | maintenance approval, logged |
| **Entry conditions** | independent detection (PR5/R12) + vendor change-evidence (PR13) — both mandatory | vendor change-evidence where element is closed | — |
| **Rollback** | defined rollback to GSM-R / parallel-run before start | segment-level rollback defined | element restore |

**The security limb stays semi-quantitative and separate (E-2026-08-19-06).** A security assessment feeding this scheme never produces a number commensurable with a THR. It enters the gate as a **named hazard** under ADR-012's adjudication rule (decided 2026-08-20): classification proceeds on blast radius × safety-criticality as above, with the security finding attached in the safety vocabulary, and the register records which security risks are **accepted**, not only which are mitigated.

**Escalation rules.** (i) Any change whose blast-radius analysis is uncertain escalates one class — uncertainty about propagation *is* the Art 4(2) monitoring/complexity criterion biting. (ii) No declassification during an active incident or an open silent-fault investigation. (iii) A vendor-supplied "routine" patch to a closed Class-A element is still Class A — 23 June was exactly this shape.

**Step 5 — authorisation-trigger check, run in PARALLEL with Steps 2–4 and never inferred from them (added 2026-08-20, E-2026-08-20-28 — closes item 6).** A change can be CSM-RA *not significant* and still authorisation-triggering, and vice versa; three tests, three deciders, one change:

- **EU vehicle layer (interoperable vehicles):** categorise per **Reg (EU) 2018/545 Art 15(1)(a)–(d)** (entity managing the change decides; maintenance substitution exempt per Art 16(1)); category (d) = new authorisation on the **Dir 2016/797 Art 21(12)** criteria — TSI-parameter exceedance, possible adverse effect on the overall safety level, or a TSI requirement. The CCS TSI (2023/1695 ch. 7) contains **no blanket radio-fitment trigger**; RMR fitment mandates attach to area-of-use extension, ETCS-part rules to function-changing upgrades.
- **National layer (EIGV 2018/2020):** authorisation iff an **Anlage-4 measure** (§ 9(3)/(4)); trackside radio rows **4.1.6/4.1.7** (complete core / whole-chain RAN builds — an FRMCS trackside build triggers), vehicle rows **4.2** (Class-B/ZBS scope) incl. **4.2.2** first-time radio interfaces and **4.2.4.5** changes touching the *Notruffunktion beim Zugfunk*; the **4.2.3 below-threshold path** (wholly in-subsystem, interfaces unchanged, no wider effects, *bestimmte Stelle* certificate) is the designed exit and the one the BR 430 used (E-2026-08-20-26).
- **Scheduling consequence for the gate:** trackside works beyond maintenance carry the **§ 21 EIGV ten-week pre-start notification** with a mandatory Anlage-4 classification — item 5's cadence reconciliation absorbs this window alongside the Appendix-B deadlines (tension: ten weeks + highest-gate ARB review inside a six-month legal correction window).

**Open interfaces, named so the scheme is not mistaken for finished law:** the cadence fit against CCS TSI Appendix-B deadlines is item 5 (now including the ten-week Anzeige window); the ch.-7 delta of Reg (EU) 2026/693 is unchecked and is verified before any external use of Step 5.

**Worked sector example (2026-08-20, E-2026-08-20-26 — AutomatedTrain BR 430 retrofit):** DB Regio ran exactly this shape for a real vehicle change — SMS-embedded CSM-RA process, safety-relevance screening, **significance analysis by the NeGST method** (DLR; monitorability, innovation degree, failure consequences, complexity → failure-consequence/uncertainty matrix), 50 change points individually assessed, **all safety-relevant changes found not significant**, documented and checked *in Anlehnung an* EN 50129 by an independent specialised company. Live confirmation of the Art 2(2)(b) route this scheme encodes. **Cross-check completed same day (E-2026-08-20-27, NeGSt Schlussbericht read at source): Step 2 now carries the AUM as its named scoring reference** — failure-consequence class tied to SIL (4/3/2/1 points) × uncertainty from innovation+complexity, yellow zone decided by reversibility and monitorability, **sum ≥ 6 = significant, < 6 = not significant** (Network Rail → DB → NeGSt lineage; in current DB use per the BR 430 assessment). **Two rules attach: (i) additionality — the sixth Art 4(2) criterion — is NOT in the AUM sum and stays a standalone escalator in this scheme (a change scoring < 6 alone can still be significant in combination with concurrent changes); (ii) currency — the method is cited as NeGSt-2013-as-applied-2026, and its point values are checked against the current CSM-RA text before any external use.**

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
**⚠️ Methodological caveat on classifying security changes alongside safety changes (added 2026-08-19, E-2026-08-19-06).** This ADR's "one gate for change" is right as **governance** — one decision point, one change record — but the two limbs feeding it do **not** share a risk calculus. Functional safety deals with **hazards** carrying quantified probabilities (THR/TFFR, SIL); IT/OT security deals with the **risk of threats**, and **a threat's occurrence probability cannot be expressed as a decimal fraction because an attack does not follow a stochastic process.** Security is therefore assessed **semi-quantitatively**: TS 50701 scores **exposure and vulnerability on levels 1–3**; DIN VDE V 0831-104, following IEC 62443, scores the attacker's **knowledge, resources and motivation**. **Consequence: the change-classification scheme at item 1 must not imply that a CSM-RA significance determination and a security threat assessment produce commensurable numbers. Classify on blast radius and safety-criticality as planned, but carry the security limb as a distinct, explicitly semi-quantitative input — and record which risks are ACCEPTED, not only which are mitigated (100% protection cannot exist, and countermeasures come from limited financial and human resources).**

1. [x] `[D]` ~~Define the change-classification scheme (A/B/C by blast radius × safety-criticality) **mapped onto the CSM-RA Art 4(2) significance test**, and the per-class control/gate matrix (significant → full CSM RA + independent AsBo; not significant → documented justification per Art 2(2)(b)). **Credit the SUBSET-146 safety/security-layer separation (E-2026-08-01-15):** a security-layer-only change on the FRMCS target with a provably untouched safety layer may be classed *not significant*; the same functional change on an entangled legacy element defaults to Class-A significant.~~ — **WRITTEN 2026-08-20: see §"The classification scheme and gate matrix" above.** The scheme carries the SUBSET-146 asymmetry, the semi-quantitative security limb (E-2026-08-19-06 caveat honoured — no common risk currency implied), and names its two open interfaces (items 5 and 6). Discharges ARB-2026-08-15 §Outstanding item 6. **This ADR's central artefact now exists; the remaining `[D]` content is item 6's national-trigger fold-in.**
2. [ ] `[I]` Codify the inactive-redundancy-only rule + maintenance window as binding (from DB countermeasures, E-2026-06-27-02/-03).
3. [ ] `[I]` Tie the pre-change test gate to ADR-007 (failover injection + canary-by-segment) and ADR-004 (per-change safety-impact analysis).
4. [ ] `[I]` Add the detection precondition (PR5/R12) and the vendor change-evidence requirement (PR13) as entry conditions.
5. [ ] `[I]` Reconcile the per-change gate cadence with the **CCS TSI Appendix-B error-correction deadlines** (Reg (EU) 2026/693: ≤6 months for new-authorisation changes / ≤1 year in-operation; pre/post-1-June-2026 legal-release split) — the policy's classification+gate overhead must fit inside these binding windows (E-2026-08-01-11); tension to watch: a Class-A change needing the highest ARB+NSA gate vs a 6-month legal deadline.
6. [x] `[D]` **CLOSED 2026-08-20 (E-2026-08-20-28) — the trigger is established at source and folded into the scheme as Step 5.** Current instruments: EIGV (2018, amended 2020) + ESiV (2020) — the 2007 texts confirmed superseded. The determination: **an FRMCS retrofit is not categorically "major upgrading" — it is categorisation-dependent, and the ratified two-stage pattern splits along the legal line**: stage 1 engineerable below both the EU (2018/545 15(1)(a)/(b)) and national (Anlage 4 § 4.2.3) thresholds; stage 2 concentrates the trigger (the MCX migration of the railway emergency call touches the nationally listed *Notruffunktion beim Zugfunk*), exercised **once per type** via Art 15 type-versioning — the *Serienzulassung* arithmetic. Trackside FRMCS builds trigger nationally (4.1.6/4.1.7) with the § 21 ten-week notification clock. Residual (named in Step 5): check Reg (EU) 2026/693's ch.-7 delta before external use. *Original item retained for the trail:* ~~**Establish the NATIONAL authorisation trigger and reconcile it with the CSM-RA significance test (NEW 2026-08-18, E-2026-08-18-03/-04).** This ADR models the EU-level **CSM-RA Art 4(2) significance** test. German interoperability law carries a **second, separate** test — whether works constitute **"major upgrading or renewal" of a structural subsystem**, which triggers an **authorisation for putting into service granted by the safety authority**, on written notification, with a **statutory determination window** (ten weeks in the 2007 text). **Two tests, two authorities, one change — and this ADR currently models one.** **Do NOT rely on the 2007 texts on file: they are superseded** (their TSI definition still points at Directives 96/48/EC and 2001/16/EC, recast twice since, latterly by Dir (EU) 2016/797). Obtain the **current** interoperability order and ESiV from the Bundesgesetzblatt, determine whether an **FRMCS retrofit** is "major upgrading" — decisive for R13/ADR-009, since it would put an EBA authorisation and its clock on the critical path of a ~16-21k-vehicle programme — and fold the answer into the change-classification scheme at item 1. **Acquisition target sharpened 2026-08-20 (E-2026-08-20-26): the operative instrument is the EIGV (Eisenbahn-Inbetriebnahmegenehmigungsverordnung) — the AutomatedTrain BR 430 retrofit runs in the public network as measurement runs precisely because it stays below the EIGV authorisation threshold (§ 15(4) named). Obtain the current EIGV alongside the ESiV; the BR 430 case is a live example of a change engineered to stay below the trigger this item must locate.**~~
7. [x] `[D]` ~~ARB + NSA ratify; flip to Accepted.~~ — **ARB ratified 2026-08-20 (session 2, Resolution 2, `07-arb-minute-2026-08-20-2.md`). Settled internally; no external validation sought or available.** The PR12 risk-register link and the FRMCS-core extension (PR11) carry forward as `[I]` implementation under §To revisit.
