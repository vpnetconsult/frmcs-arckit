# Pivot notes — autonomous-network levels: TM Forum, ETSI and 3GPP on file, and what is missing

**Date:** 2026-09-24 · **Pivot state:** `current/` at 538 rows (`E-2026-09-24-04` last); last frozen baseline `2026-09-19_2321` — **four sittings unfrozen and uncommitted (2026-09-20, -24), including a decision move in ADR-013.** · **Siblings:** `16-ig1252-self-score.md` (the score, §6 the GB1523B mapping, §6.3 the method finding), `pivot-notes-2026-09-24-race-to-2030-frmcs.md` §3.1, `pivot-notes-2026-09-15-knowledge-plane.md` Thread 4, `sdo-mapping-frmcs-gsmr-5gsa.md` §1b.
**Purpose:** one place that says, for the *topic* "how autonomous is the layer that watches the bearer, and who says so", which documents of the three standards bodies the register holds, at which version, what was read of each, and which named documents it does not hold — ranked by what their absence blocks. Nothing here is new evidence; every cell points at the row that logged it.

> **Update 2026-09-26 (E-2026-09-26-06, -07): §4 items 3 and 4 are closed.** GR ENI 007 V1.1.1, GR ENI 010 V1.2.1, GS ENI 005 V4.1.1, GS ZSM 001 V1.1.1, GS ZSM 002 V1.1.1 and GS ZSM 009-1 V1.1.1 are held in Downloads and read (ENI 005 in part). Consequences for this note: §1's ETSI row is no longer "white papers only"; §3's "What is a level?" ETSI cell should be read as ENI 007 Table 1 ("optional decision-making response" at cat. 4) plus ENI 010's Responsibility Index (recommend at 3, autonomous off-peak at 4, escalation at 5), **not** WP 64's "needs human approval"; §3's "Where is the human?" ETSI cell gains ENI 005 modes [MOP1–17] and ZSM 009-1 pause points / disabled actions; §5 item 5 ("ETSI is on file only as opinion") is withdrawn. The framework that consumes this inventory is `17-open-autonomy-framework.md` v0.2. Still missing on the 3GPP side: TS 28.533 (3gpp.org blocked from the sandbox).

**Outcome anchor:** *safe, continuous rail operations.* The level matters for one reason: it is the number a procurement or a regulator will ask for when the oversight layer is offered, and the register has decided in advance that on safety-critical actuation the answer is bounded by design (ADR-002, ADR-004). The inventory exists so that number is stated on the standards' own terms and the bound is visible in it.

**Guardrail:** oversight, not control. Every level definition below grades *who acts*; the register's layer never acts on class-4 objects, and the tables record what that costs on each scale rather than hiding it.

---

## 1. The three bodies, three roles

| Body | Role on this topic | Normative or not |
|---|---|---|
| **TM Forum** (Autonomous Networks programme) | Defines the levels per task group (IG1230), the evaluation method and two scoring methods (IG1252), the effectiveness indicators (IG1256), the framework and business requirements (IG1218/1218F), the reference architecture (IG1251), the intent vocabulary (TR290/TR292 family, TMF921) — and, since 2025, **audits** levels per scenario (ANLAV, one ANLET questionnaire per scenario). | Member guides and APIs; no law; the only body with an audit product |
| **3GPP SA5** | Defines the *normative* level classification per management workflow (TS 28.100 — **not held**), the machinery the levels are read on (TS 28.312 intent, 28.535/536 closed loops, 28.104 MDA, 28.105 AI/ML, 28.541 NRM), and studies evaluation (TR 28.909) — concluding that the *score* "does not need to be normalized in 3GPP". | Normative for the classification and the interfaces; explicitly not for the score or the KEIs |
| **ETSI** (ISG ENI, ISG ZSM) | Supplies the cognition model and the level table the trade press quotes (GR ENI 007/010 — **not held**; known to the register only through White Paper 64), closed-loop coordination (GS ZSM 009-1 — **not held**; delegated to by 28.535 §4.2.6), and the sector's own account of AI in autonomous networks (WP 69). | Group Reports/Specifications are industry specifications; everything the register holds from ETSI on this topic is a **white paper** — non-normative, vendor-weighted |

The three do not compete: TM Forum's IG1252 is cited by 3GPP's TR 28.909 as *the* method; 3GPP's 28.312 is mapped by TM Forum's IG1253 §21.1; ETSI ENI's level table is what WP 64 reproduces and what ETSI's own WP 69 argues over. The register holds the seam documents on the TM Forum and 3GPP sides and holds nothing primary on the ETSI side.

---

## 2. Inventory — held

### 2.1 TM Forum

| Document | Version held | Row | What was read | What it gives the register | Bound |
|---|---|---|---|---|---|
| **IG1230** AN Technical Architecture | v1.1.1 (Dec 2022) | E-2026-09-19-35 | levels Table 4 (P/S per task group), §2.2.5, §2.3.3 | the P / P-S / S grading the self-score convention rests on; IG1230 raises Execution to S at L2 and Decision to S at L4 | pre-production; TM Forum's own L3/L4 line (IG1218F) used to corroborate |
| **IG1252** AN Levels Evaluation Methodology | v1.2.0 (Jun 2023) | E-2026-09-19-36; **E-2026-09-24-03** | §4.2, §5.1, §5.3 (Sep 19); **§5.2 task catalogue and §5.3.2 both scoring methods in full (Sep 24)** | the evaluation unit (task contextualisation), Table 5-6's ten fault-management tasks, Methods 1 and 2 — the finding that the self-score is an unweighted Method 2 | its task tables are "only an example"; criteria deferred to "network domain specific SDO" |
| **IG1256** AN Effectiveness Indicators | v3.2.0 (May 2026) | E-2026-09-19-37 | KEI set | Availability Ratio, MTTR, Fault Handling On-time Ratio, Number of Major Faults — the measures beside the level | capability metrics deferred to domain SDOs |
| **IG1253** Intent in AN | v1.3.0 (Aug 2022) | E-2026-09-19-36 | §3.2, §5.4/5.6/5.8, §9 RACI, §21.1 | §5.8 "ask approval when …" as an intent expectation — the class-3 hold's TM Forum form; §21.1 the 28.312 mapping | RACI chapter is a position, not law |
| **IG1251** AN Reference Architecture | v1.0.1 (2022) | E-2026-09-19-47 | §4.4.1 | the *AN Consumer* role — the IM's role toward an MNO's autonomous domain | — |
| **IG1218** AN Business Requirements & Framework | v3.0.0 | E-2026-09-19-47 | by structure | context | — |
| **IG1218F** AN Framework | v2.0.0 (2025) | E-2026-09-19-47 | Table 2 | L3 "automatically delivered and manually reviewed" vs L4 "eliminating the need for manual review" — corroborates the +0.5 ceiling | — |
| **IG1339** AN L4 High Value Scenarios | v2.4.0 (2026) | E-2026-09-19-47 | §4.3.1 (I-AADE fault loop), §4.3.4.4 | the "Core Network Fault Management" L4 scenario: KEI **MTTR ≤ 15 min**, KBI major faults/yr 0 (ADR-001 5(b)(vii)) | scenario targets are TM Forum's for a CSP core |
| **IG1343** AI for Observability & Service Assurance | v2.3.0 (Mar 2026) | E-2026-09-15-04 | in full | data-quality table §2.2.1 (CMDB reconciliation, timestamp provenance) → ADR-007 item 2 entry conditions | ML sections "not yet written" in-tier note |
| **IG1187** ODA Enterprise Risk Assessment | v2.0 | E-2026-09-19-47 | by structure | STRIDE/CAPEC/OWASP on ODA trust boundaries → ADR-012 item 1 | — |
| **TR290** Intent Common Model (cover) | v3.0.0 | E-2026-09-19-37 | cover only | names the series TR290A/B/V | the model documents themselves not held |
| **TR292** Intent Ontology overview | v3.6.0 | E-2026-09-19-38 | §2.1 | the federation of graphs; open to SDO/CSP/vendor extension — rule (xi)'s licence | graphs not held (B7) |
| **TR292B** Intent Management State Machines | v3.0.0 | E-2026-09-19-39 | ch. 6 | `StateIntentReceived` etc.; timeout → `IntentRejected` — the safe default of the class-3 hold | — |
| **TR292C** Intent Functions | v3.6.0 | E-2026-09-19-42 | in part | staleness governance via `fun:` functions over observations | — |
| **TR292I** Security Ontology | *as reported* (arXiv 2605.27743 v1/v2) | E-2026-09-19-40 | preprints | `sec:SecurityExpectation` with `sec:impactValue` — the cyber-exclusion gate's ontology form | not the TM Forum text |
| **TMF921** Intent Management API | v5.0.0 (Beta) + OpenAPI + CTK | E-2026-09-19-34 | spec, examples | `ProbeIntent`; intent as RDF validated against the TIO; 24 `icm:` terms | Beta / pre-production |
| **TMF921A** Intent Management API Profile | v1.1.0 | E-2026-09-19-37 | in part | the Judge/Preference exchange — the class-3 hold as an operation | — |
| **TMF639** Resource Inventory | v5.0.0 + OpenAPI | E-2026-09-19-33 | `intent`, `externalIdentifier` | the resource ↔ intent ↔ RINF-IRI link | — |
| **GB922** SID | v24.5 (Excel v24.0/24.5; TMF434 poster v26.0) | E-2026-09-19-41 | ABE level + Intent/ClosedLoop/Anomaly/AIModel/Alarm/Party | `ClosedLoop.whyInvoke`, `Anomaly.prescribedAction` — OSS-level provenance fields | association model not in the Excel |
| TMF441 eTOM poster; TR263D | v26.0; R17.0.1 | E-2026-09-19-47 | by structure | context only | — |
| **Race to 2030** press release; **ANLAV** price list and scenario catalogue | — | **E-2026-09-24-01, -02** | search-verified; pasted list | the audit exists; 14 scenarios, one ANLET each; GB1523B = the register's Maintenance scenario | press text and questionnaires not held (B21) |

### 2.2 3GPP

| Document | Version held | Row | What was read | What it gives the register | Bound |
|---|---|---|---|---|---|
| **TR 28.909** Study on evaluation of AN levels | V18.0.0 (2024-05, ETSI TR 128 909) | **E-2026-09-24-04** | in full | qualitative level per task (28.100) is standard; **the score is not** ("ANLS does not need to be normalized"); fault-management KEIs = per-phase recovery time cost; "high-speed rail" as an *environment* | informative study; relies on 28.100 |
| **TS 28.312** Intent driven management services | V20.0.1 (2026-06) | E-2026-09-19-06 | lifecycle, §4.6.3, §5.3.4.3–4 | RECEIVED → EVALUATING → FULFILLING; pre-evaluation as the one phase that changes nothing — where the class-3 hold attaches; suspension conflict-resolution (CON-4) | no human role, no approval state |
| **TS 28.535** Communication service assurance; requirements | V19.0.0 (2025-09) | E-2026-09-19-11 | §4.2.5–6, §6.2 (22 requirements) | closed vs open loop; only three consumer constraints (CON-16 action set, CON-17 gate, CON-20 pause); escalation is informed-after-the-fact; loop coordination delegated to **GS ZSM 009-1** | — |
| **TS 28.536** Communication service assurance; stage 2/3 | V19.2.0 (2025-09) | E-2026-09-19-12 | in part | the deny list / assurance-loop objects as DNs | — |
| **TS 28.104** Management Data Analytics | V20.0.0 (2026-06) | E-2026-09-19-08 | in part | the analytics half of the management plane | — |
| **TS 28.105** AI/ML management | V19.6.0 (2026-06) | E-2026-09-19-08 | clause 4 concepts + | ML lifecycle management objects — model provenance evidence for ADR-012 | — |
| **TS 28.541** 5G NRM | V20.3.0 | E-2026-09-19-30 | IOC inventory | `AMFSet`, `NetworkSlice`, `ServiceProfile.availability` … the DNs the rules are written in | vendor-neutral model |
| TS 28.622 / 28.623 / 28.532 / 28.550 / 28.552 / 28.554 / 28.111 | V20.3.0 / V20.2.0 / V20.1.0 / V19.3.0 / V20.3.0 / V20.2.0 / V19.5.0 | E-2026-09-19-30, -32 | generic NRM, provisioning, PM, KPI catalogue, alarm model | `notifyHeartbeat`; **no end-to-end availability KPI exists** (28.554); X.733 probable causes | — |
| TS 29.510 NRF | V20.0.0 + OpenAPI | E-2026-09-19-32 | §5.2.2.3.2 | the SBA heart-beat trigger — PR11's counter | — |
| TS 23.501 / 23.502 | V20.2.0 | E-2026-09-19-05 | 5.15/5.16/5.21.2/5.22/5.33.2/5.40 | detection unspecified; redundancy outside 3GPP; slicing; disaster roaming's limits | — |
| TS 22.261 | (Rel-18) | E-2026-08-01-23 | service requirements | availability definition referenced by `ServiceProfile` | — |

### 2.3 ETSI

| Document | Held | Row | What it gives the register | Bound |
|---|---|---|---|---|
| **White Paper 64** — AI in ENI to increase autonomous operation | 1st ed., Nov 2024 | E-2026-09-15-05 | **the level table (Table 2.1) — L4 "decision typically needs human approval", L5 machine self-decision**; the *Urgent* shortcut that bypasses planning; twin use case | non-normative; the table is *from* GR ENI 007/010, which are not held |
| **White Paper 69** — AI in the evolution of AN | 1st ed., Nov 2025 | E-2026-09-15-06 | §3.2 "ongoing challenge"; §4.2.6 four-mode spectrum ending "critical infrastructure under direct human control"; §5.2.2 twin manipulation; §5.4 rec. 6 continuous audit | 23 authors, Huawei ×6 |
| **White Paper 71** — AI-native infrastructure | 1st ed., May 2026 | E-2026-08-02-13 | intent-driven, multi-agent, closed-loop OAM as vision | vision paper |
| White Paper 62 — Communications security vision | May 2024 | E-2026-08-02-14 | security spine context | tangential here |

---

## 3. The four questions, answered by each body from the held texts

| Question | TM Forum (held) | 3GPP (held) | ETSI (held) | The register's position |
|---|---|---|---|---|
| **What is a level?** | IG1230 Table 4: per task group (Execution · Awareness · Analysis · Decision · Intent), P / P-S / S per level; IG1218F: L3 = delivered automatically, reviewed manually; L4 = no manual review | 28.100 defines it per workflow task by "participation of the human and telecom system" — **known only through TR 28.909's summary** | GR ENI 007/010 L0–L5 — **known only through WP 64's Table 2.1**: L4 needs human approval, L5 does not | ADR-002 ladder: class 1–2 on-the-loop, class 3 human-gated act, class 4 act never inside the layer |
| **How is it scored?** | IG1252 Method 1 (weighted mean of task levels) or Method 2 (Lbase + weighted Lextra); they differ by 0.36 on IG1252's own example | TR 28.909 §7.1: the qualitative level is standard, the score "does not need to be normalized" | nothing on file | `16-ig1252-self-score.md`: specified 2.58 / as-built 1.31, now labelled Method-2-approximate; A15 re-score |
| **What is measured beside it?** | IG1256 KEIs: Availability Ratio, MTTR, FHOR, Major Faults; IG1339: MTTR ≤ 15 min for core FM | TR 28.909 §6.3: per-phase recovery time cost (recognition · demarcation · root cause · mechanism analysis · action evaluation/determination · execution), on-time count, total | nothing on file | A15 step 15.6; act A5's gate time box is the fifth phase |
| **Who audits?** | ANLAV — one ANLET questionnaire per scenario; 40 certifications / 17 organisations (DTW 2026) | none — 28.909 recommends no normative work on evaluation or KEIs | none | the self-score names its audit (GB1523B) and its gap (no scenario for fallback proposals on a safety bearer) |
| **Where is the human?** | IG1253 §5.8 approval as an intent expectation; TMF921A Judge/Preference; TR292B timeout → rejected | 28.312 pre-evaluation; 28.535 CON-16/17/20; 28.535 escalation = informed after the fact | WP 64 L4 approval; WP 69 "direct human control" mode | class-3 hold in pre-evaluation / Judge-Preference; class 4 never an intent (ADR-002 item 9; ADR-004 boundary) |

**Reading across the row "What is a level?":** the register quotes two of the three level definitions **second-hand**. TS 28.100 through TR 28.909; GR ENI 007/010 through WP 64. Thread 4 of the knowledge-plane note ("the SDO's own level table puts the human where the register puts them") rests on the ETSI quotation. That is the inventory's main finding.

---

## 4. Inventory — missing, ranked by what the absence blocks

| # | Document | Body | Why it is missing | What it blocks | Act |
|---|---|---|---|---|---|
| 1 | **TS 28.100** "Management and orchestration; Levels of autonomous network" (Rel-19/20) | 3GPP | never fetched; only named today by TR 28.909 | the *standardised* qualitative reading of the Maintenance flow (A15.1) — the one part of the evaluation 3GPP says is normative; a 3GPP-form level beside the TM Forum one in ADR-002's level statement | **B22** (opened 2026-09-24) |
| 2 | **GB1059** ANLET v1.0.0 · **GB1523B** Core Network Fault Management questionnaire v2.2.0 · **IG1523B** solution package v1.1.0 · **GB1524B** Core Network Change Management | TM Forum | member-gated (search snippets) | comparability of the self-score with an audited one: the task list, sub-scenarios, weights and per-task criteria ANLAV actually applies; the two 23-June scenarios (fault-type / change-type) | **B21** |
| 3 | **GR ENI 007** (AN levels categorisation) · **GR ENI 010** (evaluation of categorisation and levels) · **GS ENI 005** (ENI architecture) | ETSI | never fetched; the level table is on file only as WP 64's reproduction | Thread 4's "the SDO's own level table" claim is second-hand; the ENI *Urgent* shortcut (the mechanism ADR-012 items 2/3 answer) is likewise second-hand | **B23** (opened 2026-09-24) |
| 4 | **GS ZSM 009-1** closed-loop automation enablers (and ZSM 002 architecture) | ETSI | delegated to by 28.535 §4.2.6; never fetched | loop *coordination* — relevant once the oversight layer runs more than one loop over the same objects (ADR-007 item 7 cross-domain) | B23 |
| 5 | **TR290A/B/V, TR291A–G, TR292A/D–H, TR299** as RDF; **TR292I** normative text | TM Forum | member-gated; TR292I via preprints | **build, not decision** — validating an intent the layer writes; the rule-(xi) extension model against real superclass IRIs (A14) | B7 |
| 6 | **Race to 2030** press text · **AI-native ODA roadmap** · ANLAV method page | TM Forum | search-verified, not fetched | none load-bearing; context for B21 | B21 |
| 7 | **TS 28.530** Management and orchestration; concepts | 3GPP | named only as "not referenced by FFFIS-7950" | nothing — listed so it is not fetched by mistake as if load-bearing. **Correction 2026-09-26 (E-2026-09-26-08): its sibling TS 28.533 V20.1.0 *was* fetched and is load-bearing for the *architecture* (not the level) — §5.3 maps 3GPP's management domains onto ETSI ZSM's, A.10 places intent handling in ZSM's intelligence group and the assurance loop in control, A.11 gives a thirteen-function Release-20 reference model; consumed by `17-open-autonomy-framework.md` §4. 28.530 itself stays unfetched.** | — |
| — | **A rail-domain level criterion set** — the "domain-specific standard organization" IG1256 and TR 28.909 defer to | *no body* | **does not exist**: no UIC, ERA, UNISIG or ETSI TC-RT text defines task contextualisations or level criteria for fault management on a safety-critical bearer | this is not an acquisition gap but the L5–L3 void of `pivot-notes-2026-09-19-ontology.md` seen from the scoring side; the register's stated convention is, on file, the only rail-side statement | candidate *influence* act, same tier as A3′/A13 — parked, lead's decision |

---

## 5. What this inventory says for the register

1. **No decision moves.** The topic's positions (ADR-002 ladder; ADR-004 boundary; the self-score's bound on class-3/4 tasks) rest on documents that are held and read: IG1230, IG1252, IG1253, IG1256, TMF921/921A, TR292B, TS 28.312, 28.535, 28.536. Nothing missing changes them.
2. **Two level definitions are quoted second-hand, and one of them carries a thread.** TS 28.100 via TR 28.909; GR ENI 007/010 via WP 64. B22 and B23 close that. Until then, Thread 4's ETSI sentence should be cited as "per WP 64's reproduction of GR ENI 007/010".
3. **The score is method-stated and, by 3GPP's own conclusion, must be.** IG1252 gives two methods; 28.909 says the score is the evaluator's. The register's convention is legitimate as long as it is stated — it now is (§2 annotation of 2026-09-19 note) — and A15 restates it on IG1252 Method 2 proper.
4. **The audit exists and names the register's scenario.** GB1523B for the Maintenance flow; GB1524B for ADR-011. No scenario exists for the thing the guardrail makes distinctive — fallback proposals on a safety bearer with the act withheld. That absence is a fact to state to anyone who asks for "the level", not a defect to fix.
5. **ETSI is on file only as opinion.** Four white papers, zero Group Reports or Specifications. Everything ETSI-sourced in ADR-002 and the knowledge-plane note is tiered accordingly and should stay so until B23.
6. **Housekeeping, load-bearing:** four sittings unfrozen; cut the baseline before quoting any decision-health number for this week.

---

## Source-discipline note

All rows are `current/evidence-log.md` ids; versions are as logged at each row. "Held" means the file was in the Download folder and was read to the extent the row states; "by structure" means table of contents and headings only. Search-verified items (E-2026-09-24-01/-02) are not held. The absence of a rail-domain criterion set is asserted only over the texts the register holds — UIC FRMCS v2.1 set, ERA ontology and ISS, ETSI TC-RT interworking specs — and would be withdrawn on sight of one.
