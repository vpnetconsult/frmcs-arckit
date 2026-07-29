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
