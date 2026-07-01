# Baseline 2026-06-28

Frozen (UTC): 2026-06-28T15:29:01Z
Files: 27

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 39

## Changes vs 2026-06-28_1247

- changed: evidence-log.md
- changed: project/03-risk-register.md
- changed: project/04-adr-log.md
- added:   project/ADR-011-migration-change-control.md
- added:   project/migration-change-risk-assessment.md
- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -10,9 +10,9 @@
 | # | Requirement (driver / constraint) | Decision | How it's addressed | Status | Evidence ref |
 |---|---|---|---|---|---|
 | R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -08, -11, -13, -17, -19, -21, E-2026-06-25-02 |
-| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11, -13, -17, -18, -21 |
-| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
-| R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
+| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001, ADR-011 | E-2026-06-24-03, -11, -13, -17, -18, -21 |
+| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open · ADR-007 (prove by test) · ADR-011 (change-control) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
+| R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective · ADR-007 (prove by test) · ADR-011 (change-control) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
 | R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03, -13, -21, E-2026-06-25-02 |
 | R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03, -13 |
 | R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04, -13, -21 |
```

#### evidence-log.md
```diff
@@ -45,6 +45,8 @@
 | E-2026-06-27-07 | 2026-06-27 | ADR-010 (Agent evaluation strategy — accuracy, automation-bias, drift) opened — Proposed. Homes the accuracy/eval scope displaced when ADR-007 became the testing/canary ADR. Framework: per-role accuracy (Risk Sentinel detection/lead-time/false-alarm; Assurance evidence-chain) measured against ADR-007 replay+shadow surfaces; oversight-effectiveness/automation-bias metrics (dissent/override/latency/calibration → G4); drift monitoring on daily baselines with auto-demote-to-shadow; eval gates per autonomy rung (ADR-008). Core principle: an advisory agent is only as safe as its measured accuracy AND the measured effectiveness of the human oversight around it | Project | current/project/ADR-010-eval-strategy.md | — | R10, R12 | revise | Closes the unhomed accuracy/eval gap (drift→PR6, automation-bias→ADR-004/PR4, replay→ADR-007, accuracy→ADR-010). Records the evaluation decision that makes autonomy-ladder promotions (ADR-008) evidenced and R10/R12 measurable. No status-letter change (R10/R12 stay Proposed) — matrix R10/R12 now reference ADR-010. No external evidence (project action, tier —) |
 | E-2026-06-28-01 | 2026-06-28 | rbb24 (Rundfunk Berlin-Brandenburg, ARD public broadcaster), 26 Jun 2026 16:53 — reports DB's statement on the 23–24 Jun GSM-R outage with a Berlin S-Bahn angle. Paraphrased: DB found the fault; during planned maintenance part of the network technology was swapped; because NO error message arose, the GSM-R backup was not automatically activated though fully functional; after ruling out a cyberattack, staff manually switched to the redundant radio system and traffic resumed; ~90 min nationwide standstill. Nagl (DB InfraGO): "historisch einmaliges" Fehlerbild, now understood and preventable. Countermeasures: no further component swaps for now; manufacturer to fix the component; maintenance only 00:00–04:00 and only on the currently inactive radio system. REGIONAL: the entire Berlin S-Bahn network was stopped ("netzweite Störung im Kommunikationssystem"); private railways also affected | News (regional public broadcaster) | rbb24.de (Rundfunk Berlin-Brandenburg / ARD), 26 Jun 2026; reports DB statement + Nagl | A/C | R3, R4 | validate | A/C — regional ARD public broadcaster reporting DB's official statement (same DB-official content as E-2026-06-27-01/-03; A-weight for the content, C for the carrier). 4th source for the now primary-confirmed cause — adds NO new mechanism or provenance beyond DB's own portal (E-2026-06-27-03); VALIDATES it and adds the Berlin S-Bahn / private-railway IMPACT scope (R3/R4 blast radius). Reconfirms the silent-fault/no-alarm → failover-not-triggered detection gap (R12). No status change → matrix R3/R4 refs only (no new weight; logged for completeness) |
 | E-2026-06-28-02 | 2026-06-28 | Kontron Transportation — Railways market-segment page (kontron.com/ktrdn/market-segments-and-focus/railways). Vendor marketing: positions Kontron as a Railway Dedicated Network (RDN) leader (claims 20+ yrs, 84,000+ km of track, up to 574 km/h, "safe and secure" mission-critical comms); covers GSM-R (legacy), FRMCS (migration), 4G/5G private networks, MCx, TETRA/DMR; claims "ERTMS-compliant and EU CCS TSI certified," UIC EIRENE, involvement with ERA/UNIFE/ETSI; "evolution in continuity" (gradual GSM-R→FRMCS, reuse of installed infrastructure); GSM-R support "at least until 2035." No product names, pricing, case studies, or named partners (no DB/MORANE2/5G-RACOM/TOBA/ETCS/ATO on this page) | Vendor marketing (promotional) | kontron.com — Kontron Transportation (vendor); promotional, paraphrased | B | R8 | watch | B-tier vendor-promotional — discount superlatives (84k km, 574 km/h, "certified") per source-trust discipline; vendor self-claims, not independently verified. Relevant to R8: Kontron is one of the two FRMCS duopoly leaders (cf. E-04 Nokia–Kontron concentration) — this is its own market positioning, corroborating its supplier status but NOT independently validating concentration (self-source). Lightly corroborates R1/R2 (GSM-R-to-2035, "evolution in continuity"/reuse → parallel run) and R7 (ERTMS/CCS TSI/EIRENE conformance claims) — vendor say-so; "EU CCS TSI certified" needs primary NoBo verification, not marketing. No new verified facts → no decision moved; no matrix/ADR change (watch) |
+| E-2026-06-28-03 | 2026-06-28 | Migration change-risk assessment (current/project/migration-change-risk-assessment.md) created — Draft. Risk/risk-control assessment of the bridged parallel-run route, focused on change activity on live legacy/proprietary safety-critical code: the route relocates (not removes) risk; blast-radius shows the code-change risk is CENTRAL (4 reqs, 3 control-ADRs, the agentic detection layer, the incident proof, 7 risks); finding = the dominant risk is currently controlled only by DB's reactive countermeasures, while the design/test controls (ADR-004/007, agentic detection) are all Proposed/unproven | Project | current/project/migration-change-risk-assessment.md | — | R2, R3, R4 | watch | Synthesises the /arckit:impact blast-radius + the PR12–PR14 risks into a citable assessment (feeds SOBC). Built on logged evidence (E-2026-06-27-01/-03/-05, E-2026-06-28-01/-02, E-2026-06-25-02); no new external evidence (project work product, tier —). Recommends ADR-011 (logged E-2026-06-28-04). No status change (assessment is analysis) |
+| E-2026-06-28-04 | 2026-06-28 | ADR-011 (Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run) opened — Proposed. Five binding rules (change classification A/B/C by blast-radius × safety-criticality; inactive-redundancy-only; 00:00–04:00 window; pre-change test gate tied to ADR-007/ADR-004; blast-radius limit + segment rollback) + preconditions (silent-fault detection capability PR5/R12; vendor change-evidence PR13). Elevates DB's reactive countermeasures to a standing decision; extends to FRMCS-core changes (PR11) | Project | current/project/ADR-011-migration-change-control.md | — | R2, R3, R4 | revise | Records the change-control decision governing PR11–PR14 (the dominant migration-execution risk, PR12). Depends on ADR-001/004/007; built on E-2026-06-27-02/-03 (DB countermeasures) + the migration change-risk assessment (E-2026-06-28-03). No status-letter change (R2 Accepted, R3/R4 open) — matrix R2/R3/R4 now reference ADR-011; ADR-log index updated. No external evidence (project action, tier —) |
 
 ## How to append
 
```
