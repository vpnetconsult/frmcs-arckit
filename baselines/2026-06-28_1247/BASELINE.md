# Baseline 2026-06-28

Frozen (UTC): 2026-06-28T10:47:57Z
Files: 25

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 37

## Changes vs 2026-06-28

- changed: evidence-log.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -44,6 +44,7 @@
 | E-2026-06-27-06 | 2026-06-27 | telecomtigers.blogspot.com (Ashish Bhatia, personal blog), 8 Nov 2009 — generic educational tutorial on SS7 Signaling Transfer Points: STP as the SS7 signalling hub routing message packets between nodes; functions (routing, network management, ANSI/ITU protocol conversion, Global Title Translation, LNP); SS7 link taxonomy (A/B/C/D/E/F links) and mated-pair/quad redundancy. No mention of railway/DB/GSM-R/Nortel/the 2026 outage | Reference (personal blog, tertiary) | telecomtigers.blogspot.com — personal telecom blog; paraphrased | D | R3 | watch | D-tier: a personal-blog SS7 explainer (user-generated, secondary/tertiary), not authoritative. Generic background on the STP concept — routing hub + mated-pair redundancy + link types — lightly contextualising the as-is central signalling element (R3). BUT adds NO new evidentiary weight: the STP architecture is already documented at A-tier and node-specific by the Nortel DMS SuperNode STP spec (E-2026-06-27-05); orientation only. No railway/DB/2026 content. Does not move a decision → no matrix/ADR change (watch) |
 | E-2026-06-27-07 | 2026-06-27 | ADR-010 (Agent evaluation strategy — accuracy, automation-bias, drift) opened — Proposed. Homes the accuracy/eval scope displaced when ADR-007 became the testing/canary ADR. Framework: per-role accuracy (Risk Sentinel detection/lead-time/false-alarm; Assurance evidence-chain) measured against ADR-007 replay+shadow surfaces; oversight-effectiveness/automation-bias metrics (dissent/override/latency/calibration → G4); drift monitoring on daily baselines with auto-demote-to-shadow; eval gates per autonomy rung (ADR-008). Core principle: an advisory agent is only as safe as its measured accuracy AND the measured effectiveness of the human oversight around it | Project | current/project/ADR-010-eval-strategy.md | — | R10, R12 | revise | Closes the unhomed accuracy/eval gap (drift→PR6, automation-bias→ADR-004/PR4, replay→ADR-007, accuracy→ADR-010). Records the evaluation decision that makes autonomy-ladder promotions (ADR-008) evidenced and R10/R12 measurable. No status-letter change (R10/R12 stay Proposed) — matrix R10/R12 now reference ADR-010. No external evidence (project action, tier —) |
 | E-2026-06-28-01 | 2026-06-28 | rbb24 (Rundfunk Berlin-Brandenburg, ARD public broadcaster), 26 Jun 2026 16:53 — reports DB's statement on the 23–24 Jun GSM-R outage with a Berlin S-Bahn angle. Paraphrased: DB found the fault; during planned maintenance part of the network technology was swapped; because NO error message arose, the GSM-R backup was not automatically activated though fully functional; after ruling out a cyberattack, staff manually switched to the redundant radio system and traffic resumed; ~90 min nationwide standstill. Nagl (DB InfraGO): "historisch einmaliges" Fehlerbild, now understood and preventable. Countermeasures: no further component swaps for now; manufacturer to fix the component; maintenance only 00:00–04:00 and only on the currently inactive radio system. REGIONAL: the entire Berlin S-Bahn network was stopped ("netzweite Störung im Kommunikationssystem"); private railways also affected | News (regional public broadcaster) | rbb24.de (Rundfunk Berlin-Brandenburg / ARD), 26 Jun 2026; reports DB statement + Nagl | A/C | R3, R4 | validate | A/C — regional ARD public broadcaster reporting DB's official statement (same DB-official content as E-2026-06-27-01/-03; A-weight for the content, C for the carrier). 4th source for the now primary-confirmed cause — adds NO new mechanism or provenance beyond DB's own portal (E-2026-06-27-03); VALIDATES it and adds the Berlin S-Bahn / private-railway IMPACT scope (R3/R4 blast radius). Reconfirms the silent-fault/no-alarm → failover-not-triggered detection gap (R12). No status change → matrix R3/R4 refs only (no new weight; logged for completeness) |
+| E-2026-06-28-02 | 2026-06-28 | Kontron Transportation — Railways market-segment page (kontron.com/ktrdn/market-segments-and-focus/railways). Vendor marketing: positions Kontron as a Railway Dedicated Network (RDN) leader (claims 20+ yrs, 84,000+ km of track, up to 574 km/h, "safe and secure" mission-critical comms); covers GSM-R (legacy), FRMCS (migration), 4G/5G private networks, MCx, TETRA/DMR; claims "ERTMS-compliant and EU CCS TSI certified," UIC EIRENE, involvement with ERA/UNIFE/ETSI; "evolution in continuity" (gradual GSM-R→FRMCS, reuse of installed infrastructure); GSM-R support "at least until 2035." No product names, pricing, case studies, or named partners (no DB/MORANE2/5G-RACOM/TOBA/ETCS/ATO on this page) | Vendor marketing (promotional) | kontron.com — Kontron Transportation (vendor); promotional, paraphrased | B | R8 | watch | B-tier vendor-promotional — discount superlatives (84k km, 574 km/h, "certified") per source-trust discipline; vendor self-claims, not independently verified. Relevant to R8: Kontron is one of the two FRMCS duopoly leaders (cf. E-04 Nokia–Kontron concentration) — this is its own market positioning, corroborating its supplier status but NOT independently validating concentration (self-source). Lightly corroborates R1/R2 (GSM-R-to-2035, "evolution in continuity"/reuse → parallel run) and R7 (ERTMS/CCS TSI/EIRENE conformance claims) — vendor say-so; "EU CCS TSI certified" needs primary NoBo verification, not marketing. No new verified facts → no decision moved; no matrix/ADR change (watch) |
 
 ## How to append
 
```
