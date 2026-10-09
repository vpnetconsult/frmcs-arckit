# 19 — SID associations on record

**Sourcing rule (lead's decision, 2026-09-30).** The register reads the TM Forum SID from two sources and keeps them apart:

- **Data model — entities and attributes:** GB922 SID Excel **v26.0.0** (team-approved 29-May-2026, Production, TM Forum Approved; `GB922_Information_Framework_SID_Excel_v26.0.xlsx`) — **replaces v24.5.0 as the data-model source the same day the rule was made (E-2026-09-30-06).** The `Origin` column names the class that defines each attribute, so it also states attribute inheritance. v24.5 → v26.0 for the register's entities: no attribute added, removed or re-attributed (§6).
- **Associations — class relationships and multiplicities:** the public browsable UML export, **R20.0** (`https://www.tmforum.org/Browsable_HTML_SID_R20.0/`). The Excel does not carry associations; no later browsable release exists at that URL pattern (R20.5–R25.0 return 404, probed 2026-09-30).

**What follows from the rule, stated once.** An association cited from this file is an R20.0 fact. It is carried to v26.0 by assumption, not by a read — across six years of releases. A class that exists only in the Excel has **no association on record at all**.

Evidence: E-2026-09-30-01 … -06. Extraction: 42 class pages fetched 2026-09-30, 357 association ends, 39 with lower bound ≥ 1 ("required"). Class pages are located through `content/3E3F0EC000E9-tree.json`.

## 1. Classes with no association on record

Present in the v26.0 Excel (and already in v24.5), absent from R20.0 — the rule gives them attributes but no relationships:

| Class (v26.0) | Register use | Consequence |
|---|---|---|
| `Intent`, `IntentReport` | ADR-002 item 9, rule (xi) | who owns an intent, what it targets — not on record |
| `ClosedLoop`, `ClosedLoopBusinessRule` | ADR-011 (`whyInvoke`) | the loop's link to the resources it acts on — not on record |
| `Anomaly`, `AnomalyConsequence` | ADR-010 (`prescribedAction`) | anomaly → resource, anomaly → alarm — not on record |
| `AIModel`, `AiModelSpecification` and the AI Model Specification ABE | ADR-012 item 1 / Q-18 | **own** associations (model → specification, → training data) not on record; **inherited** ones follow from `Resource` / `LogicalResource` (§2), by attribute-inheritance evidence in the Excel (E-2026-09-30-04) |
| `Goal`, `Digitaldentity` (sic — the Excel's spelling; with `PartyDigitaldentity`, `ResourceDigitaldentity`, `Credential`), `Permission` | named in E-2026-09-19-41 | not on record |

The reverse also occurs: `SoftwareResource`, `Problem`, `Event`, `EventRecord`, `ResourceUser`, `ResourceInvolvementRole` are R20.0 classes with no business entity of that name in the v26.0 Excel (nor in v24.5). In R20.0, `Problem` and `EventRecord` already sit in packages labelled `UNUSED`. Associations that end on them (marked † below) should not be relied on. **`TroubleTicket` is the exception that came back:** `UNUSED` in R20.0, absent from v24.5, and in v26.0 a business entity again under `Patterns Domain.Trouble Ticket ABE` (with `TroubleTicketItem`) — its R20.0 associations are usable with the usual caveat, marked ‡.

## 2. Required associations (lower bound ≥ 1), R20.0

Read as: every instance of **Class** must have the stated number of **Target**.

### Resource and what hangs on it

| Class | Association | Target | Mult. | Note |
|---|---|---|---|---|
| `Resource` | `OwnsResourceDetails` | `PartyRole` | 1 | the single owner |
| `Resource` | `ResourceIsExtendedBy` | `CommonResourceInfo` | 1 | composite; MTOSI/MTNM common attributes |
| `CommonResourceInfo` | `ResourceIsExtendedBy` | `Resource` | 1 | |
| `ResourceAlarm` | `AlarmHasManagedObject` | `Resource` | 1 | every alarm names exactly one alarmed object |
| `CrossedThreshold` | `AlarmHasCrossedThreshold` | `ResourceAlarm` | 1 | |
| `ResourcePerformance` | `ResourcePerformanceMeasures` | `Resource` | 1 | |
| `ResourceConfiguration` | `ResourceConfigurationDefinedFor` | `Resource` | 1 | |
| `ResourceConfigSpec` | `ResourceConfigSpecDefinedFor` | `ResourceSpecification` | 1 | |
| `ResourceTest` | `ResourceTestExecutesOn` | `Resource` | 1 | |
| `ResourceSecurityEntity` | `ResourceServesAsResourceSecurityEntity` | `Resource` | 1 | |
| `ResourceUser` † | `UsesResource` | `Resource` | 1 | |
| `ResourceRole` | `SpecifiesResourceRoles` | `ResourceRoleSpecification` | 1 | |
| `ResourceFacingService` | `LogicalResourceImplementsRFS` | `LogicalResource` | 1..* | a resource-facing service needs at least one logical resource |
| `ResourceFacingService` | `SpecifiesResourceFacingService` | `ResourceFacingServiceSpec` | 1 | |
| `InstalledSoftware` | `ResourceUses` | `Resource` | 1 | the resource it is installed on |
| `InstalledSoftware` | `SSpecImplements` | `SoftwareSpecification` | 1 | |
| `InstalledSoftware` | `ResourceFunctionProvidedByInstalledSoftware` | `ResourceFunction` | 1..* | |
| `InstalledSoftware` | `InstalledSoftwareUsedForDeployment` | `SoftwareSupportPackage` | 1..* | |

### Party

| Class | Association | Target | Mult. | Note |
|---|---|---|---|---|
| `PartyRole` | `HasPartyRoles` | `Party` | 1 | a role is always played by exactly one party |
| `PartyRole` | `PartyResourceHas` | `PartyResource` | 1 | |
| `PartyRole` | `PartyRoleGroupContains` | `PartyRoleGroup` | 1 | |
| `PartyRoleAssociation` | `PartyRoleInvolves` | `PartyRole` | 1 | |
| `PartyRoleAssociation` | `PartyRoleInvolvedWith` | `PartyRole` | 1 | |

### Policy

| Class | Association | Target | Mult. | Note |
|---|---|---|---|---|
| `Policy` | `PolicyAppliesToDetails` | `PolicyDomain` | 1..* | |
| `PolicySet` | `SpecifiesPolicySet` | `PolicySetSpec` | 1 | |
| `PolicyRule` | `SpecifiesPolicyRule` | `PolicyRuleSpec` | 1 | |
| `PolicyRule` | `PolicyRuleIsTriggeredBy` | `PolicyEvent` | 1..* | shared |
| `PolicyRule` | `PolicyRuleIsTriggeredByPolicyEventBase` | `PolicyEventBase` | 1..* | shared |
| `PolicyRule` | `PolicyRuleEvaluates` | `PolicyCondition` | 1..* | shared |
| `PolicyRule` | `PolicyRuleTriggers` | `PolicyAction` | 1..* | shared |

### Security, performance, metric, root

| Class | Association | Target | Mult. | Note |
|---|---|---|---|---|
| `SecurityThreatTool` | `SecurityThreatActorEmploys` | `SecurityThreatActor` | 1 | |
| `SecurityThreatTool` | `SecurityThreatIndicatorDescribedBy` | `SecurityThreatIndicator` | 1 | |
| `SecurityThreatTool` | `SecurityThreatToolSpecificationDescribes` | `SecurityThreatToolSpecification` | 1 | |
| `Performance` | `PerformanceSpecificationDefines` | `PerformanceSpecification` | 1 | |
| `MetricDefinition` | `MetricDefinitionPlaysRoleOfChild` | `MetricDefinitionHierarchyMember` | 1 | |
| `ManagedEntity` | `SupportedMgmtMethodDetail` | `ManagementMethodEntity` | 1..* | shared |
| `ManagedEntity` | `EntityFurtherDefinedBy` | `Entity` | 1 | |
| `Event` † | `EventHasEnventType` (sic) | `EventType` | 1 | package `EntitiesToBeFixedInPh4` |
| `Event` † | `MilestoneGeneratesEvent` | `Milestone` | 1 | |

## 3. Optional associations the register leans on, R20.0

| Class | Association | Target | Mult. | Why it matters here |
|---|---|---|---|---|
| `Resource` | `AdministerResourceDetails` | `PartyRole` | 0..* | administrators are distinct from the one owner |
| `Resource` | `ResourcesInManagementDomain` | `ManagementDomain` | 0..1 | |
| `Resource` | `SpecifiesResource` | `ResourceSpecification` | 0..1 | a resource **may** exist without a specification |
| `ResourceAlarm` | `AlarmHasBackupObject` | `Resource` | 0..1 | |
| `ResourceAlarm` | `AlarmHasAlarmDectector` (sic) | `Resource` | 0..1 | the detecting object is optional |
| `ResourceAlarm` | `AlarmHasUnderlyingAlarms` | `ResourceAlarm` | 0..* | alarm correlation (reflexive) |
| `ResourceAlarm` | `ServiceProblemHasUnderlyingAlarms` | `ServiceProblem` | 0..* | alarm → service problem |
| `ResourceAlarm` | `AlarmHasTrackingRecords` | `TrackingRecord` | 0..* | shared |
| `ResourceAlarm` | `AlarmHasSecurityServiceProvider` / `…User` | `PartyRole` | 0..1 each | |
| `Resource` | `ServiceProblemHasAffectedResources` | `ServiceProblem` | 0..* | affected |
| `Resource` | `ProblemHasRootCauseResources` † | `Problem` | 0..* | root cause |
| `Resource` | `SecurityEventCollectionMethodUsedByResource` | `SecurityEventCollectionMethod` | 0..* | |
| `Resource` | `ResourceRepresentingSecurityThreatTool` | `SecurityThreatTool` | 0..1 | |
| `LogicalResource` | `LogicalResourceRequiresPhysicalResource` | `PhysicalResource` | 0..* | |
| `SecurityIncident` | `SecurityEventIsPartOf` | `SecurityEvent` | 0..* | |
| `SecurityIncident` | `SecurityIncidentReferences` ‡ | `TroubleTicket` | 0..* | |

## 4. Inheritance chains read (R20.0 pages)

- `RootEntity` ← `Entity` ← `Resource` ← `LogicalResource` ← `SoftwareResource` ← `InstalledSoftware`
- `Resource` ← `PhysicalResource`
- `RootEntity` ← `Policy` ← `PolicySet` ← `PolicyRuleBase` ← `PolicyRule`
- `Performance` ← `ResourcePerformance`; `Configuration` ← `ResourceConfiguration`; `Problem` ← `ServiceProblem`; `SecurityEntity` ← `ResourceSecurityEntity`
- `ResourceAlarm`, `PartyRole`, `Party`, `SecurityIncident`, `SecurityVulnerability` show no inherited-attribute block on their pages.

v26.0 (identical in v24.5), from the Excel's `Origin` column: `Resource` ← `LogicalResource` ← … ← `AIModel` (an intermediate class that adds no attributes cannot be excluded).

## 5. Not read

The optional ends of `PartyRole` (74 ends in all) and `ResourceSpecification` (27) beyond those listed; every class not in the list of 42; the diagrams. The full extraction is reproducible from the pages; it is not stored in the repo.

## 6. v24.5 → v26.0: what changed in the data model (E-2026-09-30-06)

Compared by script, business entity by business entity and attribute by attribute, across all domain sheets.

- **Size:** 1,664 → 1,754 business entities; "All Domains" 11,082 → 12,377 rows. 95 added, 5 removed (`PartyRoleProdOffRelationship`, `PartyRoleProductOffering`, `ProductSpecCharacteristicValue`, `ProductSpecificationCost`, `ResourceRoleDetails`). The `Market Sales` sheet is split into `Market` and `Sales`.
- **The register's entities are unchanged.** 170 entities matching the register's objects (Intent, ClosedLoop, Anomaly, Goal, AI Model and AI Model Specification ABEs, Alarm, Party / PartyRole, Resource / LogicalResource / PhysicalResource, Policy, Security, Permission, DigitalIdentity) were compared: none gained, lost or re-attributed an attribute; 30 differ in documentation text by whitespace only (compared after whitespace normalisation — no wording change in any entity or attribute description). The attributes the ADRs cite are all present with the same origin: `Intent.handlingState`, `ClosedLoopBusinessRule.whyInvoke`, `AnomalyConsequence.prescribedAction`, `ResourceAlarm.ackState` / `ackUserId` / `alarmEscalation`, and `AIModel`'s `isOperational` / `lrStatus` / `serviceState` (Origin `LogicalResource`) and `usageState` (Origin `Resource`).
- **Attribute changes are confined to 22 entities,** all in Agreement, Commitment, SLA, Cost, consumption summary and `Individual` — none on record here.
- **New in v26.0:**
  - **Patterns › Maturity Model ABE** (25 entities): `MaturityModel`, `MaturityModelLevel` (`targetCapabilities`), `MaturityModelDimension`, `MaturityModelCriterion`, `MaturityModelEvalScore` (`score`, `evaluationDate`, `scorerNotes`, `evidence`), `MaturityModelAssessor` / `Assessee`, `PastAssessment`, `ScoringRubric`, `GapAnalysisAction`, **`ComplianceMapping`** (`complianceStatus`, `auditReference`, `regulatoryBody` — links maturity criteria to regulatory or industry standards), `RegulatoryBody`, and a specification side. A SID form for an assessed, scored, evidenced maturity level — the shape of `16-ig1252-self-score.md`.
  - **Patterns › Agreement ABE** rebuilt (27 entities: framework / implementation / contractual / internal agreements, work contracts); **Patterns › Cost ABE** (9); **Patterns › Trouble Ticket ABE** (`TroubleTicket`, `TroubleTicketItem`).
  - Service: `NetworkService` / `NetworkServiceSpec`, Usage Volume Service. Product, Customer, Business Partner: order items, instalment pricing, consumption summaries. Shared › Party: `IndividualCitizenship`, `IndividualNationality`.
- **Not compared (see §7 for the Maturity Model ABE in full):** v25.0 and v25.5 are not held, so which release introduced each change is not known; associations are not in either Excel.

## 7. Maturity Model ABE (v26.0) — on record (E-2026-09-30-07)

Source: GB922 SID Excel v26.0, sheet `Patterns`, rows 3–203, read in full (every entity, every attribute, `Origin`, documentation). New since v24.5; absent from R20.0 — **so, under the sourcing rule, no association on record** (§1 applies).

### 7.1 Is it the Autonomous Networks maturity model? No — it is generic.

- The ABE text defines a maturity model as a structured framework to assess the maturity of "an entity: organization, processes, capabilities, services or systems", made of levels or stages. Its examples are organisational (`assesseeType`: company, department; `scope`: organizational, departmental).
- **Nothing in the ABE, and nothing in the v26.0 workbook, names Autonomous Networks, autonomy levels, IG1218, IG1230 or IG1252** (every sheet searched; the only autonomy wording in the workbook is the Anomaly ABE's "autonomous operations environment", unrelated to this ABE). No entity is typed to L0–L5, to task groups, or to operation flows.
- It is a container: the AN level scheme would be **one instance** of `MaturityModel` (with its `MaturityModelType`), alongside any other maturity model. Whether TM Forum built it with AN, the Digital Maturity Model or something else in view is not stated in the Excel; the GB922 prose addendum that would say so is not held.

### 7.2 Parent entities (from the `Origin` column)

| Entity | Inherits from | Meaning |
|---|---|---|
| `MaturityModelAssessor` | **`PartyRole`** → `RootEntity` | the assessor is a party role |
| `MaturityModelAssessee` | **`PartyRole`** → `RootEntity` | **the assessed thing is modelled as a party role** — a person, company or department, not a network, service or resource |
| `RegulatoryBody` | **`PartyRole`** → `RootEntity` | adds no attribute of its own |
| `GapAnalysisAction` | **`Activity`** → `ProjectElement` → `RootEntity` | an improvement action is a project activity (planned start/end, cost, status) |
| `MaturityModelSpecification` | **`EntitySpecification`** → `RootEntity` | the usual SID specification pattern |
| `MaturityModel` | `RootEntity` | |
| `MaturityModelCharacteristic` / `…SpecCharacteristicValue` / `…CharacteristicValue` / `…SpecCharUse` / `…SpecCharValueUse` | `CharacteristicSpecification` / `CharacteristicSpecValue` / `CharacteristicValue` / `EntitySpecCharUse` / `EntitySpecCharValueUse` | the usual SID characteristic pattern |
| `MaturityModelLevel`, `…Dimension`, `…Criterion`, `…Structure`, `…Type`, `…EvalScore`, `ScoringRubric`, `PastAssessment`, `ComplianceMapping`; and on the specification side `…Context`, `…LifecyclePhase`, `…AdoptionStrategy`, `…AssessmentMethodology`, `…EvaluationMethodology` | **none shown** — every attribute has the entity itself as origin, including `name`, `description`, `validFor` | standalone classes, not even `RootEntity` descendants by the Excel's evidence |

**Tied to, in the register's terms:** Party (through `PartyRole`), Project (through `Activity`), and the Specification / Characteristic patterns. **Not tied to, by any inherited attribute:** `Resource`, `LogicalResource`, `AIModel`, `Service`, `Intent`, `ClosedLoop`, `Anomaly`. How a score links to a level, a criterion, an assessee or an assessed system is an association, and none is on record.

### 7.3 Entities and own attributes

**Maturity Model Entity ABE (14):**

| Entity | Own attributes |
|---|---|
| `MaturityModel` | `name`, `description`, `version`, `publicationDate`, `createDate`, `purpose`, `status`, `valdifFor` (sic) |
| `MaturityModelType` | `name`, `description`, `category`, `focusArea`, `CreateDate`, `validFor` |
| `MaturityModelStructure` | `structureType` (hierarchical, flat), `dimensionHierarchy`, `criterionMapping` |
| `MaturityModelDimension` | `name`, `description`, `validFor` |
| `MaturityModelLevel` | `name`, `description`, `targetCapabilities`, `validFor` |
| `MaturityModelCriterion` | `name`, `description`, `evaluationMethod`, `validFor` |
| `ScoringRubric` | `ratingScale` (e.g. 1–5), `evidenceRequirements`, `weight`, `scoringInstructions` |
| `MaturityModelEvalScore` | `score`, `evaluationDate`, `scorerNotes`, `evidence`, `validFor` |
| `PastAssessment` | `ID`, `date`, `deltaFromPrevious`, `summaryReport` |
| `MaturityModelAssessor` | `role`, `contactInfo`, `startDate`, `endDate` (+ `PartyRole`: `status`, `validFor` required) |
| `MaturityModelAssessee` | `assesseeType`, `contactInfo`, `startDate`, `endDate` (+ `PartyRole`) |
| `GapAnalysisAction` | `estimatedCost`, `priorityScore`, `recommendedTimeline` (+ `Activity`, `ProjectElement`) |
| `ComplianceMapping` | `complianceStatus`, `auditReference`, `regulatoryBody`, `validFor` |
| `RegulatoryBody` | — (`PartyRole` only) |

**Maturity Model Specification ABE (11):** `MaturityModelSpecification`; `MaturityModelContext` (`scope`); `MaturityModelLifecyclePhase`; `MaturityModelAdoptionStrategy` (`implementationSteps`); `MaturityModelAssessmentMethodology` (`evaluationCriteria`); `MaturityModelEvaluationMethodology` (`assessmentType`, `criteriaUsed`); and the five characteristic classes.

**Quality note.** The ABE is new and unpolished: `valdifFor` and `valifFor` for `validFor`; the descriptions of the assessment and evaluation methodologies are crossed; `MaturityModelAssessor.startDate` is described as an end date; `score`, `weight` and `scoringInstructions` have no description (the Excel carries no attribute types at all).

### 7.4 How the IG1252 self-score (`16-ig1252-self-score.md`) would sit in it

A mapping, not an adoption — file 16 is unchanged in substance.

| IG1252 / IG1230 element (file 16) | SID entity | Fit |
|---|---|---|
| The AN level scheme, IG1230 v1.1.1 / IG1252 v1.2.0 | `MaturityModel` (`version`, `publicationDate`, `purpose`) + `MaturityModelType` | good |
| L0–L5 and their characteristics (IG1252 Tables 4-2 / 4-4) | `MaturityModelLevel.targetCapabilities` | good |
| Five task groups: Execution, Awareness, Analysis, Decision, Intent | `MaturityModelDimension` | good |
| P / P/S / S requirement per task group per level (IG1230 Table 4) | `MaturityModelCriterion` (`evaluationMethod`) | good |
| 1.0–5.0 scale; Scoring method 1 vs method 2; our +0.5 convention | `ScoringRubric` (`ratingScale`, `scoringInstructions`, `weight`, `evidenceRequirements`) | good |
| A score per contextualisation, with date, reasoning and where specified | `MaturityModelEvalScore` (`score`, `evaluationDate`, `scorerNotes`, `evidence`) — two instances per row: *specified* and *as-built* | good |
| Responsible subject per task (IG1252 §5.1.4) | `MaturityModelAssessee` (a `PartyRole`) | good — and it is the only place the assessee can go |
| The register as self-assessor; ANLAV as auditor | `MaturityModelAssessor` (`role`) | good |
| Re-scores and their deltas (§5 triggers) | `PastAssessment.deltaFromPrevious` | good |
| "The gap between 2.58 and 1.31 is the build" (§4.4) | `GapAnalysisAction` (`priorityScore`, `recommendedTimeline`) | good |
| Criterion ↔ CCS TSI / AI Act oversight duty | `ComplianceMapping` + `RegulatoryBody` | available; not done anywhere in the register |
| **Evaluation object: service / network → operation flow → task → contextualisation** (IG1252 §5.1.2) | none — `MaturityModelContext.scope` and `MaturityModelStructure` are the nearest, and neither decomposes an assessed network | **poor** |
| Aggregation: task = mean of contextualisations, flow = mean of tasks | none | **absent** |

**What the mapping shows.** The scoring apparatus fits well. The thing IG1252 actually scores — a network's operation flows — does not: the SID assesses a party, IG1252 assesses a flow and names a responsible party beside it. Recording an AN score in this ABE would mean carrying the flow / task / contextualisation hierarchy in free text or characteristics.
