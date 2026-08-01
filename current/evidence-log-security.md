# Security evidence register (FRMCS arcKit)

**Purpose:** a security-thematic view of the evidence base — the cybersecurity/threat rows filtered from `evidence-log.md`, plus a **MITRE ATT&CK vector** column and a **simulation backlog** for future red-team / PoC work under ADR-007.

**Source of truth:** `current/evidence-log.md` remains authoritative. This file INDEXES the security-relevant rows by `E-` id (full text lives in the master log) and ADDS the security-specific columns. Keep the two in sync: when a security row is added/changed in the master log, reflect it here.

**Trust tiers:** A primary · B vendor-promotional · C trade press · D aggregator. MITRE ATT&CK vectors marked "derived" are analyst-assigned (the source named none) — opinion, for simulation planning, not source claims.

| ID | Date | Item (short) | Tier | Affects | Action | MITRE ATT&CK / sim | Note (short) |
|---|---|---|---|---|---|---|---|
| E-2026-06-24-09 | 2026-06-24 | SecurityAffairs recap — 23 Jun DB GSM-R nationwide outage | D | R3, R12 | validate | — | Outage was NOT cyber (E-2026-06-27-01..-03); availability-as-security-effect datum |
| E-2026-06-30-01 | 2026-06-30 | P1 Security — mobile core network primer | B | R3 | watch | — | Core-network security background |
| E-2026-06-30-02 | 2026-06-30 | Latro — SS7 threat detection/monitoring | B | R3 | watch | SS7 signalling abuse (context) | Legacy-signalling threat context |
| E-2026-07-01-05 | 2026-07-01 | VDB CRA-Leitfaden (rail-industry CRA guide) | B | R7, R14 (+ADR-004/011) | watch | — | Industry CRA reading; verified vs law by E-2026-07-01-06 |
| E-2026-07-01-06 | 2026-07-01 | CRA/NIS-2 verification vs primary law (Ansvar) | A | R7, R14 | validate | — | Verified CRA/NIS-2 dates+fines; ADR-012 basis |
| E-2026-07-03-01 | 2026-07-03 | Forbes "Pwned trains" (2018) | C | R14 (+R1, PR12/13) | watch | rail-control insecurity (historical) | Dated press; security-obsolescence dimension |
| E-2026-07-10-02 | 2026-07-10 | Citation-validation of horizontal EU-law (CRA/NIS-2) | A | R14/ADR-012 (+R10/ADR-003) | validate | — | Primary-law text confirmed verbatim |
| E-2026-07-14-01 | 2026-07-14 | IJFMR survey naming Poland radio-stop | D | R14 (+R2, R12) | watch | see SIM-SEC-001 | Poland LEAD #1; bad bibliography — NEVER cite its numbers/refs |
| E-2026-07-19-01 | 2026-07-19 | ERA 2019 — GSM-R "spot abnormal operation" + FRMCS security-by-design | A | R14 (+R12, R7, R2/R4) | validate | — | Monitoring gap foreseen 2019; dated waypoint |
| E-2026-07-20-01 | 2026-07-20 | ENISA Transport Threat Landscape + DSB 2022 supply-chain | A | R14 (+R8/PR13, R4, R12) | validate | DSB: supply-chain compromise (context) | THE anchor; window ends 10/2022 (Poland 08/2023 postdates) |
| E-2026-07-24-01 | 2026-07-24 | ACM CCS '25 — 5G-core control-plane bridging + PITM/rogue-gNB | A | R14 (+R5, R3/R4) | validate | T0830 Adversary-in-the-Middle (5G PITM/rogue-gNB) — derived; SIM-SEC-002 | 5G-generic, inherited by FRMCS; effect-level only, no how-to |
| E-2026-07-25-01 | 2026-07-25 | CrowdStrike 2025 Threat Hunting Report | B | R14 (+R4, R8/PR13, R12) | watch | — | Threat-intel context |
| E-2026-07-26-14 | 2026-07-26 | ETSI TS 33.501 — 5G security architecture | A | R14, ADR-012 | validate | mitigation: mutual auth/encryption | The 5G-transport security layer |
| E-2026-07-26-15 | 2026-07-26 | CENELEC TS 50701 — railway cybersecurity | A | R14, ADR-012 | validate | zones/conduits (control) | Railway-cyber standard |
| E-2026-07-26-20 | 2026-07-26 | ETSI TS 33.180 — MC-service security (KMS/SRTP/XML) | A | R14, ADR-012 | validate | mitigation: E2E key mgmt | MC-application security layer |
| E-2026-07-29-02 | 2026-07-29 | Council 9794/25 — EU Cyber Blueprint (crisis mgmt) | A (soft law) | R14, R12 (+R3/R4 ctx) | validate | — | Union crisis layer; RAIL="n/a" sectoral-mechanism gap |
| E-2026-07-29-03 | 2026-07-29 | Cyber Forte — rail-cyber timeline (uncited, defective) | D | R14 | watch | lead-list only | No citations; duplicate entry; date errors |
| E-2026-07-29-04 | 2026-07-29 | SkySiege — Poland RADIO-STOP vendor case study | B | R4, R14, R2 | watch | SIM-SEC-001: T0860→T0855→T0814/T0826 | Poland secondary #2 (Wired-sourced); superseded by -05 primary |
| E-2026-07-29-05 | 2026-07-29 | UTK — Polish NSA annual safety report 2023 (Radio-Stop misuse confirmed) | A | R14, R4, R2 | validate | SIM-SEC-001 primary anchor | Poland PRIMARY — regulator-confirmed (governance level); GATE NOW MET |
| E-2026-07-29-06 | 2026-07-29 | ICT Cyber-Desk — "Cyber Threat to the Train Industry" (Apr 2016; summarizes StrangeLove SCADA research) | C | R14, R4, R2, R1 | watch | SIM-SEC-003 (GSM-R SIM/modem OTA hijack; RF-jam→auto-stop) | Dated think-tank brief; mine the StrangeLove primary; Bad-Aibling framing superseded |
| E-2026-07-29-07 | 2026-07-29 | Shieldworkz — Stadler Rail supply-chain extortion (mid-2026; Everest; CHF 10M) | B | R14, R8/PR13 | watch | T1078, T1195.002, T1213, T1657 (Enterprise, source-provided) — enterprise-IT, no bearer sim | Vendor blog, no primaries; ZERO OT/safety impact; distinct from ~2020 Stadler event; mine primaries |
| E-2026-07-29-08 | 2026-07-29 | ESET WeLiveSecurity — "Sandworm: a tale of disruption told anew" (GRU U74455; Industroyer/BlackEnergy/NotPetya) | B | R14, R3/R4, R12 | watch | Sandworm = MITRE ATT&CK Group G0034 (adversary-emulation profile) | Non-rail (Ukraine grid); threat-actor baseline; legacy-protocol lesson; mine DoJ/MITRE primaries |
| E-2026-07-29-10 | 2026-07-29 | Sensors 2025 (MDPI) — sensor-based FMEA cyber-risk framework under NIS2 Art 21 (Wachnik et al., WSB) | A (caveated) | R12, R14 (+ADR-010/012) | validate | Detection methodology (spoofing/replay/injection; MTTD/RPN KPIs) — no attack vector | Peer-reviewed but MDPI + self-disclaimed PoC (expert-scored, scenario data, no ML benchmark); academic instantiation of R12 Risk-Sentinel |
| E-2026-07-29-11 | 2026-07-29 | Sensors 2024 (MDPI) REVIEW — railway cybersecurity standards landscape (IEC 62443 / TS 50701 / NIST); Ibadah/Pahl et al. | C | R14, R2, R12 | validate | Standards-landscape review — no attack vector | Peer-reviewed REVIEW (secondary, not A); corroborates TS 50701←IEC 62443; flags legacy MVB/CAN integration gap; Łódź-2008 = tram hack (distinct from 2023 radio-stop) |
| E-2026-07-29-13 | 2026-07-29 | arXiv preprint — SLR on the NIS2 Directive (Ruohonen, SDU) | C | R14, R12 | watch | — | PREPRINT (not peer-reviewed) + secondary + non-rail; NIS2 research-landscape context; no new primary (NIS2 law already verified E-2026-07-01-06) |
| E-2026-07-30-01 | 2026-07-30 | Sensors 2025 (MDPI) — blockchain+DNN authentication for SMART-GRID IoT (Saleh & Cevik) | A (off-scope) | R14 (weak) | watch | — | OFF-SCOPE: smart-grid, NOT rail; FRMCS uses 3GPP 5G AKA (TS 33.501), not blockchain; poor-language quality flag; logged for completeness only |
| E-2026-07-30-03 | 2026-07-30 | UIC IRS 90940 Ed.3 — SFERA Protocol (DAS ground↔onboard data exchange) | A | R14, R6 | validate | App-layer secure-by-design (TLS 1.3 + JWT auth + MQTT-broker isolation) — no attack vector | POSITIVE example: UIC app protocol carries own E2E security independent of bearer; contrast unauthenticated GSM-R |
| E-2026-07-30-07 | 2026-07-30 | CYRail Recommendations — rail signalling/comms cybersecurity (Shift2Rail H2020, UIC-ETF 2018) | A | R14, R12, R11, R2 | validate | Rail-cyber methodology (zones/conduits/HLCRA) + IDS detection (HIDS/NIDS, anomaly) — no single ATT&CK vector | Foundational EU-project deliverable; predecessor to TS 50701 (E-2026-07-26-15); dated 2018 |
| E-2026-07-30-14 | 2026-07-30 | ETSI TS 103 765-2 V1.1.1 — FRMCS Service Stratum (Part 2; auth/authz + communication-security scope) | A | R14, R5 | validate | Service-layer security definition (user ID/auth/authz + comm security) — atop TS 33.501/33.180; no attack vector | Published ETSI TC-RT FRMCS spec; Service Stratum = 3GPP MCX/IMS; the ETSI service-layer security scope |
| E-2026-07-30-15 | 2026-07-30 | ETSI TS 103 765-1 V1.1.1 — FRMCS Transport Stratum (Part 1; auth/authz scope) | A | R14, R5 | validate | Transport-layer access-security (authentication/authorization) — atop TS 33.501; no attack vector | Published ETSI TC-RT FRMCS spec; Transport Stratum = 3GPP 5G; completes the Building-Blocks set (Parts 1-5) |
| E-2026-07-31-03 | 2026-07-31 | IEC 62443-2-1:2024 Ed 2.0 — OT-cyber ASSET-OWNER security-program (SPE 1-8; ML/SL) | A (preview) | R14, ADR-012/-011, R3/R4, R12, R8 | validate | OT-cyber core program (zones / change-control / patch / detection / availability / supply-chain) — no attack vector | The IEC 62443 core TS 50701 profiles ("3GPP-role for security"); iTeh preview (ToC read, normative text paywalled) |
| E-2026-08-01-02 | 2026-08-01 | ETSI TS 133 117 / 3GPP TS 33.117 Rel-17 — SCAS catalogue of general security assurance requirements (COMPLETE free text) | A | R14, ADR-012 (+R8/PR13, R12, ADR-007) | validate | Product-assurance baseline: SBA/SBI protection, SW-package integrity, security-event logging, GTP-C/GTP-U filtering, OS/kernel hardening, vuln+fuzz test cases — no attack vector | SCAS half of the §4a equipment-assurance pair now EVIDENCED; NESAS half still the gap; 4.1.1: product-level only, "not about operations" — confirms the operational (GSMA-role) gap is real |
| E-2026-08-01-03 | 2026-08-01 | ETSI TS 133 210 / 3GPP TS 33.210 Rel-17 — NDS/IP: security domains, SEG/Za interconnect border, IPsec/IKEv2 + TLS/JWE/JWS crypto profiles; Annex B GTP protection (COMPLETE free text) | A | R14, ADR-012 (+R2, R7) | validate | Interconnect/domain-border controls: SEG/Za IPsec, GTP-C/GTP-U policy discrimination, TLS 1.3 profiles — no attack vector | Completes the free 3GPP security set (33.501/33.180/33.117/33.210); Annex B = spec-side GTP defence → §4a GTPDOOR gap confirmed OPERATIONAL (GSMA-role), not spec-absence |
| E-2026-08-01-04 | 2026-08-01 | GSMA FS.57 MoTIF Principles v1.0 (2024) — mobile-network TTP framework, ATT&CK/FiGHT-compatible (COMPLETE text; first GSMA primary on file) | A | R14, ADR-012 (+R12, ADR-007) | validate | TTP taxonomy for mobile-bearer attacks: Exploit Interconnection Link, Exploit via Core Signalling Interface, false-base-station software, AitM, supply chain; MODS detection data sources — vector-mapping upgrade candidates for SIM-SEC-001/-002/-003 | §4a GSMA layer first evidenced (TI function); FS.11/19/20 + NESAS still the operational gap; GSMA formally catalogues the interconnect-exploitation class GTPDOOR exemplifies |
| E-2026-08-01-05 | 2026-08-01 | ENISA — Signalling Security in Telecom SS7/Diameter/5G (EU assessment, March 2018; COMPLETE text) | A (dated 2018) | R14, ADR-012 (+R2, R12) | validate | Interconnect-trust exploitation class: attacks ride LEGITIMATE signalling traffic (SS7/Diameter/GTP session hijack, O2-DE mTAN interception, location tracking, DoS) — structural anchor for SIM-SEC interconnect vectors; no single ATT&CK vector | EU-institutional anchor of the §4a interconnect gap (2018): "Wild West" trust model, provider-level responsibility, 5G "risk of repeating history"; dated — cite structurally, not as current status |

## Simulation backlog (ATT&CK vectors for future red-team / PoC under ADR-007)

**SIM-SEC-001 — Unauthenticated VHF "RADIO-STOP" command injection (Poland pattern)**
- Evidence: E-2026-07-29-05 (A, UTK NSA safety report 2023 — occurrence/date/category confirmed), corroborated by E-2026-07-29-04 (B) + E-2026-07-14-01 (D). **Gate MET** at governance level; a full TECHNICAL primary (PKBWK report / CERT.PL advisory) is a remaining narrower lead. Attribute train-count/mechanism to secondary Wired reporting, not UTK.
- ATT&CK for ICS (analyst-derived): **T0860 Wireless Compromise → T0855 Unauthorized Command Message → T0814 Denial of Service / T0826 Loss of Availability**.
- NOT applicable: **T0880 Loss of Safety** — the fail-safe operated as designed; malicious triggering of a safety function is an AVAILABILITY loss (fail-safe, not fail-soft), cf. E-2026-07-02-34.
- Objective: demonstrate the FRMCS successor's 3GPP mutual auth/integrity/encryption (TS 33.501, TS 33.180) defeats the T0860→T0855 chain the analogue/GSM-R bearer cannot — the security half of the PR15 equivalence bar. Bears R4, R14, R2.

**SIM-SEC-002 (candidate) — 5G-core control-plane bridging / rogue-gNB PITM**
- Evidence: E-2026-07-24-01 (A, CCS '25). ATT&CK: **T0830 Adversary-in-the-Middle** (5G). 5G-generic, inherited by FRMCS. Effect/lesson only — NO operational how-to.

**SIM-SEC-003 (candidate) — GSM-R SIM / modem compromise (OTA firmware hijack; RF jamming → auto-stop)**
- Evidence: E-2026-07-29-06 (C, ICT brief) summarizing the StrangeLove "Great Train Cyber Robbery" research (Timorin & Gordeychik, 2015) — PRIMARY deck NOT yet on file (pull + currency-check before building the sim; 2015 findings).
- Vectors described: default SIM codes never changed; OTA firmware-upgrade hijack of GSM-R modems; GSM-R-compatible modem attacks; GSM frequency jamming → automatic train stop (fail-safe/DoS).
- ATT&CK (analyst-derived, provisional): **T0860 Wireless Compromise** (RF jamming / radio access) + firmware-hijack vector → **T0814 Denial of Service / T0826 Loss of Availability**; OTA firmware = supply-chain/firmware-implant angle. Overlaps SIM-SEC-001 (radio-layer availability).

## Adversary profiles (the "who" to emulate across the SIM-SEC vectors)

**Sandworm (Russian GRU Military Unit 74455) — MITRE ATT&CK Group G0034.**
- Evidence: E-2026-07-29-08 (B, ESET retrospective). Proven ICS physical-disruption capability (Ukraine grid 2015/2016; Industroyer targets power/TRANSPORTATION/water/gas protocols; legacy OT protocols lack security-by-design).
- Role: the credible high-end adversary to EMULATE across SIM-SEC-001..003 — the actor profile complementing the vectors. The concrete named actor behind the "post-24-Feb-2022" rail-cyber framing (UTK E-2026-07-29-05; EU Cyber Blueprint E-2026-07-29-02).
- Precondition: pull the A-tier primaries (US DoJ 2018/2020 indictments; MITRE ATT&CK G0034) before formalizing the emulation profile.

## How to append

1. When a security-relevant row is added to `evidence-log.md`, mirror a condensed entry here with the same `E-` id + tier/affects/action, and add any MITRE ATT&CK vector (mark "derived" if analyst-assigned).
2. New simulation candidates get a `SIM-SEC-NN` id and feed the ADR-007 test programme.
3. This file is frozen by `scripts/baseline.sh` with the rest of `current/`.
