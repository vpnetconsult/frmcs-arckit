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

## Simulation backlog (ATT&CK vectors for future red-team / PoC under ADR-007)

**SIM-SEC-001 — Unauthenticated VHF "RADIO-STOP" command injection (Poland pattern)**
- Evidence: E-2026-07-29-05 (A, UTK NSA safety report 2023 — occurrence/date/category confirmed), corroborated by E-2026-07-29-04 (B) + E-2026-07-14-01 (D). **Gate MET** at governance level; a full TECHNICAL primary (PKBWK report / CERT.PL advisory) is a remaining narrower lead. Attribute train-count/mechanism to secondary Wired reporting, not UTK.
- ATT&CK for ICS (analyst-derived): **T0860 Wireless Compromise → T0855 Unauthorized Command Message → T0814 Denial of Service / T0826 Loss of Availability**.
- NOT applicable: **T0880 Loss of Safety** — the fail-safe operated as designed; malicious triggering of a safety function is an AVAILABILITY loss (fail-safe, not fail-soft), cf. E-2026-07-02-34.
- Objective: demonstrate the FRMCS successor's 3GPP mutual auth/integrity/encryption (TS 33.501, TS 33.180) defeats the T0860→T0855 chain the analogue/GSM-R bearer cannot — the security half of the PR15 equivalence bar. Bears R4, R14, R2.

**SIM-SEC-002 (candidate) — 5G-core control-plane bridging / rogue-gNB PITM**
- Evidence: E-2026-07-24-01 (A, CCS '25). ATT&CK: **T0830 Adversary-in-the-Middle** (5G). 5G-generic, inherited by FRMCS. Effect/lesson only — NO operational how-to.

## How to append

1. When a security-relevant row is added to `evidence-log.md`, mirror a condensed entry here with the same `E-` id + tier/affects/action, and add any MITRE ATT&CK vector (mark "derived" if analyst-assigned).
2. New simulation candidates get a `SIM-SEC-NN` id and feed the ADR-007 test programme.
3. This file is frozen by `scripts/baseline.sh` with the rest of `current/`.
