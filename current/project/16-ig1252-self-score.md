# IG1252 self-score of the oversight layer — AN level per task contextualisation

**Date:** 2026-09-19 · **Act:** `14-next-acts.md` A9 · **Evidence:** E-2026-09-19-46 · **Method:** TM Forum IG1252 v1.2.0 §5.1.2–5.1.3, §5.3.1 (qualitative assessment per task contextualisation, 1.0–5.0; task = mean of its contextualisations; flow = mean of its tasks), level characteristics from IG1252 Table 4-2 / 4-4 and IG1230 v1.1.1 Table 4 (P/S per task group). **Status:** self-assessment by the register, not an audited evaluation; the scoring convention in §2 is ours and is stated so it can be disputed.

## 1. Evaluation object (IG1252 §5.1.2)

- **Service / network:** the FRMCS (and interim GSM-R) bearer of the case-study infrastructure manager, as ADR-001 scopes it.
- **Operation flows:** IG1252 Table 5-1 — *Maintenance* (fault management, the 23-June class of event), *Optimization* (fail-soft / fallback proposals), *Planning* (architecture and procurement decisions), *Inventory management* (the register itself as the decision plane, ADR-014).
- **Tasks:** one per agent of ADR-002 item 3; each decomposed into the contextualisations the register has actually specified (an agent with no specified context is not scored).
- **Responsible subject per task:** named in the table, because IG1252 §5.1.4 ties every score to one management-responsibility subject.

## 2. Scoring convention (ours, stated)

IG1230 Table 4 grades five task groups (Execution, Awareness, Analysis, Decision, Intent) as P (people) / P/S / S (system) per level. A contextualisation's score is **the highest level whose five row requirements are all met**, **+0.5** when the Awareness *and* Analysis rows already meet the next level's requirement. This makes the scale's bias visible rather than hiding it: IG1230 raises Execution to S at L2 and Decision to S at L4, so **a layer that by design leaves decision and actuation with a human cannot score above L3 on a class-3 task and above ~L1.5 on a class-4 task, whatever its detection quality.** That is the guardrail ("autonomous oversight, not control") priced in the industry's own currency — and it is the point of scoring rather than asserting.

Two scores per contextualisation: **specified** (what ADR-002 and its sibling ADRs specify the layer to be) and **as-built today** (what exists on 2026-09-19: no bearer-facing agent is deployed; ADR-002 item 5's eval harness and ADR-007 item 1's replay corpus are open; the register-facing agents run in this engagement's daily loop as tool-assisted drafting reviewed by a human).

## 3. Scores

| Flow | Task (agent) | Task contextualisation | Rows at specified design (E/Aw/An/D/I) | **Specified** | **As-built** | Responsible subject | Where specified |
|---|---|---|---|---|---|---|---|
| Maintenance | Anomaly/Fault Agent (class 4 when it gates a safety action) | (1) Central-SPOF signature: nationwide-simultaneous loss ≠ RF fault (R3) — RSR per AMF set falls while `NFS.UpdateReq` continues | S / S / S / P / P | **3.0** — L3 met (Decision P/S: human decides on the signalled signature), L4 needs Decision S → never by design | 1.0 | IM network operations (duty manager) | ADR-002 item 3; ADR-007 item 3 class 1 |
| Maintenance | Anomaly/Fault Agent | (2) Silent-fault detection through out-of-band supervision (PR11): the element's self-report is not the only evidence | S / S / S / P / P | **3.0** | 1.0 | IM network operations | PR11; ADR-002 ladder (28.535 escalation) |
| Maintenance | Anomaly/Fault Agent | (3) Liveness loss on the two 3GPP heartbeats (NF→NRF `NFUpdate`, MnS `notifyHeartbeat`) classed as *process liveness only*, not service availability | S / S / P/S / P / P | **2.5** — L2 met, awareness at L3 (dynamic policy), analysis still needs human correlation | 1.0 | IM network operations | ADR-001 item 5(b)(vii); PR11 |
| Optimization | Resilience Orchestration Agent (class 4: proposal only) | (4) Multi-bearer fallback proposal under the V2 static MPF policy (SRS v2.1 §12.3) — the human actuates | P / S / S / P / P | **1.5** — L1 met (Execution P/S); L2 needs Execution S, which the guardrail forbids | 1.0 | IM network operations; safety authority for class A–C movement | ADR-001 item 5(b); R4 |
| Optimization | Resilience Orchestration Agent | (5) Degraded-mode proposal keeping safety-critical voice and movement authorities alive locally (R4) | P / S / S / P / P | **1.5** | 1.0 | IM operations control; RU operations | R4; ADR-007 surface 3 |
| Planning | Risk Sentinel (class 1–2, on-the-loop) | (6) Obsolescence / supply / recurrence signal before a threshold is crossed | S / S / S / P/S / P | **3.5** — L3 met; awareness and analysis specified as model-driven (L4) | 1.0 | Engagement lead; IM asset management | ADR-002 item 3; ADR-009 |
| Planning | Bid/Procurement Agent (irreversible / financial, in-the-loop) | (7) RFP scoring with concentration / lock-in flags and source-trust tiers (R8) | S / P/S / P/S / P / P | **2.0** — L2 met; Decision P by design (approval before action) | 1.0 | Procurement; ARB for ADR-012 gate criteria | ADR-002 item 3; ADR-012 |
| Inventory | Architecture Decision Agent (class 1–2, ARB decides) | (8) Re-evaluate ADR options when an evidence row lands; draft the delta; route to the ARB (the daily loop of this register) | S / S / S / P/S / P | **3.5** | **2.5** — today: drafting is system-executed, awareness/analysis tool-assisted with a human reading every source (P/S), decision human; L2 met, awareness at L3 | Engagement lead; ARB | CLAUDE.md daily loop; ADR-014 |
| Inventory | Assurance Agent (class 1–2) | (9) Map each decision to CCS TSI / CENELEC / NIST AI RMF / EU AI Act; emit the evidence chain (item 7) | S / S / S / P/S / P | **3.0** | **2.0** — the chain (`13-legal-binding-chain.md`, matrix) is produced and kept by hand with tool assistance | Engagement lead | ADR-002 items 3 and 7; ADR-003 |

**Aggregation (IG1252 §5.3.1.2).**

| Flow | Tasks | Specified | As-built |
|---|---|---|---|
| Maintenance | Anomaly/Fault (mean of 3.0, 3.0, 2.5) | **2.83** | 1.00 |
| Optimization | Resilience Orchestration (1.5, 1.5) | **1.50** | 1.00 |
| Planning | Risk Sentinel 3.5 · Bid/Procurement 2.0 | **2.75** | 1.00 |
| Inventory | Architecture Decision 3.5 · Assurance 3.0 | **3.25** | **2.25** |
| **Evaluation object (mean of the four flows)** | | **2.58** | **1.31** |

## 4. What the number says, and what it does not

1. **The asserted claim is corrected.** ADR-002 ladder paragraph (b) said "L3 on IG1230's scale, with L4 awareness and analysis". Scored, the *specified* layer is **2.6** — L2–L3 — and the *as-built* layer is **1.3**. The per-row statement in (b) was right (Awareness/Analysis at L3–L4, Decision at L3 for classes 1–2 and pinned at P for classes 3–4); the one-number summary "L3" was not, because IG1252 averages the flows the guardrail deliberately holds down. ADR-002 (b) is restated on this score (E-2026-09-19-46).
2. **The low Optimization score is the guardrail, not a defect.** 1.5 is what "the agent advises, never actuates" costs on a scale that rewards automated execution. Raising it means moving actuation into the machine, which R4/ADR-002 forbid for class-4 objects. This is the number to show anyone who reads "L3 oversight layer" as a promise of an L3 network.
3. **The Inventory flow is the only one with as-built evidence, and it is this register.** Its 2.25 is earned by the daily loop (drafts system-written, every source read by a human, the ARB deciding) — the honest reading is that the engagement is already running the class-1–2 pattern it specifies, at L2–L2.5, with the dissent/accuracy metrics of ADR-010 not yet measured on it.
4. **The gap between 2.58 and 1.31 is the build.** It closes through ADR-007 item 1 (replay corpus), ADR-002 item 5 (harness), ADR-007 item 2 (shadow-on-legacy) — in that order, because IG1252 scores production flows and nothing bearer-facing exists to score until shadow mode runs.
5. **Not scored:** the Intent/Experience row beyond P (no intent interface exists until the TMF921/28.312 form of the ladder is built — ADR-002 item 9); cross-domain contextualisations (ADR-007 item 7); anything on the RU side.

## 5. Re-score triggers

Re-score when: (a) shadow-on-legacy is live (ADR-007 item 2) — first as-built Maintenance score; (b) the eval harness reports dissent and accuracy on the Architecture Decision Agent (ADR-010) — turns the Inventory as-built figure from self-assessed into measured; (c) the ARB moves any class boundary (then the specified column changes); (d) ADR-002's quarterly review date.
