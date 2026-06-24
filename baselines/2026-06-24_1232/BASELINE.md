# Baseline 2026-06-24

Frozen (UTC): 2026-06-24T10:32:10Z
Files: 19

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 1 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 11

## Changes vs 2026-06-24_1057

- changed: ADR-001-gsmr-to-frmcs.md
- changed: evidence-log.md
- changed: project/ADR-003-eu-ai-act-classification.md
- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -9,8 +9,8 @@
 
 | # | Requirement (driver / constraint) | Decision | How it's addressed | Status | Evidence ref |
 |---|---|---|---|---|---|
-| R1 | Remove obsolescence risk (2G EoL ~2030) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03 |
-| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03 |
+| R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -11 |
+| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11 |
 | R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open | E-2026-06-24-01 |
 | R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective | E-2026-06-24-01 |
 | R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03 |
@@ -18,7 +18,7 @@
 | R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04 |
 | R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | Recommended — policy-level open | E-2026-06-24-04 |
 | R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | Proposed · ADR-002 | — |
-| R10 | Human oversight proportional to risk (SIL-4; EU AI Act high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | Proposed · ADR-002 | E-2026-06-24-05 |
+| R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | Proposed · ADR-002 (classification verified · ADR-003) | E-2026-06-24-05, -07 |
 | R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing | — |
 | R12 | Close the awareness gap ("why nobody knew") | Risk Sentinel + Assurance agents | Continuous risk register + evidence chain; decision-ready alert before threshold | Proposed · ADR-002 | E-2026-06-24-02 |
 
```

#### evidence-log.md
```diff
@@ -12,8 +12,13 @@
 | E-2026-06-24-02 | 2026-06-24 | Outage was known/recurring; political reaction reactive ("fassungslos") | News | heise; verkehrsrundschau | C | R12 | validate | Confirms the awareness gap thesis behind R12 |
 | E-2026-06-24-03 | 2026-06-24 | FRMCS = UIC-designated successor; 5G SA + MCX; trials 2026, V3 ~2027; GSM-R EoL ~2030 | News/standards | UIC; ERA; Ericsson/Nokia/ANDREW | A/B | R1, R2, R5, R6 | validate | Underpins the ADR-001 target decision |
 | E-2026-06-24-04 | 2026-06-24 | Vendor/RFP landscape: Nokia + Kontron lead; MORANE2 consortium; SNCF→Kontron, UK→Systra, Adif €6.78m, ProRail→Nokia; duopoly concern | Market | IRJ; RailTech; RailwayPro; EU-Rail | A/C | R7, R8 | validate | Duopoly concern (RailwayPro) is analysis, not fact. Most deals are pilots/strategy, not national rollout |
-| E-2026-06-24-05 | 2026-06-24 | EU AI Act likely high-risk for rail-control AI — needs verification vs Annex I + CCS TSI | Regulatory | (to verify) | — | R10 | watch | Do not assert until verified — ADR-002 action item #1. Now tracked under ADR-003 |
+| E-2026-06-24-05 | 2026-06-24 | EU AI Act likely high-risk for rail-control AI — needs verification vs Annex I + CCS TSI | Regulatory | (to verify) | — | R10 | revise | Superseded by verification — see E-2026-06-24-07. The "likely high-risk" framing is NOT supported: classification is conditional, not automatic |
 | E-2026-06-24-06 | 2026-06-24 | ADR-003 (EU AI Act classification & compliance posture) opened — verify high-risk vs Annex I + CCS TSI interface | Project | current/project/ADR-003-eu-ai-act-classification.md | — | R10 | watch | Status Pending; classification remains a watch item — high-risk not asserted as fact until verified to A-tier sources |
+| E-2026-06-24-07 | 2026-06-24 | EU AI Act classification VERIFIED vs primary text + CCS TSI: not automatically high-risk; conditional on Art 3(14) "safety component" test | Regulatory | AI Act Reg (EU) 2024/1689 Arts 2(2),3(14),6(1), Annex I §B item 17, Annex III(2); CCS TSI Reg (EU) 2023/1695 under Dir (EU) 2016/797 (EUR-Lex) | A | R10 | revise | As designed (oversight-not-control, SIL-4 kernel, no actuation — R9/R11) the layer sits outside the safety-component perimeter → not high-risk. Rail (Dir 2016/797) is Annex I §B item 17 & CCS needs NoBo assessment, so only the Art 6(1)(a) safety-component limb is open. If it became a CCS safety component, Art 2(2) routes obligations via rail sectoral law. Annex III(2) covers road not rail. Closes ADR-003 verification (action items 1–4) |
+| E-2026-06-24-08 | 2026-06-24 | DVF/Accenture position paper (pub. 2025-06-27) "why FRMCS must be implemented now": GSM-R obsolescence (dwindling spares, shrinking supplier base, declining expertise); only 24% of operators implementation-ready; funding + binding-timeline asks; network slicing on public 5G (Finnish model) | Position paper | verkehrsforum.de — Deutsches Verkehrsforum (industry lobby), authored by Accenture citing its own 800-respondent survey | B | R1 | validate | B-tier advocacy: survey data is real but promotional. Corroborates the obsolescence-urgency driver behind R1; gives NO explicit GSM-R EoL date, so cannot support the "~2030" claim. Slicing-on-public-5G lightly touches R4/R5 (noted, not load-bearing). No status change |
+| E-2026-06-24-09 | 2026-06-24 | SecurityAffairs recap of 23 Jun DB GSM-R outage: nationwide standstill ~22:30–01:00 CEST, CEO Palla "we don't yet know" the cause; cyberattack & physical damage ruled out | News | securityaffairs.com (Paganini) — aggregates DW / Bild / The Register | D | R12, R3 | validate | Corroborates the awareness-gap thesis (R12) and that the root cause was not publicly disclosed. D-tier aggregator, no primary/independent analysis → no status change. R3 root-cause thread stays open. Duplicate source of the 23 Jun outage already in E-2026-06-24-01/-02 (weaker tier) — no new evidentiary weight |
+| E-2026-06-24-10 | 2026-06-24 | Wikipedia "GSM-R": background on GSM-R (GSM/EIRENE-MORANE; supports ETCS/ERTMS; legacy spectrum 876–880/921–925 MHz) and FRMCS/LTE-R succession (UIC, 3GPP R15/16) | Reference (tertiary) | en.wikipedia.org/wiki/GSM-R — tertiary encyclopedia, aggregates secondary sources | D | R1 | watch | D-tier tertiary reference — orientation only, no new evidentiary weight beyond E-03. Gives NO GSM-R EoL date and NO migration timeline, so cannot support R1's "~2030" claim. Lightly documents ETCS/spectrum background (R5–R7). No status change |
+| E-2026-06-24-11 | 2026-06-24 | Sektorinitiative FRMCS-Fahrzeugmigration — Positionspapier (Zusammenfassung): DE GSM-R switch-off planned 2035; 16,000–21,000 vehicles to retrofit by 2035; cost €1.2–2.4bn (~€640m approval costs under 4th EU Railway Package); new builds FRMCS-standard ~2032 (≈5yr after binding spec); GSM-R+FRMCS must run parallel vehicle+infra during migration; NO current EU legal obligation to fit FRMCS; four asks (coordinating body, chipset supply, faster approvals, funding directive) | Position paper | Sektorinitiative FRMCS-Fahrzeugmigration (Allianz pro Schiene, BSN, DB, DVF, mofair, Die Güterbahnen, VPI, VDB, VDV); cites BMDV DKS evaluation | B | R1, R2 | revise | Strong B: 2035 is "nach aktueller Planung" (official) & FoC% is BMDV-derived → authoritative; cost/fleet are the initiative's own projections. REVISES R1 timeline (DE switch-off 2035, not "~2030"); CONFIRMS R2 parallel dual-network (vehicle+infra). Fleet-retrofit economics (€1.2–2.4bn, approval bottleneck, funding) is a major programme dimension NOT represented as a requirement — coverage gap (candidate R13) |
 
 ## How to append
 
@@ -26,7 +31,7 @@
 
 ## Open threads to validate (carried forward)
 
-- EU AI Act high-risk classification for rail-control AI (R10) — verify against Annex I and the CCS TSI interface.
+- ~~EU AI Act high-risk classification for rail-control AI (R10) — verify against Annex I and the CCS TSI interface.~~ **Resolved 2026-06-24** (E-2026-06-24-07): conditional, not automatic high-risk. Residual: confirm the Art 3(14) safety-component boundary holds in detailed design (ADR-003 action #5, ADR-004).
 - DB root-cause mechanism for the 23–24 Jun outage — currently inference only (R3).
 - Whether Schnieder / any Land issues a statement later on 24 Jun (incident-annex.md political section).
 - Primary verification of national tenders (SNCF, Adif figures) against operator portals, not trade press (R8).
```
