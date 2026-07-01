# Baseline 2026-06-24

Frozen (UTC): 2026-06-24T13:05:29Z
Files: 19

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 20

## Changes vs 2026-06-24_1501

- changed: evidence-log.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -27,6 +27,7 @@
 | E-2026-06-24-17 | 2026-06-24 | Bundestag Drucksache 21/6477 (Antwort der Bundesregierung, 12.06.2026, BMV) — ERTMS/ETCS status DE: FRMCS (Morane 2 + first pilot line by end 2027; further pilots 2029/2030; equip all FRMCS lines "by end of GSM-R support"); CTMS = DB AI-based Capacity & Traffic Management System (plans + part-automates train movements; prototype → production); Bund ERTMS Koordinierungsstelle established (Schnieder); FRMCS/ATO pre-equipping funding planned; DKS-F €481.8m cap, €338.8m approved, only 20.13% of 2025 funds drawn | Government (primary) | Deutscher Bundestag Drucksache 21/6477; Bundesregierung / BMV | A | R1, R2, R9, R10, R11, R12, R13 | revise | A-tier primary (official answer to Parliament). CTMS = first primary evidence of a LIVE AI traffic-decision system in-domain → validates R9–R12 / ADR-002 premise; partially fills the R9/R11 gap; raises the CTMS human-oversight / SIL-4 boundary question. Confirms FRMCS timeline (R1/R2). R13: Bund coordinating body now established + funding planned, but 20.13% drawdown = feasibility risk. Caveats: dated 12.06.2026 (PRE-outage); "Vorabfassung" |
 | E-2026-06-24-18 | 2026-06-24 | DB InfraGO Ril 481.0205 "Grundlagen für Verbindungen des Zugfunks im GSM-R-Netz" (in force 14.12.2025; update cover 25.11.2025, w/ 481.0101/0202/0204/0301/0302) — live DB operating rulebook for GSM-R train radio. Paraphrased: rail features = functional addressing, group calls, pre-emption, Notruf priority; FALLBACK — on GSM-R loss/gaps the public P-GSM (D) may be used only if permitted, but Notruf & group calls are NOT possible on it (§5/§9); on a radio fault preventing connection the driver must in principle STOP at the next station (§9(4)); planned GSM-R out-of-service has a defined EVU/driver notification process (§9; 481.0302); vehicles can send a Fahrzeug-Hilferuf SMS on events (§8) | Operator regulation (primary) | DB InfraGO AG, Ril 481.0205 (I.IBB 32) — paraphrased, not quoted (copyrighted) | A | R2, R3, R4 | revise | A-tier primary (operator's own in-force rulebook). UPGRADES the E-16 fallback claim from C→A: DB's own regulation states the public-network fallback cannot carry Notruf/group calls → not a safety-critical substitute (R4). Confirms the as-is fail-soft reality (radio loss → stop at next station) the FRMCS design must improve on (R4) and the GSM-R operating baseline the cutover must preserve (R2). NB: confirms the STRUCTURAL fallback gap, NOT the specific "backup also failed on 23 Jun" event (stays E-16/C-tier). Copyrighted DB doc — paraphrased only |
 | E-2026-06-24-19 | 2026-06-24 | DB InfraGO-Zustandsbericht Netz und Personenbahnhöfe 2023 (3rd annual edition; foreword Dr. Philipp Nagl) — primary asset-condition report on the fixed network. Paraphrased: overall Netzzustandsnote worsened 3.01 (2022)→3.03 (2023); ~€92.2bn condition-based backlog (≈16% of €560.5bn replacement value, +€1.9bn YoY); Leit-/Sicherungstechnik (LST) the worst gewerk, worsened 3.73→3.90; Stellwerke (interlockings) the worst asset type at 4.02 (2022: 3.70), explicitly driven by "überalterte Stellwerkstechnik" hit by Umbauverbote + schwere Obsoleszenzfälle; names Digitale Schiene Deutschland (DSD) as the lever to modernise "überalterte und teils obsolete Technik" | Operator condition report (primary) | DB InfraGO AG — InfraGO-Zustandsbericht 2023 (paraphrased, not quoted; © DB InfraGO AG) | A | R1 | validate | A-tier primary first-party operator report (not press/vendor/aggregator). CONFIRMS the obsolescence-urgency driver behind R1 with in-domain primary evidence — signalling obsolescence is the operator's own worst-and-worsening finding, and DSD is named as the modernisation lever. SCOPE LIMIT: fixed-infra (Netz) report only — it does NOT cover the GSM-R radio bearer and gives NO GSM-R EoL date, so it cannot support R1's ~2030/2035 timeline (driver only, not date). Lightly touches R3 (aged LST → rising Störgeschehen / systemic reliability decline) as background for why availability matters — NOT the radio SPOF; noted, not load-bearing. Self-reported by the asset owner (minor framing caveat), but condition reports are primary for asset condition. No status change (R1 already Accepted) → no ADR/matrix-status edit; added only as an R1 evidence ref |
+| E-2026-06-24-20 | 2026-06-24 | Rail UK (railuk.com), dated 4 Aug 2011 — HISTORICAL: Kapsch CarrierCom contracted (signed end-Jul 2011, ~€15m, completion ~mid-2014) to modernise DB's GSM-R core / Network Subsystem (NSS) to 3GPP Release 4 / IP-based. Core topology named: 2 geo-redundant Call Servers, 7 Media Gateways, 2 HLRs, 1 Service Control Point; called "the world's largest GSM-R network." No mention of FRMCS, 5G, or GSM-R EoL | News (trade press recapping vendor PR) | railuk.com — recap of a Kapsch CarrierCom announcement | C | R3 | watch | ~15-year-old item — HISTORICAL CONTEXT only, not current evidence. Tier C (trade press), but the content is a vendor (Kapsch) announcement → treat promotional claims ("world's largest", "quickly and safely") as discounted B-grade PR. Relevance: documents the as-is centralised GSM-R core (geo-redundant call servers but centralised HLR/SCP) — the very core whose centralisation R3 seeks to design out and the 23 Jun 2026 outage exposed; also light context on estate age/lifecycle (R1) and another historical DB GSM-R core supplier beyond Nokia/Kontron (R8). Background only: does NOT establish the 2026 cascade mechanism, and the 2011 architecture has very likely evolved since. No status change → no matrix/ADR edit (logged as watch) |
 
 ## How to append
 
```
