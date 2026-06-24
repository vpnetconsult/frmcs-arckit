# ADR-001: Transition of railway operational communications from GSM-R (2G) to FRMCS (5G)

**Status:** Proposed
**Date:** 2026-06-24
**Deciders:** Infrastructure Manager CTO / Head of Telecoms · ERTMS Programme · Architecture Review Board · National Safety Authority interface
**Tags:** ERTMS · GSM-R · FRMCS · 5G SA · 3GPP MCX · CCS TSI · spectrum

---

## Context

GSM-R is the communications leg of ERTMS, paired with ETCS for signalling. It is a GSM Phase 2+ (2G) bearer carrying ASCI voice features (VGCS / VBS / eMLPP), location-dependent addressing, and circuit-switched ETCS data over EDOR (~9.6 kbit/s CSD). It is deployed on the order of 130,000 km of track in Europe (≈210,000 km worldwide) with roughly 90,000 on-board cab radios, in the R-GSM / E-GSM bands around 876–880 / 921–925 MHz.

Three forces now compel a decision:

1. **Obsolescence and supply risk.** Major suppliers have signalled discontinuation of GSM-R maintenance from around 2030, and the engineering skills base for 2G is contracting. EU-Rail / FRMCS Deployment Group scenarios assume a final GSM-R switch-off around 2030 or shortly after, with a decade-plus parallel-run period before that.
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

Keep the 2G estate running with sourced spares and bespoke vendor support past 2030.

| Dimension | Assessment |
|-----------|------------|
| Complexity | Low near-term, High long-term |
| Cost | Rising sharply; bespoke support, spares scarcity |
| Scalability | None — capacity and capability are capped |
| Safety continuity | Degrading — supply and skills risk |
| Regulatory fit | Diverges from CCS TSI direction |

**Pros:** No migration programme; no spectrum/RAN capex now.
**Cons:** Terminal architecture; supplier exit ~2030; cannot host ATO/video/dense ETCS; growing skills gap; a deferral, not a decision.

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

## Action Items

1. [ ] Ratify Option B (dedicated 5G SA + MCX, parallel run) as target; record Option C as fallback layer.
2. [ ] Commission rail-specific Network Planning & Optimisation (NPO): inter-site dimensioning in RMR bands, reuse assessment of GSM-R sites/backhaul, tunnel and cell-edge coverage modelling.
3. [ ] Define the service catalogue and per-application QoS/priority profiles (voice, ETCS, ATO, video, TCMS) to set base requirements.
4. [ ] Fix the on-board architecture: TOBA gateway spec, OBapp/OBrad/OBom interfaces, hybrid cab-radio strategy, coupling decision per application.
5. [ ] Lock the coexistence and fallback design: GSM-R↔FRMCS handover at boundaries, public-5G/satellite fallback, border-crossing behaviour.
6. [ ] Run de-risking PoC/field trials (align with 5GRail / MORANE2 outputs; 1900 MHz n101 validated on live test track).
7. [ ] Establish the security and assurance baseline: IMS/MCX threat model, key management, patch lifecycle, safety-case evidence chain.
8. [ ] Build the migration programme plan with national timeline, funding case, RFI/RFQ, and CCS TSI / NSA conformance gates.

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

The transition is **necessary** (obsolescence, ~2030 supplier exit, capability ceiling) and **architecturally sound** under Option B. The FRMCS reference architecture — 5G SA transport, MCX service layer, gateway decoupling, OBapp-mediated applications — is well-formed and standards-anchored. The residual risk is concentrated in three places: **RF coverage** (the make-or-break layer), **fleet-scale on-board retrofit** (TOBA/hybrid cab radios), and **multi-year coexistence**. The recommended posture is a **services-led, phased parallel run** with early de-risking PoCs aligned to 5GRail/MORANE2, dedicated spectrum for the spine, and public-5G/satellite as a sanctioned fallback rather than the foundation.

---

## References (standards & sources)

- **UIC** — FRMCS programme, specifications (FRS/SRS V1 finalised; V2/V3), FRMCS-Transition (FRMCS-T) guideline; TOBA on-board architecture & migration scenarios.
- **ERA** — FRMCS SRS (AT-7800) and TOBA FRS (TOBA-7510); CCS TSI introduction path.
- **3GPP** — Mission-Critical Services (MCX): MCPTT, MCData, MCVideo; common MC architecture (e.g. TS 23.380); IMS-derived functions.
- **CEPT/ECC** — Decision ECC (20)02, RMR spectrum (1900 MHz n101 + refarmed sub-GHz).
- **ETSI TC RT** — Railway Telecommunications technical specifications completing FRMCS.
- **EU-Rail / FRMCS Deployment Group** — migration scenarios; coexistence to ~2030+, GSM-R switch-off around 2030 or shortly after.
- **Projects** — 5GRail (Horizon 2020), MORANE2 / "Destination 2" (2024–2027), 5G-RACOM (Franco-German), Digitale Schiene Deutschland / Kontron–DB FRMCS MCX design.
- **Vendor architecture material** — Ericsson (FRMCS/5G integration; radio planning), Nokia (1900 MHz n101 live test-track call), ANDREW (RF foundation, site-sharing filters).
- **National programmes** — SNCF Réseau (2028–2035, commercial from 2032; Kontron lifecycle contract); Deutsche Bahn / DB Infrago early-mover trials; DE national GSM-R switch-off planned **2035**, ~16,000–21,000 vehicles, €1.2–2.4bn retrofit, no EU legal mandate yet; EU-level GSM-R support to ≥2030 per UNITEL Committee 2021; path = FRMCS-V3 (end-2026) → TSI ZZS 2027 → 5yr → earliest partial switch-off 2032 (Sektorinitiative FRMCS-Fahrzeugmigration — E-2026-06-24-11, -13).

*Note: ADR number, deciders and status are placeholders — renumber to fit your sequence (e.g. for github.com/vpnetconsult/ibn-core) before circulating.*
