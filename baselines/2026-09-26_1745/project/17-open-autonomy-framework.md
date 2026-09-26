# Open-reference autonomy framework for the oversight of critical networks — v0.3 (working title)

**Version note.** v0.1 written 2026-09-26 with the ETSI side second-hand. **v0.2, same day, evening:** ETSI GR ENI 007 V1.1.1, GR ENI 010 V1.2.1, GS ENI 005 V4.1.1, GS ZSM 001/002 V1.1.1 and GS ZSM 009-1 V1.1.1 fetched and read at source (E-2026-09-26-06, -07); §2, §3, §4, §6, §8, §12 and §13 re-issued. Still second-hand or unread: nothing on the ETSI side. **3GPP TS 28.533 V20.1.0 read the same evening (E-2026-09-26-08): §4 gains the 3GPP column and the Release-20 reference-model functions. v0.3, later the same evening: TS 28.567 V20.1.0 and TS 28.561 V20.2.0 read (E-2026-09-26-09, -10) — the class-3 hold is `ClosedControlLoop.desiredBehavior = NOTIFY_RCOMMENDATION` in 3GPP's own model, and the twin (`NDTFunction`) is the standard's environment for surfaces 1 and 3; §3, §4, §6, §10 and §12 updated.** Remaining for v0.4: GB1523B (B21), ENI 005 §6.3 in full, FRMCS#6.

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

**Citation form for 3GPP texts** follows the register convention of 2026-09-26 (`CLAUDE.md` §Always): *rail-pinned* specs — those named in the normative references of a held ETSI TC RT or UIC FRMCS document — are cited as ETSI transpositions at the pinned frozen version; *common* specs (SA5 management, generic 5GC and SA3, RAN L1) as 3GPP native texts with the release stated. The class of each spec is in `18-standards-on-record.md`. This framework's 3GPP column is therefore mostly *common* (28.100, 28.312, 28.535/536, 28.567, 28.561 …) and its service-layer citations *rail-pinned* (22.280, 23.280, 23.283, 24.379 …).

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
| A | **Outcomes and requirements** | IG1218 / IG1218F Business Requirements & Framework (O-A; held) | Outcome-anchored requirements in `traceability-matrix.md` R1–R14; **ETSI GS ZSM 001** V1.1.1 — 39 scenarios, requirement table incl. 65–70 closed loops in and across domains, nested loops, loop-conflict resolution; 92–95 stepwise ML introduction (O-N; held, E-2026-09-26-07) | — | none; the register already does this |
| B | **Autonomy level scale** | IG1230 Table 4 (P / P-S / S per task group); IG1252 §5 (O-A; held) | **3GPP TS 28.100** §5 levels, §7.3 fault-management tasks A–K, Table 5-1 Note 1 (O-N; held, E-2026-09-24-05); **ETSI GR ENI 007** V1.1.1 categories 0–5 on six factors, Table 1/2, fault-recovery Table 5; **GR ENI 010** V1.2.1 Responsibility Index 0–5, five-dimension scoring, Table 5-6 KPI targets (O-N; held, E-2026-09-26-06) | — | the **decision-class ceiling** column (§3) and a rail-domain criterion set (none exists in any body — inventory §4) |
| C | **Reference architecture** | IG1251 (O-A; held §4.4.1) | **ETSI GS ZSM 002** V1.1.1 — management services / functions / domains, E2E service management domain, integration fabric, data services, per-domain service groups (O-N; held, E-2026-09-26-07); **GS ENI 005** V4.1.1 — Assisted System classes 1–3, recommendation / management / mixed modes, API broker (O-N; held in part, E-2026-09-26-06); **3GPP TS 28.533** V20.1.0 SBMA — MnS producer/consumer, component types A/B/C, exposure governance, §5.3 mapping onto ZSM, Annex A.11 thirteen-function reference model (O-N; held, E-2026-09-26-08); TS 28.535/536 closed loops (held); **TS 28.567** V20.1.0 closed-control-loop management — `ClosedControlLoop` with `desiredBehavior` {DECISION_ACTIVATION · NOTIFY_RCOMMENDATION · DO_NOTHING}, four scopes incl. bounded/unbounded impact scope, escalation by confidence threshold, conflict coordination, consumer feedback and revocation (O-N; held, E-2026-09-26-09); **TS 28.561** V20.2.0 network digital twin — `NDTFunction`/`NDTJob`, NETWORK_ISSUE_INDUCEMENT incl. fault injection, RISKY_ACTIONS_PREDICTION, automation-configuration verification (O-N; held, E-2026-09-26-10) | ONAP (Apache-2.0); O-RAN SC Non-RT RIC (Apache-2.0); ETSI TeraFlowSDN, OSM, OpenSlice (Apache-2.0); Nephio (Apache-2.0) | the two-plane split (ADR-002/014), the **out-of-band monitor** and the **vital gateway** (ADR-004) — ZSM has *slots* for the first (a cross-domain data-collection producer) and none of the three as named elements |
| D | **Intent** | IG1253; TR290/TR292 family; TMF921 v5 + TMF921A (O-A for the guides and ontology; **TMF921 OpenAPI + CTK O-S, Apache-2.0 — verify**; held) | **3GPP TS 28.312** intent NRM and lifecycle (O-N; held); **IETF RFC 9315** IBN concepts (O-N; held); **GS ZSM 009-1** §8.1.5.3 intent as a closed-loop goal, `closedLoopGoalStatement` declarative or SLS (O-N; held); **GS ENI 005** [MOP1–17] modes per decision class (O-N; held) | ibn-core stack (private build — TMF921 front, Jena/Neo4j stores, SHACL); OpenSlice (TMF641/620 service ordering) | the **rail intent-extension model** (rule (xi), act A14); the class-3 hold as a Judge/Preference exchange; "class 4 is never an intent" as a unit test |
| E | **Closed loops and analytics** | IG1230 loop model; IG1339 I-AADE (O-A; held) | **TS 28.535/536** assurance closed loops, CON-16/17/20 (held); **TS 28.104** MDA (held); **TS 28.105** AI/ML management (held); **ETSI GS ZSM 009-1** V1.1.1 — stages, customization flow (approve/reject, explain), governance (lifecycle, models, goals, escalate), **pause points**, coordination (pre-execution conflict detection, **post-execution enable/disable actions**, priority) (O-N; held, E-2026-09-26-07) | ONAP Policy / CLAMP / DCAE (Apache-2.0); O-RAN rApps on Non-RT RIC (Apache-2.0) | the **"cannot adjust" signal from outside the loop** (ZSM's escalation and health-issue reporting are self-emitted); the *per-class values* of pause points and disabled actions (§6) |
| F | **Knowledge and data** | GB922 SID (O-A; held); TR292 ontology (O-A; graphs **not held**, B7); **TMF915 AI Management API v4.0.0 — `aiModel`, `aiModelSpecification`, `aiContract`, `aiContractViolation` (O-S, Apache-2.0 read from the release; held, E-2026-09-26-18)** | **TS 28.541 / 28.622 NRM** (O-N; held); **ERA vocabulary and ISS ontology** (O-N; held, v3.3.4 / v1.0.0); **W3C PROV-O, SHACL, SOSA** (O-N); **ETSI TR 104 180** data-quality metrics (O-N; held, E-2026-09-26-03) | Apache Jena Fuseki (Apache-2.0); Neo4j CE + n10s (GPL-3.0 / Apache-2.0); pyshacl (Apache-2.0); morph-kgc (Apache-2.0), RMLMapper (MIT) | the operator-side terms joining cell ↔ section of line ↔ slice (ibn-core §4 item 3) |
| G | **Effectiveness indicators** | IG1256 KEIs (O-A; held) | **TR 28.909 §6.3** per-phase recovery-time cost (O-N; held); **TS 28.554** KPIs (O-N; held; no E2E availability KPI exists) | OpenTelemetry (Apache-2.0); Prometheus (Apache-2.0); Grafana (AGPL-3.0) | the **availability-cost** measure of R4 (what legitimate service a reaction consumed) |
| H | **Evaluation and audit instrument** | IG1252 Methods 1 and 2; **GB1059 ANLET method (held, E-2026-09-25-01); GB1059x / GB1523B questionnaires (O-A, member — not held, B21); ANLAV audit (commercial)** | TS 28.100 §7.3 tasks as the row set; TR 28.909 §7.1 "score is the evaluator's" (both held) | the register's `16-ig1252-self-score.md` §7 as instrument v0.1 (this repo) | **there is no open audit**; this framework publishes the instrument and invites third-party scoring, which is not the same thing (§12) |
| I | **Assurance** — safety, security, AI governance, human factors | IG1187 ODA risk assessment (O-A; held) | EU AI Act (O-N); NIST AI RMF (O-N); DIN SPEC 92005 / 92001-3 (O-A); CCS TSI → EN 50126/50128/50129 (P, law-pointed); NIS-2 / CRA (O-N); MITRE ATT&CK / FiGHT (O-N); ETSI TS 103 792, TS 103 564 (O-N; held) | the register's ADR-004, ADR-010, ADR-012 as the operating rules; `15-mcx-parity-suite.md` | none new — the register carries this; the framework points |
| J | **Use cases** | IG1339 L4 high-value scenarios (O-A; held) | — | — | **rail-side scenarios on a safety bearer** (§10) — no body has them |

---

## 3. Component B — the level scale with a decision-class ceiling

**Scale.** 3GPP TS 28.100 §5: levels 0–5 defined per task by "participation of the human and telecom system"; §7.3 the eleven fault-management tasks — A control-information generation · B intent-fulfilment evaluation · C data collection · D alarm filtering · E fault recognition · F fault prediction · G demarcation · H root-cause analysis · I recovery-mechanism analysis · J action evaluation and determination · K action execution. **Table 5-1 Note 1: the human-reviewed decision has the highest authority at every level.** L4 is unspecified in the held V19.0.0 text; L5 is defined only as "without human-predefined control information".

**Mapping to TM Forum** (IG1252 Table 5-6 rows ↔ 28.100 tasks): `16-ig1252-self-score.md` §7.1, eleven rows, two vocabularies.

**Mapping to ETSI — at source (E-2026-09-26-06).** GR ENI 007 grades six *categories* 0–5 on six technical factors; the decision factor reads: cat. 1 "provide suggestions … help decision making" · cat. 2 "multiple opinions … limited decisions" · cat. 3 "most of the machines make decisions" · **cat. 4 "optional decision-making response"** · cat. 5 "machine autonomous decision"; the market table keeps analysis and decision-making at "Operator" through cat. 3, "Operator and System" at 4, "System" only at 5. The human's position is made precise in **GR ENI 010's Responsibility Index**: 3 = the network recommends with a complete view of side effects; **4 = as 3, autonomous only in off-peak hours**; 5 = autonomous with escalation to experts for severe unforeseeable events — and "within level 5 … the Human Supervision will not be completely removed" (§7.1). ENI's fault-recovery example (007 Table 5) places 2019 practice at category 2 ("manual fault recovery") evolving to 3 ("provides fault-recovery solutions"); automatic recovery is a category-4 property. **Correction carried from the inventory:** WP 64's "L4 needs human approval" was a paraphrase; ENI's own mechanism is time-boxed delegation and escalation, not approval.

**The ceiling in each body's vocabulary** — the same bound, four ways of saying it:

| ADR-002 class | 3GPP TS 28.100 (task J / K) · **TS 28.567 `desiredBehavior`** | TM Forum IG1230 / IG1253 | ETSI ENI 010 ANRI · ENI 005 mode | ETSI ZSM 009-1 mechanism |
|---|---|---|---|---|
| 1–2 reversible | J and K may reach L4–L5 · **`DECISION_ACTIVATION`** | Decision S at L4; Execution S from L2 | ANRI 4–5 permitted; **management mode with approve-all [MOP14]** | pause points disabled; actions enabled |
| 3 irreversible / financial | J ≤ L3 "Human & Telecom system"; K ≤ L1 · **`NOTIFY_RCOMMENDATION` — "the recommendation is notified to the consumer who then considers whether it should be applied"; escalation threshold set by the consumer (REQ-ESC_01-01)** | IG1253 §5.8 "ask approval when …" expectation; Judge/Preference | **ANRI ≤ 3 (recommend); management mode, per-command approval [MOP13]** | **pause point between Decision and Execution enabled; time limit → stop** |
| 4 safety-critical | J ≤ L0/L1 (display); K never in the layer · **no loop with a class-4 object in its control scope may carry `DECISION_ACTIVATION`; impact scope on such objects must be bounded and known (28.567 §4.3.4)** | no TM Forum term — L4 core-FM target keeps review and execution manual (E-2026-09-26-01) | **ANRI 1–2; recommendation mode only [MOP1]; the kernel is a class-1 Assisted System, so [CLR2] excludes real-time loop involvement** | **actions disabled on every class-4 managed entity (post-execution coordination)**; vital gateway as second enforcement |

**One bound, three realisations.** ZSM's pause point, 3GPP's `NOTIFY_RCOMMENDATION` and ENI's recommendation mode are the same thing said by three bodies; a realisation must implement at least one at the management plane and the vital gateway beneath it. On a vendor's *closed-box* loop (28.567 §4.5) the attribute is a procurement requirement to state, not a property to assume.

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

Described as layers and elements in **ETSI GS ZSM 002's vocabulary** (held, E-2026-09-26-07): *management services* offered at end-points by *management functions*, federated into *management domains* delineated by a business, administrative or technological boundary; an *E2E service management domain* that composes services and never touches resources; an *integration fabric* for registration, discovery and exposure; *data services* that separate persistence from processing. Per domain the service groups are data collection → analytics → intelligence → orchestration → control → supporting (policy). ZSM 002 specifies decision *support* and leaves decision *making* and action *planning* "for future specification" — the gap this framework's human-gated design occupies rather than fills.

**Planes (ADR-002, ADR-014):**
- **Decision plane** — the register: evidence log, ADRs, ARB, baselines. Agents that participate (Risk Sentinel, Architecture Decision Agent, Bid/Procurement Agent, Assurance Agent) operate under the same discipline. *This plane exists and runs today.*
- **Runtime plane** — Anomaly/Fault Agent, Resilience Orchestration Agent, Intent Agents. *Out of operation until ADR-007 evidence exists.*
- **Knowledge plane** (ADR-002 item 9; `pivot-notes-2026-09-15-knowledge-plane.md`) — the graphs both planes reason over: 3GPP NRM instances (TS 28.541), rail infrastructure (ERA RINF/ERATV vocabulary), incident records (ERA ISS), intents (TIO + rail extension model), provenance (PROV-O), all SHACL-validated.

**The planes in ZSM terms:**
- **Decision plane** (the register) = a *ZSM framework consumer* — ZSM 002 §3.1 allows human users — plus the governance half of the E2E service management domain: it sets closed-loop goals and operational policies, ratifies, and reads the audit trail [CL-general-8, -14].
- **Runtime plane** = *domain intelligence*, **decision-support services only** (ZSM 002 §6.5.4.1), plus analytics and data collection; it never realises the decision-making and action-planning services ZSM left unspecified for class 3–4 objects. In ENI 005 terms: recommendation mode for class 4, management mode with per-command approval for class 3 [MOP13], approve-all for classes 1–2 [MOP14].
- **Knowledge plane** = *data services* (domain and cross-domain, ZSM 002 §6.4) plus the *knowledge base service* (§6.5.4.2.4 — "replace the present use of manuals") and the *AI training data management service* (§6.6.4.2.3, labelled ground truth) — the ADR-010 label stream's ZSM home.

**The same architecture in 3GPP's vocabulary (TS 28.533 V20.1.0, E-2026-09-26-08).** 3GPP maps itself onto ZSM in §5.3: its Cross-Domain, RAN and CN Management Domains *are* ZSM management domains, and "a 3GPP Management Framework Consumer (e.g. vertical OT system, BSS) is a ZSM framework consumer". So the register's decision plane holds one seat under three names — **3GPP Management Framework Consumer · ZSM framework consumer · TM Forum AN Consumer (IG1251 §4.4.1)**. Annex A.10 places the intent function (`IntentHandlingFunction`, 28.312) in ZSM's *intelligence* group and the assurance loop (`AssuranceClosedControlLoop`, 28.536) with the SON functions in *control*. Annex A.11's Release-20 reference model names the functions the runtime and knowledge planes are built from: **MDAF** analytics (28.104) · **IHF** intent handling with feasibility check and conflict resolution (28.312) · **CCLF** closed control loops with disallowed-attribute lists (28.536) and, per **TS 28.567**, escalation "to higher-level entities under predefined conditions", conflict detection and impact assessment · **MLTRF / MLTEF / MLEMF** model training, testing and **emulation "before deployment to the live network … verification of non-impact on live systems"** (28.105) · **NDTF** digital twin for "evaluating high-risk operations, failure scenarios" and synthetic training data (28.561) · **DMF / MRDF** data lifecycle, registry and discovery (28.537) · PMF / FMF / UDHF / PRF. **MLEMF and NDTF are the standard's slots for ADR-007 surfaces 1 and 3** — replay and injection in an emulation or a twin, never on production. At source (TS 28.561, E-2026-09-26-10): an `NDTFunction` with NETWORK_ISSUE_INDUCEMENT runs "fault injection experiments avoiding impact on the physical network" and builds "a training data set for enhancing and enriching detection"; RISKY_ACTIONS_PREDICTION evaluates a proposed remedy before it is applied; AUTOMATION_CONFIGURATION_VERIFICATION verifies the oversight layer's *own* settings in the twin (REQ-NDTVER-06). **Limit, stated by the standard itself:** the twin is "a good approximation" of the network as modelled — it runs the fault classes the catalogue names and cannot discover the class nobody modelled (Thread 5; ADR-010 item 11). What A.11 does not name, and this framework adds: an independent function monitor (every PMF/FMF producer in A.11 is the element's own) and the vital gateway.

**Management domains:** one per bearer estate (5GC + IMS + MCX; RAN; transport), an E2E service management domain for the FRMCS service, and **the rail operational domain as an AN Consumer** (IG1251 §4.4.1) of any public MNO domain used for fallback — in 28.533 terms an exposure-governed derivative MnS A′ across administrative domains (§4.4, §5.5), the same relationship a corridor intent between two infrastructure managers (UC4) uses. **The API chain toward a public MNO is the industry's, not the register's (IG1318, E-2026-09-26-21):** CAMARA Service APIs (Quality on Demand, Device Location) for the reversible class-1/2 actions, TM Forum Open APIs as the operate layer (TMF620 offer → TMF679 qualification → TMF622 order), 3GPP SA5 beneath for the OAM the MNO keeps to itself, and a Transformation Function mapping one to the other. The fallback path is therefore a *purchased offer* the layer may tune inside its terms, never a commanded network; no class-3/4 rail object appears on it, and CAMARA exposes none. Operational policies per domain and per loop declare "levels of human oversight, of reporting, and conditions for escalation, delegation and coordination" (ZSM 002 §6.7) — that is where the §3 ceiling is written down, as the loop's `closedLoopPolicy` (ZSM 009-1 §8.1.4.2 NOTE 9: "autonomy, supervision, reporting, execution").

**Elements no body draws, and this framework does:**
1. **Out-of-band function monitor** — in ZSM terms a *data-collection service producer* placed in a management domain other than the monitored element's, consumed cross-domain through the integration fabric; ZSM has the slot, not the element. It produces a signal about the *function performed* (traffic carried, registrations served: e.g. registration success rate per AMF set, TS 28.554 §6.2.3, read against `NFS.UpdateReq`, TS 28.552 §5.10.2, E-2026-09-19-32) by something other than the element, in addition to the two standard heartbeats (NF→NRF `nfStatus`, MnS `notifyHeartbeat`), never as their replacement. It is both an *input* to the 28.535 Decision box and the source of its "cannot adjust" signal (E-2026-09-19-11). On FRMCS it needs gateway-side taps, controlled key access or metadata-only observation, because MC traffic is encrypted (PR5).
2. **Vital gateway** (ADR-004) — the deterministic, fully verifiable boundary that rejects any class-4 action from the layer. Implementation class bound to decision class (ADR-002 §Implementation class).
3. **Class-3 hold** — the intent held in EVALUATING (TS 28.312 pre-evaluation) or as a Judge/Preference exchange (TMF921A) until a named human has advised the preferred outcome; timeout → rejected (TR292B).
4. **Independent data-quality layer** — ETSI TR 104 180 metrics computed on every ingested stream before analytics: temporal stability *with a minimum-variability bound* (stuck-at), timeliness against logged event and arrival times, completeness with the structural-null rule, lineage per critical data element.

**Open-source realisation candidates (tier O-S):** Kubernetes (kind for the private build); ONAP for policy, closed-loop (CLAMP) and data collection (DCAE); O-RAN SC Non-RT RIC for A1-style policy/intent to a RAN domain; ETSI TeraFlowSDN for transport; ETSI OpenSlice for TMF-API service ordering; Nephio for intent-driven configuration on Kubernetes; free5GC (Apache-2.0) or Open5GS (AGPL-3.0) as the 5GC of a test ring (ADR-007 surfaces 1/3); Kamailio (GPL-2.0+) as SIP core. **No complete open-source MCX server or client is known to the register**; a test ring therefore mixes O-S bearer with commercial MCX under the ADR-007 execution prerequisites (`15-mcx-parity-suite.md` §5). *Gap, stated.*

---

## 5. Component D — intent

- **Model:** TMF921 v5 (intent as RDF validated against the TIO) mapped to 3GPP TS 28.312 (IG1253 §21.1 gives the mapping); vocabulary of concepts per IETF RFC 9315. **Origin and version caveat (E-2026-09-26-20):** the `icm:` common model and the federation rule — common model mandatory, "intent extension models … can be proposed by any standards organization or work group" — come from IG1253A (2021–2022); the current term names and IRIs are TR290 v3's, so the rail extension model is built against TR290/TMF921 v5, and IG1253A is cited only for the principle.
- **Lifecycle:** RECEIVED → EVALUATING → FULFILLING → FULFILLED/DEGRADED (28.312); the layer is *consumer* for classes 3–4 and holds in EVALUATING; TMF921 `ProbeIntent` for the feasibility question that changes nothing.
- **Rail extension model** (ADR-002 item 9 rule (xi); act A14): an `imo:IntentExtensionModel` specialising `icm:` classes for functional alias (TS 23.280 §8.1.5), REC and the class A–C service catalogue (ADR-001 §5(b)), RINF radio terms (`era:gsmrVersion`, `era:switchRadioSystem` …), the FRMCS `NetworkSlice` / `ServiceProfile` DN (SRS §13). Validated with pyshacl against the TIO shapes when the graphs are held (B7); against a locally written subset until then.
- **Three intent rules, testable:** (i) *class 4 is never an intent* — the intent processor rejects any expectation whose target is a class-4 object; (ii) *class 3 intents carry an approval expectation* (IG1253 §5.8 "ask approval when …") and cannot leave EVALUATING without a recorded human preference; (iii) *every intent names its provenance* (`prov:wasDerivedFrom` the evidence row or ADR that motivated it).
- **Interconnection caveat (E-2026-09-26-05, 5th FRMCS Plugtests §10.1.3):** alias resolution across primary/partner MC systems is ambiguous between 23.280 Stage 2 and 24.379 Stage 3; a corridor intent that names an alias in another IM's system inherits that ambiguity and must say so.

---

## 6. Component E — closed loops and analytics

- **Loop model:** TS 28.535 assurance closed loop with the consumer constraints the standard offers — CON-16 permitted action set, CON-17 gate, CON-20 pause — realised with **ETSI GS ZSM 009-1's enablers** (held, E-2026-09-26-07): stages Monitoring · Analysis · Decision · Execution plus Knowledge; a *customization flow* for external entities to configure, monitor, **approve/reject recommendations and obtain explanations**; a closed-loop model with mandatory `closedLoopPriority`, a `closedLoopGoal` stated as intent or SLS, target managed entities, and a `closedLoopPolicy` for autonomy and supervision.
- **The class-3 hold = a pause point.** ZSM 009-1 §9.2.4: an enabled pause point halts that flow, notifies the authorised consumer with the stage's output, and the consumer "may then choose to resume the execution or completely stop". The framework fixes its values: **a pause point between Decision and Execution, enabled for every loop whose target entities include class-3 objects; time limit configured to *stop*, never *auto-continue*** (the TR292B / 28.312 safe default). The consumer is the named accountable role, and their resume is the recorded human preference.
- **The hold in 3GPP's model (TS 28.567 V20.1.0, E-2026-09-26-09; verbatim in the frozen Release 19 text TS 128 567 V19.3.0, E-2026-09-26-16 — cite that one).** `ClosedControlLoop.desiredBehavior = NOTIFY_RCOMMENDATION`: the loop "starts processing input to derive recommendations but without the corresponding actions executed on the network"; the consumer decides. The framework fixes: every loop whose *control scope* (28.567 §4.3.4, "the action-space") contains a class-3 object runs in `NOTIFY_RCOMMENDATION`; the consumer's recorded decision is the human preference; escalation is configured per REQ-ESC_01-01 with the recipient being the named accountable role, not another loop. Condition-gated execution (REQ-DynCCL_05-01) carries the ADR-011 window and inactive-redundancy rules as conditions. Consumer feedback 0–10 and revocation (REQ-CCLPERF_02) feed ADR-010's dissent measure at the standard's interface.
- **The class-4 deny list = disabled actions.** ZSM 009-1 §9.3.3 post-execution coordination "Enable/Disable actions": **every action on a class-4 managed entity is disabled for every loop**, so the loop "is then unable to execute disabled actions in execution stage"; the vital gateway (ADR-004) enforces the same bound outside the management plane. CON-16's permitted action set is the 28.535 statement of the same list.
- **Escalation and the "cannot adjust" signal.** ZSM gives two self-emitted forms — CLG "Escalate issue" when a loop "is not able to achieve the goal(s) assigned to it" (§9.2.2) and *health issue reporting* to "a higher-order entity" (ZSM 002 §6.5.4.2.5). Both originate inside the thing being judged, as 28.535's escalation does (E-2026-09-19-11). The out-of-band monitor therefore stays the *independent* source of the same escalation: it raises the issue when the loop's own signals are silent.
- **Coordination:** several loops over the same objects are coordinated per ZSM 009-1 §8.2 — hierarchical (goals delegated down, issues escalated up) and peer (cooperation); **pre-execution conflict detection and action-plan selection (§9.3.2)** before Execution; concurrency by `closedLoopPriority`; impact assessment "left for future stages". A loop is itself a managed entity, so the decision plane may target a runtime loop with a governing loop of its own.
- **Audit:** [CL-general-8] actions logged; **[CL-general-14] AI/ML decisions "monitored to support administrative audit trails"** — the ZSM form of ADR-010's evidence chain and ADR-012's model-provenance record; ENI 005 [CLR3.10] logs every goal with its final action set.
- **Where the hold lives in the TM Forum operate APIs (E-2026-09-26-22/-23/-24 — TMF642 v5.0.1, TMF664 v5.0.0, TMF641 v5.0.0 read at the OAS).** The task API that actuates a virtualised function — **TMF664** `POST /heal` · `/scale` · `/migrate` — has no held or awaiting-approval state (`acknowledged → inProgress → done | terminatedWithError`), so the class-3 pause point cannot be placed inside it; it sits **above**, in the closed loop (ZSM pause point / `NOTIFY_RCOMMENDATION`) or in the **TMF641** service order, whose `pending` state waits for a named party's input (InformationRequiredEvent, auto-cancel if none comes) and whose cancellation is assessed against an explicit **point of no return**. A TMF664 task on an MCX, IMS or 5GC function is posted only after that hold releases; once posted, it runs. By class: `scale` inside a pre-approved envelope is class 2; `heal` on a function carrying live MCX sessions is class 3 unless redundancy and failover are proven in the parity suite (ADR-007); `migrate` is class 3 always. On the alarm side, **TMF642** splits the operator's acts into tasks: `ackAlarm`, `commentAlarm`, `groupAlarm` change only what a human sees (class 1, any level); **`clearAlarm` removes a symptom irreversibly** ("once cleared … can no longer be set") and is issued on a class-3/4 managed object only by the element itself or by a human — a loop that judges an alarm stale posts a comment, never a clear. `ackSystemId` / `clearSystemId` are the "who acted" fields; a loop's system id must be distinguishable from any console id so the audit trail separates the two without inference. No Resource Function is a vital object, so nothing on this path reaches class 4 (ADR-004 gateway).
- **Analytics:** TS 28.104 MDA (`MDAAssistedFaultManagement` — failure prediction, root cause, recovery recommendation) as the analytics vocabulary; TS 28.105 for model lifecycle and provenance (ADR-012 item 1's model-provenance evidence); ZSM 002's *deployed AI model assessment* (retrain / reconfigure / replace / pause / terminate) as the drift response ADR-010 item 3 monitors for.
- **Implementation:** ONAP Policy Framework and CLAMP for loop definition and gating; DCAE for collection; O-RAN Non-RT RIC rApps where the domain is RAN. All Apache-2.0.

---

## 7. Component F — knowledge and data

- **Models:** TS 28.541 / 28.622 NRM (YANG/OpenAPI, O-N) for the bearer; ERA vocabulary v3.3.4 and ISS v1.0.0 (O-N) for infrastructure and incidents; GB922 SID (O-A) for the OSS-side entities where TM Forum terms are needed (`ClosedLoop.whyInvoke`, `Anomaly.prescribedAction`); TIO (O-A) for intents; PROV-O for provenance; SHACL for every constraint.
- **Stores:** Apache Jena Fuseki (TDB2) for RDF with per-graph provenance; Neo4j CE + n10s where property-graph analytics are needed; Redis or equivalent for state. All O-S.
- **Data quality (ETSI TR 104 180, O-N, held):** the eighteen metrics as the reporting vocabulary; five are mandatory on every ingested stream — reliability (temporal stability with minimum-variability bound), timeliness, completeness (structural-null rule stated), lineage, and for labelled data label quality against a second-adjudicator gold sample (ADR-010 item 12/14). Each gap report names the metric, the value and the missing metadata that prevented computing it.
- **Incident record:** every run, injection and incident is written as an ERA ISS occurrence scenario (`incident-annex-iss-occurrence-scenario.md` §8 pattern) so failures of parity, failover and detection share one evidence format.

---

## 8. Components G and H — indicators and the evaluation instrument

**Indicators (open):** a third open source joins the two below — **ETSI GR ENI 010 Table 5-6** gives per-level KPI targets for "network anomaly detection, diagnosis and intelligent recovery": average monthly unavailable time **1 h at L2, 0.5 h at L3, 0.3 h at L4**, and root-cause "diagnosis and self-healing accuracy > 90 %" at L4 — written for a CSP's special-line business, so a comparator, not a bar for a safety bearer; ENI 010 §5.2.4's result shape — the quintuple {object, autonomous domain, subsystem, lifecycle phase, category} plus a radar map over the five dimensions — is adopted as the instrument's reporting form beside the three columns. TR 28.909 §6.3 per-phase recovery-time cost — recognition · demarcation · root cause · mechanism analysis · action evaluation/determination · execution — plus on-time count and total; TS 28.554 KPIs where they exist (registration success rate; no end-to-end availability KPI exists — the framework defines one per scenario and says so); the register's **availability cost** (what legitimate service a reaction consumed, R4). TM Forum's IG1256 names (Availability Ratio, MTTR, Fault Handling On-time Ratio, Number of Major Faults) are mapped for comparability.

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
| Interoperability and conformance of the service layer | ETSI TS 103 564 V1.6.1 + Plugtests reports (O-N; held) — *interoperability*; **ETSI TS 104 069-1/-2 + TS 104 070 V1.1.1, TC RT, Rel-19 (O-N; held, E-2026-09-26-11) — *conformance* test purposes for FRMCS client and server with ICS pro forma (n100/n101)**; TS 103 792 (O-N; held) — GSM-R interworking, which neither test set covers | `15-mcx-parity-suite.md`; executed precedent per case recorded (E-2026-09-26-05) |
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
- **Stack:** independent monitor (metadata taps / passive probes where encryption allows); ONAP DCAE + Policy; Fuseki with NRM + RINF + ISS graphs; TR 104 180 stuck-at rule on every self-report stream; **the loop as a `ClosedControlLoop` in `NOTIFY_RCOMMENDATION` with bounded impact scope (TS 28.567); replay and the seven injection classes run as `NDTJob`s on an `NDTFunction` with NETWORK_ISSUE_INDUCEMENT (TS 28.561) before any test-ring run.**
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
- **Suite:** `15-mcx-parity-suite.md` — 21 cases cited to Stage 1–3 text, to the ETSI Plugtests descriptions, and **since 26 Sep 2026 to ETSI TC RT's conformance test purposes (TS 104 069-1/-2 V1.1.1, E-2026-09-26-11)** — every FA and MT case has a public Rel-19 conformance purpose; executed precedent per case from E-2026-09-26-05 (functional alias strong; multi-talker thin; REC three passes; GSM-R interworking one failed attempt and **no conformance purpose at all**).
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
| Policy, closed loop, collection | ONAP Policy Framework, CLAMP, DCAE — 3GPP's own deployment example shows ONAP DCAE and an ONAP controller consuming 3GPP MnS (TS 28.533 Annex A.9, E-2026-09-26-08) | Apache-2.0 | LF Networking |
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
| Intent API front | TMF921 v5 OpenAPI + CTK | Apache-2.0 (**verify** for the v5 Beta artefacts; the sibling TMF915 v4.0.0 release ships an Apache-2.0 `LICENSE`, E-2026-09-26-18; TM Forum's own IG1318 states its "over 70 Open APIs" are published "under the Apache 2.0 license", E-2026-09-26-21) | TM Forum GitHub |
| Public-MNO service and operate APIs (fallback path, UC4) | CAMARA Service APIs (Linux Foundation) · TMF620 / TMF679 / TMF622 | Apache-2.0 (CAMARA, LF project) · Apache-2.0 (TM Forum, as stated) | CAMARA GitHub · TM Forum GitHub |
| AI model / contract management | TMF915 AI Management Suite API v4.0.0 | Apache-2.0 (read from the release zip) | TM Forum GitHub |
| Alarm, resource-function and service-order operate APIs | TMF642 Alarm v5.0.1 · TMF664 Resource Function Activation v5.0.0 (Preview, Team Approved 24-Sep-2026) · TMF641 Service Ordering v5.0.0 · TMF620 Product Catalog v5.0.0 (all OAS held, E-2026-09-26-22/-23/-24) | Apache-2.0 declared **inside the yaml only for TMF664**; the TMF620/641/642 files carry no `info.license` — A17 verifies at the repository `LICENSE` | TM Forum GitHub |
| Vocabularies | ERA vocabulary, ERA ISS ontology and SHACL | open (EU reuse terms — **verify** exact licence per repository) | ERA GitLab |

**Licence hygiene:** AGPL-3.0 and GPL components (Open5GS, Grafana, Neo4j CE, Kamailio) are fine to *run* and are kept out of any redistributed derivative; Apache-2.0 components may be embedded. This is the ADR-015 action-3 check.

---

## 12. Gaps, stated

1. **No open audit of autonomy.** TM Forum's ANLAV is the only audit product; it runs on member-gated questionnaires. This framework offers a *published, reproducible instrument*; a third party can re-score it, nobody certifies it. That is a weaker claim and is stated as such. (By contrast the *service layer* now has an open conformance route: ETSI TC RT's TS 104 069 set, E-2026-09-26-11 — conformance of an FRMCS client or server is testable against public purposes; the autonomy of the layer that watches it is not.)
2. **No rail-domain criterion set exists in any body** (inventory §4). The ceiling column and the instrument rows in §3/§8 are the register's own and are offered as a candidate — an influence act at the tier of A3′/A13, the lead's decision.
3. **ETSI is now on file at source** (E-2026-09-26-06/-07) — and the reading changed a sentence the register had carried: ENI's human at "L4" is placed by *time-boxed delegation and escalation* (ENI 010 ANRI), not by *approval* as WP 64 paraphrased it. Remaining ETSI-side bounds: ENI 007's fault-recovery baseline is 2019; ENI 010 calls its own evaluation incomplete; ZSM 002 leaves decision-making and action-planning services unspecified and 009-1 leaves most post-execution coordination for future stages; ENI 005's thirteen functional blocks are read as headings only. **3GPP TS 28.533, 28.567 and 28.561 are held and read** (E-2026-09-26-08/-09/-10); the 3GPP column of §3/§6 now rests on 28.567's own model, **and the facts it uses are confirmed in the frozen Release 19 transpositions TS 128 567 V19.3.0 and TS 128 561 V19.3.0 (E-2026-09-26-16) — the Release 20 texts carry a "shall not be implemented" working-version notice, so citations for conformity or procurement use the Release 19 editions.** Remaining 3GPP bounds: 28.567 is written for a loop *without* human intervention and admits the human only as the MnS consumer who configures behaviour and thresholds; its closed-box loops hide internals from that consumer; 28.561's twin covers RAN and core only, with fidelity left to the deployment.
4. **TS 28.100 does not define L4** in the held text; the instrument caps at L3 where the standard is silent.
5. **No open-source MCX.** UC3's ring mixes open bearer with commercial service layer.
6. **TIO graphs are member-gated** (B7); the rail extension model is validated against a locally written subset until they are held.
7. **Detection is not standardised anywhere** (E-2026-09-19-05/-30/-32): 3GPP names no mechanism, UIC V2 carries no monitoring requirement; the out-of-band monitor is a deployment obligation this framework states and no standard imposes.
8. **The only use case with operating evidence is the register itself** (UC7). UC1–UC6 are specified, partly built, not run.

---

## 13. Governance and path to adoption

- **Decision:** ADR-015 (Proposed) — adopt this framework as the engagement's reference frame, keeping TM Forum AN as the mapped comparator and the ANLAV scenario catalogue as the comparability target. The ARB decides; the register does not flip its own status.
- **Naming and licence of the framework text:** the lead's call (ADR-015 item 5). Recommendation, marked as opinion: CC BY 4.0 for the text and instrument, Apache-2.0 for any code, with the TM Forum-derived material limited to citation and paraphrase.
- **Versioning:** v0.1 (2026-09-26, ETSI second-hand) · **v0.2 (2026-09-26 evening — this document: ENI 007/010/005 and ZSM 001/002/009-1 read at source, E-2026-09-26-06/-07)** · TS 28.533 read the same evening (E-2026-09-26-08; §4 3GPP column) · **v0.3 (2026-09-26, late evening — this document): TS 28.567 / 28.561 read (E-2026-09-26-09/-10); the hold, the deny list, escalation and the twin at source in 3GPP's model** · v0.4 after GB1523B (B21, instrument comparability) and ENI 005 §6 in full · v0.4 after FRMCS#6 (Q4 2026) and the UIC conference (24–25 Nov 2026) — MORANE-2 D1.1 status, V3p, Plugtests catalogue ownership (C6).
- **Tracks:** Track A (EU/NIS-2) is the framework's native frame; Track B (Malaysia/NACSA, ADR-014) inherits method and instrument, never EU law.
- **Acts opened:** `14-next-acts.md` A16 (ARB adoption), A17 (licence verification of §11 and §2 artefacts). Existing acts it depends on: A14 (rail extension model), A15 (re-score on IG1252 Method 2), A5 (operator's gate bound), B7, B21, B22, B23.

---

## Source-discipline note

Every "held" reference is a `current/evidence-log.md` row; every "not held" one is a `14-next-acts.md` target. Tier labels O-N / O-S / O-A / P are this framework's, applied from the publisher's stated terms as read on 2026-09-26; licences in §11 are "as commonly published" and are the object of ADR-015 action 3, not facts the register vouches for yet. TM Forum material is paraphrased and cited by document and clause, never reproduced. The ceiling column in §3 and the use cases in §10 are the register's positions (ADR-002, ADR-004, ADR-007, ADR-010, ADR-011), restated in the framework's terms — they carry no new evidence and move no decision until ADR-015 is decided.
