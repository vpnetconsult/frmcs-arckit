# Master architecture reference — GSM-R → FRMCS

> Physical component catalogue (name · role) **plus** the 3GPP-release evolution of the
> core, read through the **Nokia core-vendor lens**. Engagement working note — a
> reference synthesis over the ADRs, the GSM-R equipment map, and the evidence log.
> Every load-bearing claim traces to an evidence ID; **a row is only as strong as its
> weakest cited tier.** Trust tiers: **A** primary · **B** vendor-promotional ·
> **C** trade press · **D** aggregator.

## Document control

| Field | Value |
|---|---|
| Document ID | ARC-FRMCS-REF-MASTER-v1.0 |
| Type | Reference synthesis (components + release evolution) |
| Project | FRMCS arcKit — GSM-R→FRMCS transition + agentic oversight |
| Classification | INTERNAL (contains C-tier estate mapping + restricted-doc references) |
| Status | DRAFT · Version 1.0 · 2026-07-26 · Owner: Vpnet engagement lead |
| Companion | `gsmr-e2e-equipment-map.md` (GSM-R estate detail); `ADR-001` (target); `ADR-002` (oversight); `ADR-004` (SIL-4 boundary) |

**Binding carry-overs (from the equipment map, §10):** the 23-June *ground transport /
distribution* layer carries DB's five words only — **"a network distribution
component"** — and **no vendor may ever be joined to it**; the two competing
element-class inferences (E-2026-07-03-02 C; E-2026-06-27-05) stay uncited. DB estate
vendor split is C-tier (E-2026-06-29-02) — verify at primary before external use.

---

# Part A — Physical component catalogue

Organised by stratum, top (train) to bottom (ground). "Std-3GPP" marks names that are
standard 3GPP/ETSI architecture terms (definitional, not a repo evidence claim); "repo"
marks names the evidence log attributes with a tier.

## A1 · Onboard (cab) equipment

| Component | Role | Era | Source (tier) |
|---|---|---|---|
| **Cab Radio** | Driver operational voice: railway emergency call (REC/Notruf), group/broadcast calls, functional numbers, call arbitration | GSM-R → FRMCS (hybrid) | O-3001 test spec; E-2026-07-06-06/-08 (A, restricted) |
| **EDOR** (ETCS Data Only Radio) | The **data bearer for ETCS L2** over GSM-R CSD (~9.6 kbit/s); 40-s silence trips T_NVCONTACT → forced service brake | GSM-R | E-2026-07-06-08 (A); watchdog E-2026-07-02-34 (A) |
| **OBU** (On-Board Unit) | Generic on-board radio/comms unit; in ETCS-PS mode holds the OBU IP-address pool | GSM-R PS + FRMCS | O-8664 §2.4.4 (A, E-2026-07-26-02) |
| **TOBA / OB_GTW** (Telecom On-Board Architecture / On-Board Gateway) | The FRMCS **on-board gateway** — insulates applications from transport; distributes user-plane traffic over 1..n FRMCS radios by QoS/priority; hosts loose-coupled data/video MCX clients | FRMCS | ADR-001 §1.6; TOBA FRS (TOBA-7510) |
| **TOBA-K** | Kontron's TOBA implementation, lab-tested end-to-end in 5GRAIL WP4 (prototype) | FRMCS (prototype) | E-2026-07-25-09 (A, prototype) |
| **MCG** (Mobile Communication Gateway) | On-board gateway path for apps lacking native OBapp (e.g. TCMS) | FRMCS | ADR-001 §1.5/1.8 |
| **OBapp** (reference point, not a box) | The **only** interface applications use to reach the on-board system (FFFIS, API-accessible); ETCS binds via SS-037, ATO via its FRMCS profile | FRMCS | ADR-001 §1.5/1.8 |
| **EVC** (European Vital Computer) | The onboard ETCS "brain" — computes/ supervises movement authorities; consumes RBC data over the bearer | ETCS (bearer-agnostic) | 5GRAIL abbrev.; SUBSET-078 context (E-2026-07-25-07) |
| **DMI** (Driver Machine Interface) | Driver's ETCS display/input | ETCS | E-2026-07-12-04 (Vitale, A) |
| **ATO-OB** | Automatic Train Operation on-board (GoA1/2 now, higher later) | FRMCS-enabled | ADR-001; 5GRAIL E-2026-07-25-09 |
| **EIRENE mobiles / handhelds (GPH), controller terminals, EIRENE SIM** | Subscriber/terminal population; SIM carries the railway subscriber profile | GSM-R | E-2026-07-06-04 (A); roaming list E-2026-07-25-03 (A) |
| **TIMS** (Train Integrity Monitoring System) | Reports train integrity; spec mandates "unknown" over stale "confirmed" | Adjacent onboard | E-2026-07-02-29 (A) |

## A2 · Trackside signalling (CCS / ETCS)

| Component | Role | Source (tier) |
|---|---|---|
| **RBC** (Radio Block Centre) | The ETCS-L2 trackside safety computer — issues Movement Authorities to trains over the radio bearer; the safety-critical peer of the EVC | SUBSET-078 (A, E-2026-07-25-07); O-8664 RBC IP addressing (A, E-2026-07-26-02) |
| **RBC-RBC interface** | Handover of a train between adjacent RBCs (SUBSET-039 FIS + SUBSET-098 safe comm); FMEA'd in SUBSET-078 | E-2026-07-25-07 (A) |
| **Eurobalise / LEU** | Trackside spot-transmission (position/data) and lineside encoder — the fixed-point ETCS reference | ETCS (std); Capacity Strategy balise pilots (context) |
| **Interlocking (Stellwerk)** | Route-setting safety logic; DB's worst-and-worsening asset type (LST) per the Zustandsbericht | E-2026-06-24-19 (A) |
| **KMC** (Key Management Centre) | Cryptographic key management for ETCS/EuroRadio (and the FRMCS security regime) | ADR-012 context (E-2026-07-24-01 KMC ref) |

## A3 · Radio Access Network (RAN)

| Component | Role | Era | Source (tier) |
|---|---|---|---|
| **BTS** (Base Transceiver Station) | GSM-R air-interface radio site | GSM-R (2G) | equipment-map §4; E-2026-07-06-01 (B) |
| **BSC** (Base Station Controller) | Controls radio resource + handovers across BTSs; connects to the core over the A-interface | GSM-R (2G) | equipment-map §4 |
| **TCU / TRAU** (Transcoder) | Speech transcoding between air and core | GSM-R | equipment-map §4 |
| **RNC** (Radio Network Controller) | UMTS RAN controller (Nokia RNC) — the 3G analogue of the BSC | UMTS (3G) — reference only | Nokia UMTS deck (D, E-2026-07-26-05) |
| **gNodeB** | 5G Standalone base station — the FRMCS radio site; candidate **ORAN** for openness/diversity | FRMCS (5G SA) | ADR-001 §1.2 |

## A4 · Core network — NSS → 5GC (**see Part B for the release evolution**)

| Component | Role | Era / release | Source (tier) |
|---|---|---|---|
| **MSC / VLR** (Mobile-services Switching Centre / Visitor Location Register) | Circuit-switched call switching + mobility; VLR holds the temporary subscriber/location record | GSM/UMTS Rel-99 | equipment-map §5 (A); Nokia UMTS deck (D) |
| **GMSC** (Gateway MSC) | Gateway to external networks (PSTN/ISDN); interrogates HLR to route calls | Rel-99 | equipment-map §5 (A) |
| **HLR** (Home Location Register) | The master subscriber register (semi-permanent profile + location) | Rel-99 → | equipment-map §5 (A) |
| **AuC** (Authentication Centre) | Generates auth/ciphering data (USIM↔network mutual auth) | Rel-99 → | Nokia UMTS deck (D) |
| **EIR** (Equipment Identity Register) | Terminal-equipment verification | Rel-99 → | Nokia UMTS deck (D) |
| **GCR** (Group Call Register) | Holds group/broadcast-call definitions — the ASCI (VGCS/VBS) enabler; interface to MSC left unchanged in BICN | GSM-R specific | TS 103 066 (A, E-2026-07-26-03); TS 143 068/069 (A) |
| **GCSMSC** (Group-Call-Serving MSC) | Anchors a group/broadcast call; **GCSMSC + GCR Redundancy** is the Rel-11 group-call resilience feature | GSM-R Rel-11 | TS 103 147 (A, E-2026-07-01-09) |
| **FNN** (Functional Number Node) | Resolves functional numbers / location-dependent addressing | GSM-R specific | equipment-map §5 (A) |
| **MSC-Server (MSC-S)** | **Rel-4 split:** the *signalling-only* half of the former MSC | Rel-4 (BICN) | TS 103 066 (A, E-2026-07-26-03) |
| **CS-MGW** (Circuit-Switched Media Gateway) | **Rel-4 split:** the *user-data* half of the former MSC (bearer over ATM or IP) | Rel-4 (BICN) | TS 103 066 (A, E-2026-07-26-03) |
| **GMSC-Server + CS-MGW** | Same split applied to the gateway MSC | Rel-4 (BICN) | TS 103 066 (A) |
| **SGSN** (Serving GPRS Support Node) | PS-domain mobility + session control; network access control | GPRS/EGPRS (PS) | O-8664 (A, E-2026-07-26-02); Nokia UMTS deck (D) |
| **GGSN** (Gateway GPRS Support Node) | PS-domain gateway to external IP networks (PDN); packet routing/tunnelling | GPRS/EGPRS (PS) | O-8664 (A); Nokia UMTS deck (D) |
| **BG / CGF** (Border Gateway / Charging Gateway Function) | Secure inter-PLMN PS connection; charging intermediary | PS | Nokia UMTS deck (D) |
| **5GC** (5G Core) — **AMF, SMF, UPF, UDM, UDR, AUSF, PCF, NRF, NSSF** | Service-based 5G SA core with control/user-plane separation + slicing. AMF=access/mobility mgmt; SMF=session mgmt; **UPF=user-plane forwarding**; UDM/UDR=unified subscriber data; AUSF=auth; PCF=policy; NRF=NF discovery; NSSF=slice selection | FRMCS (5G SA) | ADR-001 §1.3 (repo); NF names Std-3GPP; UPF/AMF/SMF attack surface E-2026-07-24-01 (A) |
| **IMS / CSCF** (IP Multimedia Subsystem / Call-Session Control Function) | SIP session control for the MCX service layer (P/I/S-CSCF) | FRMCS | ADR-001 §1.4 (repo); CSCF Std-3GPP |
| **HSS** (Home Subscriber Server) | IMS-era master subscriber DB (HLR successor) | FRMCS/IMS | ADR-012 (repo); Std-3GPP |
| **Core redundancy — MSC pool / "RANflex"** | A RAN node connects to *multiple* core nodes so one core-node loss ≠ area outage; TS 103 147 mandates **automatic** switchover incl. for maintenance events | Rel-5 → Rel-17 | TS 123 236 (A, E-2026-07-05-08); TS 103 147 (A, E-2026-07-01-09) |

## A5 · Service layer (ASCI → MCX)

| Component | Role | Era | Source (tier) |
|---|---|---|---|
| **ASCI** — VGCS / VBS / eMLPP | GSM-R bespoke: Voice Group Call, Voice Broadcast, enhanced Multi-Level Precedence & Pre-emption | GSM-R | TS 143 068/069 (A, E-2026-07-05-06/-07) |
| **REC** (Railway Emergency Call) + Functional/Location-Dependent Addressing | The safety-critical GSM-R feature set — the **MCX-equivalence bar** (PR15) | GSM-R | TS 103 066 §7.3 (A); UIC test plan E-2026-07-25-11 (A, draft) |
| **MCX** — MCPTT / MCData / MCVideo | FRMCS 3GPP Mission-Critical service layer: MCPTT (voice), **MCData (ETCS/ATO/TCMS)**, MCVideo (surveillance); realised over IMS | FRMCS | ADR-001 §1.4; 5GRAIL E-2026-07-25-09 (A) |
| **MCX server / client** | Service-domain server + on-board/dispatcher clients (voice tight-coupled in cab radio, data/video loose-coupled in TOBA) | FRMCS | ADR-001 §1.4 |

## A6 · Ground transport / distribution layer — **the 23-June culprit layer**

- Citable identification: **"a network distribution component"** — planned swap → single software fault → **no alarm** → automatic failover to the functional redundancy never engaged → manual recovery (~2 h standstill, first trains ≈00:30); cyberattack ruled out. (E-2026-06-27-01/-02/-03, A.)
- **Quarantine absolute:** no vendor name; the two element-class inferences stay uncited.

## A7 · Ground estate / data centres

| Component | Role | Source (tier) |
|---|---|---|
| **DTZ data centres (geo-redundant)** | Centralised CCS estate; **cold standby** now, virtualised **warm standby** (Cloud4Rail / vendor-independent COTS + certified safety layer) as Zielbild; disaster switchover kept **manual** by design | E-2026-07-02-25 (A); Cloud4Rail E-2026-07-02-01/-03/-27 |

## A8 · Dispatcher / control-room side

| Component | Role | Source (tier) |
|---|---|---|
| **Dispatcher terminals** (incl. **DICORA**) | Dispatcher call handling, OTDI, kill sequences, train/mobile display | E-2026-07-06-09 (A) |
| **FDS** (Functional Dispatcher System) | National dispatcher system (Kontron, LTG Infra) | E-2026-07-06-01 (B) |
| **Fixed control panels** | Lineside/dispatcher fixed radio access | E-2026-07-06-01 (B) |

## A9 · Network management & assurance

| Component | Role | Source (tier) |
|---|---|---|
| **NMS** (Network Management Subsystem) | O&M across the estate; service visibility line→yard | ADR-001 §1.9 |
| **Nokia NetAct** | Nokia's OSS/NMS framework (UMTS-era reference) | Nokia UMTS deck (D, E-2026-07-26-05) |
| **VIAVI EVOIA / drive-test + passive monitoring** | COTS GSM-R/FRMCS network-assurance tooling (drive test, passive probes, "cyber inter-domain correlations") | E-2026-07-26-01 (B, promotional) |
| **Out-of-band monitoring (ITU-T Q.752 pattern) / QoS measurement (O-2475)** | Independent listener watching *actual* signalling traffic — detects the fault a component won't self-report (the 23-June lesson); O-2475 defines the GSM-R QoS KPIs incl. MATVR | E-2026-06-30-03; O-2475 A (E-2026-07-25-08) |

## A10 · Agentic oversight layer (ADR-002 — **oversight, not control**)

| Component | Role | Source (tier) |
|---|---|---|
| **Risk Sentinel agent** | Continuous risk register + decision-ready alert before threshold (closes the "why nobody knew" gap, R12) | ADR-002 (repo, Proposed) |
| **Assurance agent** | Emits the evidence chain / audit trail | ADR-002 |
| **Bid/RFP agent** | Flags vendor concentration + attaches source-trust tiers (R8) | ADR-002 |
| **Deterministic SIL-4 kernel (boundary)** | Certified safety core the agents advise *around* but never actuate; EN 50129 freedom-from-interference (ADR-004) | ADR-004 (repo) |

**Guardrail:** the oversight layer advises and protects; **safety-critical actuation stays human-in-command.**

## A11 · Interface quick-reference

| Interface | Between | Era |
|---|---|---|
| **Um** (air) | Mobile ↔ BTS | GSM-R |
| **A** | BSS ↔ NSS (BSC↔MSC) | GSM-R |
| **B/C/D/F/G** | MSC↔VLR / HLR↔GMSC / HLR↔VLR / MSC↔EIR / VLR↔VLR | GSM/UMTS |
| **E** | MSC ↔ MSC / network ↔ network (MAP & ISUP; roaming, cross-network pre-emption) | GSM-R |
| **Mc / Nc / Nb** | MSC-S↔CS-MGW / MSC-S↔GMSC-S / CS-MGW↔CS-MGW (Rel-4 BICN) | Rel-4 |
| **Gb / Gn / Gp** | BSS↔SGSN / SGSN↔GGSN / inter-PLMN PS | GPRS/EGPRS |
| **Uu / N1 / N2 / N3 / N4 / N6** | UE↔gNodeB / UE↔AMF / gNodeB↔AMF(NGAP) / gNodeB↔UPF / SMF↔UPF(PFCP) / UPF↔DN | 5G SA |
| **OBapp / OBrad / OBom** | Application ↔ on-board system / radio / O&M | FRMCS |

---

# Part B — Physical core architecture by 3GPP release (Nokia core-vendor lens)

**The through-line.** Rail's operational-radio core is not bespoke hardware — it rides the
mainstream 3GPP core, one release behind the consumer world. Every generation splits a
previously-monolithic function into more, smaller, more separable boxes: **monolithic MSC
(Rel-99) → signalling/media split (Rel-4 BICN) → pooled cores (Rel-5+) → packet core for
data (GPRS/EGPRS) → fully service-based, control/user-plane-separated 5G core (5G SA).**
The engagement's redundancy and silent-fault lessons attach to *every* step of this
lineage, because the redundancy that stood idle on 23 June is standard 3GPP core
architecture, not railway-exotic kit (E-2026-07-05-08).

## B1 · Release-by-release physical evolution

| 3GPP release | Core physical model | Key boxes | Redundancy mechanism | Rail/GSM-R specifics |
|---|---|---|---|---|
| **Rel-99** (GSM-R baseline) | **Monolithic** — one MSC entity does switching *and* media; GMSC gateways out | MSC/VLR, GMSC, HLR, AuC, EIR (+ SGSN/GGSN for PS) | Basic 1+1 / geographic; MSC-level | GCR, GCSMSC, FNN for ASCI (VGCS/VBS/eMLPP) + functional addressing; **the GSM-R baseline remains Rel-99** |
| **Rel-4 (BICN)** | **Signalling/media split** — MSC → **MSC-Server** (signalling) + **CS-MGW** (media, ATM/IP); bearer-independent (BICC) | MSC-S, CS-MGW, GMSC-S; Mc/Nc/Nb | Same functions/QoS as Rel-99 (backward-compatible "black-box replacement") | **Optional** for GSM-R — TS 103 066 explicitly does *not* mandate it; baseline stays Rel-99 (E-2026-07-26-03) |
| **Rel-5 → Rel-17 (pooling)** | **Pooled cores** — a RAN node connects to *multiple* core nodes ("MSC pool"/RANflex), removing the one-core-per-area SPOF | MSC pool; NRI-based routing | **Automatic switchover mandated** for GSM-R by ETSI TS 103 147 (incl. maintenance events) — the requirement the 23-June mode breached | Feature frozen since Rel-5; maintained to Rel-17 (E-2026-07-05-08) |
| **PS evolution (GPRS/EGPRS)** | **Parallel packet core** for data (ETCS PS-mode) | SGSN, GGSN, BG, CGF; Gb/Gn/Gp | PS-domain resilience; QoS profile per ETCS | ETCS moves CS→PS on GSM-R to beat CS capacity limits (O-8664, Nokia co-author — E-2026-07-26-02) |
| **5G SA (FRMCS)** | **Service-based, CP/UP-separated** — every core function a discrete network function; slicing for mission-critical isolation | **AMF, SMF, UPF, UDM/UDR, AUSF, PCF, NRF, NSSF** + **IMS/CSCF, HSS**; N1–N6 | Geo-redundant active-active cores + slice isolation; **but silent-fault detection still needs out-of-band monitoring on top** (E-2026-07-24-01, E-2026-07-02-25) | FRMCS service layer = **MCX** (MCPTT/MCData/MCVideo) over IMS; gateways (TOBA/GCG) decouple apps from this core |

## B2 · Nokia's footprint in this lineage (as the record actually holds it)

Nokia appears across the whole span — but **at different tiers, and not always as the
GSM-R *core* vendor**. Stated honestly:

| Layer / release | Nokia's role in the record | Tier |
|---|---|---|
| **Rel-99 GSM-R NSS (core)** | Nokia Siemens Networks (NSN) supplied **Release-99 NSS** in the TEN interoperability plans; mixed-vendor NSN-NSS ↔ Kapsch-BSS proven | **A** (E-2026-07-06-02/-03) |
| **Rel-4 BICN (core)** | In the TEN plans the **Rel-4 NSS was Kapsch, not Nokia** — so Nokia's Rel-4 core role is *not* GSM-R-evidenced here; the Rel-4 MSC-S/CS-MGW model is described in Nokia's own **generic UMTS training deck** | Rel-4 GSM-R = Kapsch (A); Nokia Rel-4 model = **D** (generic deck, E-2026-07-26-05) |
| **PS core (GPRS/EGPRS)** | Nokia (M. Lauwers) **co-authored** the UIC ETCS-PS-mode guideline O-8664 | **A** (E-2026-07-26-02) |
| **UMTS 3G core/RAN** | Nokia RNC, Nokia **NetAct** NMS — reference/tutorial only (not rail) | **D** (E-2026-07-26-05) |
| **DB GSM-R RAN** | Nokia = **south RAN** (regional split) | **C** — verify at primary (E-2026-06-29-02) |
| **FRMCS 5G SA (target core)** | Nokia + DB **"Highly Reliable FRMCS 5G Design"** whitepaper (active-active geo-redundant core, dual radio layers, multi-path IP); **n101 1900 MHz 5G SA** call at the DTB test track, commissioned 09/2025 | Design **B** (E-2026-07-01-12); n101 **C**, verify (E-2026-07-03-02) |

**Reading it:** the honest Nokia core-vendor story is a *bookend* one — **A-tier at the
Rel-99 GSM-R NSS bookend and (B-tier design + C-tier trial) at the 5G-SA FRMCS bookend**,
with the Rel-4/UMTS middle carried only by Nokia's own generic material (D). The clean
GSM-R Rel-4 core in the record is **Kapsch→Kontron**, not Nokia. Do not silently promote
the D-tier generic-UMTS Rel-4 slides into a Nokia-GSM-R-Rel-4 claim.

## B3 · What carries, what breaks, across the releases (engagement lens)

- **Redundancy is standard 3GPP, at every step** — 1+1 (Rel-99) → pooling (Rel-5+) → active-active 5G SA. The 23-June failure was therefore a *proving-discipline* problem, not a technology gap: the redundancy existed and was standard; its **automatic trigger** (mandated since TS 103 147) was defeated by a **silent** fault (E-2026-07-05-08, E-2026-07-01-09).
- **CP/UP separation is a through-line, not a 5G novelty** — it starts at Rel-4 (MSC-S vs CS-MGW) and completes at 5G SA (control NFs vs UPF). The same separation that the CCS '25 paper shows is *bridgeable* when routing enforcement is weak (E-2026-07-24-01).
- **Feature parity is the recurring risk** — the ASCI/REC/functional-addressing set (Rel-99 GCR/GCSMSC/FNN) must be reproduced by MCX at 5G SA and *proven equivalent* (PR15). The GSM-R feature bar is documented at CN level in TS 103 066 §7.3 and as tests in the UIC plan (E-2026-07-26-03, E-2026-07-25-11).
- **The gateway (TOBA/GCG) is what makes the release churn survivable** — by decoupling ETCS/ATO from the transport core, a new 3GPP release can be absorbed without re-qualifying the safety-gated application layer (ADR-001, R6).

---

## Evidence refs (consolidated)

Onboard/estate/GSM-R: E-2026-06-27-01/-02/-03 · E-2026-06-29-02 (C) · E-2026-06-30-03 · E-2026-07-02-21/-25/-29/-34 · E-2026-07-06-01…-09.
Standards lineage & core: E-2026-07-01-09 (TS 103 147) · E-2026-07-05-05/-06/-07/-08 · E-2026-07-26-02 (O-8664) · E-2026-07-26-03 (TS 103 066) · E-2026-07-26-05 (Nokia UMTS deck, D).
FRMCS target & Nokia: ADR-001 · ADR-002 · ADR-004 · E-2026-07-01-10/-12 · E-2026-07-12-02 (FRMCS SRS) · E-2026-07-24-01 (5G-core security) · E-2026-07-25-07/-08/-09/-11.

*Honesty constraints from `gsmr-e2e-equipment-map.md §10` apply in full to this document.*
