# Open-reference autonomy framework for the oversight of critical networks — v0.1 (working title)

**Date:** 2026-09-26 · **Status:** working document; adoption as the engagement's reference frame is **ADR-015 (Proposed)** — nothing here is adopted until the ARB says so · **Author:** engagement working session · **Siblings:** `pivot-notes-2026-09-24-an-levels-sdo-inventory.md` (what is held, per body), `16-ig1252-self-score.md` (the instrument this framework generalises), `pivot-notes-2026-09-20-ibn-core-rail-e2e.md` (the stack), `pivot-notes-2026-09-19-ontology.md` (the layer model L7…L0), ADR-002 (the ladder), ADR-004 (the boundary), ADR-014 (the register as decision plane).

**Outcome anchor:** *safe, continuous rail operations.* The framework exists so that the autonomy of a layer that watches a safety bearer can be **specified, scored, tested and audited on references anyone can read, with tooling anyone can run**, and so that the human-in-command bound is part of the scale rather than a footnote to it.

**Guardrail:** oversight, not control. Every level in this framework grades *who acts*. On class-4 objects (safety-critical actuation) the layer never acts; the scale says so at the task where it bites.

---

## 0. What this is, and what it is not

**It is** a framework in the shape of TM Forum's Autonomous Networks (AN) programme — outcomes, a level scale, a reference architecture, an intent model, closed loops, knowledge and data, effectiveness indicators, an evaluation instrument, assurance, and use cases — **rebuilt so that every component has an anchor that is free to read and, where code is involved, free to run and modify.** TM Forum's material is *mapped*, not replaced: where a TM Forum asset is open (the Open APIs and their conformance kits) it is used; where it is member-gated (the IG guides, the GB questionnaires, the intent ontology graphs) it is cited as the comparator and an open counterpart is named or built.

**It is not** a standard, a certification scheme, or a claim that the open counterpart is equivalent to the gated original. Where the open counterpart is thinner — and for the audit instrument it is — the gap is stated in §12.

**Three meanings of "open", kept apart throughout:**

| Tier | Meaning | Examples |
|---|---|---|
| **O-N** open normative | Specification or law that is free to read and cite, published by a body with a public process | 3GPP TS/TR · ETSI GS/GR/TS/TR · IETF RFC · W3C REC · EU law (EUR-Lex) · ERA vocabularies |
| **O-S** open source | Code or data under an OSI-approved or equivalent licence, free to run, modify and redistribute | ONAP · O-RAN SC · ETSI OSM / TeraFlowSDN / OpenSlice · Nephio · Apache Jena · pyshacl · OpenTelemetry · free5GC / Open5GS |
| **O-A** open access, restricted reuse | Free to download (often after registration) but copyright and IPR terms restrict republication or derivation | TM Forum IG/GB/TR documents (RAND) · O-RAN Alliance specifications (adopter licence) · DIN SPEC (free PDF, copyright DIN) |
| **P** paid | Behind a paywall; cited by number, never reproduced | CENELEC EN 5012x · ISO/IEC 42001 · IEC 62443 |

**Rule:** a component of this framework may *depend* on O-N and O-S material without restriction, on O-A material only by citation and paraphrase, and on P material only where law points at it (the CCS TSI points at EN 50126/50128/50129). Every reference below carries its tier. Licences are stated as commonly published and **are to be re-verified at adoption** (ADR-015 action 3).

---

## 1. Design principles

1. **Level is a property of a task in a scenario, not of a system.** Inherited from 3GPP TS 28.100 and TM Forum IG1252 alike; the framework never reports one number for "the layer".
2. **The human bound is on the scale.** Each task carries a **decision-class ceiling** from ADR-002: the highest level the layer may reach on that task given the object's class. Class 4 caps *execution* (28.100 Task K) at "human executes"; class 3 caps *decision* (Task J) at "system proposes, human determines". A score above the ceiling is a defect, not an achievement. TM Forum's own core-fault-management L4 target keeps expert review and execution manual (E-2026-09-26-01), so the ceiling is not a rail eccentricity — it is what the industry's L4 already looks like for a core.
3. **Detection is independent of the thing detected.** The 23 June 2026 outage (E-2026-06-27-01) was a healthy-looking element that raised no alarm. The reference architecture therefore has an **out-of-band function monitor** as a first-class element that neither TM Forum's IG1251 nor 3GPP's SBMA draws, and the data-quality layer applies a minimum-variability rule to every self-report (ETSI TR 104 180 §6.2.3.2, E-2026-09-26-03).
4. **The instrument is published with the score.** Following TR 28.909's conclusion that the level is standard and the score is the evaluator's, every score names its task set, weights, method and sub-scenarios. The instrument itself (§8) is part of the framework and is released under the same licence as the framework.
5. **Evidence-logged, decision-recorded.** The framework is operated the way this register is operated (ADR-014): dated evidence with trust tiers, a decision question per row, ADRs ratified by a board, daily baselines. That discipline *is* the decision plane; the runtime plane inherits it.
6. **SDO-neutral mapping, SDO-specific citation.** Each component is expressed once and mapped to TM Forum, 3GPP and ETSI terms in a table; claims are cited to the body that made them, at version.
7. **Nothing in the framework is a law.** Where law binds (CCS TSI, NIS-2, CRA, the AI Act, national authorisation), the framework points at the binding text and stops (`13-legal-binding-chain.md`).

---

## 2. The framework at a glance

| # | Component | TM Forum AN asset (tier; held?) | Open normative anchor (tier; held?) | Open-source implementation (tier; licence as published) | Gap this framework must fill |
|---|---|---|---|---|---|
| A | **Outcomes and requirements** | IG1218 / IG1218F Business Requirements & Framework (O-A; held) | Outcome-anchored requirements in `traceability-matrix.md` R1–R14; ETSI GS ZSM 001 requirements (O-N; **not held**, B23) | — | none; the register already does this |
| B | **Autonomy level scale** | IG1230 Table 4 (P / P-S / S per task group); IG1252 §5 (O-A; held) | **3GPP TS 28.100** §5 levels, §7.3 fault-management tasks A–K, Table 5-1 Note 1 (O-N; held, E-2026-09-24-05); ETSI GR ENI 007/010 L0–L5 (O-N; **not held**, B23 — known via WP 64) | — | the **decision-class ceiling** column (§3) and a rail-domain criterion set (none exists in any body — inventory §4) |
| C | **Reference architecture** | IG1251 (O-A; held §4.4.1) | **ETSI GS ZSM 002** management domains + E2E service management domain (O-N; **not held**, B23); 3GPP TS 28.533 SBMA (O-N; not held); TS 28.535/536 closed loops (held) | ONAP (Apache-2.0); O-RAN SC Non-RT RIC (Apache-2.0); ETSI TeraFlowSDN, OSM, OpenSlice (Apache-2.0); Nephio (Apache-2.0) | the two-plane split (ADR-002/014), the **out-of-band monitor** and the **vital gateway** (ADR-004) — none drawn by any body |
| D | **Intent** | IG1253; TR290/TR292 family; TMF921 v5 + TMF921A (O-A for the guides and ontology; **TMF921 OpenAPI + CTK O-S, Apache-2.0 — verify**; held) | **3GPP TS 28.312** intent NRM and lifecycle (O-N; held); **IETF RFC 9315** IBN concepts (O-N; held) | ibn-core stack (private build — TMF921 front, Jena/Neo4j stores, SHACL); OpenSlice (TMF641/620 service ordering) | the **rail intent-extension model** (rule (xi), act A14); the class-3 hold as a Judge/Preference exchange; "class 4 is never an intent" as a unit test |
| E | **Closed loops and analytics** | IG1230 loop model; IG1339 I-AADE (O-A; held) | **TS 28.535/536** assurance closed loops, CON-16/17/20 (held); **TS 28.104** MDA (held); **TS 28.105** AI/ML management (held); **ETSI GS ZSM 009-1** loop coordination (O-N; **not held**, B23) | ONAP Policy / CLAMP / DCAE (Apache-2.0); O-RAN rApps on Non-RT RIC (Apache-2.0) | the **"cannot adjust" signal from outside the loop**; loop deny-lists per decision class |
| F | **Knowledge and data** | GB922 SID (O-A; held); TR292 ontology (O-A; graphs **not held**, B7) | **TS 28.541 / 28.622 NRM** (O-N; held); **ERA vocabulary and ISS ontology** (O-N; held, v3.3.4 / v1.0.0); **W3C PROV-O, SHACL, SOSA** (O-N); **ETSI TR 104 180** data-quality metrics (O-N; held, E-2026-09-26-03) | Apache Jena Fuseki (Apache-2.0); Neo4j CE + n10s (GPL-3.0 / Apache-2.0); pyshacl (Apache-2.0); morph-kgc (Apache-2.0), RMLMapper (MIT) | the operator-side terms joining cell ↔ section of line ↔ slice (ibn-core §4 item 3) |
| G | **Effectiveness indicators** | IG1256 KEIs (O-A; held) | **TR 28.909 §6.3** per-phase recovery-time cost (O-N; held); **TS 28.554** KPIs (O-N; held; no E2E availability KPI exists) | OpenTelemetry (Apache-2.0); Prometheus (Apache-2.0); Grafana (AGPL-3.0) | the **availability-cost** measure of R4 (what legitimate service a reaction consumed) |
| H | **Evaluation and audit instrument** | IG1252 Methods 1 and 2; **GB1059 ANLET method (held, E-2026-09-25-01); GB1059x / GB1523B questionnaires (O-A, member — not held, B21); ANLAV audit (commercial)** | TS 28.100 §7.3 tasks as the row set; TR 28.909 §7.1 "score is the evaluator's" (both held) | the register's `16-ig1252-self-score.md` §7 as instrument v0.1 (this repo) | **there is no open audit**; this framework publishes the instrument and invites third-party scoring, which is not the same thing (§12) |
| I | **Assurance** — safety, security, AI governance, human factors | IG1187 ODA risk assessment (O-A; held) | EU AI Act (O-N); NIST AI RMF (O-N); DIN SPEC 92005 / 92001-3 (O-A); CCS TSI → EN 50126/50128/50129 (P, law-pointed); NIS-2 / CRA (O-N); MITRE ATT&CK / FiGHT (O-N); ETSI TS 103 792, TS 103 564 (O-N; held) | the register's ADR-004, ADR-010, ADR-012 as the operating rules; `15-mcx-parity-suite.md` | none new — the register carries this; the framework points |
| J | **Use cases** | IG1339 L4 high-value scenarios (O-A; held) | — | — | **rail-side scenarios on a safety bearer** (§10) — no body has them |

---

## 3. Component B — the level scale with a decision-class ceiling

**Scale.** 3GPP TS 28.100 §5: levels 0–5 defined per task by "participation of the human and telecom system"; §7.3 the eleven fault-management tasks — A control-information generation · B intent-fulfilment evaluation · C data collection · D alarm filtering · E fault recognition · F fault prediction · G demarcation · H root-cause analysis · I recovery-mechanism analysis · J action evaluation and determination · K action execution. **Table 5-1 Note 1: the human-reviewed decision has the highest authority at every level.** L4 is unspecified in the held V19.0.0 text; L5 is defined only as "without human-predefined control information".

**Mapping to TM Forum** (IG1252 Table 5-6 rows ↔ 28.100 tasks): `16-ig1252-self-score.md` §7.1, eleven rows, two vocabularies. **Mapping to ETSI:** GR ENI 007/010 L0–L5 as reproduced in WP 64 Table 2.1 — L4 "decision typically needs human approval", L5 self-decision — **second-hand until B23 is held.**

**The ceiling column, per ADR-002 decision class of the *object* the task acts on:**

| ADR-002 class | Objects | Ceiling on Task J (decision) | Ceiling on Task K (execution) | Ceiling on A–I (awareness, analysis, intent) |
|---|---|---|---|---|
| 1 reversible, no safety impact | re-score a claim; refresh a register | L5 permitted | L5 permitted | L5 |
| 2 reversible, operational | draft an ADR delta; propose a capacity slice | L4 with review on sample | L4 | L5 |
| 3 irreversible / financial | award recommendation; fallback to a public bearer | **L3 — system proposes, human determines** (28.100 "Human & Telecom system") | **L1 — human executes on the system's prepared action** | L4 |
| 4 safety-critical actuation | movement authority; emergency stop; degraded-mode entry | **L0/L1 — human decides; system may display** | **never inside the layer** (ADR-004 vital gateway) | L3 — awareness and analysis may be automated; the finding is advisory |

**Reading rule.** A scenario score is reported as *specified* (what the design allows), *as-built* (what runs) and *ceiling* (what the class permits). The gap between as-built and specified is engineering debt; the gap between specified and ceiling is the guardrail, priced (`16-ig1252-self-score.md` §4). A score above ceiling fails the evaluation regardless of the KEIs.

**What this adds to every existing scale.** IG1230 raises Decision to S at L4 and Execution to S at L2 with no object class; 28.100 grades the task with no object class; ENI grades "the decision" with a human-approval note at L4. None of them says *on which objects*. The ceiling column does.

---

## 4. Component C — reference architecture

Described as layers and elements; each element names its open anchor. No new drawing is asserted until the ZSM 002 text is held (B23), because the domain vocabulary should be ZSM's.

**Planes (ADR-002, ADR-014):**
- **Decision plane** — the register: evidence log, ADRs, ARB, baselines. Agents that participate (Risk Sentinel, Architecture Decision Agent, Bid/Procurement Agent, Assurance Agent) operate under the same discipline. *This plane exists and runs today.*
- **Runtime plane** — Anomaly/Fault Agent, Resilience Orchestration Agent, Intent Agents. *Out of operation until ADR-007 evidence exists.*
- **Knowledge plane** (ADR-002 item 9; `pivot-notes-2026-09-15-knowledge-plane.md`) — the graphs both planes reason over: 3GPP NRM instances (TS 28.541), rail infrastructure (ERA RINF/ERATV vocabulary), incident records (ERA ISS), intents (TIO + rail extension model), provenance (PROV-O), all SHACL-validated.

**Management domains (ETSI GS ZSM 002 terms — to be aligned on sight of the text):** one domain per bearer estate (5GC + IMS + MCX; RAN; transport), an end-to-end service domain for the FRMCS service, and **the rail operational domain as an AN Consumer** (IG1251 §4.4.1) of any public MNO domain used for fallback.

**Elements no body draws, and this framework does:**
1. **Out-of-band function monitor** — produces a signal about the *function performed* (traffic carried, registrations served: e.g. registration success rate per AMF set, TS 28.554 §6.2.3, read against `NFS.UpdateReq`, TS 28.552 §5.10.2, E-2026-09-19-32) by something other than the element, in addition to the two standard heartbeats (NF→NRF `nfStatus`, MnS `notifyHeartbeat`), never as their replacement. It is both an *input* to the 28.535 Decision box and the source of its "cannot adjust" signal (E-2026-09-19-11). On FRMCS it needs gateway-side taps, controlled key access or metadata-only observation, because MC traffic is encrypted (PR5).
2. **Vital gateway** (ADR-004) — the deterministic, fully verifiable boundary that rejects any class-4 action from the layer. Implementation class bound to decision class (ADR-002 §Implementation class).
3. **Class-3 hold** — the intent held in EVALUATING (TS 28.312 pre-evaluation) or as a Judge/Preference exchange (TMF921A) until a named human has advised the preferred outcome; timeout → rejected (TR292B).
4. **Independent data-quality layer** — ETSI TR 104 180 metrics computed on every ingested stream before analytics: temporal stability *with a minimum-variability bound* (stuck-at), timeliness against logged event and arrival times, completeness with the structural-null rule, lineage per critical data element.

**Open-source realisation candidates (tier O-S):** Kubernetes (kind for the private build); ONAP for policy, closed-loop (CLAMP) and data collection (DCAE); O-RAN SC Non-RT RIC for A1-style policy/intent to a RAN domain; ETSI TeraFlowSDN for transport; ETSI OpenSlice for TMF-API service ordering; Nephio for intent-driven configuration on Kubernetes; free5GC (Apache-2.0) or Open5GS (AGPL-3.0) as the 5GC of a test ring (ADR-007 surfaces 1/3); Kamailio (GPL-2.0+) as SIP core. **No complete open-source MCX server or client is known to the register**; a test ring therefore mixes O-S bearer with commercial MCX under the ADR-007 execution prerequisites (`15-mcx-parity-suite.md` §5). *Gap, stated.*

---

## 5. Component D — intent

- **Model:** TMF921 v5 (intent as RDF validated against the TIO) mapped to 3GPP TS 28.312 (IG1253 §21.1 gives the mapping); vocabulary of concepts per IETF RFC 9315.
- **Lifecycle:** RECEIVED → EVALUATING → FULFILLING → FULFILLED/DEGRADED (28.312); the layer is *consumer* for classes 3–4 and holds in EVALUATING; TMF921 `ProbeIntent` for the feasibility question that changes nothing.
- **Rail extension model** (ADR-002 item 9 rule (xi); act A14): an `imo:IntentExtensionModel` specialising `icm:` classes for functional alias (TS 23.280 §8.1.5), REC and the class A–C service catalogue (ADR-001 §5(b)), RINF radio terms (`era:gsmrVersion`, `era:switchRadioSystem` …), the FRMCS `NetworkSlice` / `ServiceProfile` DN (SRS §13). Validated with pyshacl against the TIO shapes when the graphs are held (B7); against a locally written subset until then.
- **Three intent rules, testable:** (i) *class 4 is never an intent* — the intent processor rejects any expectation whose target is a class-4 object; (ii) *class 3 intents carry an approval expectation* (IG1253 §5.8 "ask approval when …") and cannot leave EVALUATING without a recorded human preference; (iii) *every intent names its provenance* (`prov:wasDerivedFrom` the evidence row or ADR that motivated it).
- **Interconnection caveat (E-2026-09-26-05, 5th FRMCS Plugtests §10.1.3):** alias resolution across primary/partner MC systems is ambiguous between 23.280 Stage 2 and 24.379 Stage 3; a corridor intent that names an alias in another IM's system inherits that ambiguity and must say so.

---

## 6. Component E — closed loops and analytics

- **Loop model:** TS 28.535 assurance closed loop with the consumer constraints the standard offers — CON-16 permitted action set, CON-17 gate, CON-20 pause; escalation is "informed after the loop cannot adjust" (E-2026-09-19-11), so the out-of-band monitor supplies the *cannot adjust* signal from outside.
- **Per-class deny list:** the loop's permitted action set is derived from the decision-class ceiling (§3); class-4 actions are absent from every loop's action set by construction, and the vital gateway enforces it a second time.
- **Analytics:** TS 28.104 MDA (`MDAAssistedFaultManagement` — failure prediction, root cause, recovery recommendation) as the analytics vocabulary; TS 28.105 for model lifecycle and provenance (ADR-012 item 1's model-provenance evidence).
- **Coordination:** several loops over the same objects need ETSI GS ZSM 009-1 (delegated to by 28.535 §4.2.6) — **not held (B23)**; until then a single loop per object class.
- **Implementation:** ONAP Policy Framework and CLAMP for loop definition and gating; DCAE for collection; O-RAN Non-RT RIC rApps where the domain is RAN. All Apache-2.0.

---

## 7. Component F — knowledge and data

- **Models:** TS 28.541 / 28.622 NRM (YANG/OpenAPI, O-N) for the bearer; ERA vocabulary v3.3.4 and ISS v1.0.0 (O-N) for infrastructure and incidents; GB922 SID (O-A) for the OSS-side entities where TM Forum terms are needed (`ClosedLoop.whyInvoke`, `Anomaly.prescribedAction`); TIO (O-A) for intents; PROV-O for provenance; SHACL for every constraint.
- **Stores:** Apache Jena Fuseki (TDB2) for RDF with per-graph provenance; Neo4j CE + n10s where property-graph analytics are needed; Redis or equivalent for state. All O-S.
- **Data quality (ETSI TR 104 180, O-N, held):** the eighteen metrics as the reporting vocabulary; five are mandatory on every ingested stream — reliability (temporal stability with minimum-variability bound), timeliness, completeness (structural-null rule stated), lineage, and for labelled data label quality against a second-adjudicator gold sample (ADR-010 item 12/14). Each gap report names the metric, the value and the missing metadata that prevented computing it.
- **Incident record:** every run, injection and incident is written as an ERA ISS occurrence scenario (`incident-annex-iss-occurrence-scenario.md` §8 pattern) so failures of parity, failover and detection share one evidence format.

---

## 8. Components G and H — indicators and the evaluation instrument

**Indicators (open):** TR 28.909 §6.3 per-phase recovery-time cost — recognition · demarcation · root cause · mechanism analysis · action evaluation/determination · execution — plus on-time count and total; TS 28.554 KPIs where they exist (registration success rate; no end-to-end availability KPI exists — the framework defines one per scenario and says so); the register's **availability cost** (what legitimate service a reaction consumed, R4). TM Forum's IG1256 names (Availability Ratio, MTTR, Fault Handling On-time Ratio, Number of Major Faults) are mapped for comparability.

**Instrument v0.1 = `16-ig1252-self-score.md` §7, generalised:**
1. **Row set:** TS 28.100 §7.3 tasks A–K (eleven rows with IG1252 Table 5-6 names beside them).
2. **Criterion per row:** 28.100's own level text for that task; where 28.100 is silent (L4), the row says "unspecified" and scores no higher than L3.
3. **Ceiling per row:** from §3, by the object class the scenario acts on.
4. **Weights:** group totals as IG1252 Table 5-19 (Intent 10 · Awareness 35 · Analysis 20 · Decision 15 · Execution 20), intra-group split published, replaced by an audited set when one is held.
5. **Arithmetic:** IG1252 §5.3.2.2.3 and §5.3.2.2.4 — *both* methods, unweighted and weighted, four figures per scenario, per TR 28.909's licence that the score is the evaluator's.
6. **Sub-scenarios:** ≥ 2 per scenario, one fault-type and one change-type where applicable (GB1059's 80 % sub-scenario rule noted as the comparator, E-2026-09-26-01).
7. **Three columns reported:** specified · as-built · ceiling.
8. **Re-score triggers:** as `16-ig1252-self-score.md` §5, plus any change of an object's decision class.
9. **Publication:** the filled instrument is published with the score and the evidence rows it rests on.

**What this is not:** an audit. ANLAV issues certificates against member-gated questionnaires; this instrument invites *third-party re-scoring on the same published sheet*. That is reproducibility, not certification — §12 item 1.

---

## 9. Component I — assurance, by pointer

| Concern | Open anchor | Register rule |
|---|---|---|
| Safety boundary | CCS TSI (O-N) → EN 50126/50128/50129 (P) | ADR-004: deterministic vital kernel outside the learning agents; fully verifiable components only on class-3/4 paths (ADR-002 §Implementation class) |
| AI governance | EU AI Act (O-N; classification `watch`, ADR-003); NIST AI RMF (O-N); DIN SPEC 92005 / 92001-3 (O-A) | ADR-010: transparency score, stakeholder-relative explainability, independent uncertainty, calibration, explanation as failure-capable; model provenance (ADR-012 item 1) |
| Human factors | 28.100 Table 5-1 Note 1; IG1253 §5.8 | ADR-010 items 2 and 12: dissent rate, anchoring measured (adjudicate before seeing the model), criterion drift, mandatory "uncertain", sampled re-adjudication; PR4 decision-load bound |
| Security | NIS-2, CRA, RED (O-N); MITRE ATT&CK / FiGHT (O-N); TS 33.180 (O-N) | ADR-012; ADR-007 surface 6 (abuse cases → attack graphs, two teams); the cyber-exclusion gate as a `sec:SecurityExpectation` with a time box the operator owns (act A5) |
| Interoperability of the service layer | ETSI TS 103 564 V1.6.1 + Plugtests reports (O-N; held); TS 103 792 (O-N; held) | `15-mcx-parity-suite.md`; executed precedent per case recorded (E-2026-09-26-05) |
| Testing | — | ADR-007 six surfaces; no probabilistic canary on safety traffic |

---

## 10. Component J — practical use cases

Each use case states: the scenario · the 28.100 tasks in play · level target per task with the class ceiling · the intent · the loop · the indicators · the open stack · the evidence it rests on · what already exists in this register.

### UC1 — Silent core fault on a safety bearer (the 23 June class)

- **Scenario:** planned component swap → silent software fault → no alarm → redundancy present but failover not triggered → nationwide loss of train radio; manual recovery ~90 min (E-2026-06-27-01/-02/-03). Sub-scenario S1 of `16-ig1252-self-score.md` §7.2.
- **Tasks and targets:** C/D/E awareness at L3–L4 (independent monitor detects loss of *function* while self-report is clean); G demarcation L2–L3 (nationwide-simultaneous ≠ RF → core); H root cause L3; I recovery options L3 (system proposes: engage standby, isolate change); **J decision — ceiling L3 (class 3: fallback to a public bearer is irreversible/financial; entry into degraded mode is class 4 → L0/L1)**; **K execution — human, always** for class-4 objects; system may pre-stage.
- **Intent:** "FRMCS service on section-set X available at ≥ p; on loss detected by the independent monitor, propose recovery within t; ask approval before any action on objects of class ≥ 3."
- **Loop:** 28.535 loop with CON-16 action set = {alert, prepare standby engagement, prepare rollback}, CON-17 gate = named duty role; "cannot adjust" signal = monitor's function loss persisting beyond t.
- **Indicators:** TR 28.909 per-phase recovery time versus the 23 June baseline (~90 min human/manual, ADR-007 surface 1); registration success rate per AMF set; availability cost of the proposed action.
- **Stack:** independent monitor (metadata taps / passive probes where encryption allows); ONAP DCAE + Policy; Fuseki with NRM + RINF + ISS graphs; TR 104 180 stuck-at rule on every self-report stream.
- **Evidence and status:** ADR-007 surface 1 corpus (inference-based until DB/EBA telemetry — PR8); surface 3 seven-class injection catalogue (item 3) incl. freezing a self-report; instrument v0.1 scores specified 2.6 / as-built 1.3 (§3 of the self-score; labelled Method-2-approximate; A15 re-score). **Nothing runs yet; the register is the only working plane.**

### UC2 — Change on live legacy during the parallel run (the change that caused UC1)

- **Scenario:** component swap without change verification or rehearsed fallback; sub-scenario S2 (change type; GB1524B is the TM Forum comparator).
- **Tasks:** IG1252 §5.2.2.4.2 network-change task set (not the fault set); the framework's instrument needs the change rows added — **open item**.
- **Ceiling:** the change itself is class 3 or 4 by its object; the layer's role is verification and rollback readiness — Task J at L3 for class 3 (system evaluates the change plan, human approves), K never for class 4.
- **Loop:** ADR-011 change gate as a closed loop with a mandatory verification step and a rehearsed fallback as CON-17 preconditions; inactive-redundancy-only and 00:00–04:00 window inherited as rules.
- **Indicators:** change success rate; verification coverage; time-to-rollback measured in rehearsal.
- **Stack:** the change record as an ISS occurrence scenario before the change; ONAP Policy gate; parity suite (UC3) run before any MCX-touching change.
- **Status:** ADR-011 Accepted; loop not built; instrument rows not written.

### UC3 — MCX feature-parity regression as a change-gate loop

- **Scenario:** any change to MCX or GSM-R↔MCX interworking must leave every GSM-R safety feature reproduced (ADR-007 surface 5; PR15).
- **Tasks:** B intent-fulfilment evaluation and the IG1252 "service verification" row at L4 (fully automatable — nothing here acts on class-4 objects); the *result* gates a class-3 change (J at L3).
- **Suite:** `15-mcx-parity-suite.md` — 21 cases cited to Stage 1–3 text and to the ETSI Plugtests descriptions; executed precedent per case from E-2026-09-26-05 (functional alias strong; multi-talker thin; REC three passes; GSM-R interworking one failed attempt).
- **Loop:** run at every ADR-011 gate and before each canary segment; any red is a blocker.
- **Indicators:** pass/fail per feature and condition; call-setup and pre-emption times against Ril 481.0205 / EIRENE (MI) bars.
- **Stack:** test ring per suite §5 — O-S bearer (free5GC/Open5GS + Kamailio) with commercial MCX (no O-S MCX exists); TS 103 564 descriptions as the case format; results recorded as ISS records. **Open:** the ring does not exist (ADR-007 items 2/4).

### UC4 — Corridor intent across two infrastructure managers

- **Scenario:** a train path booked across a border (path-booking note, 19 entities) needs the FRMCS `NetworkSlice` / `ServiceProfile` of each IM constrained for the path's time window, functional aliases resolved across MC systems, and GSM-R fallback declared per RINF section (`era:switchRadioSystem`).
- **Tasks:** A control-information generation at L3–L4 (the layer drafts the intent from the path); B evaluation at L4; the *actuation* of a slice profile change on a live safety bearer is class 3 at least → J ceiling L3, human approves.
- **Intent:** TMF921 intent with rail extension model targets (`era:` section IRIs, `NetworkSlice` DN, alias set per IM) and an approval expectation.
- **Known ambiguities to carry in the intent:** alias resolution across partner systems (5th Plugtests §10.1.3); IPCONN multipath session linkage (4th §10.2.1); border emulation by consensus configuration (TS 103 564 §10.9).
- **Stack:** ibn-core stack (TMF921 → LLM-assisted processor → MCP seams → Fuseki/Neo4j), rule-(xi) model (A14), SHACL validation, TMF639 resource ↔ intent ↔ RINF link.
- **Status:** private build exists at L2/L2′; the extension model and the cell↔section↔slice terms are the build gap (ibn-core note §4).

### UC5 — Incident-to-evidence: the assurance loop

- **Scenario:** every operational event, injection and test run becomes an ERA ISS occurrence scenario with building blocks, failed risk-control measures and factors, linked to evidence rows and ADRs.
- **Tasks:** C/D at L4 (collection and filtering automatable); classification into ISS taxonomy at L3 (system proposes, adjudicator confirms — the label stream of ADR-010 item 12, anchoring measured).
- **Indicators:** label quality against the second-adjudicator sample; lineage score; time from event to record.
- **Stack:** ISS SHACL shapes (ERA GitLab, O-N; defects reported per A11), pyshacl, Fuseki; PROV-O on every record.
- **Status:** `incident-annex-iss-occurrence-scenario.md` exists for 23 June; the pipeline is manual.

### UC6 — The cyber-exclusion gate on the recovery path

- **Scenario:** under the operator's rule, staff must exclude a cyber-attack before switching manually to a healthy redundancy (E-2026-09-15-01); on 23 June this gate sat on the recovery path.
- **Tasks:** E/G/H at L3 — the layer assembles the attack/no-attack evidence and proposes a verdict within a time box; **J stays human (class 4 recovery decision), K stays human.**
- **Intent:** `sec:SecurityExpectation` with `sec:impactValue` and a time box the operator owns (act A5 — the register does not set the number).
- **Loop:** ADR-007 item 3 class 6 injection (organisational gate on the recovery path) measures the gate's cost in availability.
- **Status:** the number and the named authority are act A5's to obtain; the ontology form is on file via TR292I preprints (O-A, preprint).

### UC7 — The register as decision plane (already running)

- **Scenario:** ADR-014 — evidence in, decision question answered per row, ADRs ratified by board act, baselines frozen daily with decision-health metrics.
- **Tasks:** A–B at L3–L4 (the assistant drafts rows, deltas and acts; the lead ratifies); K (ratification) human by rule.
- **Indicators:** revise rate, ADRs Accepted, items closed/open, freeze currency — the decision-health block.
- **Stack:** git, `scripts/baseline.sh`, Markdown registers, pyshacl for graph artefacts. **This is the one use case with three months of operating evidence** (E-2026-06-24 → today, 552 rows).

---

## 11. Open-source implementation stack — candidate list with licences as published

| Function | Candidate | Licence (as published; verify at adoption) | Origin |
|---|---|---|---|
| Container platform / private build | Kubernetes, kind | Apache-2.0 | CNCF |
| Policy, closed loop, collection | ONAP Policy Framework, CLAMP, DCAE | Apache-2.0 | LF Networking |
| RAN-domain non-RT control | O-RAN SC Non-RT RIC, rApp framework | Apache-2.0 (code); O-RAN specs need an adopter licence | O-RAN SC / O-RAN Alliance |
| Transport SDN | ETSI TeraFlowSDN | Apache-2.0 | ETSI SDG TFS |
| Service ordering on TMF APIs | ETSI OpenSlice | Apache-2.0 | ETSI SDG OSL |
| NFV orchestration | ETSI OSM | Apache-2.0 | ETSI OSG OSM |
| Intent-driven config on Kubernetes | Nephio | Apache-2.0 | LF Networking |
| 5G core for the test ring | free5GC · Open5GS | Apache-2.0 · AGPL-3.0 | free5GC.org · Open5GS |
| SIP core for the test ring | Kamailio | GPL-2.0-or-later | Kamailio project |
| MCX server / client | **none known** — commercial only (15 vendors at the 5th FRMCS Plugtests) | — | gap |
| RDF store | Apache Jena Fuseki (TDB2) | Apache-2.0 | ASF |
| Property graph + RDF bridge | Neo4j Community Edition + neosemantics (n10s) | GPL-3.0 · Apache-2.0 | Neo4j |
| Shape validation | pyshacl | Apache-2.0 | RDFLib |
| RDF mapping | morph-kgc · RMLMapper | Apache-2.0 · MIT | OEG-UPM · IDLab |
| Telemetry, metrics, dashboards | OpenTelemetry · Prometheus · Grafana | Apache-2.0 · Apache-2.0 · AGPL-3.0 | CNCF · CNCF · Grafana Labs |
| Intent API front | TMF921 v5 OpenAPI + CTK | Apache-2.0 (**verify** for the v5 Beta artefacts) | TM Forum GitHub |
| Vocabularies | ERA vocabulary, ERA ISS ontology and SHACL | open (EU reuse terms — **verify** exact licence per repository) | ERA GitLab |

**Licence hygiene:** AGPL-3.0 and GPL components (Open5GS, Grafana, Neo4j CE, Kamailio) are fine to *run* and are kept out of any redistributed derivative; Apache-2.0 components may be embedded. This is the ADR-015 action-3 check.

---

## 12. Gaps, stated

1. **No open audit.** TM Forum's ANLAV is the only audit product; it runs on member-gated questionnaires. This framework offers a *published, reproducible instrument*; a third party can re-score it, nobody certifies it. That is a weaker claim and is stated as such.
2. **No rail-domain criterion set exists in any body** (inventory §4). The ceiling column and the instrument rows in §3/§8 are the register's own and are offered as a candidate — an influence act at the tier of A3′/A13, the lead's decision.
3. **ETSI is on file only as opinion** until GR ENI 007/010, GS ENI 005, GS ZSM 001/002/009-1 are held (B23). The architecture's domain vocabulary and the level table's ETSI form are deferred to that reading.
4. **TS 28.100 does not define L4** in the held text; the instrument caps at L3 where the standard is silent.
5. **No open-source MCX.** UC3's ring mixes open bearer with commercial service layer.
6. **TIO graphs are member-gated** (B7); the rail extension model is validated against a locally written subset until they are held.
7. **Detection is not standardised anywhere** (E-2026-09-19-05/-30/-32): 3GPP names no mechanism, UIC V2 carries no monitoring requirement; the out-of-band monitor is a deployment obligation this framework states and no standard imposes.
8. **The only use case with operating evidence is the register itself** (UC7). UC1–UC6 are specified, partly built, not run.

---

## 13. Governance and path to adoption

- **Decision:** ADR-015 (Proposed) — adopt this framework as the engagement's reference frame, keeping TM Forum AN as the mapped comparator and the ANLAV scenario catalogue as the comparability target. The ARB decides; the register does not flip its own status.
- **Naming and licence of the framework text:** the lead's call (ADR-015 item 5). Recommendation, marked as opinion: CC BY 4.0 for the text and instrument, Apache-2.0 for any code, with the TM Forum-derived material limited to citation and paraphrase.
- **Versioning:** v0.1 (this document) · v0.2 after B22/B23 are read (ENI/ZSM texts — architecture vocabulary and level table at source) · v0.3 after FRMCS#6 (Q4 2026) and the UIC conference (24–25 Nov 2026) — MORANE-2 D1.1 status, V3p, Plugtests catalogue ownership (C6).
- **Tracks:** Track A (EU/NIS-2) is the framework's native frame; Track B (Malaysia/NACSA, ADR-014) inherits method and instrument, never EU law.
- **Acts opened:** `14-next-acts.md` A16 (ARB adoption), A17 (licence verification of §11 and §2 artefacts). Existing acts it depends on: A14 (rail extension model), A15 (re-score on IG1252 Method 2), A5 (operator's gate bound), B7, B21, B22, B23.

---

## Source-discipline note

Every "held" reference is a `current/evidence-log.md` row; every "not held" one is a `14-next-acts.md` target. Tier labels O-N / O-S / O-A / P are this framework's, applied from the publisher's stated terms as read on 2026-09-26; licences in §11 are "as commonly published" and are the object of ADR-015 action 3, not facts the register vouches for yet. TM Forum material is paraphrased and cited by document and clause, never reproduced. The ceiling column in §3 and the use cases in §10 are the register's positions (ADR-002, ADR-004, ADR-007, ADR-010, ADR-011), restated in the framework's terms — they carry no new evidence and move no decision until ADR-015 is decided.
