# Pivot notes — knowledge plane source pack

**Date:** 2026-09-15 · **Pivot state:** `current/` at 466 rows (`E-2026-09-15-06` last); freeze the day's `_HHMM` cut after this sitting and re-point here. · **Siblings:** `pivot-notes-2026-07-02.md` (outage + oversight boundary), `pivot-notes-2026-09-15-security.md` (security spine). Companion prompts: `pivot-prompts-2026-09-15-knowledge-plane.md`.
**Purpose:** the threads the register can carry into articles and letters on the **knowledge plane** — the layer the telecom SDOs now say autonomous-network agents must reason *over* — and what it means for an oversight layer over a rail bearer. The trigger was one sponsored report (E-2026-09-15-03); the material is the whole day's read (E-2026-09-15-03..-06) on top of the intent/management-plane thread the register has carried since August (`sdo-mapping-frmcs-gsmr-5gsa.md` §1b, E-2026-08-01-39, E-2026-08-02-13, E-2026-08-03-02..-08). **This is the pivot: the register spent August establishing that FRMCS inherits a management plane it does not mandate, and today established that its own six agents have no named grounding layer — while holding that layer's proto-form in three working notes.**

**Outcome anchor for every piece:** *safe, continuous rail operations.* A knowledge plane matters here for exactly one reason: on 23 June nobody could tell, fast, that a nationwide-simultaneous loss was a core fault and not a thousand radio faults. That is a topology question, and topology is knowledge, not data.

**The guardrail, restated:** oversight, not control. A knowledge plane grounds *advice*; it never grounds an actuation the human did not command (ADR-002; ADR-004 keeps the certified kernel independent of it).

---

## Thread 0 — Grounded, not just fed: the agents were specified by inputs, not by what they reason over

**Layman claim:** Every AI agent in the oversight design was described by what it reads — telemetry, bid documents, the register. None was described by what it *knows*: which base station hangs off which controller, which controller off which core, which core off which switch. Without that, an agent watching a nationwide outage sees ten thousand alarms; with it, it sees one. The telecom industry has now given that missing layer a name — the knowledge plane — and the register already holds its first draft in three working notes it never called a layer.

**Chain:** **ADR-002 item 3** (six agents, "principal inputs" column — no grounding layer) → **ADR-002 item 9** (opened 2026-09-15: topology · state · semantics · ontology, provenance per fact, staleness governance, store-as-attack-surface) · **E-2026-09-15-03** (TM Forum: *"grounded in knowledge and not just data"*; knowledge plane = topology, state, semantics, ontology; processes: storage, ingestion, knowledge creation, improvement, federation, retrieval via MCP/A2A) · **the proto-layer on file:** `project/gsmr-e2e-equipment-map.md` (hardware · vendors · governing specs, every row tiered), `project/finding-dbinfrago-rel4-core-architecture.md` (DB's core is Rel-4 BICN — the topology fact that makes 23 June a core question), `project/master-architecture-reference.md` (component catalogue + 3GPP-release evolution) · **R3** (detect the central-SPOF signature: *nationwide-simultaneous ≠ RF*) · **R4** (fail-soft needs the dependency chain) · **E-2026-09-15-06** (ETSI WP 69: agents *"require protection against adversarial inputs"*; twin-manipulation case) · **E-2026-09-19-23** (added 2026-09-19 — the "ontology first, then data mapped onto it" pattern has an in-sector, in-law instance: the **ERA Ontology**, OWL/SKOS/SHACL on ERA's public GitLab, a technical document under Dir 2016/797 Art 4(8) published with the Telematics TSI 2026/253, bi-directionally change-controlled, federated by domain (RINF/ERATV/EVR/telematics); ADR-002 item 9 now extends it at register level and bounds it — no CCS/FRMCS concept in it, so below register level the ontology is the operator's).

**Why it opens:** it is concrete, it is the register's own finding, and it turns a fashionable telecom term into a rail operational need with a date attached. It also makes the modest point: the first knowledge graph is not a platform purchase, it is the three notes reconciled against live configuration on a stated date.

**Limits:** ADR-002 item 9 is open — a specification target, not a built thing. The three working notes carry C-tier rows (trade press) for the DB-specific estate; a knowledge plane is only as strong as its weakest cited tier, which those notes say on their first page. No oversight layer exists to ground.

---

## Thread 1 — Stale and settled look identical from outside: the knowledge plane inherits the register's own failure mode

**Layman claim:** This register learned the hard way that a decision nobody has re-read looks exactly like a decision that is still right (338 rows, 0 ratified ADRs, both founding decisions silently wrong on 2026-08-15). A knowledge plane has the same disease: a topology fact nobody has re-verified looks exactly like a current one, and an agent will reason from it with full confidence. The fix is the same fix — every fact carries who said it, when, and when it was last checked; a fact with no last-verified date is treated as unverified.

**Chain:** `evidence-log.md` rule 4 + `linkedin-post-decision-drift.md` (the 2026-08-15 drift finding) · **ADR-001/ADR-002 "Next review due"** dates (the register's own staleness governance for decisions) · **ADR-002 item 7** (seven-field evidence chain per decision — provenance for outputs) → **item 9(ii)/(iii)** (provenance and staleness for the *inputs*) · **E-2026-09-15-03** (TM Forum challenge 8: *"traceability, the potential for outdated or 'stale' knowledge and a lack of trust in source data … new workflows to track provenance"*) · **E-2026-09-15-04** (IG1343 §2.2.1: CMDB not reconciled with live configuration; data not time-stamped at generation is unusable for root-cause; *"Analytics & AI cannot overcome these problems with data"*) · **ADR-007 item 2** (three telemetry-quality entry conditions added 2026-09-15: timestamp provenance, resolution vs signature timescale, inventory reconciliation) · **E-2026-09-15-06** (ETSI WP 69 §5.4 rec. 6: continuous auditing of the "choices" made by AI, for traceability and *"identifying responsibilities"*).

**Why it matters:** it is the thread where the register's method and the technology converge — the evidence log *is* a knowledge plane with provenance and trust tiers, and its 2026-08-15 lesson is the design requirement. A policy audience gets the point without any technology: unattended knowledge is not stable, it is stale.

**Limits:** the register's own drift lesson is an internal governance finding, not a measured industry statistic. IG1343's data-quality table is written; its ML sections are not (in-tier note on E-2026-09-15-04). "Provenance workflows" in the TM Forum report are a challenge statement, not a method.

---

## Thread 2 — Knowledge is a kind of data, so it is a product with digital elements, so it is an attack surface

**Layman claim:** If an oversight layer reasons over a store of facts about the network, then whoever can write to that store can steer the advice. Poison the topology and the agent proposes the wrong fallback; the human, trusting the advice, acts on it. The telecom SDO has already written the worked case: an attacker edits a 5G core's digital twin and the operator reroutes traffic on a false congestion prediction. In this register the store is part of the oversight software, which is in Cyber Resilience Act scope — so the store gets the same secure-by-design, integrity and audit obligations as a cab radio.

**Chain:** **E-2026-09-15-06** (ETSI WP 69 §5.2.2 — the twin-manipulation case; mitigations: access control, cryptographic integrity verification, anomaly detection inside the model) · **E-2026-09-15-03** (TM Forum challenge 7: *"malicious introduction of data, exposure of sensitive data across interconnected … knowledge stores, increasing difficulty when auditing these stores"*) · **ADR-002 item 9(iv)** (store as attack surface, re-anchored on WP 69) · **ADR-002 §5 anti-laundering** (a Risk Sentinel alert that becomes the basis of a degraded-mode decision has entered class 4) · **ADR-012 Decision item 1** (the agentic-oversight layer is itself a PDE in CRA scope) · **ADR-007 surface 6** (abuse-case → attack-graph; the poisoning class named for it) · **E-2026-09-05-13** (`SP-SEC-ServSpec` LOG service; `SuppEssFunc` for the availability cost of integrity controls) · `pivot-notes-2026-09-15-security.md` Thread 7 (the watcher is a product too).

**Why it matters:** it closes the loop between the security pivot and this one — the knowledge plane is where "the watcher is a product" becomes specific. It also pre-empts the obvious objection to a knowledge graph in a safety context ("you have created a single place to lie to the system") by stating it first.

**Limits:** no store exists; the threat class is named, not modelled. ETSI's case is a congestion/rerouting example in consumer 5G, transplanted here by analogy to fallback proposals. The SP-SEC LOG service is read at scope, not requirement-by-requirement.

---

## Thread 3 — The management plane FRMCS inherits but does not mandate

**Layman claim:** FRMCS is a profile of consumer 5G. It mandates the radio, the mission-critical services and the security — and says nothing about how the network is managed. The intent-driven, knowledge-graph-backed management plane the telecom SDOs are building (3GPP SA5, ETSI ENI/ZSM, TM Forum) arrives with the 5G core as an operator capability, unmentioned by any rail specification. That is not a defect; it is a seam — and it means the rail operator, or the public MNO it buys service from, decides how autonomous the management of a safety-relevant bearer becomes, with no rail rule in the way.

**Chain:** `sdo-mapping-frmcs-gsmr-5gsa.md` **§1b** (research → normative pipeline; the FRMCS→SA5 link marked *(inferred)*) · **E-2026-08-01-21** (UIC FFFIS-7950's reference list: MCX service layer + HTTP/2 + JSON, **nothing from SA5** — no 28.312, 28.530, NWDAF) · **E-2026-07-26-11** (ETSI TS 103 764: strata, procedures, security — no OAM clause noted) · **E-2026-08-03-03** (IRTF RFC 9315 Intent-Based Networking — inner autonomic loop + outer human loop) · **E-2026-08-03-02/-04/-05/-06** (NMDA RFC 8342 intended-vs-operational datastores; NETCONF; YANG 1.1; RESTCONF — the protocol substrate) · **E-2026-08-01-39** (ICOIN 2024 intent-driven 5G management — research layer, generic 5G, FRMCS link inferred) · **E-2026-08-02-13** (ETSI WP 71 AI-native infrastructure: intent-driven, multi-agent, closed-loop OAM — vision, not spec) · **E-2026-09-15-05** (ETSI WP 64: ENI cognition model, OODA-as-FSM with an AI planner; level table) · **E-2026-09-15-04** (IG1343: AN L3–L4 assurance; IG1218F/1251/1253/1256, TMF921A as the TM Forum frame) · **E-2026-09-06-03** (a vast majority of IMs intend public-MNO use — as redundancy, capacity, *"or even as the only network"*) · **E-2026-08-01-25/-24** (FRMCS-T, the EIM/CER-requested public-networks route) · **R9** (autonomy as a governable layer over the bearer, not inherent to it).

**Why it matters:** it is the answer to "how will FRMCS operators handle the management TM Forum describes?" — and the honest answer is that nothing on file says, because nothing in the rail spec set reaches it. For an IM consuming FRMCS-T from an MNO, the MNO's autonomous operations apply directly and the railway "handles" them through an SLA and a demarcation point nobody has yet specified.

**Limits:** absence in the reference lists the register holds is not proof of absence in the full UIC/ETSI corpus — the FRS "network operator" role sections and 5GRAIL's 39 deliverables have not been read for OAM. All three ETSI white papers are non-normative and vendor-weighted (Huawei). No operator statement on FRMCS operations doctrine is on file (acquisition list in the 2026-09-15 session notes).

---

## Thread 4 — "Remove the human" vs "decision needs human approval": the telecom sector is two-minded, and both minds are on file

**Layman claim:** Ask the telecom industry whether a Level-4 autonomous network keeps a human in the loop and you get two answers in the same month. A tier-1 operator's architect: *"We have to remove the human from the loop otherwise the network will get so complex that it is unmanageable."* The SDO's own level table: Level 4 = *"decision typically needs human approval"*; only Level 5 is machine self-decision. And the same SDO's 2025 paper calls human-machine collaboration frameworks *"an ongoing challenge."* The register's ladder sits where the SDO sits — with the rail-specific addition that safety-critical actuation never reaches Level 5 at all.

**Chain:** **E-2026-09-15-03** (Telstra quote; the report's own stack still places humans at the top *"in the loop as needed"*) · **E-2026-09-15-05** (ETSI WP 64 Table 2.1: L4 human approval, L5 machine self-decision; ENI's *Urgent* shortcut that bypasses planning and decision-making) · **E-2026-09-15-06** (ETSI WP 69 §3.2 *"ongoing challenge"*; §4.2.6 four-mode spectrum — recommendation-only → supervised → domain-restricted with *"critical infrastructure under direct human control"* → full) · **ADR-002 Decision** (HITL ladder by decision class; §Trade-off analysis — the counter-position recorded 2026-09-15) · **ADR-002 implementation-class rules 1–5** (learned components propose, verifiable components gate; anti-laundering) · **ADR-012 items 2/3** (no bypass on urgency for vital PDEs — the rail answer to ENI's *Urgent* shortcut) · **PR4** (automation bias; load bound) · **E-2026-08-19-01** (human-autonomy teaming: no left-over principle; deliberate hand-back).

**Why it matters:** it takes the sting out of the "you are behind the industry" objection by showing the industry has not decided — and that its own formal level definitions put the human where the register puts them. The rail difference is then a single, defensible sentence.

**Limits:** the Telstra quote is attributed opinion in a sponsored report; the ETSI level table is from a non-normative white paper citing GR ENI 007/010 (not on file). Neither is a rail position. ADR-002 is settled internally only.

---

## Thread 5 — A twin proves nothing about a network it does not mirror

**Layman claim:** Both SDOs want a network digital twin: test configuration changes on the copy before touching the real network, inject faults you could never inject live, regression-test after every patch. That is exactly what a rail change gate wants too — the pre-change test, the failover injection, the post-patch regression. But a twin is a claim about fidelity, and the SDOs concede the hard part is keeping the copy synchronised with the real thing. In rail, an untrusted twin is worse than no twin: it manufactures confidence in a change that then reaches a live safety-carrying element.

**Chain:** **E-2026-09-15-05** (WP 64 use case 2: twin-based verification of IP configuration changes before application; §4.5 the two-way synchronisation is *"arguably the most relevant"* unsolved challenge) · **E-2026-09-15-06** (WP 69 §4.1.5: pre-deployment testing, fault injection — *"injecting faults into a live network is impractical"* — security testing, regression after patches) · **E-2026-09-15-04** (IG1343: observability platforms *"creating a unified digital twin"* from time-synchronised telemetry) · **ADR-007** (pre-change gate; failover-injection surface; *"design-stage testing before metal exists — digital twin/testbed — fidelity flag applies"*) · **ADR-010 item 11** (the four-part simulation-credibility requirement, adopted 2026-08-20 from E-2026-08-20-29: toolchain credibility, model validity, scenario coverage, uncertainty statement) · **ADR-010 item 5** (ODD declared before any eval claim — *a claim outside the ODD is not a claim*) · **ADR-011** (Class A/B change control; the 23-June change-on-live-legacy lesson) · **ADR-012 item 3** (patch regression by population) · **E-2026-07-02-25** (DB's own admission that an isolated cold fallback cannot be fully end-to-end tested) · **E-2026-09-15-07** (ETSI TS 103 845 §4.6/§5.6 — the normative form of the fidelity claim: a twin *shall* model, monitor and expose its own **entanglement** — connection · speed · direction — and indirect or delayed twins are fit for analysis and prediction, *not* for control or live monitoring; added to ADR-002 item 9 as constraints (v)–(viii), by analogy from the IoT domain).

**Why it matters:** it gives the change-control argument a constructive tool and immediately bounds it — and the ETSI SmartM2M spec supplies the vocabulary to state the bound as a published property of the twin rather than a caveat in a footnote — the same discipline the register applies to simulation evidence for the oversight layer applies to the twin the management plane will offer.

**Limits:** no twin of the DB estate exists or is proposed; the SDO material describes consumer-network twins. ADR-010 item 11 governs simulation *credibility*, not twin *construction*. WP 64's figures for the twin use case are unreferenced and not adopted.

---

## Thread 6 — The data problem underneath: rail-native data is scarce, and the legacy stack cannot be retrofitted with context

**Layman claim:** A knowledge plane is only as good as what feeds it, and two findings on file cut against optimism. First, the legacy management stack rail runs today — the same FCAPS/SNMP lineage the telecom guide describes — does not timestamp at generation, averages performance into 15-minute bins, and cannot have context added after the fact. Second, rail-native training data is scarce enough that the safety research centre built its own open dataset and an automotive lab ported car-perception methods to rail for want of rail data. Grounding agents in knowledge presumes the knowledge can be built; in rail, that is the first engineering task, not an assumption.

**Chain:** **E-2026-09-15-04** (IG1343 §2.2.1 data-quality table; Appendix A on FCAPS/SNMP: context *"cannot be retroactively added once the data leaves the network"*) · **ADR-007 item 2** (the three telemetry-quality entry conditions, 2026-09-15) · **PR5** (telemetry insufficient to detect the central-SPOF signature — validated by 23 June) · **PR8** (incident replay not representative — DB root-cause telemetry unpublished) · **E-2026-09-03-02** (DZSF OSDaR23 — *"first publicly available multi-sensor dataset"* for rail, built because rail-native data was scarce) · **E-2026-09-03-01** (SynDRA-BBox — automotive-perception domain adaptation to rail) · **E-2026-08-19-13** (DZSF NIST-CSF survey: IMs at Detect 1.03 / Respond 0.69 on 0–5 — R12's awareness gap, measured) · **E-2026-09-15-03** (TM Forum challenge 5, legacy systems: *"poor data quality with limited real-time data delivery; proprietary interfaces"*; use-case criterion *"data that is sufficiently available and accurate"*) · **R12** (close the awareness gap).

**Why it matters:** it keeps the knowledge-plane story honest for a rail audience — the telecom industry's precondition ("high data quality is a prerequisite") is exactly the thing rail measures itself as lacking, so the first deliverable is instrumentation and reconciliation, not reasoning.

**Limits:** the DZSF survey scores come from a 6-page summary; the full report is not held. OSDaR23 is a perception dataset, not a network-telemetry one — it evidences the *pattern* of scarcity, not the GSM-R telemetry gap specifically. PR8 remains open until DB or the EBA publishes.

---

## Thread 7 — The register is a knowledge plane, and it is the one that already works

**Layman claim:** One of the six agents — the Architecture Decision Agent — reads "the register itself": 466 dated evidence rows, each with a trust tier, a source location, the requirements it touches, and an explicit answer to "did this move a decision?"; eleven decision records, the two load-bearing ones carrying review dates; a matrix tying requirements to decisions to status; a daily frozen baseline with a health block. That is a knowledge plane by the telecom definition — persistent, semantically structured, provenance-tracked, reasoned over — built by hand, in Markdown, and it has already caught its own drift once. The lesson for the network-side plane is not the technology; it is the discipline.

**Chain:** **ADR-002 item 3** (Architecture Decision Agent and Assurance Agent: inputs = *"the register itself — ADRs, evidence log, matrix"*) · `evidence-log.md` rule 4 (every row answers the decision question) · `traceability-matrix.md` (requirements ↔ decisions ↔ status — the spine) · `scripts/baseline.sh` + `CLAUDE.md` §Never (the 2026-09-04 corruption: 15 zeroed files across 7 baselines, caught because the health counters read the *frozen* copy — a worked case of *integrity verification of the store*) · **ADR-002 item 7** (seven-field evidence chain) · **E-2026-09-15-03** (knowledge plane purpose: *"a persistent store of knowledge that gives a model reliable context to reason over … reduces the chances of poor decisions, drift and errors"*) · **E-2026-09-15-06** (WP 69 §5.4 rec. 6, continuous auditing of AI choices) · `12-institutional-map.md` §6 and this day's three late finds (RSEG 09-05, ERORAT 09-10, VDV 09-15 — knowledge already on file or in the stakeholder map, unread).

**Why it matters:** it is the piece with the least technology and the most transferable content — how to run a knowledge base so that stale knowledge cannot masquerade as settled — and it lets the author speak from practice rather than from a vendor's diagram.

**Limits:** the register is small (hundreds of rows, not millions of telemetry points) and human-curated; it says nothing about scale, latency or federation. Its ARB is one person in a room. The 2026-09-04 corruption was caused by the register's own tooling and caught by its own control — both halves must travel together.

---

## What no piece may say

- That FRMCS specifies, mandates or forbids any management plane. It is silent (Thread 3).
- That any rail operator has stated how it will operate FRMCS in TM Forum's terms. None is on file.
- That a knowledge plane or digital twin of the DB estate exists or is planned. Neither is.
- Any figure from the ETSI white papers' use cases (70 %, 80 %, €130 m) or the vendor's "391 %".
- That the EU AI Act's high-risk regime is engaged for the oversight layer (ENI asserts knowledge graphs are "critical for compliance" — ADR-003's finding is that the regime is not engaged while the boundary holds; the classification stays `watch`).
- That ADR-002 item 9 is anything other than open.

## Source-discipline note

Four of the five documents behind this pack were in the download folder for weeks before they were logged (IG1343 since 16 July, WP 64/69 since 2 August); one had been named as a companion in an August row and never given a row of its own. The pack's Thread 1 is about exactly that failure mode, and the pieces should say so.

---

**Threads → requirements / ADRs:** T0 → R3/R4, ADR-002 items 3/9 · T1 → ADR-002 items 7/9, ADR-007 item 2, rule 4 · T2 → ADR-002 item 9(iv), ADR-012 item 1, ADR-007 surface 6 · T3 → R9, sdo-map §1b, ADR-001 item 5 (public-MNO) · T4 → R10, ADR-002 ladder + §Trade-off, ADR-012 items 2/3, PR4 · T5 → ADR-007, ADR-010 items 5/11, ADR-011 · T6 → PR5/PR8/R12, ADR-007 item 2 · T7 → ADR-002 items 3/7, CLAUDE.md §Daily loop.
