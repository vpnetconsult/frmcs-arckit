# ADR-001: Transition of railway operational communications from GSM-R (2G) to FRMCS (5G)

**Status:** Accepted (ARB 2026-08-15) — **settled internally; no external validation sought or available**
**Ratified:** ARB-2026-08-15, Resolution 3 — see `project/07-arb-minute-2026-08-15.md`. **Not usable in a safety case, conformance submission or any statement to a regulator.** ⚠️ **Reworded 2026-08-19 — this previously read "NSA concurrence outstanding", which was wrong in a way that mattered: it implied a pending act by a body that has no relationship to this work and never has had one.** No safety authority has been asked to concur, none will be, and the qualifier described a validation that was never available. **What is true instead:** this is an independent assessment with **no client and no authorising body** (`project/00-charter.md` §Standing), ratified by a **working session chaired by the engagement lead** rather than a convened board of the named deciders (`project/07-arb-minute-2026-08-15.md`). The decision is settled **internally** — it is no longer provisional for the purposes of this assessment — and it carries **no external standing whatsoever**. **The practical limit is unchanged and is not weakened by the rewording: nothing here may be presented to a regulator, an operator or an assessor as an authorised or endorsed position.** Findings may be shared as contributions from an independent party; concurrence is never requested.
**Decision:** Option B (dedicated rail 5G SA + MCX, gateway decoupling) as the spine; Option C (public-5G/satellite) as a sanctioned fallback layer, not the foundation; phased dual-network parallel run. Option D rejected.
**Date:** 2026-06-24
**Last read back against evidence:** 2026-08-15 · **Next review due: 2026-11-15** (quarterly; this ADR is load-bearing and had gone 7 weeks and 338 evidence rows without a read-back — see `linkedin-post-decision-drift.md`)
**Deciders:** Infrastructure Manager CTO / Head of Telecoms · ERTMS Programme · Architecture Review Board · National Safety Authority interface
**Tags:** ERTMS · GSM-R · FRMCS · 5G SA · 3GPP MCX · CCS TSI · spectrum
**Downstream ADRs (this decision is their parent — added 2026-08-15):** ADR-002 (agentic decision & oversight layer) · ADR-003 (EU AI Act classification) · ADR-004 (SIL-4 boundary / freedom-from-interference) · ADR-007 (testing & canary strategy) · ADR-009 (fleet retrofit — R13) · ADR-010 (eval strategy) · ADR-011 (migration change-control) · ADR-012 (cybersecurity regulatory conformance — CRA/NIS-2)

---

## ⚠️ Timeline premise — corrected 2026-08-15

**This ADR previously asserted a GSM-R switch-off of "around 2030". That figure is WITHDRAWN.** It originated in **E-2026-06-24-03 (tier B)**, which the evidence log itself marked *"superseded/refined by E-11/-13"* — **on 24 June 2026, the day the register opened.** The log caught it immediately; this ADR never absorbed the correction and carried the stale figure for seven weeks and 338 evidence rows, while internally contradicting itself (§References already said 2035). That drift is written up in `linkedin-post-decision-drift.md`; this block is the repair.

**Stated position — GSM-R end-of-life horizon:**

| Marker | Date | Source | Weight |
|---|---|---|---|
| ~~EU legal outer bound~~ **⚠️ WITHDRAWN 2026-08-18 (E-2026-08-18-02)** | ~~31 Dec 2040 — Class B funding option~~ **— MISATTRIBUTED. GSM-R is a Class A radio system (E-2026-08-01-25: "RMR = two radio Class A systems (GSM-R + FRMCS)"), so the Class B funding provision in Reg (EU) 2026/693 does NOT bound it. That date governs legacy Class B national systems.** | E-2026-08-01-25 | — |
| **THERE IS NO EU LEGAL END-DATE FOR GSM-R** | **none** — E-2026-08-01-25 (tier A): *"GSM-R continues as Class A **without end-date**"* | E-2026-08-01-25 | **A** |
| ERA's own obsolescence window | **2035–2040** | E-2026-08-01-25 | A |
| German national switch-off | **2035** (earliest partial 2032) | E-2026-06-24-11, -13, -21 | A |
| Operator (DSD) positioning | **"mid-2030s"** | E-2026-07-01-11 | A — operator primary |
| Vendor support commitments | ≥2035; to 2040 | E-2026-07-26-06; E-2026-07-26-01 | **B — vendor-interested** (VIAVI sells GSM-R support contracts to 2040); upper-bound signal, not a planning date |

**Planning position: coexistence to at least 2035, on a planning range with NO statutory backstop.** **⚠️ Corrected 2026-08-18 (E-2026-08-18-02): this previously read "with 2040 as the legal outer bound", which was wrong** — it attributed a Class B funding date to a Class A system. **The original ADR-001 error (a hard ~2030 date) and its 2026-08-15 repair (a hard 2040 legal bound) were the same mistake twice: manufacturing legal certainty about a date that is not in law.** The horizon is set by national plan (DE 2035), ERA's obsolescence window (2035–2040), operator positioning ("mid-2030s") and vendor support — **none of them a legal bound.** **The absence of a statutory backstop is itself load-bearing: nothing external forces this migration to complete, which INCREASES the weight on R2 coexistence rather than relieving it.** RMR carries GSM-R and FRMCS as two Class A radio systems permitted to coexist (E-2026-08-01-25) — that is the legal basis for the dual run, not merely a tolerance.

**Does this change the decision? No — and that is worth stating explicitly.** Obsolescence still forces the move (supply, skills, capability ceiling are independent of the switch-off date) and the target architecture is unaffected. **What changes is the premise's direction of pressure:** the parallel-run window is *longer* than this ADR assumed, so **coexistence (R2) becomes more load-bearing, not less** — more years carrying two estates, two skill sets and two assurance chains (see Consequences → Harder), and a longer funding exposure. It also means the urgency framing in §Context force 1 was overstated: the driver is obsolescence and capability, not a 2030 cliff.

## Context

GSM-R is the communications leg of ERTMS, paired with ETCS for signalling. It is a GSM Phase 2+ (2G) bearer carrying ASCI voice features (VGCS / VBS / eMLPP), location-dependent addressing, and circuit-switched ETCS data over EDOR (~9.6 kbit/s CSD). It is deployed on the order of 130,000 km of track in Europe (≈210,000 km worldwide) with roughly 90,000 on-board cab radios, in the R-GSM / E-GSM bands around 876–880 / 921–925 MHz.

Three forces now compel a decision:

1. **Obsolescence and supply risk.** Major suppliers have signalled discontinuation of GSM-R maintenance from around 2030 — **but note that vendor EOL signalling and the actual switch-off are different things: current vendor commitments run to ≥2035 and, interestedly, to 2040 (see Timeline premise above)**. The load-bearing drivers are the contracting 2G skills base and spares supply, not a date. **Switch-off horizon: 2035 national (DE), 2035–2040 per ERA — and NO EU legal end-date at all (corrected 2026-08-18, E-2026-08-18-02; GSM-R is Class A "without end-date"). A decade-plus parallel run before it.**
2. **Capacity and capability ceiling.** Circuit-switched GSM-R cannot carry ATO, real-time video, TCMS telemetry, or high-density ETCS Level 2/3 traffic. It saturates at busy nodes and offers no native packet path for digital-rail applications.
3. **Regulatory and interoperability pull.** FRMCS is the UIC-designated successor, being introduced through the CCS TSI and completed by ETSI TC RT specifications. RMR spectrum additional to GSM-R has been secured in Europe (ECC (20)02): a dedicated 1900 MHz band (n101) plus refarmed sub-GHz. FRMCS FRS/SRS V1 is finalised; V2 is in flight; field trials run from 2026 with V3 expected around 2027.

The decision is **not whether** to move — obsolescence forces it — but **which target architecture and migration pattern** to commit to, given safety-critical continuity requirements and a long coexistence window.

## Decision

Adopt **FRMCS as the GSM-R successor**, built on **5G Standalone (5G SA) transport with a 3GPP Mission-Critical Services (MCX) service layer over an IMS/SIP core**, and migrate via a **phased, dual-network parallel run** rather than a cutover.

Anchor the target on three architectural commitments:

- **Gateway decoupling.** Introduce FRMCS gateways on both sides of the 5G infrastructure — the on-board gateway (OB_GTW / TOBA) and the trackside gateway — so the application stratum is insulated from the transport stratum. This yields **bearer flexibility**: the radio/transport layer can evolve (new 5G releases, additional bands, non-3GPP access) without changing rail applications.
- **MCX service layer.** Realise the FRMCS Service Domain through 3GPP MCX (MCPTT for voice, MCData for ETCS/ATO/TCMS, MCVideo for surveillance), with MCX servers/clients and an IMS/SIP core per FRMCS specifications.
- **Loose-coupling by default.** Implement data/video MCX clients in the TOBA gateway (loose coupling); keep voice MCX clients tight-coupled in the cab radio where latency and call-setup behaviour demand it. Applications reach the on-board system only through the **OBapp** reference point (FFFIS, API-accessible); ETCS binds via SS 037, ATO GoA1/2 via its FRMCS profile.

Run GSM-R and FRMCS **in parallel** through the transition, using **hybrid cab radios and dispatcher positions**, with defined fallback to public 5G and, where justified, satellite.

## Options Considered

### Option A — Sustain / life-extend GSM-R

Keep the 2G estate running with sourced spares and bespoke vendor support past 2030 (vendors now offer support to ≥2035/2040 — see Timeline premise).

| Dimension | Assessment |
|-----------|------------|
| Complexity | Low near-term, High long-term |
| Cost | Rising sharply; bespoke support, spares scarcity |
| Scalability | None — capacity and capability are capped |
| Safety continuity | Degrading — supply and skills risk |
| Regulatory fit | Diverges from CCS TSI direction |

**Pros:** No migration programme; no spectrum/RAN capex now.
**Cons:** Terminal architecture; supplier exit signalled from ~2030 (commitments to ≥2035/2040 are vendor-interested — see Timeline premise); cannot host ATO/video/dense ETCS; growing skills gap; a deferral, not a decision. **Note: a longer-than-assumed GSM-R horizon makes this option *more* superficially attractive and therefore needs the capability-ceiling argument, not the obsolescence-date argument, to carry the rejection.**

### Option B — FRMCS on dedicated RMR spectrum, dedicated rail 5G SA (recommended)

Build a rail-owned/operated 5G SA network in the 1900 MHz (n101) and refarmed sub-GHz RMR bands, with FRMCS gateways and MCX, parallel-run against GSM-R.

| Dimension | Assessment |
|-----------|------------|
| Complexity | High |
| Cost | High capex; predictable lifecycle |
| Scalability | High — packet-native, slice-capable |
| Safety continuity | Strong — dedicated, controllable QoS and priority |
| Regulatory fit | Aligned with CCS TSI / ETSI TC RT / ECC (20)02 |

**Pros:** Full control of availability, priority and security; clean ERTMS evolution path (ATO, ETCS L2/L3, video); bearer-flexible via gateway decoupling; matches UIC/EU-Rail reference architecture (5GRail, MORANE2).
**Cons:** Largest capital programme; long parallel-run cost; RF re-planning of 130k+ km; spectrum and site-sharing coordination with public MNOs.

### Option C — FRMCS hosted on public MNO 5G (MOCN / hosted core / MVNO)

Ride commercial 5G via MOCN radio sharing or a hosted/host-core model, with rail retaining the MCX service layer.

| Dimension | Assessment |
|-----------|------------|
| Complexity | Medium–High (inter-operator integration) |
| Cost | Lower capex; recurring opex and dependency |
| Scalability | High, but contended with public traffic |
| Safety continuity | Conditional — depends on SLA, priority, coverage at cell edge |
| Regulatory fit | Workable; resilience must be evidenced |

**Pros:** Lower upfront capex; faster coverage where MNO footprint exists; MOCN keeps a dedicated backhaul to the FRMCS core, improving resilience over pure national roaming.
**Cons:** Dependency on CSP coverage/priority along linear rail corridors and at cell edges; weaker control of mission-critical QoS; resilience and security harder to assure for safety cases. Best as a **complement** (fallback / rural fill), not the spine.

### Option D — Big-bang cutover to FRMCS

Switch corridors from GSM-R to FRMCS without an extended overlap.

| Dimension | Assessment |
|-----------|------------|
| Complexity | Very High |
| Cost | Concentrated; high contingency |
| Scalability | N/A |
| Safety continuity | Unacceptable risk |
| Regulatory fit | Fails continuity-of-service expectations |

**Pros:** Shortest total migration duration in theory; no prolonged dual-running cost.
**Cons:** GSM-R underpins live safety services that cannot be switched off for an upgrade; no industry precedent supports a hard cutover at national scale. Rejected.

## Trade-off Analysis

The dominant trade is **control of mission-critical performance vs. capital intensity** — Option B vs. Option C. For the safety-critical spine (ETCS, ATO, operational voice), dedicated spectrum and a rail-controlled 5G SA core (Option B) give the QoS, priority (eMLPP-equivalent via MCX) and security posture that a national safety case can defend at the cell edge and in tunnels. Option C's economics are attractive but transfer control of the most safety-relevant variables — coverage continuity along corridors, priority under public load, and security boundaries — to a third party.

The second trade is **migration risk vs. duration** — Option B/parallel-run vs. Option D. Because GSM-R carries live safety traffic, an extended overlap is not a preference but a constraint; the gateway/TOBA architecture exists precisely to make hybrid on-board operation tractable. Big-bang (D) is dismissed.

The gateway-decoupling and loose-coupling commitments de-risk the largest long-term exposure — **technology lock-in**. By isolating applications behind OBapp and pushing data/video MCX clients into the TOBA gateway, the transport layer can absorb later 5G releases or new bands without re-qualifying ETCS/ATO, which is the expensive, safety-gated part of the stack.

**Recommendation: Option B as the spine, with Option C as a sanctioned fallback/fill layer (public-5G and satellite fallback), executed through a phased parallel run.** For spectrum- or budget-constrained networks, stage entry via the UIC FRMCS-Transition (FRMCS-T) guideline.

## Consequences

**Easier**
- ATO (GoA1/2 now, higher GoA later), ETCS L2/L3 at density, real-time video and TCMS telemetry become carriable.
- Transport-layer evolution decoupled from application re-qualification (bearer flexibility).
- Alignment with CCS TSI, ETSI TC RT and the UIC/EU-Rail reference architecture; cross-border interoperability preserved by design.

**Harder**
- Multi-year dual-network operation: two estates, two skill sets, two NMS/assurance chains, hybrid on-board devices.
- RF re-planning across the network in new bands (1900 MHz n101 + refarmed sub-GHz); tunnel/cutting coverage and site-sharing filters with public 5G.
- Security surface expands from a closed 2G bearer to an IP/IMS/MCX stack — assurance, key management and lifecycle patching become continuous obligations.

**To revisit**
- Coupling decision on the open binding question for each application class (where the MCX client lives) as MCX/3GPP releases mature.
- Public-5G/MOCN reliance per corridor as commercial coverage and priority guarantees evolve.
- Satellite fallback inclusion once mission-critical NTN profiles stabilise.
- ORAN adoption for the rail RAN (resilience, supplier diversity) as products mature.

**⚠️ THREE THINGS THIS ADR DOES NOT COVER, FOUND 2026-08-20 IN THE DLR PROJECT REGISTER (E-2026-08-20-10, -11, -12).** This ADR is ratified and its Option B spine is not in question. What follows are gaps, not contradictions. **(1) NO POSITION ON A COMMODITY BEARER FOR NON-VITAL FUNCTIONS.** *Rail2X-Smart Services* (DB Systel coordinator, Siemens partner, €3.81 m, field-trialled on the Erzgebirgsbahn) ran **automotive Car2X** for on-demand stops and **passenger-requested level-crossing protection**, on the argument that automotive volume makes *"die standardisierten Komponenten in Kürze auch für den Bahnverkehr kostengünstig"* available. **That is a third anti-concentration route beside unbundled lots and conformance testing — adopt a standard whose volume is set outside rail, so no rail supplier controls its price or roadmap. This ADR has no position on it, and R8 is weaker for that.** **(2) THE PUBLIC-BEARER DEPENDENCY IS A GOVERNANCE QUESTION, NOT A TECHNICAL ONE.** The BMDV **5G-Reallabor** (~€12 m, with PTB) ran its use cases *"in öffentlichen 5G-Mobilfunknetzen, die im Rahmen der regulären Netzplanung ausgebaut werden"*, requiring *"eine enge Synchronisierung mit Mobilfunknetzbetreibern"* over releases and MEC — **and demonstrated a remotely driven train over that public 5G in the Erzgebirge.** ⚠️ **The consequence to record: on a public bearer, the programme's capability roadmap becomes the MNO's release roadmap. That is the strongest argument for Option B's dedicated spine — a CONTROL-OF-ROADMAP argument rather than a coverage or latency one — and this ADR has never put it that way.** **(3) BACKWARD COMPATIBILITY IS A BINDING DESIGN CONSTRAINT, NOT AN OPERATIONAL CONSEQUENCE.** X2Rail-5 (DLR-coordinated, €33.89 m, the whole supplier base plus six infrastructure managers, results routed into **CCS TSI**) states it: *"To ensure the evolution and **backward compatibility** of ERTMS/ETCS technologies, notwithstanding of the required functional enrichment of the future signalling and control systems."* **R2 (coexistence) has been treated here as a consequence of a long dual run. It is also a constraint imposed on FRMCS itself through the TSI route — which makes it harder to trade away later.**

## Action Items

1. [x] `[D]` ~~Ratify Option B (dedicated 5G SA + MCX, parallel run) as target; record Option C as fallback layer.~~ — **ARB ratified 2026-08-15 (Resolution 3), on the corrected 2035/2040 timeline premise. Settled internally; no external validation sought or available — see the Status line.**
2. [ ] `[I]` Commission rail-specific Network Planning & Optimisation (NPO): inter-site dimensioning in RMR bands, reuse assessment of GSM-R sites/backhaul, tunnel and cell-edge coverage modelling.
3. [x] `[I]` **CATALOGUE DEFINED 2026-09-04 — five application classes, ordered by what may be pre-empted, not by what is fastest.**

| Class | Applications | Characteristic that sets the requirement | Pre-emptable |
|---|---|---|---|
| **A — Safety voice** | Railway Emergency Call (REC/Notruf), VGCS/VBS group calls, shunting | Establishment time and **guaranteed pre-emption of everything below**; the (MI)-marked EIRENE parity bar applies | **Never** |
| **B — Train control** | ETCS movement authorities, degraded-mode signalling | Bounded latency and **loss detection**, not throughput; a late MA is a wrong MA | **Never** |
| **C — Automation** | ATO, remote/teleoperated command paths | Bounded latency **plus a declared availability property and a defined loss-of-command behaviour** (ADR-002 class-4 preconditions) | Below A and B only |
| **D — Operational data** | TCMS, diagnostics, SOVD-class fault management, telemetry to the oversight layer | Volume and continuity; tolerant of delay, intolerant of silent gaps | Yes |
| **E — Non-operational** | CCTV/video, passenger-adjacent, administrative | Bandwidth-hungry, safety-irrelevant | **First to go** |

**The ordering principle, stated because it is the decision:** classes are ranked by **what may be pre-empted under contention**, not by nominal bit-rate or latency figures. **Class E exists chiefly to be sacrificed, and a design in which video contends with class A on the same bearer without a hard pre-emption mechanism has not implemented this catalogue.** This is GSM-R's **eMLPP** discipline carried forward — the MCX priority/pre-emption model must reproduce it, which is a **PR15 feature-parity question, not an assumption** (E-2026-07-01-10 names rail-specific group affiliation as Rel-16-onward and functional-alias termination-side spec as in progress). **⚠️ Deliberately NOT set here: numeric 5QI values, GBR/non-GBR assignments and per-class latency budgets.** Those are fixed by the FRMCS FRS/SRS set and the CCS TSI Annex A pair, **which this register does not hold in full** — and inventing 5QI mappings that a spec already determines would be exactly the kind of plausible-looking assertion the register's own founding defect consisted of. **The catalogue's job is to fix the classes and the pre-emption order so that the spec values, when read, land in a structure that already says what matters.**
4. [ ] `[I]` Fix the on-board architecture: TOBA gateway spec, OBapp/OBrad/OBom interfaces, hybrid cab-radio strategy, coupling decision per application.
5. [x] `[I]` **LOCKED 2026-09-04 — three design rules, and the normative anchor is named rather than assumed.** **(a) GSM-R↔FRMCS BOUNDARIES.** Interworking is **specified**, not to be invented: **ETSI TS 103 792** defines the IWF reference points (**IWF-1…-g5**) and the group / emergency-group / P2P / text-messaging procedures, the **EIRENE↔Functional-Alias identity mapping**, talker and floor control, and codec/encryption handling (E-2026-07-26-13). **The rule: every boundary is an IWF-mediated transition with a declared identity mapping; no boundary is handled by "both radios fitted and the driver picks."** ⚠️ **Bound, carried from PR15: TS 103 792 is a DRAFT (Public Enquiry/Vote), and interworking-specified ≠ equivalence-PROVEN. The (MI)-marked EIRENE FRS 8.1.0 / SRS 16.1.0 parity bar and Ril 481.0205 remain the test targets, and the ADR-007 MCX-parity regression is still owed.** **(b) FALLBACK — AND IT IS A SCOPE DECISION, NOT A RESILIENCE FEATURE.** Public-5G or satellite fallback is retained as Option C's layer, with two consequences now stated on the face of this item: **(i)** ⚠️ **a fallback path can make on-board equipment "internet-connected" under Del Reg (EU) 2022/30 Art 1(1), pulling it into RED cyber scope — the fallback prices the equipment, and that price is paid at ADR-012's procurement gate, not discovered at conformity assessment**; **(ii)** fallback carries **class D and E only** by default (item 3's catalogue). **Classes A–C move to a fallback bearer only on an explicit, evidenced decision that the bearer meets their requirement — not automatically because the primary failed.** **A silent downgrade that keeps safety traffic flowing over an unqualified bearer is worse than a clean loss, because it removes the signal that anything is wrong** — which is the 23-June failure mode restated for bearers. **(c) BORDER CROSSING** is treated as the same problem as (a) with a second variable: the neighbouring network's generation *and* its national spectrum position. **Cross-border behaviour is declared per corridor, never assumed uniform** — the register's own n101/1900 MHz premise depends on an ECC-harmonised equivalent existing at all, which is a dependency and not a given.
6. [ ] `[I]` Run de-risking PoC/field trials (align with 5GRail / MORANE2 outputs; 1900 MHz n101 validated on live test track).
7. [x] `[I]` **BASELINE ESTABLISHED 2026-09-04 — by pointing at the four places it now actually lives, rather than restating them here.** **(a) IMS/MCX THREAT MODEL → ADR-012 + ADR-007 surface 6.** The method is attack-graph derivation over abuse cases with the four-attribute scoring observed in practice — **Resources · Knowledge · Location · Impact** (E-2026-09-04-16) — seeded from the 49-countermeasure corpus, of which **21 sit at maturity A/B and are the surface's known blind spots rather than its coverage.** ⚠️ **The MCX-specific gaps are named threats, not TODOs: security functions are OPTIONAL in the specs and E2E encryption is "to be defined" (E-2026-07-01-10) — which is why ADR-012 item 2 carries the mandate-the-optional rule into procurement.** **(b) KEY MANAGEMENT** is scoped as an ADR-012 procurement-gate requirement, not a design owned here — with the register's honest position recorded: **the operational interconnect-security detail lives in GSMA FS.11/FS.19/FS.20, which are membership-gated and not held**, and the gating is itself evidence for the operational-gap thesis. **(c) PATCH LIFECYCLE → ADR-012 item 3 as decided today: by POPULATION, not by urgency.** Vital/safety-certified PDEs stay under ADR-011 without exception; IT-side takes the BSI tempo; the expedited path is sized to CRA Art 14(2)(c)'s **14-day** clock and expedited in scheduling, never in gates. **And the case this ADR must not forget: where a PDE cannot take an update at all, there is no patch lifecycle — there is a compensating-control decision (E-2026-09-04-14).** **(d) SAFETY-CASE EVIDENCE CHAIN → ADR-002 item 7's seven fields**, of which the two that matter are **what would falsify the decision** and **what was not known when it was taken**. ⚠️ **Recorded so this item is not over-read: the chain is emitted for the ARB and structured so it COULD serve a safety authority. No NSA relationship exists and none is sought (`00-charter.md` §Standing) — the FRMCS safety case itself belongs to an operator and its authority, and Vpnet is never Accountable for safety.** **⚠️ WHAT THIS CLOSURE IS AND IS NOT: it establishes the baseline's SHAPE and its owners, so that no part of it is homeless. It does not produce the threat model, the key-management design or the safety case — those need an estate, a licensed standards set and an accountable operator, none of which this engagement has.**
8. [ ] `[I]` Build the migration programme plan with national timeline, funding case, RFI/RFQ, and CCS TSI / NSA conformance gates. **ARB-2026-08-15/02: carry the longer-coexistence consequence (to ≥2035, legal bound 2040) into this plan — more years of two estates, two skill sets, two assurance chains. Owner: ERTMS Programme.**

---

# arcKit Architecture Assessment — GSM-R → FRMCS

A structured, viewpoint-by-viewpoint evaluation supporting the ADR. Read as the architecture-kit companion: current state, target state, gap, and risk per architecture domain, followed by a quality-attribute scorecard and the open decisions.

## 1. Architecture domains

### 1.1 Spectrum & RF
**Current (GSM-R):** R-/E-GSM ~876–880 / 921–925 MHz; narrowband, voice-optimised, propagation-favourable sub-GHz.
**Target (FRMCS):** Dedicated 1900 MHz (n101) for capacity plus refarmed sub-GHz for coverage/continuity (ECC (20)02). Multi-frequency, multipath on-board.
**Gap:** New band planning across the whole network; 1900 MHz needs denser sites for linear coverage; sub-GHz contends with refarming timelines.
**Risk:** High — RF layer determines migration success; cell-edge and tunnel coverage are the critical constraint.

### 1.2 Radio Access Network
**Current:** GSM BTS estate, circuit-switched.
**Target:** 5G SA gNodeB; candidate ORAN for openness, resilience and supplier diversity. Site/backhaul reuse where dimensioning allows.
**Gap:** New RAN overlay alongside live GSM-R; site sharing with public MNOs needs high-selectivity RF conditioning filters to protect both networks.
**Risk:** Medium–High.

### 1.3 Core network
**Current:** GSM core, MSC/BSC, circuit-switched.
**Target:** 5G SA core (control/user-plane separation, slicing) plus IMS/SIP for MCX session control.
**Gap:** Greenfield packet core; network slicing design for mission-critical isolation; dual-core operation during overlap.
**Risk:** Medium.

### 1.4 Service layer (MCX)
**Current:** ASCI (VGCS/VBS/eMLPP), location-dependent addressing — bespoke GSM-R features.
**Target:** 3GPP MCX — MCPTT (voice), MCData (ETCS/ATO/TCMS), MCVideo (surveillance); MCX servers/clients; functional pieces derived from IMS. FRMCS Service Domain realised by MCX.
**Gap:** ASCI semantics (group calls, pre-emption, railway emergency call) must be reproduced through MCX equivalents and proven equivalent for the safety case.
**Risk:** Medium — functional parity for safety voice is the gating concern.

### 1.5 Application stratum
**Current:** ETCS over EDOR/CSD; voice via cab radio; little else.
**Target:** Applications reach the on-board system only via **OBapp** (FFFIS, API-accessible). ETCS binds via **SS 037**; ATO GoA1/2 via its FRMCS profile; TCMS via the Mobile Communication Gateway where the app lacks native OBapp. Voice, ETCS, ATO, video, TCMS coexist on one bearer-flexible system.
**Gap:** Application re-qualification against new interfaces; this is the safety-gated, expensive layer the gateway design is meant to protect.
**Risk:** Medium.

### 1.6 On-board architecture (TOBA / OB_GTW)
**Current:** Discrete cab radio + EDOR modem.
**Target:** TOBA gateway managing data flows, control-plane interface to applications, distributing user-plane traffic over 1..n FRMCS radios by QoS/priority. Voice MCX client tight-coupled in the cab radio; data/video MCX client loose-coupled in TOBA. FRMCS radio explicitly does **not** cover GSM-R — hybrid units carry both.
**Gap:** Hybrid on-board device strategy; fleet retrofit across ~90k cab radios; coupling decision per application.
**Risk:** High — fleet-scale, long-lead, safety-certified hardware.

### 1.7 Coexistence & fallback
**Target:** GSM-R and FRMCS parallel for a decade+; hybrid cab radios and dispatchers; defined GSM-R↔FRMCS handover at coverage boundaries; fallback to public 5G (MOCN/national roaming) and, where justified, satellite; FRMCS-T guideline for constrained networks.
**Gap:** Boundary handover continuity for safety services; border-crossing interoperability. **Caveat (public-network fallback ≠ safety-critical substitute):** today's GSM-R rulebook (Ril 481.0205 §5/§9, in force 14.12.2025 — E-2026-06-24-18) confirms the public network (P-GSM D) cannot carry Notruf or group calls; any FRMCS public-5G/national-roaming fallback must therefore re-provide mission-critical functions (MCPTT group/emergency), not merely IP connectivity, or it is not a safety-critical fallback.
**Risk:** High — coexistence is the dominant programme-risk surface.

### 1.8 Security
**Current:** Closed 2G bearer; limited but contained attack surface.
**Target:** IP/IMS/MCX stack — identity management, key management, MCX security, slice isolation.
**Gap:** Continuous assurance, patch lifecycle, threat modelling; integrity/confidentiality on some reference points still being firmed in the specs.
**Risk:** Medium–High — surface expands materially; must be carried in the safety/security case.

### 1.9 Operations & assurance
**Current:** Mature GSM-R O&M and skills (but thinning).
**Target:** New NMS, service-level visibility from high-speed line to shunting yard, automation/standardised tooling for config-test-acceptance and version alignment with full audit/certification traceability.
**Gap:** Dual-estate operations; new competencies; assurance toolchain.
**Risk:** Medium.

### 1.10 Interoperability & regulatory
**Current:** GSM-R fully border-crossing interoperable; embedded in CCS TSI.
**Target:** FRMCS introduced via CCS TSI, completed by ETSI TC RT; UIC change-control (V1 done, V2/V3 progressing); ERA, CEPT/CEC coordination; cross-border scenarios validated in MORANE2.
**Gap:** Spec stability (V2/V3 still moving); national timelines diverge (e.g. France 2028–2035, commercial from 2032; Germany an early mover).
**Risk:** Medium — managed by standards alignment and phased national plans.

## 2. Quality-attribute scorecard

| Attribute | GSM-R (2G) | FRMCS (5G SA + MCX) | Direction |
|-----------|-----------|---------------------|-----------|
| Availability / safety continuity | High but supply-eroding | High by design (dedicated, prioritised) | Maintained → improved |
| Capacity / throughput | Capped (CS, ~9.6 kbit/s data) | Broadband, slice-able | Step change |
| Latency | Adequate for CS voice/ETCS | Low (URLLC-class for MC) | Improved |
| Capability breadth | Voice + basic ETCS | + ATO, video, TCMS, IoT | Step change |
| Evolvability | None (terminal) | High (gateway/bearer flexibility) | Step change |
| Security posture | Contained legacy | Larger surface, modern controls | Trade-off |
| Cost trajectory | Rising (obsolescence) | High capex, predictable lifecycle | Front-loaded |
| Skills availability | Declining | Growing (mainstream 5G/MCX) | Improved |
| Supplier diversity | Narrow, exiting | Broad (5G/ORAN ecosystem) | Improved |

## 3. Key architectural decisions (and their open questions)

1. **Gateway decoupling (TOBA/OB_GTW + trackside GTW).** *Settled* — adopt; it is the source of bearer flexibility and lock-in protection.
2. **Coupling per application** — voice tight (cab radio), data/video loose (TOBA). *Open per application class* as MCX/3GPP releases mature; revisit ETCS and ATO coupling at each release gate.
3. **Spectrum strategy** — 1900 MHz n101 (capacity) + refarmed sub-GHz (coverage). *Settled in principle*; site density and refarming sequencing are NPO outputs.
4. **Network ownership** — dedicated rail 5G SA spine (Option B) vs. hosted/MOCN (Option C). *Settled*: dedicated spine, public-5G/satellite as fallback layer.
5. **RAN openness** — ORAN vs. classic RAN. *Open*; track product maturity, decide at procurement.
6. **Coexistence boundary design** — handover and fallback behaviour for safety services. *Open*; primary PoC objective.

## 4. Assessment verdict

The transition is **necessary** (obsolescence, contracting 2G supply/skills base, capability ceiling — **not a 2030 cliff; see Timeline premise, corrected 2026-08-15**) and **architecturally sound** under Option B. The FRMCS reference architecture — 5G SA transport, MCX service layer, gateway decoupling, OBapp-mediated applications — is well-formed and standards-anchored. The residual risk is concentrated in three places: **RF coverage** (the make-or-break layer), **fleet-scale on-board retrofit** (TOBA/hybrid cab radios), and **multi-year coexistence**. The recommended posture is a **services-led, phased parallel run** with early de-risking PoCs aligned to 5GRail/MORANE2, dedicated spectrum for the spine, and public-5G/satellite as a sanctioned fallback rather than the foundation.

---

## References (standards & sources)

- **UIC** — FRMCS programme, specifications (FRS/SRS V1 finalised; V2/V3), FRMCS-Transition (FRMCS-T) guideline; TOBA on-board architecture & migration scenarios.
- **ERA** — FRMCS SRS (AT-7800) and TOBA FRS (TOBA-7510); CCS TSI introduction path.
- **3GPP** — Mission-Critical Services (MCX): MCPTT, MCData, MCVideo; common MC architecture (e.g. TS 23.380); IMS-derived functions.
- **CEPT/ECC** — Decision ECC (20)02, RMR spectrum (1900 MHz n101 + refarmed sub-GHz).
- **ETSI TC RT** — Railway Telecommunications technical specifications completing FRMCS.
- **EU-Rail / FRMCS Deployment Group** — migration scenarios; coexistence to ~2030+, GSM-R switch-off around 2030 or shortly after. **⚠️ SUPERSEDED as a timeline source (2026-08-15) — see Timeline premise; retained here only to show what the original ADR rested on.**
- **Projects** — 5GRail (Horizon 2020), MORANE2 / "Destination 2" (2024–2027), 5G-RACOM (Franco-German), Digitale Schiene Deutschland / Kontron–DB FRMCS MCX design.
- **Vendor architecture material** — Ericsson (FRMCS/5G integration; radio planning), Nokia (1900 MHz n101 live test-track call), ANDREW (RF foundation, site-sharing filters).
- **National programmes** — SNCF Réseau (2028–2035, commercial from 2032; Kontron lifecycle contract); Deutsche Bahn / DB Infrago early-mover trials; DE national GSM-R switch-off planned **2035**, ~16,000–21,000 vehicles, €1.2–2.4bn retrofit, no EU legal mandate yet; EU-level GSM-R support to ≥2030 per UNITEL Committee 2021, **now superseded by the 31 Dec 2040 Class B funding date in Reg (EU) 2026/693 Art 8(2) (E-2026-08-01-11, -16)**; path = FRMCS-V3 (end-2026) → TSI ZZS 2027 → 5yr → earliest partial switch-off 2032 (Sektorinitiative FRMCS-Fahrzeugmigration — E-2026-06-24-11, -13).

*Note (revised 2026-08-15): the original template placeholder text — "ADR number, deciders and status are placeholders, renumber before circulating" — was removed as inaccurate and misleading. **ADR-001 is not a placeholder:** it is the parent decision for eight downstream ADRs and is referenced across 338 evidence rows. The **Status field is real and currently `Proposed`** — it has never been ratified, which is a live finding, not a template artefact.*
