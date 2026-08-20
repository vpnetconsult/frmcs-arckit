# ADR-007: Testing & canary strategy — prove R3/R4 by test, not assertion

**Status:** Proposed
**Date:** 2026-06-27
**Deciders:** Architecture Review Board · Infrastructure Manager (DB InfraGO interface) · NSA / safety authority liaison · Vpnet engagement lead (test & assurance)
**Depends on:** ADR-001 (FRMCS transition; R3/R4 resilience), ADR-002 (agentic oversight layer; autonomy ladder), ADR-004 (SIL-4 boundary — no actuation); relates to ADR-008 (autonomy-ladder authorisation)
**Affects requirements:** R3 (eliminate central SPOF), R4 (fail-soft), with bearing on R12 (awareness/detection), R9/R10/R11 (the oversight agents under test), and R5/R2 via the MCX feature-parity surface (PR15)

## Context

The 23 June outage is now DB-confirmed (E-2026-06-27-01, corroborated by -02/-03): during planned maintenance a network-distribution component was swapped, which triggered a single software fault that **raised no alarm** — so the automatic failover to the (fully functional) redundant GSM-R **never engaged**, and recovery took ~90 minutes of manual work. The redundancy existed and worked; its **trigger had never been exercised against a fault that stays silent**.

That is the whole lesson for assurance: **R3 (no central SPOF) and R4 (fail-soft) cannot be asserted — they must be proven by test.** Specifically, the test must show that redundancy *triggers* under a hidden fault, not merely that it *exists*. Calculated availability is not evidence: DB's own 2019 Stuttgart study showed very high calculated GSM-R availability (E-2026-06-25-02 §2.2.4, Tables 27–28) for the same estate that then failed on an untriggered failover.

A second force: the agentic oversight agents (ADR-002; R9–R12) must be validated before they touch anything. The autonomy ladder's lowest rung — **shadow / observe-only** — is realisable on GSM-R/2G **today**, so the agents can accrue evidence before FRMCS exists, within the ADR-004 no-actuation boundary.

## Decision

Adopt a **four-surface testing strategy feeding Gate G3**:

**(a) Incident-replay.** Offline replay of the silent-fault cascade (component swap → silent software fault → no alarm → failover not triggered). Proves the Risk Sentinel would flag it and the proposed FRMCS failover design triggers. Non-production. *Caveat (PR8): replay is inference-based until DB/EBA publish full telemetry — broaden the corpus when it lands.*

**(b) Shadow-on-legacy.** Oversight agents run **read-only** on the live GSM-R network/NMS; their outputs are **compared against reality, not acted on**. This is the autonomy ladder's **shadow rung**, available on 2G today — agents earn evidence with no actuation and no control (R9/R11 boundary; ADR-004).

**(c) Silent-fault / failover injection.** Deliberately inject **alarm-less** faults and verify that **detection-driven failover actually engages — driven by INDEPENDENT out-of-band monitoring (ITU-T Q.752-style signalling probes, E-2026-06-30-03), not the element's self-report** — the exact gap from 23 June. Run in lab / test-ring; on production **only on the inactive redundancy side** (mirroring DB's own countermeasure: maintenance 00:00–04:00 on inactive redundancy, E-2026-06-27-02/-03). This is the core test: prove the trigger fires, not that the backup exists. **Extend the injection catalogue with a common-mode class:** a bad software/config push to a redundancy running **identical code/config** defeats both sides at once, *independent of the trigger* (the 2024 CrowdStrike monoculture pattern — a framing analogy, not logged evidence). Verify the staged / inactive-side rollout (ADR-011) actually prevents simultaneous defeat — i.e. test not only that failover triggers, but that one change cannot reach both redundancy sides together (config/version diversity or staging).

**(d) Canary-by-segment.** Staged **geographic** rollout of the bearer with a **manual safety gate per segment**; advance only on green criteria; rollback = revert that segment to GSM-R / parallel-run (ADR-001).

**(e) MCX feature-parity regression.** Verify each GSM-R safety feature is faithfully reproduced by MCX — REC/Notruf (Railway Emergency Call), VGCS/VBS group calls, eMLPP pre-emption, functional & location-dependent addressing — and **stays** reproduced after any MCX or GSM-R↔MCX interworking change; bar set by Ril 481.0205 (E-2026-06-24-18) plus the European normative bar: the (MI)-marked requirements of UIC EIRENE FRS 8.1.0 + SRS 16.1.0 (E-2026-07-02-30/-31, CCS TSI Annex A mandatory pair — the certification-relevant set). This surface covers the **functional** failure mode (**PR15** / R5 / R2) — distinct from the resilience surfaces (a)–(c). Per the first FRMCS lab tests (E-2026-06-29-01) MCX REC/interconnection is still 3GPP-evolving, so equivalence is *validated-in-progress*, not mature. A Kontron / DB Netze (DSD) FRMCS-MCX design study (E-2026-07-01-10, Feb 2021) enumerates the concrete gaps the regression must track: rail group affiliation (Rel-16 / 3GPP CT1 in progress), functional-alias termination side, and E2E encryption/security (optional, to-be-defined).

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

The governing trade is **assurance strength vs cost/lead-time**. Asserting resilience (A) is cheapest and is precisely what failed on 23 June. Probabilistic canary (C) is operationally familiar but unacceptable for SIL-4 traffic. The four-surface strategy (B) costs more but is the only one that yields evidence a safety case and the NSA can rely on — and it front-loads value: the **shadow rung lets the agents earn evidence on 2G now**, and **fault-injection borrows DB's own inactive-redundancy safeguard**, so it is compatible with live infrastructure rather than waiting for FRMCS. In-domain methodology grounding (E-2026-07-02-12 — DSD's own V&V leadership, 11/2024): DSD's GoA-4 strategy uses a staged test-environment ladder (MIL → data replay vs annotated ground truth → SIL with fault injection → HIL/mock-ups → field test last) explicitly to escape rail's field-test cost trap, and aims to **certify the test environments for CENELEC-compliant lab V&V** — with **qualified synthetic data for safety-critical functions** named as the key open challenge. If that certification lands, this ADR's proof obligations gain a repeatable lab path; until then, DSD's own candour stands: field tests remain indispensable, and replay without annotated ground truth is only informal evidence.

## Consequences

- **Easier:** R3/R4 move from *asserted* to *test-evidenced*; Gate G3 gets concrete entry/exit criteria; oversight agents (R9–R12) accrue evidence safely via shadow on 2G; aligns with ADR-004 (no actuation) and ADR-008 (autonomy ladder).
- **Harder:** building a representative replay corpus (PR8 — inference-based until DB/EBA telemetry); fault-injection needs a lab/test-ring plus strict inactive-redundancy discipline; canary-by-segment is slower than probabilistic rollout.
- **To revisit:** replay fidelity once DB/EBA publish telemetry; per-rung promotion criteria (ADR-008); the former ADR-007 *eval scope* (accuracy/drift/automation-bias) is now homed in **ADR-010** (drift → PR6; automation-bias → ADR-004/PR4; accuracy → ADR-010).

## Action items
1. [ ] Build the incident-replay corpus from the confirmed mechanism (E-2026-06-27-01/-02/-03); flag inference gaps (PR8); broaden when DB/EBA telemetry lands.
2. [ ] Stand up shadow-on-legacy: read-only agents on the GSM-R NMS + output-compare harness; define the shadow-rung exit criteria (dissent rate, accuracy) — links ADR-008.
3. [ ] Define the silent-fault / failover-injection catalogue (alarm-less fault classes); lab/test-ring first; production only on the inactive redundancy side (per DB countermeasure).
4. [ ] Define canary-by-segment gates: per-segment green criteria, manual safety gate, segment-level rollback to GSM-R parallel-run; record the no-probabilistic-canary rule as binding.
5. [ ] Define the MCX feature-parity regression suite (REC/Notruf, group calls, eMLPP pre-emption, functional/location-dependent addressing; bar = Ril 481.0205, E-2026-06-24-18) — covers PR15.
7. [ ] **Add a SECURITY test surface — this ADR currently has none (NEW 2026-08-15, prompted by E-2026-08-15-55, gap confirmed by reading items 1-6).** Items 1-6 are reliability and functional-parity testing: incident replay, shadow-on-legacy, silent-fault/failover injection, canary-by-segment, MCX parity. **ADR-012 makes cybersecurity a first-class governed dimension and routes its security-update change gate through this ADR — but there is no penetration testing, no red-team, no independent adversarial tester and no security regression suite defined here, so the two ADRs do not meet.** Define, at minimum: (a) a **security regression suite** run at the same gate as the MCX parity suite (item 5); (b) **independent adversarial testing as a standing function**, not a one-off acceptance activity — an external party alongside internal testing; (c) **design-stage testing before metal exists** (digital-twin / testbed), so findings land while they are still cheap; (d) **variant coverage** carried over from ADR-009 item 5 (E-2026-08-15-54: a fleet variant not represented in test cost three weeks in series production); (e) the **rule that a security finding is a change** and re-enters the item-4 canary gate rather than bypassing it on urgency (CRA Art 14 expedited-but-gated path, ADR-012 item 3). **CONCRETE METHOD NOW AVAILABLE (added 2026-08-19, E-2026-08-19-04) — this item no longer needs inventing.** The DZSF-financed project "Prognose Securitybedarf" published a rail-specific approach: **forecast how digital technologies will be used, derive ABUSE CASES (how each use case can be misused by attack), and perform software-supported threat analysis by ATTACK GRAPHS**, the tool collecting all abuse cases for a given use case into a graph. **The tooling is open-source** (`incyde-gmbh/drawio-plugin-attackgraphs`, `INCYDE-GmbH/attackgraphs`) and the method has a separate write-up in Signal+Draht 05/2022 (**obtain — not in this register**). Adopt this as the (a) security-regression basis and pair it with the ODD/scenario/completeness frame at ADR-010 item 5: **abuse cases are the security analogue of DZSF's functional→logical→concrete scenarios, and the same completeness argument applies.** Two further transplants from the same source: **two expert teams should analyse separately and reconcile** (inter-rater, cheap and defensible), and **treat TS 50701/IEC 62443 as a FLOOR to be gap-analysed against expected future threats rather than a conformance ceiling** — consider existing standards, identify gaps, develop targeted measures, reassess iteratively. **Caveat on provenance: the prompt for this item was a tier-B consultancy deck that sells penetration testing; the item is justified by the internal inconsistency between ADR-007 and ADR-012, not by that deck's authority.** **Funding route (2026-08-15, E-2026-08-15-56):** the EU funds this instrument class directly — DEP topic **DIGITAL-ECCC-2024-DEPLOY-CYBER-07-LARGEOPER** (€35M, grants €3-5M at a **100% funding rate**) targeted NIS2 critical-infrastructure sectors and explicitly covered **penetration-testing scenario development, testing of operating CI for vulnerabilities, threat assessment and continuous attack-surface monitoring**, with compulsory Financial Support to Third Parties. **That 2024 round closed 21.01.2025** — before adopting a build-it-ourselves cost assumption, check the **current** DEP work programme (ECCC, dep@eccc.europa.eu) for a LARGEOPER successor and for the CYBER-07-SOC/SOCPLAT national- and cross-border-SOC track, which bears on whether the operator builds an OT SOC or consumes national-SOC early warnings (see R12 and E-2026-08-15-54). **⚠️ THREE NAMED, IN-DOMAIN ATTACK CLASSES TO BUILD AGAINST (added 2026-08-19, E-2026-08-19-12 — Heinrich, TU Darmstadt): this item has been open and undefined since 15 August; it now has a published starting point.** The most critical semantic attacks on railway signalling are identified as **(1) switch a point before or below a train; (2) confuse track occupancy so as to provoke two trains in the same section; (3) set signals to bypass protection of the following section.** Both detectors in that work were validated against all three, the learned one via a **purpose-built artificial attack dataset** — **so the method for generating the adversarial test data is published too, which is the part this ADR would otherwise have had to invent.** ⚠️ **Carry the availability consequence into the test design, not just the detection rate: a prevention control with a false-positive rate above zero drops legitimate messages, and the whole approach works by making security reactions indistinguishable from transmission faults. Every security test surface here must therefore measure the AVAILABILITY cost alongside the detection rate — R3/R4 are the requirements this ADR exists to prove, and they are the ones a fail-safe security control spends.** **⚠️ AND TEST *RESPOND* HARDEST — IT IS THE SECTOR'S MEASURED WEAKEST FUNCTION (added 2026-08-19, E-2026-08-19-13).** The DZSF-commissioned NIST-CSF survey puts the sector's **Respond at 1.58 / 5**, its worst discipline, and the **infrastructure managers at 0.69** — against Recover at 2.36. **So the sector is comparatively better at restoring service than at reacting while an incident is live, which is exactly the window this ADR's failover and canary surfaces exercise.** Design the security test surface accordingly: **not only can the attack be detected, but does anything happen next, in time, by a named role** — the 23-June pattern was detection failing and response defaulting to ~90 minutes of manual work. **Detection rate alone would test the function the sector is second-worst at and miss the one it is worst at.**
8. [ ] Set G3 entry/exit criteria from the five surfaces; ARB + NSA to ratify; flip ADR-007 to Accepted.
