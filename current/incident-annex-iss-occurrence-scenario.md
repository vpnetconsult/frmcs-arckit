# Incident annex, re-expressed as an ISS occurrence scenario — DB GSM-R nationwide outage, 23–24 June 2026

**Date:** 2026-09-19 · **Method:** arcKit · **Status:** DRAFT v1 — a structural re-expression, not a new investigation
**Source of every fact:** `current/incident-annex.md` (last revised 2026-06-27, characterisation corrected 2026-09-15) and the rows it cites. Nothing below adds a fact the annex does not hold; where the ISS structure asks for something the public record cannot supply, the field is marked **not held**.
**Target structure:** the ERA **ISS ontology** v1.0.0 (`iss_ontology`, E-2026-09-19-26) — the Information Sharing System of the *draft* delegated act of the CSM ASLP ("CDR (EU) 2024/xxxx", not yet adopted, `watch`). Classes and properties are cited by their ontology names; SKOS values by their published concept labels.
**Why:** ADR-012 item 5 records *what* a post-incident record must contain (TS 22.280 §6.15.4, TS 33.180 §10.1) and, since E-2026-09-19-26, *how* an EU safety regulator will read it. This document is the first test of whether the register's reconstruction of 23 June is complete in the regulator's sense. Its gaps are its findings.

> ⚠️ **Standing caveats.** (1) The CSM ASLP is a draft; no reporting obligation in this form exists today, and this record is the register's exercise, not a submission. (2) The reporting entity would be the infrastructure manager; the register is not it. (3) Trust tiers are carried through: DB's own statements (A) are the spine; insider-sourced press (C) is marked wherever used. (4) The ISS SHACL shapes (`iss-shacl/`) were not run against the Turtle sketch in §8 — it is illustrative.

---

## 1. `Record`

| Property | Value | Held? |
|---|---|---|
| `recordTitle` | Nationwide loss of GSM-R train radio, Germany, 23–24 June 2026 — planned component swap, silent software fault, automatic failover not triggered, manual recovery | ✅ |
| `recordId` | *(assigned by the ISS)* — register handle: `incident-annex` | — |
| `recordDatetime` | first record 2026-06-24; this version 2026-09-19 | ✅ |
| `hasRecordVersion` → `recordVersionNumber` | v1 (24 Jun, press) → v2 (27 Jun, DB-confirmed cause) → v3 (15 Sep, recovery-gate correction) → v4 (this re-expression) | ✅ |
| `reportingEntity` / `reportingEntityRole` | *would be* DB InfraGO AG — `OrgRoles: Infrastructure Manager` (operating railway lines). **This document is authored by the register from public sources.** | ⚠️ |
| `reportingReason` | *(SKOS scheme `ReportingReasons` has 3 concepts; labels not read)* | not held |
| `recordType` / `recordStatus` | *(schemes present; labels not read)* | not held |
| `notifyingEntity` | none — no `Notification` (NTF.5 NIB decision to investigate, NTF.5.4 final report) is on file; the annex records "a formal EBA report, if any, still outstanding" | ✅ (absence) |
| `hasRecordAttachment` | E-2026-06-27-03 (DB press portal, 24–26 Jun), E-2026-09-15-01 (DB statement 26.06.2026 via Golem), E-2026-06-24-18 (Ril 481.0205), E-2026-07-01-09 (ETSI TS 103 147) | ✅ |
| `isRelatedToRecord` | none held — the annex notes GSM-R "has repeatedly caused major disruptions in Germany before" (heise, high) but no prior record is on file | ⚠️ gap |

## 2. `SimpleReportSafetyRelatedEvent`

| Property | Value | Held? |
|---|---|---|
| `occurrenceTitle` | as `recordTitle` | ✅ |
| `occurrenceId` | *(ISS-assigned)* | — |
| `generalOccurrenceNarrative` | From late evening 23 June 2026 the German network came to a standstill after the GSM-R train-radio system failed. Duration ≈ 2 h to first movements (~00:30, 24 June); residual delays past 06:00. Scope nationwide (Stuttgart, Lower Saxony/Bremen/Hamburg, Berlin, Munich, NRW all reported complete outages). DB: a planned swap of a network distribution component in the GSM-R system triggered a "singular software fault"; the fault raised no automatic alarm; the system did not fail over automatically to its existing redundancy; recovery was manual. (A — DB statements 24–26 Jun; timings journalistic.) | ✅ |
| `occurrenceContextNarrative` | Planned maintenance action on the GSM-R core during operating hours (evening); the redundancy model of ETSI TS 103 147 (MSC pool / 1+1 / 1+N, GCR redundancy) was present; its automatic trigger did not engage. DB's rules for the scenario required staff to exclude a cyberattack before switching manually to the redundancy. | ✅ |
| `occcurrenceLocationNarrative` / `locationName` | Germany, nationwide — not a section of line | ✅ |
| `wgs:location` / `exactLocationOccurrencePositioningNorm` | not applicable to a network-wide event; the ISS location model (`era:LineReference`, `gsp:Geometry`) has no "whole network" value | ⚠️ **structural gap** |
| `causeOfReportedEventType` — direct cause (SKOS `directCauseReportedTypes`, 71 concepts) | Nearest: **B.3.3 – Other failures of the infrastructure** (B.3.3.1 is "power supply equipment failure"; there is no "train radio / CCS trackside failure" leaf). *Not* B.3.1.3 "wrong side signalling (infrastructure) failure" — the radio failed safe. | ⚠️ **taxonomy gap: no radio-system cause code** |
| — indirect cause (SKOS `indirectCauseReportedTypes`, 101 concepts) | **C.1.2.1 – Variation in function 'Detect irregularity'** (the silent fault) and **C.1.2.8 – Variation in function 'Coordinating failure and incident response'** (the gated recovery). **C.3.6 – Cyber attack** was *excluded*, not present — but the exclusion procedure is itself a scenario element (§4, BB7). | ✅ |
| `isADangerousGoodsEvent` | false | ✅ |
| `humanConsequencesTotalPerInjuryType` | none reported | ✅ (absence) |
| `monetizedDamages` / `damagesForReportingEntity` | not held | not held |

## 3. `DetailedReportSafetyRelatedEvent`

| Property | Value | Held? |
|---|---|---|
| `damageOperationServicesNarrative` | Full safety-mandated standstill of train operations nationwide for ≈2 h; residual delays into the morning peak. Under DB InfraGO Ril 481.0205 (in force 14.12.2025) a radio fault preventing connection requires the driver to stop at the next station, and the public-network fallback (P-GSM) cannot carry emergency (Notruf) or group calls — so the standstill was the documented rule, not an improvisation. | ✅ |
| `numberDelayedPassengerTrains` / `numberDelayedFreightTrains` / `minutesDelayPassengerTrains` / `minutesDelayFreightTrains` | **not held** — no operator figure published; the register holds no count | not held |
| `estimatedCostOperationDisruption*` | not held | not held |
| `damageInfrastructureNarrative` / `damageRollingStockNarrative` | none — no physical damage reported | ✅ (absence) |
| `lightCondition` / `ambientCondition` / `weatherCondition` | night; not relevant to the mechanism | — |
| `hasOccurrenceScenario` | §4 | ✅ |
| Affected railway system function (SKOS `railwaySystemFunctions`, 127 concepts) | **RSYS.4.2.1 – GSM-R Trackside Voice/Data** → **RSYS.4.2.1.3 – Mobile Switching Center-MSC** (nearest published leaf to "network distribution component"; the exact element is *not* named by DB and is not asserted here). Note: the scheme also contains **RSYS.4.1.2.4 – FRMCS** and **RSYS.4.1.3.1.3 – FRMCS** as on-board functions — the first ERA vocabulary in which FRMCS appears as a term. | ⚠️ element unnamed |

## 4. `OccurrenceScenario` — the fault tree in building blocks

`occurrenceScenarioNarrative`: a planned maintenance action produced a silent software fault in a central GSM-R element; because the fault raised no alarm, the existing automatic failover did not trigger; the network was lost nationwide; operating rules mandated a standstill and forbade safety-critical use of the fallback bearer; recovery required a procedural cyber-exclusion before humans were permitted to switch manually to the redundancy; manual switch-over restored service after ≈2 h.

Each block: `buildingBlockNarrative`, `outputEvent`, gates (`inputAndGate` / `inputOrGate`), and the failed measures and factors attached to it (§5, §6).

| Block | `buildingBlockNarrative` | `outputEvent` (working label) | Gate / inputs | Tier |
|---|---|---|---|---|
| **BB1** | Scheduled swap of a network distribution component in the GSM-R core, performed during operating hours (evening of 23 Jun) | *maintenance action on live core* | — (initiating) | A |
| **BB2** | The swap triggers a "singular software fault" in the component | *software fault in central element* | input: BB1 | A |
| **BB3** | The fault raises **no automatic alarm** — it is silent to the monitoring | *undetected fault* | input: BB2; `hasFailedRiskControlMeasure` FRCM-1 | A |
| **BB4** | Because no fault is signalled, the **automatic failover to the existing redundancy does not trigger** | *redundancy not engaged* | **AND** gate: BB2 ∧ BB3; `hasFailedRiskControlMeasure` FRCM-2 | A |
| **BB5** | GSM-R voice and data service is lost **nationwide, simultaneously** (central failure domain) | *loss of train radio, whole network* | input: BB4 | A |
| **BB6** | Under Ril 481.0205 drivers stop at the next station; the P-GSM fallback cannot carry Notruf or group calls, so no safety-critical traffic moves to it | *safety-mandated standstill* | input: BB5; `hasFailedRiskControlMeasure` FRCM-3 | A (rule) |
| **BB7** | DB's rules for this scenario require staff to **exclude a cyberattack before** switching manually to the redundancy; the exclusion is performed | *recovery gated by security procedure* | input: BB5; `hasFailedRiskControlMeasure` FRCM-4 (measure that introduced a threat to mitigation) | A (DB 26.06) |
| **BB8** | Staff switch manually to the redundant side; service returns ≈00:30 (≈2 h after loss, the gate of BB7 included) | *manual recovery* | **AND** gate: BB4 ∧ BB7 (recovery required both the redundancy to exist and the gate to be passed) | A / timings C |
| *(BB9, C-tier, unconfirmed)* | Berliner Zeitung: the backup system "also failed" — **refined by DB**: the backup did not fail, it was never triggered. Retained only as the corrected reading of BB4. | — | — | C → superseded |

**Structural remark.** The ISS gate model expresses this cleanly: the outage is an AND of *fault present* and *fault undetected*; the recovery is an AND of *redundancy exists* and *procedural gate passed*. The event has **two gates in series** — one technical (BB3/BB4), one organisational (BB7) — and the tree makes visible that removing either shortens the outage. That is the register's finding of 2026-09-15 in the regulator's notation.

## 5. `FailedRiskControlMeasure` × 4

The ISS pairs each failed measure with the `RiskControlMeasure` it corresponds to and its `RiskControlMeasureFunction` (detect / diagnose / act — E-2026-09-19-26).

| Id | `correspondsToRiskControlMeasure` (`riskControlMeasureName`) | Function | `failedInBlock` | `failureMode` | `failureAnalysis` | Tier |
|---|---|---|---|---|---|---|
| **FRCM-1** | Fault detection / automatic alarming of the GSM-R core element | **detect** | BB3 | Silent fault: the failed element continued to be trusted to report its own state and reported nothing | The element was the sole source of evidence about itself; no out-of-band supervision (ITU-T Q.752 principle, E-2026-06-30-03) existed to see the silence. PR11's founding instance. | A |
| **FRCM-2** | Automatic switch-over to redundant core (ETSI TS 103 147 §4.2: redundancy "without physical intervention … automatic switchover, no manual switchover"; §4.1 names maintenance activities among covered events) | **act** | BB4 | Not triggered: the act function was conditioned on the detect function, which had failed | A non-conformance to TS 103 147's automatic-switchover requirement, not a scenario the standard failed to anticipate. Redundancy hardware present; trigger absent. | A |
| **FRCM-3** | Fallback bearer (public network, P-GSM) | **act** (mitigate consequences) | BB6 | *Did not fail — was designed not to carry the traffic*: Ril 481.0205 forbids Notruf/group calls on it | The measure's `riskControlMeasureAim` never included safety-critical voice; it mitigates nothing in this scenario. Recorded as failed-by-scope, which the ISS `resultFailedRiskControlMeasure` can carry. | A |
| **FRCM-4** | Recovery procedure: mandatory cyber-attack exclusion before manual failover (DB rule for the scenario) | **diagnose** | BB7 | Did not fail *as a security control* — it worked as written. It failed *as part of the availability path*: it added an unbounded, unlisted latency to recovery | This is the ISS property **`introducesThreatToEventMitigation`** on the security RCM: a measure that, by design, delays mitigation of a different event. The adverse-effect class `SP-SEC-SuppEssFunc` enumerates (ADR-012 item 5, ARB-2026-09-17 R1). | A |

**What the ISS structure forces that the annex had not:** FRCM-4 has to be *declared* as a risk control measure with a function, an aim and a documented threat to mitigation — the annex only narrated it. ADR-012 item 5's enumeration duty is this declaration, made once per such measure.

## 6. `ContributingSystemicFactor`

Values from the two published SKOS schemes (`systemicFactors`, 35 concepts; `contributingFactors`, 36 concepts), each with the `contributingSystemicFactorNarrative` the annex supports.

| Attached to | Scheme | Concept | Narrative | Tier |
|---|---|---|---|---|
| BB1 | Systemic | **Management of change** | A component swap on the live core was scheduled in operating hours; DB's countermeasures (maintenance only 00:00–04:00, only on the inactive redundancy side, swaps suspended pending a manufacturer fix) are the change-management rule that was absent | A |
| BB1 | Systemic | **Contractors, partners and suppliers** | "Pending a manufacturer fix" — the fault sits in supplier software; the operator's change window depends on the supplier's correction | A |
| BB3 | Systemic | **Monitoring** (performance evaluation) | No independent supervision of the central element; detection depended on self-report | A |
| BB3 / BB4 | Contributing | **Design** | Automatic failover conditioned solely on an alarm from the element being failed over — a single detection path | A |
| BB6 | Contributing | **Instructions** | Ril 481.0205: stop at next station; fallback barred from safety-critical use — correct as written, and the reason the standstill was total | A |
| BB7 | Contributing | **Instructions** · **Decision-making** | The cyber-exclusion rule placed a security decision on the availability path with no time bound and no named authority (ADR-012 item 4 now bounds it) | A |
| BB7 | Systemic | **Emergency management** | Recovery procedure not designed for the case "redundancy exists but did not engage" | A |
| Record | Systemic | **Learning from accidents and incidents** | GSM-R had "repeatedly caused major disruptions in Germany before" (heise) — recurrence known; no prior record linked (§1 `isRelatedToRecord` gap) | high (press) |
| Record | Systemic | **Asset Management** | DB terms the event "historisch einmalig" while announcing a comprehensive GSM-R renewal/resilience programme and ≥10 more years of GSM-R as interim — the asset is end-of-life and load-bearing at once | A |

Not used: `Cyber attack` (C.3.6) — excluded by DB; `Competence`, `Fatigue`, `Stress` — no evidence either way.

## 7. `Recommendation` / `RecommendationItem`

Two sets, kept apart because the ISS `Recommendation` is normally an investigating body's. Neither is a NIB's.

**7.1 The infrastructure manager's own countermeasures (DB, 24–27 Jun; A)** — recorded as `RiskControlMeasure`s the IM has declared, not as recommendations:

| Measure | Function | Maps to block |
|---|---|---|
| Component swaps suspended pending a manufacturer fix | act (prevent) | BB1 |
| Maintenance windows restricted to 00:00–04:00, and only on the inactive redundancy side | act (prevent) | BB1 |
| Comprehensive GSM-R renewal / resilience programme | — (programme) | BB2–BB5 |
| Fallback layer transitioning to the public mobile network | act (mitigate) | BB6 — ⚠️ per Ril 481.0205 the public network cannot carry Notruf/group calls; a public-mobile fallback must re-provide MCPTT functions to be a safety-critical substitute (R4) |

**7.2 The register's recommendations (this engagement's ADRs), as `RecommendationItem`s:**

| `recommendationId` | `recommendationTitle` | `recommendationText` (paraphrase) | Addresses |
|---|---|---|---|
| REC-PR11 | Independent detection of silent faults | A component's failure may not be detected solely by that component: out-of-band supervision (Q.752) feeds the failover decision and *is* the "cannot adjust" signal a closed loop cannot raise about itself (28.535 escalation rule, E-2026-09-19-11) | FRCM-1 |
| REC-R3 | Design out the central SPOF in FRMCS | Geo-redundant 5G core / IMS / MCX with the failover *trigger* specified by the operator, since 3GPP leaves it to peers "detecting" (TS 23.501 §5.21, E-2026-09-19-05) and UIC V2 marks gateway redundancy out of scope (E-2026-09-19-19) | FRCM-2 |
| REC-R4 | A designed fail-soft path | Defined degraded mode keeping safety-critical voice and movement authorities alive locally; multi-bearer fallback as a designed, statically-policied path (SRS v2.1 §12.3.8), classes A–C moving only on an evidenced decision (ADR-001 item 5(b)) | FRCM-3 |
| REC-ADR012-5 | Enumerate every security control on a recovery path | Each such control listed as `SP-SEC-SuppEssFunc` with its mitigation, time-boxed and with a named authority (ADR-012 items 4–5, ARB-2026-09-17 R1) | FRCM-4 |
| REC-ADR011 | Change control for live-core interventions | Vital managed objects excluded from maintenance intents; a change to a vital object enters change control as a request, never as an intent; producer-created assurance loops are configuration items (ADR-011 mechanism clause) | BB1 |
| REC-ADR012-5b | Build the post-incident record before the incident | TS 22.280 §6.15.4 metadata incl. bearer-side events (pre-emption, loss of signal, failed registration) and TS 33.180 §10.1 security content, specified at procurement since UIC V2 mandates only REC metadata — so that a future record fills §2–§3 of this document from logs, not from press | §2–§3 gaps |

## 8. Turtle sketch — **validated 2026-09-19 against `iss_ontology` v1.0.0 `iss-shacl/shapes/` (30 shape files) with pyshacl 0.40.1** (E-2026-09-19-44)

**Result: conforms, after two corrections to the sketch and with one class of violation that is ERA's, not ours.** (1) Every ISS text property is constrained `sh:datatype xsd:string` (81 such constraints; no `rdf:langString`, no `sh:languageIn` anywhere) — language-tagged literals (`"…"@en`) are violations, so the sketch now carries plain strings. (2) The RCM function is not a free string: `iss:riskControlMeasureFunction` takes a concept from the published scheme `…/iss/concepts/risk-control-measure-functions/` — nine codes, **each function split by who performs it: RCMF.1.1 detect–technical system / 1.2 detect–human; 2.1 diagnose–technical / 2.2 diagnose–human; 3.1 act–technical / 3.2 act–human** (x.0 = "none"). The sketch now cites those codes. (3) **Three defects in ERA's v1.0.0 artefacts, found by running them:** the gate shapes require `sh:class era:InputAndGate` / `era:InputOrGate` while the ontology defines the classes in the `iss:` namespace, so every conformant gate node is reported as a violation; the shape `RiskControlMeasureFunctionSKOSinScheme` demands scheme `…/safety-measure-function-types/RiskControlMeasureFunctionTypes` while the published SKOS file puts the concepts in `…/risk-control-measure-functions/RiskControlMeasureFunctions`; six shapes still point at the *deprecated* `safety-event-types/SafetyEventTypes` scheme. Reported as an act (A11 in `14-next-acts.md`); the sketch uses the ontology's IRIs and the published scheme, so the final run (sketch + the two SKOS files as data, `ontology.ttl` as ontology graph, 348 triples) reports exactly five violations, all upstream: the two AND-gate nodes (namespace) and the three `riskControlMeasureFunction` values (scheme IRI). Nothing else. Runner: `python3 -m pyshacl -s <concat of iss-shacl/shapes/*.ttl> -e iss_ontology/ontology.ttl <this sketch + era-skos-riskControlMeasureFunctions.ttl + era-skos-systemicFactors.ttl>`.

```turtle
@prefix iss:  <http://data.europa.eu/949/iss/> .
@prefix era:  <http://data.europa.eu/949/> .
@prefix xsd:  <http://www.w3.org/2001/XMLSchema#> .
@prefix ex:   <https://frmcs-arckit.example/incident/2026-06-23/> .
@prefix iss-rcmf: <http://data.europa.eu/949/iss/concepts/risk-control-measure-functions/> .
@prefix iss-sf:   <http://data.europa.eu/949/iss/concepts/systemic-factors/> .
# Strings are plain xsd:string throughout: the ISS shapes reject language-tagged literals.

ex:record a iss:Record ;
  iss:recordTitle "Nationwide loss of GSM-R train radio, Germany, 23–24 June 2026" ;
  iss:recordDatetime "2026-09-19T00:00:00"^^xsd:dateTime ;
  iss:recordVersionNumber "4" ;
  iss:hasInfoInRecord ex:simple , ex:detailed .

ex:simple a iss:SimpleReportSafetyRelatedEvent ;
  iss:occurrenceTitle "Nationwide loss of GSM-R train radio, 23–24 June 2026" ;
  iss:generalOccurrenceNarrative "Planned swap of a network distribution component → singular software fault → no alarm → automatic failover not triggered → nationwide loss ≈2 h → manual recovery after mandatory cyber-attack exclusion." ;
  iss:isADangerousGoodsEvent false .

ex:detailed a iss:DetailedReportSafetyRelatedEvent ;
  iss:damageOperationServicesNarrative "Safety-mandated nationwide standstill ≈2 h; residual delays past 06:00; counts and costs not published." ;
  iss:hasOccurrenceScenario ex:scenario .

ex:scenario a iss:OccurrenceScenario ;
  iss:occurrenceScenarioNarrative "Two gates in series: technical (silent fault, failover not triggered) and organisational (cyber-exclusion before manual switch-over)." ;
  iss:hasOccurrenceScenarioBlock ex:bb1 , ex:bb2 , ex:bb3 , ex:bb4 , ex:bb5 , ex:bb6 , ex:bb7 , ex:bb8 .

ex:bb3 a iss:OccurrenceScenarioBuildingBlock ;
  iss:buildingBlockNarrative "Software fault raises no automatic alarm." ;
  iss:hasFailedRiskControlMeasure ex:frcm1 ;
  iss:hasContributingSystemicFactor ex:csf-monitoring .

ex:bb4 a iss:OccurrenceScenarioBuildingBlock ;
  iss:buildingBlockNarrative "Automatic failover to existing redundancy not triggered." ;
  iss:inputAndgate [ a iss:InputAndGate ; iss:inputAndGateBuildingBlock ex:bb2 , ex:bb3 ] ;
  iss:hasFailedRiskControlMeasure ex:frcm2 .

ex:bb7 a iss:OccurrenceScenarioBuildingBlock ;
  iss:buildingBlockNarrative "Rules require cyber-attack exclusion before manual switch-over." ;
  iss:hasFailedRiskControlMeasure ex:frcm4 .

ex:bb8 a iss:OccurrenceScenarioBuildingBlock ;
  iss:buildingBlockNarrative "Manual switch-over; service restored ≈00:30." ;
  iss:inputAndgate [ a iss:InputAndGate ; iss:inputAndGateBuildingBlock ex:bb4 , ex:bb7 ] .

ex:frcm1 a iss:FailedRiskControlMeasure ;
  iss:failedInBlock ex:bb3 ;
  iss:failureMode "silent fault — self-report only" ;
  iss:correspondsToRiskControlMeasure ex:rcm-detect .
ex:rcm-detect a iss:RiskControlMeasure ;
  iss:riskControlMeasureName "Fault detection / automatic alarming of GSM-R core element" ;
  iss:riskControlMeasureFunction iss-rcmf:11 .   # RCMF.1.1 Detect function - Technical system

ex:frcm2 a iss:FailedRiskControlMeasure ;
  iss:failedInBlock ex:bb4 ;
  iss:failureMode "act function conditioned on failed detect function" ;
  iss:correspondsToRiskControlMeasure ex:rcm-failover .
ex:rcm-failover a iss:RiskControlMeasure ;
  iss:riskControlMeasureName "Automatic core switch-over (ETSI TS 103 147 §4.2)" ;
  iss:riskControlMeasureFunction iss-rcmf:31 .   # RCMF.3.1 Act function - Technical system

ex:frcm4 a iss:FailedRiskControlMeasure ;
  iss:failedInBlock ex:bb7 ;
  iss:failureMode "security control on the availability recovery path, unbounded" ;
  iss:correspondsToRiskControlMeasure ex:rcm-cyber-exclusion .
ex:rcm-cyber-exclusion a iss:RiskControlMeasure ;
  iss:riskControlMeasureName "Mandatory cyber-attack exclusion before manual failover" ;
  iss:riskControlMeasureFunction iss-rcmf:22 ;   # RCMF.2.2 Diagnose function - Human
  iss:additionalExplanationRiskControlMeasureThreats "Introduces a threat to event mitigation: delays recovery from loss of train radio." .

# Blocks elided above, typed so the scenario's block list validates; factor coded from the published scheme.
ex:bb1 a iss:OccurrenceScenarioBuildingBlock ; iss:buildingBlockNarrative "Planned swap of a network distribution component in the GSM-R core, in operating hours." .
ex:bb2 a iss:OccurrenceScenarioBuildingBlock ; iss:buildingBlockNarrative "The swap triggers a singular software fault in the component." .
ex:bb5 a iss:OccurrenceScenarioBuildingBlock ; iss:buildingBlockNarrative "GSM-R voice and data lost nationwide, ~2 h." .
ex:bb6 a iss:OccurrenceScenarioBuildingBlock ; iss:buildingBlockNarrative "Safety-mandated standstill; fallback bearer barred from Notruf/group calls." .
ex:csf-monitoring a iss:ContributingSystemicFactor ;
  iss:systemicFactor iss-sf:SF-5-1 ;   # Monitoring (performance evaluation)
  iss:contributingSystemicFactorNarrative "No independent supervision of the central element; detection depended on self-report." .
```

## 9. What the exercise found — the gaps are the result

1. **Two taxonomy gaps in the ISS itself.** No direct-cause code for a train-radio / CCS-trackside failure (nearest: B.3.3 "other failures of the infrastructure"); no location value for "whole network". A nationwide telecom outage does not fit a scheme built around trains, tracks and level crossings. If the CSM ASLP is adopted as drafted, the sector's first FRMCS-era core outage will be reported under "other".
2. **Four fields the public record cannot fill** — delayed-train counts, delay minutes, disruption cost, the failed element's identity. DB has published none; the register holds none. These are exactly the fields the 22.280 §6.15.4 / 33.180 §10.1 logs would supply if they existed on the operator's side (ADR-012 item 5) — and, on V2 products, only REC metadata is mandatory (E-2026-09-19-19).
3. **The organisational gate becomes a first-class object.** In the annex, the cyber-exclusion rule was a corrected sentence. In the ISS it is a declared `RiskControlMeasure` with function *diagnose* and a documented `introducesThreatToEventMitigation`. The ISS vocabulary has a property for precisely the adverse-effect class ADR-012 item 5 enumerates — which is the strongest external confirmation yet that the enumeration duty is the right instrument.
4. **The fault tree is two ANDs.** Outage = fault ∧ undetected; recovery = redundancy ∧ gate-passed. Every register position on this incident (PR11, R3, R4, ADR-012 items 4–5, ADR-011) attaches to one of those four leaves, and nothing attaches anywhere else. The reconstruction is complete in the regulator's sense *for the mechanism*; it is incomplete *for the consequences*, and that incompleteness is the operator's, not the register's.
5. **FRMCS appears in an ERA vocabulary for the first time** — `railwaySystemFunctions` RSYS.4.1.2.4 / RSYS.4.1.3.1.3 (on-board voice / data). The ISS can name the system that will replace GSM-R; RINF and the RCC still cannot (E-2026-09-19-25/-26). Recorded on the legal-chain note. **Corrected in degree 2026-09-19 (E-2026-09-19-44, full scheme read — 126 codes):** FRMCS is named *on-board only*. The trackside branch is **RSYS.4.2.1 "GSM-R Trackside Voice/Data"** with exactly three children — 4.2.1.1 Dispatcher Terminal, 4.2.1.2 Base Station (BTS/BSC), 4.2.1.3 Mobile Switching Center (MSC) — a 2G decomposition. **This incident's failed element (a core "network distribution component") codes at best as RSYS.4.2.1.3 MSC; an FRMCS trackside failure — gNB, 5G core, IMS, MCX server — has no code at all.** So the first FRMCS-era core outage would be reported not only under "other" for its cause (finding 1) but under a GSM-R function code for its system. Third ISS taxonomy gap; the legal-chain note §4 carries it.
6. **No prior record to link.** The recurrence the press asserts (heise) has no record in this register; `isRelatedToRecord` is empty. An acquisition target: earlier German GSM-R outages as dated events.

*Anchors:* `incident-annex.md` · E-2026-06-24-16/-18/-26 · E-2026-06-25-01 · E-2026-06-27-01/-02/-03 · E-2026-06-30-03 · E-2026-07-01-09 · E-2026-09-15-01 · E-2026-09-19-05/-11/-19/-25/-26 · ADR-011, ADR-012 items 4–5, PR11, R3, R4.
