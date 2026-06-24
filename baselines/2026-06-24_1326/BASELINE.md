# Baseline 2026-06-24

Frozen (UTC): 2026-06-24T11:26:54Z
Files: 19

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 15

## Changes vs 2026-06-24_1232

- changed: ADR-001-gsmr-to-frmcs.md
- changed: evidence-log.md
- changed: incident-annex.md
- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -9,18 +9,19 @@
 
 | # | Requirement (driver / constraint) | Decision | How it's addressed | Status | Evidence ref |
 |---|---|---|---|---|---|
-| R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -11 |
-| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11 |
-| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open | E-2026-06-24-01 |
+| R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -11, -13 |
+| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11, -13 |
+| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open | E-2026-06-24-01, -15 |
 | R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective | E-2026-06-24-01 |
 | R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03 |
 | R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03 |
-| R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04 |
+| R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04, -13 |
 | R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | Recommended — policy-level open | E-2026-06-24-04 |
 | R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | Proposed · ADR-002 | — |
 | R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | Proposed · ADR-002 (classification verified · ADR-003) | E-2026-06-24-05, -07 |
 | R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing | — |
 | R12 | Close the awareness gap ("why nobody knew") | Risk Sentinel + Assurance agents | Continuous risk register + evidence chain; decision-ready alert before threshold | Proposed · ADR-002 | E-2026-06-24-02 |
+| R13 | Make fleet-scale FRMCS retrofit feasible & funded (16–21k DE vehicles + ~40k mobile / ~3.5k stationary GSM-R devices by 2035) | Sector coordinating body + Bund Förderrichtlinie (up to 100%); Umbaucluster / Serienzulassung approval reform; chipset-supply assurance | Coexistence (R2) depends on rolling-stock readiness; approval burden ~30% of cost; no EU/national fit-obligation today (Bestandsschutz) | Open — external dependency (Bund/sector programme; no ADR yet) | E-2026-06-24-11, -13 |
 
 ## Reading notes
 
```

#### evidence-log.md
```diff
@@ -18,7 +18,11 @@
 | E-2026-06-24-08 | 2026-06-24 | DVF/Accenture position paper (pub. 2025-06-27) "why FRMCS must be implemented now": GSM-R obsolescence (dwindling spares, shrinking supplier base, declining expertise); only 24% of operators implementation-ready; funding + binding-timeline asks; network slicing on public 5G (Finnish model) | Position paper | verkehrsforum.de — Deutsches Verkehrsforum (industry lobby), authored by Accenture citing its own 800-respondent survey | B | R1 | validate | B-tier advocacy: survey data is real but promotional. Corroborates the obsolescence-urgency driver behind R1; gives NO explicit GSM-R EoL date, so cannot support the "~2030" claim. Slicing-on-public-5G lightly touches R4/R5 (noted, not load-bearing). No status change |
 | E-2026-06-24-09 | 2026-06-24 | SecurityAffairs recap of 23 Jun DB GSM-R outage: nationwide standstill ~22:30–01:00 CEST, CEO Palla "we don't yet know" the cause; cyberattack & physical damage ruled out | News | securityaffairs.com (Paganini) — aggregates DW / Bild / The Register | D | R12, R3 | validate | Corroborates the awareness-gap thesis (R12) and that the root cause was not publicly disclosed. D-tier aggregator, no primary/independent analysis → no status change. R3 root-cause thread stays open. Duplicate source of the 23 Jun outage already in E-2026-06-24-01/-02 (weaker tier) — no new evidentiary weight |
 | E-2026-06-24-10 | 2026-06-24 | Wikipedia "GSM-R": background on GSM-R (GSM/EIRENE-MORANE; supports ETCS/ERTMS; legacy spectrum 876–880/921–925 MHz) and FRMCS/LTE-R succession (UIC, 3GPP R15/16) | Reference (tertiary) | en.wikipedia.org/wiki/GSM-R — tertiary encyclopedia, aggregates secondary sources | D | R1 | watch | D-tier tertiary reference — orientation only, no new evidentiary weight beyond E-03. Gives NO GSM-R EoL date and NO migration timeline, so cannot support R1's "~2030" claim. Lightly documents ETCS/spectrum background (R5–R7). No status change |
-| E-2026-06-24-11 | 2026-06-24 | Sektorinitiative FRMCS-Fahrzeugmigration — Positionspapier (Zusammenfassung): DE GSM-R switch-off planned 2035; 16,000–21,000 vehicles to retrofit by 2035; cost €1.2–2.4bn (~€640m approval costs under 4th EU Railway Package); new builds FRMCS-standard ~2032 (≈5yr after binding spec); GSM-R+FRMCS must run parallel vehicle+infra during migration; NO current EU legal obligation to fit FRMCS; four asks (coordinating body, chipset supply, faster approvals, funding directive) | Position paper | Sektorinitiative FRMCS-Fahrzeugmigration (Allianz pro Schiene, BSN, DB, DVF, mofair, Die Güterbahnen, VPI, VDB, VDV); cites BMDV DKS evaluation | B | R1, R2 | revise | Strong B: 2035 is "nach aktueller Planung" (official) & FoC% is BMDV-derived → authoritative; cost/fleet are the initiative's own projections. REVISES R1 timeline (DE switch-off 2035, not "~2030"); CONFIRMS R2 parallel dual-network (vehicle+infra). Fleet-retrofit economics (€1.2–2.4bn, approval bottleneck, funding) is a major programme dimension NOT represented as a requirement — coverage gap (candidate R13) |
+| E-2026-06-24-11 | 2026-06-24 | Sektorinitiative FRMCS-Fahrzeugmigration — Positionspapier (Zusammenfassung): DE GSM-R switch-off planned 2035; 16,000–21,000 vehicles to retrofit by 2035; cost €1.2–2.4bn (~€640m approval costs under 4th EU Railway Package); new builds FRMCS-standard ~2032 (≈5yr after binding spec); GSM-R+FRMCS must run parallel vehicle+infra during migration; NO current EU legal obligation to fit FRMCS; four asks (coordinating body, chipset supply, faster approvals, funding directive) | Position paper | Sektorinitiative FRMCS-Fahrzeugmigration (9 publishers: Allianz pro Schiene, BSN, DB, DVF, mofair, NEE/Die Güterbahnen, Überwachungsgemeinschaft Gleisbau, VDB, VDV — corrected per E-13 annex); cites BMDV DKS evaluation | B | R1, R2 | revise | Strong B: 2035 is "nach aktueller Planung" (official) & FoC% is BMDV-derived → authoritative; cost/fleet are the initiative's own projections. REVISES R1 timeline (DE switch-off 2035, not "~2030"); CONFIRMS R2 parallel dual-network (vehicle+infra). Fleet-retrofit economics (€1.2–2.4bn, approval bottleneck, funding) is a major programme dimension NOT represented as a requirement — coverage gap (candidate R13) |
+| E-2026-06-24-12 | 2026-06-24 | Official site of the Sektorinitiative FRMCS-Fahrzeugmigration (frmcs-fahrzeuginitiative.de/sektor): hosts the full Positionspapier (976 KB) + Zusammenfassung (2 MB); restates 16k–21k vehicles, €1.2–2.4bn, 2035 GSM-R shutdown, 450+ EVU; 8-org coalition founded Sep 2022 | Website (primary host) | frmcs-fahrzeuginitiative.de — Sektorinitiative FRMCS-Fahrzeugmigration (multi-association) | B | R1, R2 | validate | Canonical official source page for E-11 — confirms authorship + figures, supplies citable URL provenance. No new facts beyond E-11 → no status change. Full Positionspapier (976 KB) not yet read vs the Zusammenfassung behind E-11 |
+| E-2026-06-24-13 | 2026-06-24 | Full Positionspapier der Sektorinitiative FRMCS-Fahrzeugmigration (Stand 11/2023, © DB AG) — full version of E-11/-12. Adds: timeline (FRMCS-V3 end-2026 → TSI ZZS 2027 → 5yr window → earliest GSM-R partial switch-off 2032; 2035 expected obsolescence); EU "GSM-R ≥2030" per UNITEL Committee 2021; approval legal basis (TSI ZZS 2023 = Reg (EU) 2023/1695 repealing 2016/919; Reg (EU) 2018/545 Arts 15–16; Dir (EU) 2016/797 Art 21); RMR spectrum 1900–1910 MHz unpaired + 874.4–880.0/919.4–925.0 MHz paired; +~40,000 mobile & ~3,500 stationary GSM-R devices; 3 vehicle configs / Multi-Mode / Multipath | Position paper (full) | Sektorinitiative FRMCS-Fahrzeugmigration — 9 publishers (Allianz pro Schiene, BSN, DB, DVF, mofair, NEE/Die Güterbahnen, ÜG Gleisbau, VDB, VDV) | B | R1, R2, R7 | revise | Strong B (primary citations: BMDV 2020, UNITEL 2021, ERA, EC regs). Gives primary attribution for the "~2030" (UNITEL 2021, EU) vs DE 2035 (national); supplies the standards/legal basis that FIXES R7 (was mis-tied to market row E-04); confirms R2 parallel-run. Recency: dated 11/2023 — applies to E-11/-12 too. No status change |
+| E-2026-06-24-14 | 2026-06-24 | Reuters report (via Global Banking & Finance Review): DB infrastructure head attributes the 23 Jun GSM-R outage to "the scheduled replacement of a technical component"; exact mechanism still under analysis; no sabotage/external interference | News (wire, aggregated) | globalbankingandfinance.com republishing Reuters (Rinke, Steitz et al.); quotes DB infrastructure head | D | R3, R4 | watch | FIRST attributed proximate cause (scheduled component swap → nationwide GSM-R failure) — a central-SPOF signature reinforcing R3/R4. Preliminary ("appears to have been"; DB "analysing exactly how") and delivered via a D-tier finance aggregator; underlying claim is a DB-official quote via Reuters (A-grade-if-verified). No status change — verify vs primary DB/Reuters before treating as established |
+| E-2026-06-24-15 | 2026-06-24 | Primary-source verification of the outage cause: DB InfraGO head Philipp Nagl, on record (brief statement), attributes it to "the scheduled swap of a technical component"; "analysing with highest priority how exactly this led to the fault." Corroborated by AP (Moulson) + Reuters (Rinke/Steitz) | News (wire) + operator statement | AP via ABC/PBS/The Hill; Reuters via Yahoo; quoting Philipp Nagl, DB InfraGO | A/C | R3, R4 | revise | Upgrades E-14 (D-tier) → named operator official + two independent wires. Proximate cause now established; MECHANISM still open (DB analysing the cascade). No formal DB press release located. Reinforces R3 central-SPOF / R4 fail-soft; R3 stays "open" until cascade mechanism proven |
 
 ## How to append
 
@@ -32,6 +36,7 @@
 ## Open threads to validate (carried forward)
 
 - ~~EU AI Act high-risk classification for rail-control AI (R10) — verify against Annex I and the CCS TSI interface.~~ **Resolved 2026-06-24** (E-2026-06-24-07): conditional, not automatic high-risk. Residual: confirm the Art 3(14) safety-component boundary holds in detailed design (ADR-003 action #5, ADR-004).
-- DB root-cause mechanism for the 23–24 Jun outage — currently inference only (R3).
+- DB root-cause: **proximate cause verified** at wire grade — DB InfraGO head Philipp Nagl (AP + Reuters, E-14/-15) attributes it to a scheduled technical-component swap. **Mechanism still open**: how a scheduled swap cascaded network-wide is under DB analysis (no formal DB press release yet) (R3).
 - Whether Schnieder / any Land issues a statement later on 24 Jun (incident-annex.md political section).
 - Primary verification of national tenders (SNCF, Adif figures) against operator portals, not trade press (R8).
+- ~~Full Positionspapier (976 KB) of the Sektorinitiative FRMCS-Fahrzeugmigration not yet read.~~ **Read 2026-06-24** (E-13): cost breakdown (approval ~30%), no EU/national fit-obligation, up-to-100% Förderrichtlinie proposal, chipset/Release-19 timeline. Substantiates R13.
```
