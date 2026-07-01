# Baseline 2026-06-28

Frozen (UTC): 2026-06-28T10:31:36Z
Files: 25

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 36

## Changes vs 2026-06-27_1835

- changed: evidence-log.md
- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -2,7 +2,7 @@
 
 **Scope:** GSM-R → FRMCS transition + agentic decision/governance layer
 **Owner:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud
-**Last revised:** 2026-06-27
+**Last revised:** 2026-06-28
 **Linked records:** ADR-001 (transition), ADR-002 (agentic decision & oversight layer), incident-annex.md, evidence-log.md
 
 This matrix is the living core of the assessment. Each requirement traces to a decision, a mechanism that addresses it, and a status. The status column is the honest part: it shows what is settled, what last night's outage promoted from assumed to load-bearing-open, and what is still only proposed. Revise statuses as evidence arrives (see evidence-log.md); the daily baseline freezes the state so the evolution is visible.
@@ -11,8 +11,8 @@
 |---|---|---|---|---|---|
 | R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -08, -11, -13, -17, -19, -21, E-2026-06-25-02 |
 | R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11, -13, -17, -18, -21 |
-| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03 |
-| R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03 |
+| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
+| R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective · ADR-007 (prove by test) | E-2026-06-24-01, -15, -16, -18, -21, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-28-01 |
 | R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03, -13, -21, E-2026-06-25-02 |
 | R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03, -13 |
 | R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04, -13, -21 |
```

#### evidence-log.md
```diff
@@ -43,6 +43,7 @@
 | E-2026-06-27-05 | 2026-06-27 | Northern Telecom (Nortel) "DMS SuperNode Signaling Transfer Point Technical Specification" (PLN-5101-001, DMS-100 Family, BCS32+, Standard 01.01, Sept 1991; © Northern Telecom) — manufacturer technical spec for the DMS SuperNode STP, an SS7/CCS7 Signaling Transfer Point. Paraphrased: an STP ROUTES CCS7 messages between network nodes (not a source/destination — a routing conduit); built on DMS-core/DMS-bus + Link Peripheral Processor (LPP/LMS/LIU7); dual-plane combined core (redundancy); covers capacity/throughput, STP cross-delay, accuracy & reliability standards, gateway screening, SEAS, global-title translation, enhanced maintenance (DS-0A loopback, BER test), CCS7 protocol. Reference document, not an ops guide. Per engagement identification (user): this is the spec of the node whose swap was the 23 Jun culprit | Vendor technical specification (primary, historical) | Northern Telecom (Nortel), PLN-5101-001, Sept 1991; paraphrased, not quoted (© NT) | A | R3, R1 | watch | Tier A: a manufacturer's primary TECHNICAL specification (authoritative for the node's design/capacity/redundancy) — NOT vendor-promotional (B is for marketing); vendor-origin (Nortel) + 1991/BCS32 historical. Documents the as-is central SS7 STP: its function ("routes CCS7 messages between network nodes… conduit for routing traffic") is consistent with DB's "network distribution component" (E-2026-06-27-01/-02/-03), and its dual-plane core matches the "redundancy existed but auto-failover didn't engage" finding (R3/R4). R1 obsolescence: a 1991-spec node from a long-defunct vendor (Nortel, gone 2009) in a live signalling core is concrete obsolescence/supply risk (cf. DB's "pending a manufacturer fix"). IMPORTANT — the "this was THE 23-Jun culprit" linkage is an ENGAGEMENT identification (user), NOT in any public/primary source: DB named only a "network distribution component," no vendor/element. The spec proves what the node IS, not that it failed on 23 Jun → logged as watch; does NOT revise the confirmed cause and moves no status. Verify the element identification vs a primary DB/EBA source before treating as established. Copyrighted NT doc — paraphrased only |
 | E-2026-06-27-06 | 2026-06-27 | telecomtigers.blogspot.com (Ashish Bhatia, personal blog), 8 Nov 2009 — generic educational tutorial on SS7 Signaling Transfer Points: STP as the SS7 signalling hub routing message packets between nodes; functions (routing, network management, ANSI/ITU protocol conversion, Global Title Translation, LNP); SS7 link taxonomy (A/B/C/D/E/F links) and mated-pair/quad redundancy. No mention of railway/DB/GSM-R/Nortel/the 2026 outage | Reference (personal blog, tertiary) | telecomtigers.blogspot.com — personal telecom blog; paraphrased | D | R3 | watch | D-tier: a personal-blog SS7 explainer (user-generated, secondary/tertiary), not authoritative. Generic background on the STP concept — routing hub + mated-pair redundancy + link types — lightly contextualising the as-is central signalling element (R3). BUT adds NO new evidentiary weight: the STP architecture is already documented at A-tier and node-specific by the Nortel DMS SuperNode STP spec (E-2026-06-27-05); orientation only. No railway/DB/2026 content. Does not move a decision → no matrix/ADR change (watch) |
 | E-2026-06-27-07 | 2026-06-27 | ADR-010 (Agent evaluation strategy — accuracy, automation-bias, drift) opened — Proposed. Homes the accuracy/eval scope displaced when ADR-007 became the testing/canary ADR. Framework: per-role accuracy (Risk Sentinel detection/lead-time/false-alarm; Assurance evidence-chain) measured against ADR-007 replay+shadow surfaces; oversight-effectiveness/automation-bias metrics (dissent/override/latency/calibration → G4); drift monitoring on daily baselines with auto-demote-to-shadow; eval gates per autonomy rung (ADR-008). Core principle: an advisory agent is only as safe as its measured accuracy AND the measured effectiveness of the human oversight around it | Project | current/project/ADR-010-eval-strategy.md | — | R10, R12 | revise | Closes the unhomed accuracy/eval gap (drift→PR6, automation-bias→ADR-004/PR4, replay→ADR-007, accuracy→ADR-010). Records the evaluation decision that makes autonomy-ladder promotions (ADR-008) evidenced and R10/R12 measurable. No status-letter change (R10/R12 stay Proposed) — matrix R10/R12 now reference ADR-010. No external evidence (project action, tier —) |
+| E-2026-06-28-01 | 2026-06-28 | rbb24 (Rundfunk Berlin-Brandenburg, ARD public broadcaster), 26 Jun 2026 16:53 — reports DB's statement on the 23–24 Jun GSM-R outage with a Berlin S-Bahn angle. Paraphrased: DB found the fault; during planned maintenance part of the network technology was swapped; because NO error message arose, the GSM-R backup was not automatically activated though fully functional; after ruling out a cyberattack, staff manually switched to the redundant radio system and traffic resumed; ~90 min nationwide standstill. Nagl (DB InfraGO): "historisch einmaliges" Fehlerbild, now understood and preventable. Countermeasures: no further component swaps for now; manufacturer to fix the component; maintenance only 00:00–04:00 and only on the currently inactive radio system. REGIONAL: the entire Berlin S-Bahn network was stopped ("netzweite Störung im Kommunikationssystem"); private railways also affected | News (regional public broadcaster) | rbb24.de (Rundfunk Berlin-Brandenburg / ARD), 26 Jun 2026; reports DB statement + Nagl | A/C | R3, R4 | validate | A/C — regional ARD public broadcaster reporting DB's official statement (same DB-official content as E-2026-06-27-01/-03; A-weight for the content, C for the carrier). 4th source for the now primary-confirmed cause — adds NO new mechanism or provenance beyond DB's own portal (E-2026-06-27-03); VALIDATES it and adds the Berlin S-Bahn / private-railway IMPACT scope (R3/R4 blast radius). Reconfirms the silent-fault/no-alarm → failover-not-triggered detection gap (R12). No status change → matrix R3/R4 refs only (no new weight; logged for completeness) |
 
 ## How to append
 
```
