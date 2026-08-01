# SDO mapping — FRMCS ↔ GSM-R, and leverage vs Consumer 5G SA

**Purpose:** map which Standards Definition Organisations (SDOs) own which layer of FRMCS, trace each layer *backwards* to its GSM-R equivalent, and separate what FRMCS **reuses from the consumer 3GPP 5G Standalone (SA) stack** from what is **rail-specific divergence**.

**Method / status:** v3 (2026-08-01; v2 2026-08-01; v1 2026-07-30), **anchored on the Kontron/DB (DSD) FRMCS MCX Design final report** (E-2026-07-01-10, Feb 2021, V1.1) and the ETSI/3GPP/CENELEC spec set already on file.

**v3 changes (2026-08-01):** added **§1b** (the research → normative pipeline — where foundation input enters and graduates; flagship: IRTF RFC 9315 IBN → 3GPP TS 28.312/28.530 + NWDAF → ADR-002 autonomy, with the FRMCS link marked *(inferred)* — confirmed out-of-normative-scope by FRMCS FFFIS-7950's reference list, E-2026-08-01-21); **broadened the IETF row** (full RFC set incl. HTTP/2 RFC 9113 + JSON RFC 8259; standards-body vs IRTF-research clarified); **refreshed §4** into a 3GPP-roadmap capability→release map (three-axis Release/Edition/Baseline reconciliation; Kontron 2021 gaps carried to their Rel-18 status; roadmap = the pacing function beneath the migration triangle).

**v4 changes (2026-08-01):** §4 **authoritatively grounded by the official 3GPP Work Plan** (E-2026-08-01-22, dated 2026-06-26) — the FRMCS **Phase axis** (Phase N = Rel-(14+N), Phase 1–6 = Rel-15–20) added as the 4th numbering axis; the **MONASTERY/FRMCS work-item series → release table** added (the roadmap in 3GPP's own WI names); the **forward view resolved** (Rel-20/Phase 6 live at 55%); spec-coverage note added (TS 22.261 base 5G reqs now on file, E-2026-08-01-23).

**v2 changes (2026-08-01):** added **IEC** and **UNISIG** rows to §1; IETF row de-inferenced (TS 33.210 §6 = the concrete 3GPP→IETF consumption point, E-2026-08-01-03); §4a security sub-tree updated — 3GPP SCAS (TS 33.117) + NDS/IP (TS 33.210) now EVIDENCED on file (E-2026-08-01-02/-03), the interconnect gap is confirmed **operational** (spec-side GTP defences exist); EN 50128 A1/A2 amendments on file (E-2026-07-31-05, E-2026-08-01-01) — the safety↔security bridge (EN 5012x ↔ IEC 62443) is now primary from **both sides**; successor watches added (EN 50716:2023, IEC 63452 — to verify, not asserted). Spec IDs are sourced from that report (Ch. 3–7) or from logged evidence rows; where a mapping is analytic inference it is marked *(inferred)*. Kontron release-mapping is 2021-vintage (Rel-15 available, Rel-16 in progress); the currently-logged ETSI normative editions are Rel-18 (e.g. TS 123 280 V18.11.0, E-2026-07-26-16) — release columns below reflect *when a capability first landed*, not the latest edition.

**Outcome anchor:** safe, continuous rail operations. This mapping exists to show where the safety-critical bearer's behaviour is *owned* (which SDO can change it) and where FRMCS inherits consumer-5G risk vs adds rail control.

---

## 1. The SDO landscape (who owns what)

| SDO | Role in FRMCS | Deliverables | Evidence |
|---|---|---|---|
| **UIC** (International Union of Railways) | Sector owner; launched FRMCS as a project in 2014. Owns the *user/operational* requirements and drives FRS/SRS with ERA + stakeholders | **URS** (User Requirement Spec), **FRS** (Functional Requirement Spec), **SRS** (System Requirement Spec) | E-2026-07-01-10; E-2026-07-12-02 (FRMCS SRS §15 MCX) |
| **ETSI TC-RT** (Technical Committee for Railway Telecommunications) | **Implementor / interop-governance tier — the GSMA-role for rail.** EU-Commission-mandated (by end-2022) to *profile* finalised 3GPP building blocks into the **normative** FRMCS architecture; does **not** originate the radio/service specs (its work "assumes the utilization of 3GPP 5G and MCX") | **TR 103 459** (FRMCS logical architecture); **TS 103 764** (architecture), **TS 103 765-4** (trackside gateway), **TS 103 792** (GSM-R interworking) | E-2026-07-01-10; E-2026-07-26-11/-12/-13 |
| **3GPP** | **Technology / roadmap tier — the CORE (Fig. 7-4 base).** Defines the actual specs — 5G System (SA) + Mission-Critical (MCX) + IMS + security — **with rail-specific work items on its own roadmap** (SA1 **TS 22.289**, functional aliasing+location, GSM-R interworking, MONASTERY2/eMONASTERY2). FRMCS is a profile of 3GPP; rail reqs flow *down into* 3GPP, not just into ETSI | 5GS (23.501/23.502), MCX (22.28x / 23.28x / 24.xxx), security (33.501/33.180), rail reqs (**TS 22.289 FRMCS**) | E-2026-07-01-10; E-2026-07-26-14/-16..-20 |
| **CEN/CENELEC** | Railway cybersecurity + functional-safety framework wrapped around the bearer | **CLC/TS 50701** (railway cybersecurity), **EN 5012x** (RAMS/SIL; EN 50128:2011 A1+A2 amendments on file — clause bodies paywalled; **watch:** reported successor EN 50716:2023, verify) | E-2026-07-26-15; ADR-004; E-2026-07-31-05, E-2026-08-01-01 |
| **IEC** | **OT-cyber technology core — the "3GPP-role for security"** (§4a security sub-tree): the ISA/IEC 62443 IACS series that CLC/TS 50701 profiles for rail — *TS 50701 : IEC 62443 :: ETSI TC-RT : 3GPP*. EN 50128/A2's Introduction itself delegates IT security to the 62443 series (bridge primary both sides). **Successor CONFIRMED (E-2026-08-01-17):** IEC 63452 ED1 "Railway applications – Cybersecurity" at CDV (IEC 9/3232A/CDV, TC 9; CENELEC parallel vote; ~2028 stability) — supersedes CLC/TS 50701, graduating the rail-cyber layer TS → full IEC/EN standard (RAMS-lifecycle-integrated, role-based) | **IEC 62443-2-1:2024** (asset-owner security program; preview on file); 62443-3-2 / -3-3 (zones-conduits risk + SL system requirements; paywalled, NOT on file); **IEC 63452 ED1 (draft/CDV)** | E-2026-07-31-03; E-2026-08-01-01 (delegation); E-2026-08-01-17 (63452) |
| **ERA** (EU Agency for Railways) | Integrates FRS/SRS into EU law; owns interoperability conformance | **CCS TSI** (train radio + ETCS) — current law = **Reg (EU) 2023/1695 as amended by Reg (EU) 2026/693** (Annex I replaced wholesale; Table A 3 = non-exclusive safe harbour into CSM-RA; FRMCS Baseline 0 mandated but "not tender-complete", Note 9) | **E-2026-08-01-11 (TSI as amended, on file); E-2026-08-01-13 (edition/harmonisation verification)**; E-2026-07-25-05 (ERA Art-12 *report about* the TSI — NOT the TSI text); E-2026-07-01-10 |
| **UNISIG** (industry consortium, UNIFE) | ETCS/ERTMS application specs riding the FRMCS bearer — meets ETSI TC-RT at the **OBapp/gateway boundary** (R6 decoupling); SUBSETs made binding via ERA's CCS TSI | **SUBSET-026** (ETCS SRS), **SUBSET-078** (RBC-interface FMEA; on file) | E-2026-07-25-07; E-2026-07-05-02 |
| **CEPT / ECC** | Spectrum designation for rail (RMR — Rail Mobile Radio). Note: designation is **non-exclusive** (Decides 2); RMR is **not a safety service** (ITU RR No. 1.59); wideband = LTE or NR (technology-neutral) | ECC/DEC + **ECC(20)02** (RMR bands; replaces (02)05/09/10) | **E-2026-08-01-06 (primary, on file)**; E-2026-06-24-04 |
| **IETF** | **A standards body, not a research one** — defines the open internet-protocol standards (Standards-Track RFCs) the 5G/IMS/MCX/SBA service layer runs on. Distinctive among the SDOs here: open participation, "rough consensus and running code", **not** nation/treaty-based (contrast ITU) nor formal-committee (contrast ISO/IEC/CENELEC). Consumed **two ways**: (a) via **3GPP profiling** (TS 33.210 §6 profiles TLS 1.3/1.2 + JWE/JWS for 3GPP use); (b) **directly by the rail app specs** — FRMCS FFFIS-7950 OBapp API = HTTP/2 + JSON + ASN.1; SUBSET-146/-137 cite the X.509/CMP/OCSP/TLS RFCs for E2E security + key management. Its **research arm is the IRTF** (Internet Research Task Force) — out of scope for the bearer stack (e.g. RFC 9315 *Intent-Based Networking* is an IRTF informational doc, not referenced; a candidate ADR-002 autonomy reference, not a protocol standard) | RFCs on file: **HTTP/2** (9113) + **JSON** (8259) [FRMCS OBapp API]; **TLS 1.3** (8446) + integrity-only ciphers (9150); **X.509 PKI** — CMP (4210), OCSP (6960); **JWT** (7519); **WebSocket** (6455); **NTP v4** (5905) + Time Protocol (868); **MPTCP** (8684); randomness (4086); UUID (4122); host reqs (1122) — consumed, not rail-specific | E-2026-08-01-21 (FFFIS-7950 — HTTP/2 + JSON, OBapp API); E-2026-08-01-03 (TS 33.210 §6 profiling); E-2026-08-01-15/-18 (SUBSET-146/-137 cite PKI/TLS/OCSP directly); E-2026-07-30-03 (SFERA — TLS 1.3 + JWT) |
| **GSMA** | The consumer-mobile **structural analogue of ETSI TC-RT**: profiles/governs 3GPP implementation for operators (roaming, device cert, deployment guidelines). FRMCS swaps GSMA → ETSI TC-RT at the implementor tier (see §1a). **Public PRDs on file** (FS.40 5G Security Guide, FS.57 MoTIF, FS.61 micro-segmentation, FS.56 MDSCert); **FS.11/19/20 interconnect guidelines = MEMBER-ONLY residual** — the gating itself evidences the §4a gap (rail has no membership channel; verify DB/sector GSMA or T-ISAC access) | NG.xxx, roaming agreements; FS-series security PRDs | E-2026-08-01-04/-07/-08/-09 (public set); §4a |
| **ETSI TC CYBER** | ETSI's cybersecurity committee (distinct from TC-RT) — authors the **Consumer Mobile Device Protection Profiles** (Common-Criteria SFRs/SARs) that GSMA's MDSCert scheme certifies against; the SDO side of the industry-body↔SDO device-security loop (GSMA feeds identified gaps back to it, §1a analogy at the device layer). No rail equivalent → the FRMCS-terminal security-certification gap (E-2026-08-01-08) | **ETSI TS 103 732 series** (Consumer Mobile Device PP: base, biometric, preloaded-apps, bootloader/root-of-trust) | E-2026-08-01-08 (via GSMA FS.56/MDSCert) |

### 1a. The Figure 7-4 model — three tiers, and ETSI ≈ GSMA (core of the mapping)

Kontron Fig. 7-4 shows the three FRMCS standardisation bodies **stacked, not sequential**. Read bottom-up — this is the load-bearing structure:

```
   UIC FRMCS           ← SECTOR / USER tier: URS, operational requirements ("what rail needs")
   ─────────────
   ETSI TC-RT          ← IMPLEMENTOR / GOVERNANCE tier: profiles 3GPP into the FRMCS
                         normative architecture (TR 103 459 → TS 103 764).
                         ROLE ANALOGUE = GSMA in consumer mobile.
   ─────────────
   3GPP                ← TECHNOLOGY / ROADMAP tier (the CORE): defines the actual
                         specs — 5G SA + MCX + security — WITH rail-specific parts
                         baked into the roadmap (TS 22.289 FRMCS reqs, functional
                         aliasing+location, GSM-R interworking, MONASTERY2/eMONASTERY2).
```

**The key correction to a naïve "UIC → ETSI → 3GPP top-down" reading:** rail requirements don't stop at ETSI — they flow **down into 3GPP itself**, which carries dedicated rail work items on its roadmap. 3GPP is where the behaviour is *defined* (the core). **ETSI TC-RT does not originate the radio/service specs — it governs their implementation for rail**, taking finalised 3GPP building blocks and profiling them into the binding FRMCS architecture. The report's own Conclusion is explicit: *"The assumption in ETSI TC-RT for FRMCS normative work is the utilization of 3GPP 5G and MCX."*

**This is the single most important leverage insight:** the FRMCS SDO structure is a **1:1 structural clone of the consumer-5G SDO structure**, with one substitution —

| Tier | Consumer 5G | FRMCS (rail) |
|---|---|---|
| Technology / spec origin | **3GPP** | **3GPP** (same body; + rail work items) |
| Implementation / interop governance | **GSMA** (profiles, roaming, device cert, deployment guidelines) | **ETSI TC-RT** (FRMCS normative architecture, interop across countries) |
| Sector / user requirements | MNO ecosystem / operators | **UIC** |

So FRMCS doesn't just *reuse consumer-5G technology* — it *reuses the consumer-5G governance shape*, swapping GSMA-the-implementor for ETSI-TC-RT-the-implementor. Everything below the ETSI/GSMA line is shared 3GPP; the rail-specific value is added at (and above) the ETSI-TC-RT tier, plus the rail work items 3GPP already carries.

**Two directions — don't conflate them:**
- **Requirements flow TOP-DOWN from UIC.** UIC is the **ultimate requirements body**: URS → FRS → SRS express *what rail needs*, flow down through ETSI TC-RT, and land as **rail work items inside 3GPP** (TS 22.289 etc.). UIC owns the *why/what* — it is the apex of the requirements chain, and the sector's future-capability strategy (E-2026-07-30-02) sits above even the URS.
- **Technology/specs are defined BOTTOM-UP at 3GPP.** The core defines 5G SA + MCX; ETSI TC-RT profiles them *upward* into the binding FRMCS architecture. 3GPP owns the *how*.
- **Legal wrapper:** ERA folds FRS/SRS into the **CCS TSI** (legally binding) → **MORANE-2** validates Edition 1.

So the stack is drawn bottom-up (3GPP at the base = the *technology core*), but **authority runs top-down from UIC** (the *requirements apex*). The two are not in tension: UIC-set requirements are precisely what get realised as 3GPP rail work items and profiled by ETSI.

---

## 1b. The research → normative pipeline (where foundation input enters, and how it graduates)

§1 and §1a are a **normative snapshot**. But standards don't appear fully formed — each has a **research / pre-normative foundation** that feeds it and matures along a pipeline. The map is therefore a *moving picture*: today's `watch` items are yesterday's research graduating.

```
LEGAL         ERA CCS TSI (Reg 2023/1695 + 2026/693)              ← binding
  ▲
NORMATIVE     3GPP TS · ETSI TS · CENELEC EN · IEC IS · UNISIG    ← the §1 roster
  ▲
PRE-NORMATIVE study items: 3GPP TR · ETSI TR                       ← "study before spec"
  ▲
RESEARCH      ERJU/Shift2Rail · EU Horizon · academia · IRTF       ← the foundation layer
             (validation alongside: MORANE-2, 5GRAIL labs — prove specs pre-deployment)
```

| Foundation body | What it is | FRMCS anchor on file | Feeds |
|---|---|---|---|
| **Europe's Rail JU (ERJU / EU-Rail)**, ex-**Shift2Rail** | The EU rail R&D body — System Pillar (target architecture) + Innovation Pillar; a *formal* TSI pathway via CCS TSI Art 11 "innovative solutions" (ERJU → Agency opinion → TSI) | CYRail (Shift2Rail H2020, E-2026-07-30-07) | → CLC/TS 50701 → IEC 63452 |
| **EU Horizon / H2020 projects** | FRMCS validation & prototyping | 5GRAIL GA 951725 (E-2026-06-29-01); 5G-RACOM multipath (E-2026-07-02-21) | → MORANE-2 validation; → 3GPP/ETSI specs |
| **SDO study stages** | pre-normative TR → normative TS | 3GPP TR 22.889 (E-2026-07-30-26); ETSI TR 103 459 (E-2026-07-30-24) | → TS 22.289; → TS 103 764 |
| **Academia / security research** | threat models, attack classes | ACM CCS (E-2026-07-24-01), SAFECOMP (E-2026-07-06-10), StrangeLove (E-2026-07-29-06), CVD catalogue (FS.40 §20) | → IEC 63452 §7 threat landscape; → GSMA MoTIF |
| **IRTF** (IETF's research arm) | internet research (Informational RFCs) | RFC 9315 *Intent-Based Networking* (not referenced) | → 3GPP SA5 mgmt specs (below); → ADR-002 autonomy |

**Flagship graduation — research that lands on this engagement's core.** Intent-Based Networking begins as **IRTF research** (RFC 9315, Informational, 2022). 3GPP then makes it **normative** in the 5G management-and-orchestration plane: **TS 28.312** (intent-driven management services) and **TS 28.530** (management & orchestration), using **closed-loop automation** plus **NWDAF** (Network Data Analytics Function) to *verify whether the stated intent is fulfilled*. That pattern — declare intent → automation realizes it within the bearer → analytics verify fulfilment — **is the agentic-oversight layer's pattern** (ADR-002/R9/R12): NWDAF-verifying-intent is the *assurance/Risk-Sentinel* role; closed-loop automation is exactly the *control* the guardrail keeps **human-in-command** over ("oversight, not control"). **The FRMCS→management-plane link is *(inferred)*, NOT a rail-spec reference:** FRMCS profiles the 3GPP *service* strata (MCX/IMS/security) — a primary mandated FRMCS spec (FFFIS-7950, E-2026-08-01-21) references the MCX service layer + HTTP/2 + JSON, and cites **nothing from SA5** (no 28.312/28.530/NWDAF). So the management plane is inherited as an operator/deployment capability, not a mandated rail interface — the intent/closed-loop substrate the autonomy layer *could* leverage, verify against FRMCS clause bodies before treating as firmer than inferred.

**The management plane is a layer the §2 stack lacks.** 3GPP **SA5** (TS 28.530 M&O · TS 28.312 intent-driven · NWDAF + MDAF analytics, TS 28.104) is distinct from the control/user planes §2 maps — it is the *orchestration/assurance* plane. Candidate fetches: TS 28.530, TS 28.312 — the bearer-native counterpart to ADR-002.

**Other graduations on file:** **CYRail (2018 research) → CLC/TS 50701 (2021) → IEC 63452 (~2028)** — a full ~10-year research→normative arc, end-to-end on file; **3GPP TR 22.889 (study) → TS 22.289 (normative rail reqs)**; **5G-RACOM multipath research → MPTCP (RFC 8684) → candidate FRMCS multi-bearer resilience (R4)**.

---

## 2. FRMCS stack by layer → SDO owner → GSM-R backward equivalent

The core mapping. Read left-to-right: each FRMCS layer, who owns it, the spec, and what it *replaces* in GSM-R.

| Layer | FRMCS — SDO + spec | GSM-R equivalent — SDO + spec | What changed |
|---|---|---|---|
| **Operational / user reqs** | UIC **URS** + operational rules | UIC **EIRENE** operational reqs (via MORANE) | Same owner (UIC); broadened to data-intensive/automated apps |
| **Functional reqs** | UIC/ETSI TC-RT **FRS** | UIC **EIRENE FRS** (v8/v15) | E-2026-07-02-30/-31 (EIRENE bar) → FRMCS FRS |
| **System reqs** | UIC/ETSI TC-RT **SRS** | UIC **EIRENE SRS** | SRS §15 = MCX (E-2026-07-12-02) |
| **Logical architecture** | ETSI TC-RT **TR 103 459 → TS 103 764** | *(none — GSM-R had no separated service/transport strata)* | **NEW**: service stratum / transport stratum split; gateway decoupling |
| **Service stratum — voice** | 3GPP **MCPTT** (TS 23.379 / 22.179 / 24.379-380) | GSM **ASCI**: VGCS (TS 43.068), VBS, eMLPP, functional numbering | E-2026-07-26-17 (MCPTT); E-2026-07-05-06 (VGCS). Group/emergency/floor-control/pre-emption re-realised on MCPTT |
| **Service stratum — data** | 3GPP **MCData** (TS 23.282 / 22.282 / 24.282-582) | GSM **SMS/CBS** (GSM 07.05), GPRS, ETCS-over-CSD | E-2026-07-26-18 (MCData); E-2026-07-26-08 (SMS). Carries ETCS/ATO/TCMS |
| **Service stratum — video** | 3GPP **MCVideo** (TS 23.281 / 22.281 / 24.281-581) | *(none — GSM-R CS ~9.6 kbit/s, no video)* | **NEW** capability (surveillance) |
| **Service stratum — common** | 3GPP **MC common** (TS 23.280 / 22.280): IdM, GMS, KMS, CMS, **functional alias** | GSM-R functional numbering + location-dependent addressing | E-2026-07-26-16. **Functional alias ≈ GSM-R functional number** (the interworking bridge) |
| **Rail service profile** | 3GPP **TS 22.289** (FRMCS reqs); ETSI TC-RT rail profiles | *(EIRENE embedded rail features directly in GSM-R)* | Rail reqs now a **3GPP SA1 work item** (Rel-15+), profiled by ETSI |
| **Session / IMS** | 3GPP **IMS** (+ SIP-Core), integrated to 5GC | GSM-R: none (CS call control in the MSC) | **NEW**: IMS session layer; Kontron flags IMS↔5GC integration (TR 23.794 CUPS) |
| **Transport stratum** | 3GPP **5GS / 5G SA** — 5GC (AMF/SMF/UPF/PCF/UDM/AUSF) + NR (TS 23.501/23.502) | GSM **2G CS** + GPRS; BSS/NSS (MSC/BSC/BTS) | E-2026-06-30-01 (core). 2G circuit-switched → 5G packet, service-based |
| **QoS** | 3GPP 5G QoS (5QI, PCF, slicing) | GSM-R: fixed 200 kHz channel, eMLPP priority | E-2026-07-01-10 Ch.6. Per-app mission-critical QoS + slices |
| **Transport security** | 3GPP **TS 33.501** (5G security architecture) | GSM A5/GEA ciphering; EIRENE security | E-2026-07-26-14. 5G mutual auth (AKA), integrity, encryption |
| **Service security** | 3GPP **TS 33.180** (MC security — KMS/SAKKE, IdMS, SRTP, XML) | GSM-R: minimal; no E2E MC key mgmt | E-2026-07-26-20. Fills the "E2E encryption optional/TBD" gap (E-2026-07-01-10) |
| **Railway cybersecurity** | CEN/CENELEC **CLC/TS 50701** (zones/conduits, on IEC 62443) | *(none formalised for GSM-R era)* | E-2026-07-26-15; corroborated E-2026-07-29-11 |
| **Functional safety** | CENELEC **EN 5012x** (RAMS/SIL-4) | EN 5012x (same family) | ADR-004. FRMCS "SIL-4 certifiable" (E-2026-07-29-09) |
| **Spectrum** | CEPT/ECC **RMR** — 1900 MHz (+900 MHz), **ECC(20)02** | ECC: **876–880 / 921–925 MHz** (GSM-R, dedicated for railway) | E-2026-08-01-06 (primary), E-2026-07-29-09 (bands). Dedicated rail spectrum retained + moved/expanded — **non-exclusive** designation (national implementation decides exclusivity); RMR not a safety service (ITU RR 1.59) |
| **Interworking** | ETSI TC-RT **TS 103 792** (GSM-R ↔ FRMCS) | *(n/a)* | E-2026-07-26-13. Enables the decade-long dual-run (R2) |
| **Regulatory** | ERA **CCS TSI** (FRMCS Class A) + CRA/NIS-2 | ERA **CCS TSI** (GSM-R Class A) | E-2026-07-25-05; R14 (CRA/NIS-2 new) |
| **Validation** | **MORANE-2** (FRMCS Edition 1) | **MORANE** (EIRENE/GSM-R) | E-2026-07-02-15 |

---

## 3. FRMCS vs Consumer 5G SA — leverage vs divergence

The user's core question: what does FRMCS take *verbatim* from the consumer 3GPP 5G SA stack, and where does it diverge?

### 3a. LEVERAGE — reused from consumer 3GPP 5G SA (little/no rail change)

| Consumer-5G element | FRMCS use | Note |
|---|---|---|
| **5GC network functions** (AMF, SMF, UPF, PCF, UDM, AUSF) | Reused as-is | Same 5G Core; rail is a tenant/profile |
| **NR radio (gNB, NR-Uu)** | Reused | Rail runs NR in RMR bands |
| **Service-Based Architecture** (HTTP/2 + JSON, REST, SBI) | Reused | The 2G→5G "core network" leap (E-2026-07-29-09) |
| **IMS** (SIP session control) | Reused, integrated to 5GC | Kontron: "SIP-Core/IMS out of the box… some customisation for functional alias" |
| **5G security** (TS 33.501 — AKA, integrity, ciphering) | Reused | The transport-security layer |
| **MCX framework** (TS 23.280/379/282/281) | Reused as the service stratum | FRMCS Service Stratum *is* the 3GPP MCX framework (E-2026-07-26-11) |
| **Network slicing / 5QI QoS** | Reused | Per-app mission-critical QoS + dedicated slices |
| **MBMS/MBS** multicast | Reused (MC MBMS API TS 23.479, Rel-16) | For group/broadcast distribution |
| **CUPS / edge** (CP/UP separation) | Reused | Kontron Ch.5.3 distributed/edge deployment |

**Implication:** FRMCS inherits the consumer 5G SA **attack surface and failure modes** along with the capability — e.g. the 5G-core control-plane/PITM class (E-2026-07-24-01) applies to FRMCS *by inheritance*. Leverage cuts both ways (R14).

### 3b. DIVERGENCE — rail-specific, added on top of / around consumer 5G

| Divergence | What & why | SDO | Evidence |
|---|---|---|---|
| **Dedicated spectrum** | RMR (900 MHz paired + 1900 MHz TDD) designated for rail vs shared public MNO bands — but on a **NON-exclusive basis** (ECC/DEC/(20)02 Decides 2); dedicated-for-rail in practice, exclusivity is a national-implementation matter, not granted by the CEPT text; RMR is **not a safety service** (ITU RR No. 1.59) | CEPT/ECC | E-2026-08-01-06 (primary); E-2026-07-29-09 |
| **Rail service reqs** | TS 22.289 FRMCS requirements — a *rail-specific 3GPP SA1* work item | 3GPP + UIC | E-2026-07-01-10 |
| **Functional alias** | Rail's location/role addressing (≈ GSM-R functional numbering); needs SIP-Core/IMS customisation | 3GPP MC common (23.280) | E-2026-07-26-16 |
| **Railway Emergency Call** | REC/Notruf as an MCPTT emergency/imminent-peril profile | 3GPP MCPTT + UIC | E-2026-07-26-17 |
| **FRMCS architecture** | Service/transport stratum split; TR 103 459 / TS 103 764 — not a consumer-5G concept | ETSI TC-RT | E-2026-07-26-11 |
| **Gateway decoupling (TOBA / OB_GTW / OBapp)** | "Transport transparent to the application" — ETCS not re-qualified on bearer change (R6) | ETSI TC-RT | E-2026-07-01-10; E-2026-07-26-12 |
| **GSM-R interworking** | TS 103 792 — dual-run bridge; no consumer-5G analogue | ETSI TC-RT | E-2026-07-26-13 |
| **SIL-4 / deterministic** | Hard latency + SIL-4 certifiability + safety layer | CENELEC | E-2026-07-29-09; ADR-004 |
| **On/off-network for rail** | Off-network (ProSe-style) operation for rail continuity | 3GPP MCX | E-2026-07-26-16 |
| **Dedicated/exclusive network** | Private rail network vs public MNO; geo-redundancy doctrine | DB/DSD + 3GPP | E-2026-07-02-25 |

---

## 3b. CUPS and the user plane — standard inherited, implementation (and the Linux kernel) diverges

**Governance = 3GPP, inherited.** CUPS (Control/User Plane Separation) is pure 3GPP: EPC Rel-14 (SGW/PGW split, Sx/PFCP) and *native* to 5G SA (**SMF** ⇄ **UPF** over **N4/PFCP**). Below the ETSI/GSMA line → FRMCS takes it with **no rail-specific spec change** (leverage). Only FRMCS-flavoured touch: **CUPS-for-IMS** (3GPP **TR 23.794**), because MCX rides IMS and IMS wasn't CUPS-native (Kontron Ch. 5.3 / Ch. 7).

**Spec level: no difference. Implementation level: real differences, concentrated in the UPF data path.**

| Axis | Consumer 5G UPF | FRMCS UPF concern |
|---|---|---|
| Data-path | Linux kernel netstack / **eBPF-XDP** / **DPDK** kernel-bypass — chosen for *throughput* | Chosen for **determinism** (remote-driving GoA4 <10 ms; ATO/ETCS hard latency) — jitter, not Gbps, is the metric |
| Kernel | General-purpose Linux; PREEMPT_RT optional | **PREEMPT_RT** becomes load-bearing; scheduling jitter is a safety-adjacent property |
| GTP-U | Linux `gtp` module / `gtp5g` / DPDK — known CVE surface | Same code, now in the path of **safety-signalling** (ETCS MA over MCData) → kernel becomes a safety-case dependency |
| Placement | Edge UPF for latency | Aggressive **trackside/edge UPF** + local breakout under the "transport-transparent" gateway (TOBA) |

**The Linux-kernel crux — three issues:**
1. **Determinism** — general-purpose kernel paths add jitter; rail pushes toward DPDK kernel-bypass / eBPF-XDP + **PREEMPT_RT** to bound worst-case latency. CUPS helps: the user-plane forwarding can be made deterministic without constraining the complex control plane.
2. **Safety** — a general-purpose Linux kernel is **not** SIL-4-certifiable (too large / too fast-changing; CRA-update tension, ADR-011). Sector approach = run Linux as **untrusted COTS under a certified application-safety layer / separation kernel with freedom-from-interference** (DSD "SIL4 Cloud" / separation-kernel, E-2026-07-02-03; Cloud4Rail untrusted-COTS + certified NHA, E-2026-07-02-27). CUPS aligns with the ADR-004 SIL-4 boundary — keep the certifiable path small.
3. **Security** — Linux in the user plane makes the **kernel a security-critical dependency**: GTP-module CVE history, eBPF verifier surface, and kernel-level implants (**GTPDOOR is a Linux backdoor**, §4a). UPF kernel hardening / SBOM / update stream → R14 / TS 50701 zones-conduits / CRA; and per §4a, no GSMA-equivalent rail body governs that operational hardening.

**Resilience (R4).** CUPS is a fail-soft lever — the UPF holds SMF-installed forwarding rules, so a control-plane hiccup need not immediately sever active sessions. But whether the failover *holds* on CP/N4 loss is an **implementation property, tested not assumed** — the same "does the trigger fire?" question as the 23-Jun silent-fault (E-2026-07-29-09).

*Anchors:* E-2026-07-01-10 (Kontron Ch. 5.3 CP/UP + TR 23.794) · E-2026-07-02-03 (SIL4 Cloud / separation kernel) · E-2026-07-02-27 (Cloud4Rail) · E-2026-07-24-01 (5G-core attack surface) · E-2026-07-29-09 (silent-fault) · ADR-004 / ADR-011 / R4 / R14.

## 4. The 3GPP roadmap — the key enabler, and the capability → release map (v4, 2026-08-01; authoritatively grounded by the 3GPP Work Plan E-2026-08-01-22)

**Why this is the pacing function.** FRMCS is a *profile* of 3GPP (§1a) — it originates no radio/service specs; it selects and profiles finalised 3GPP building blocks. So **FRMCS capability availability is gated by the 3GPP release cadence**: a feature is deployable only once 3GPP has *defined* it → ETSI TC-RT has *profiled* it → MORANE-2 has *validated* it. The 3GPP roadmap therefore sits **beneath the migration triangle** (migration-change-risk-assessment.md §4a): the CCS TSI "not complete for tendering" status (Note 9, E-2026-08-01-16) is *downstream* of 3GPP rail work items still maturing.

**Three numbering axes — do not conflate** (a recurring source of confusion):

| Axis | Owner | Values | Counts |
|---|---|---|---|
| **3GPP Release** | 3GPP | Rel-15 … Rel-20 (Rel-18+ = "5G-Advanced") | when a capability is *defined* |
| **3GPP FRMCS Phase** | 3GPP | Phase 1 … Phase 6 (**Phase N = Rel-(14+N)**) | the rail *work-item* generation inside 3GPP |
| **UIC FRMCS Edition** | UIC | Edition 1, Edition 2 | the rail *profile* baseline |
| **CCS TSI RMR Baseline** | ERA | Baseline 0, 1 | the *mandated* set in EU law |

The **FRMCS Phase axis is authoritative** (3GPP Work Plan, E-2026-08-01-22): Phase 1=Rel-15 … Phase 6=Rel-20. Approximate correspondence to the *other* axes (**verify vs a UIC FRMCS Edition roadmap — not on file**): FRMCS **Edition 1** ≈ Phase 2/3 (Rel-16/17) = CCS TSI RMR **Baseline 0** (the current mandated, "not-tender-complete" set, E-2026-08-01-16); FRMCS **Edition 2** ≈ Phase 4+ (Rel-18+).

**Authoritative rail work-item series → release** (3GPP Work Plan E-2026-08-01-22; ✓ = complete):

| Phase | Rel | Work item(s) | Status | Specs touched |
|---|---|---|---|---|
| 1 | 15 | FS_FRMCS (study, TR 22.989) + FS_FRMCS_ARCH (TR 23.790); **MONASTERY** (normative) + MONASTERY_SEC | ✓ 100% | 22.280/179, 23.280/379, 24.x; **33.180** (security) |
| 2 | 16 | FS_FRMCS2 (study, **New TR 22.889**); **MONASTERY2** — **created New TS 22.289** | ✓ 100% | 22.280/281/282/179, 23.280/379/281/282 |
| 3 | 17 | FS_FRMCS3; MONASTERYEND (gap analysis); **eMONASTERY2** | ✓ 100% | 23.280/379/281/282/283, 24.x |
| 4 | 18 | FS_FRMCS_Ph4 (study) | ✓ 100% | — |
| 5 | 19 | **FRMCS_Ph5** (normative: "Railways-specific Enhancements to Mission Critical") | ✓ 100% | 22.280/179/289/**261**, 23.280/281/282/379/283/289, 24.x |
| 6 | 20 | **FRMCS_Ph6** (normative) | 🔵 55% (Stage-1 100%, Stage-2 90%, CT 0%) | 22.280/179/281, 23.280/281/282/379/283/289 |

The **backward lineage** (§2) is now authoritative too: **VGCS/VBS** (Rel-7/11, GSM-R ASCI group calls) → **GCSE_LTE** (Rel-12, group-comms enabler for LTE) → **MCX** (Rel-13+) → **MONASTERY/FRMCS** (Rel-15+). Note Phase 5 touches **TS 22.261** (base 5G service reqs, on file E-2026-08-01-23) — rail requirements feed the *core* 5G reqs, not just profile them.

**Capability → release map** (release history per Kontron/3GPP; ✓ = spec edition logged on file):

| Capability | 3GPP work (WG) | Release landing | On file |
|---|---|---|---|
| FRMCS service requirements | TS 22.289 (SA1) | Rel-15 initial → Rel-17 | ✓ V17.0.0 (E-2026-07-31-02) |
| MC common / **functional alias** | TS 23.280 (SA6) | Rel-15 → Rel-18 | ✓ V18.11.0 (E-2026-07-26-16) |
| MCPTT (voice) | TS 23.379 / 24.379 | Rel-13 → 15 (3.0) → 16 (4.0) | ✓ (E-2026-07-26-17) |
| MCData | TS 23.282 / 24.282 | Rel-14 → 15 (2.0) → 16 | ✓ (E-2026-07-26-18) |
| MCVideo | TS 23.281 / 24.281 | Rel-14/15 | ✓ (E-2026-07-26-19) |
| 5G security architecture | TS 33.501 (SA3) | Rel-15 → 18 → 19 | ✓ V18.6.0/V19.6.0 (E-26-14, E-31-04) |
| MC service security | TS 33.180 (SA3) | Rel-15+ | ✓ (E-2026-07-26-20) |
| MC-over-5GC | TR 23.783 | Rel-16/17 study → normative Rel-17/18 | study-vintage (Kontron) |
| IMS ↔ 5GC (CUPS-for-IMS) | TR 23.794 | Rel-16 study | study-vintage (Kontron) |
| MBMS → 5G-MBS multicast | TS 23.479 → 5G MBS | Rel-16 → Rel-17 | via Kontron §7 |
| GSM-R interworking | TS 22.280 → ETSI profiling | Rel-16 | ✓ via TS 103 792 (E-2026-07-26-13) |

**The FRMCS requirements are spread across releases**, and the apex reqs spec (TS 22.289) is refreshed each release — so "FRMCS Edition 1" is not one release but a *selected profile across Rel-15→17*, with Edition 2 pulling in Rel-18 (5G-Advanced) features. This is precisely why no single "FRMCS is done at Rel-N" statement holds.

**The Kontron 2021 gaps — original vs current status** (candid, load-bearing for PR15 / ADR-007e):

| # | Gap (Kontron, 2021, ~Rel-15/16) | Status now |
|---|---|---|
| 1 | Rail **group affiliation** — "in progress in CT1" | Landed from Rel-16; *deployment* maturity TBD |
| 2 | **Functional-alias termination side** — spec in progress | Verify at Rel-18 (not confirmed on file) |
| 3 | **E2E encryption / security OPTIONAL** — "to be defined" | Normatively defined by TS 33.180 (E-2026-07-26-20); **optionality is now a deployment/procurement matter** (ADR-012 action-2) |
| 4 | **MC-over-5GC** — Rel-16/17 study; MCX ran over LTE/EPC | Normative by Rel-17/18 (5GC-native) |
| 5 | **IMS ↔ 5GC** — CUPS-for-IMS study (TR 23.794) | Verify normative status at Rel-18 |

**Coupling to the migration triangle.** The 3GPP roadmap is the pacing function beneath FRMCS readiness: FRMCS cannot become tender-ready faster than 3GPP *defines* → ETSI *profiles* → MORANE-2 *validates*. So the "specs not tender-complete" front-of-runway squeeze (migration §4a vertex C) is not a drafting delay — it is the 3GPP rail work-items maturing. Several gaps closed at *spec* level by Rel-18; whether they are closed *in deployment* is the open PR15 question (verify vs MORANE-2, E-2026-07-02-15).

**Honest gap in this map.** Mostly closed at v4: the **release history, the rail WI-series status, and the forward view (Rel-20/Phase 6) are now authoritative** (3GPP Work Plan, E-2026-08-01-22). **Spec coverage** of the specs the rail WIs touch: the architecture-load-bearing set is on file (22.289 reqs apex, 22.889 study, the MCX Stage-2 architecture 23.280/281/282/379, 33.180 security, and now **22.261** base 5G reqs, E-2026-08-01-23); not on file (lower priority) = the FRMCS study TRs (22.989/23.790/23.796, pre-normative) and the MCX Stage-3 protocol specs (24.x, below the engagement's altitude). **The one axis still unresolved:** the **UIC FRMCS Edition ↔ 3GPP Phase/Release crosswalk** — the Phase axis is authoritative, but how UIC Editions map to it needs a UIC FRMCS Edition roadmap (still to fetch).

*Anchors:* Kontron Ch. 7 Fig. 7-3 (E-2026-07-01-10) · TS 22.289 (E-2026-07-31-02) · MCX Stage-2 set (E-2026-07-26-16..-19) · TS 33.501/33.180 (E-26-14/-20, E-31-04) · TS 103 792 interworking (E-2026-07-26-13) · MORANE-2 (E-2026-07-02-15) · migration-change-risk-assessment.md §4a. Related: PR15, ADR-007(e), ADR-012, R1/R5/R7.

---

## 4a. Security governance — and the GSMA gap the substitution opens

Where is FRMCS security *governed*? Mapping it onto the Fig. 7-4 tiers exposes a seam: the GSMA→ETSI-TC-RT substitution (§1a) is complete for **architecture** but **incomplete for operational security**.

| Security concern | Consumer-5G owner | FRMCS owner | Inherited cleanly? |
|---|---|---|---|
| Radio/core crypto (5G-AKA, ciphering, integrity) | 3GPP **TS 33.501** | 3GPP TS 33.501 (current at Rel-19, E-2026-07-31-04) | ✅ inherited (E-2026-07-26-14) |
| MC-service security (KMS/SAKKE, IdMS, SRTP/XML) | 3GPP **TS 33.180** | 3GPP TS 33.180 | ✅ inherited (E-2026-07-26-20) |
| **Network-domain / interconnect borders** (security domains, SEG/Za IPsec, GTP-C/U protection, TLS/JWE/JWS crypto profiles) | 3GPP **TS 33.210** (NDS/IP) | 3GPP TS 33.210 — Annex B = normative GTP protection; spans GSM→5G (covers the legacy dual-run side) | ✅ inherited, **on file** (E-2026-08-01-03) |
| **Interconnect / roaming security — OPERATIONAL layer** (SEPP *deployment*, GTP/Diameter/SS7 hardening in operation, GRX/IPX trust, monitoring, roaming-partner assurance) | **GSMA** — FS.11/FS.19/FS.20, SEPP guidelines, roaming-partner assurance | 3GPP *spec-side* defences inherited AND on file (SEPP TS 33.501 · NDS/IP GTP Annex B · SCAS GTP filtering); **GSMA's operational layer has NO rail owner** — gap confirmed OPERATIONAL, not spec-absence | ⚠️ **GAP** (operational) |
| Network-equipment assurance | **GSMA NESAS** + 3GPP SCAS | 3GPP SCAS **on file** (TS 33.117 catalogue, E-2026-08-01-02); NESAS (the scheme auditing vendors against SCAS) **not clearly mandated for rail** | ⚠️ partial gap (NESAS half) |
| Railway cyber (zones/conduits) | — | CEN/CENELEC **TS 50701**, profiling **IEC 62443** (62443-2-1:2024 on file; 62443-3-2/-3-3 paywalled) → **successor IEC 63452 ED1 confirmed at CDV, ~2028** (E-2026-08-01-17; graduates TS → full IEC/EN standard) | rail add (E-2026-07-26-15; E-2026-07-31-03; E-2026-08-01-17) |
| **Safety↔security interface** | — | EN 50128/A2 Introduction: safety standard does NOT cover IT security, **delegates to IEC 62443 series** (+ISO 27000) — bridge primary from BOTH sides | ✅ rail add, **closed both ways** (E-2026-08-01-01 ↔ E-2026-07-31-03) |
| Functional safety | — | CENELEC **EN 5012x** (EN 50128 A1/A2 on file; clause bodies paywalled; watch EN 50716:2023) | rail add (ADR-004; E-2026-07-31-05, E-2026-08-01-01) |
| Operator risk-mgmt + incident reporting | national / GSMA | **NIS-2** (operator) + **CRA** (product) | regulatory (R14) |
| Sector cyber-crisis coordination | GSMA / national CERTs | **EU Cyber Blueprint — rail = "n/a"** | ⚠️ **GAP** (E-2026-07-29-02) |

**The GTPDOOR probe.** GTPDOOR (LightBasin / UNC1945) is a Linux backdoor that listens for magic **GTP-C echo** packets over the **GRX roaming exchange** and blends its C2 into legitimate inter-operator interconnect traffic — it abuses the *trust of the roaming/interconnect fabric*, not the crypto. In consumer mobile that layer is **GSMA's** (FS.20 GTP-U security, interconnect monitoring, roaming-partner assurance). Apply §1a: FRMCS puts **ETSI TC-RT where GSMA sits — but ETSI TC-RT governs the architecture spec, not operational interconnect security.** So FRMCS inherits the interconnect **attack surface** (reused 3GPP transport + national roaming [INB 2026, E-2026-07-28-01] + the GSM-R↔FRMCS interworking gateway [TS 103 792, E-2026-07-26-13]) **without** GSMA's interconnect-security governance.

Mitigations that shrink but don't close it:
- **5G SA's SEPP** (N32/HTTP-2) replaces 4G GTP-C/Diameter signalling interconnect → the *exact* GTPDOOR GTP-C vector is reduced in a pure-SA core. BUT GTP-U/GRX persist; the **2G GSM-R side is live for a decade** (R2 — the legacy GTP-era interconnect is the weakest link); and the interconnect-*trust* attack **class** generalises past the specific protocol.
- Default fallback owner = **the operator (DB) under NIS-2 + CRA + TS 50701 zones/conduits** — but with **no rail-sector body in GSMA's interconnect-security role** and **no Union-level rail cyber-crisis mechanism** (Cyber Blueprint rail = "n/a").
- **Spec-side GTP defences now evidenced (2026-08-01):** TS 33.210 **Annex B** (normative GTP protection — GTP-C/GTP-U policy discrimination, GTP-C transport protection; E-2026-08-01-03) + TS 33.117 SCAS **GTP-C/GTP-U filtering** requirements (4.2.6.2.3/.4; E-2026-08-01-02). And SCAS 4.1.1 states its own boundary: SCAS "is not about security in operations and deployments." So the product/spec layer exists and is on file — what has no rail owner is precisely GSMA's **operational** role (deployment, monitoring, roaming-partner assurance). The gap is operational governance, not spec absence.

**Finding:** 3GPP-standardised security (33.501/33.180/33.210/33.117) is inherited cleanly and is now primary on file; **GSMA-governed operational interconnect/roaming security has no rail owner** — a named governance gap, of which GTPDOOR is the concrete exemplar. Ties R14 / ADR-012; candidate SIM-SEC vector (interconnect/roaming — GTP/SEPP-trust abuse); reinforces the "leverage = inherited risk" thesis (§3a).

## 5. One-line summary

FRMCS is the **consumer-5G SDO structure with one substitution**: **3GPP** at the core defines 5G SA + MCX + security *and* carries the rail work items (TS 22.289, functional alias, GSM-R interworking); **ETSI TC-RT** sits where **GSMA** sits in consumer mobile — the implementor/interop-governance tier that profiles finalised 3GPP into the binding FRMCS architecture; **UIC** sets the sector requirements on top. Rail divergence is concentrated at/above the ETSI tier — **spectrum (ECC/RMR)**, **service profiles (functional alias, REC, TS 22.289)**, **the stratum/gateway split**, **safety/security wrap (CENELEC EN 5012x / TS 50701)** — legally bound by **ERA's CCS TSI** and validated by **MORANE-2**. Everything below the ETSI/GSMA line is shared 3GPP, reused largely verbatim. Backwards, every layer maps to a GSM-R ancestor except **MCVideo** and the **service/transport-stratum split**, which are genuinely new. The consumer-5G leverage is the value *and* the inherited-risk story (R5/R6 vs R14).

---

### Evidence anchors
E-2026-07-01-10 (Kontron/DB MCX design — primary anchor) · E-2026-07-26-11/-12/-13 (ETSI FRMCS TS 103 764/765-4/792) · E-2026-07-26-14/-16..-20 (3GPP 5G/MCX/security) · E-2026-07-26-15 (TS 50701) · E-2026-07-31-03 (IEC 62443-2-1) · E-2026-07-31-05 + E-2026-08-01-01 (EN 50128 A1/A2 — harmonisation + alignment; 62443 delegation) · E-2026-08-01-02 (TS 33.117 SCAS) · E-2026-08-01-03 (TS 33.210 NDS/IP) · E-2026-07-12-02 (FRMCS SRS §15) · E-2026-07-02-30/-31 (EIRENE bar) · E-2026-07-05-06 (VGCS) · E-2026-07-02-15 (MORANE-2) · E-2026-07-29-09 (VDE — bands/architecture) · E-2026-07-25-07 (UNISIG SUBSET-078). Related: R5/R6/R7/R14/PR15, ADR-001, ADR-004, ADR-007(e), ADR-012, master-architecture-reference.md.
