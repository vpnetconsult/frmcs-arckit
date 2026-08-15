# ADR-002: Agentic decision & oversight layer for the FRMCS transition

**Status:** Proposed
**Date:** 2026-06-24
**Deciders:** Infrastructure Manager CTO · ERTMS Programme · AI Governance / Risk · National Safety Authority interface · Architecture Review Board
**Last read back against evidence:** 2026-08-15 · **Next review due: 2026-11-15** (quarterly; load-bearing, and had gone 7 weeks without a read-back — see `linkedin-post-decision-drift.md`)
**Depends on:** ADR-001 (GSM-R → FRMCS transition)
**Downstream / related ADRs (added 2026-08-15 — this ADR previously referenced NONE of them):** ADR-003 (EU AI Act classification — **resolves this ADR's action item 1**) · ADR-004 (SIL-4 boundary / freedom-from-interference — polices the guardrail this ADR sets) · ADR-007 (testing & canary) · ADR-010 (eval strategy — the evaluation this ADR requires) · ADR-011 (migration change-control) · ADR-012 (cybersecurity conformance — the oversight layer is itself a product with digital elements)
**Tags:** agentic AI · NIST AI RMF · EU AI Act · human-in-the-loop · SIL-4 · governance

## Context

ADR-001 commits to FRMCS (5G SA + MCX) as a resilient, bearer-flexible transport. It does not, by itself, govern *decisions* — neither decisions about the architecture (the ADR, the RFP evaluation, the risk register) nor decisions within the running network (fault detection, fail-soft, bearer fallback). Today both are episodic, human, and slow: the 23–24 June 2026 DB GSM-R outage (incident-annex.md) was a roughly two-hour standstill in which a known, recurring risk had no agent watching it and no system authorised to act on it. That is a decision-and-governance gap, not only a radio gap.

A critical clarification carried from ADR-001: **5G/FRMCS is an enabler of autonomy, not autonomy itself.** The bearer provides the bandwidth, latency, and mission-critical services that make ATO and agentic decisions possible; autonomy is a separate layer riding on top, with its own governance. Conflating the two is how a programme buys "5G" and assumes resilience and autonomy arrived in the box.

## Decision

Introduce an **agentic decision & oversight layer** over the FRMCS bearer, split into two planes, with human oversight bounded by the reversibility and safety-impact of each action and a named human accountable for every decision class. Keep the SIL-4 safety kernel deterministic and outside the learning agents.

### Two planes

Decision plane — governs the architecture:
- `Risk Sentinel` — continuously ingests obsolescence signals, incident telemetry, supplier/market and spectrum/regulatory changes; maintains a live risk register; raises a decision-ready alert before a threshold is crossed. (Closes the "why nobody knew" gap — R12.)
- `Architecture Decision Agent` — re-evaluates ADR options when inputs move; drafts the delta; routes to the ARB.
- `Bid/Procurement Agent` — scores RFP responses against weighted criteria; flags vendor concentration/lock-in; attaches source-trust tiers to ingested claims. (R8.)
- `Assurance Agent` — maps each decision to CCS TSI, CENELEC, NIST AI RMF, EU AI Act; emits the audit/evidence chain.

Runtime plane — governs the live network:
- `Anomaly/Fault Agent` — detects the central-SPOF signature (nationwide-simultaneous ≠ RF) faster than a human duty manager. (R3.)
- `Resilience Orchestration Agent` — proposes fail-soft/degraded mode and multi-bearer fallback; does not actuate safety-critical state autonomously. (R4.)
- `Intent Agents (BIA/SIA/RIA)` — compile operational intent to CAMARA/network actions for reversible, non-safety actions.

### Human-in-the-loop model (oversight by decision class)

| Decision class | Example | Autonomy | Human role |
|---|---|---|---|
| Reversible, no safety impact | Re-score an RFP claim; refresh risk register | Autonomous | On-the-loop (audit) |
| Reversible, operational | Draft ADR delta; propose capacity slice | Human-on-the-loop | Can intervene; periodic review |
| Irreversible / financial | Award recommendation; fallback to public bearer | Human-in-the-loop | Approves before action |
| Safety-critical actuation | Movement authority; emergency stop; degraded-mode entry | Human-in-command | Human initiates; agent advises only — never autonomous |

### Non-negotiables

- The **SIL-4 safety kernel stays deterministic and outside the learning agent** (CENELEC EN 50126/28/29). The agent optimises and advises around a certified safety core; it does not become the safety core. (R11.)
- **Automation bias** is a designed-against failure: a human rubber-stamping agent proposals is not oversight. The model must make dissent cheap and the rationale legible.
- **Accountability does not transfer.** The agent never owns the decision; a person does.

## Options considered

### Option A — No agentic layer (status quo)
Episodic human decisions, reactive incident response.
**Pros:** nothing new to assure. **Cons:** reproduces the 23–24 Jun failure mode — known risk unwatched, no authorised fast action. Rejected as the target.

### Option B — Agentic layer, advisory-only across all classes
Agents propose; humans execute everything.
**Pros:** simplest assurance; no autonomous action. **Cons:** loses the speed benefit where it is safe and valuable (audit/operational classes); humans remain the bottleneck for reversible actions. Partial.

### Option C — Agentic layer with oversight bounded by decision class (recommended)
Autonomy where reversible and safe; human-in-the-loop where irreversible/financial; human-in-command for safety actuation.
**Pros:** speed where safe, control where it matters; certifiable core preserved; closes the awareness gap. **Cons:** requires a real AI management system (NIST AI RMF / ISO 42001) and eval/drift monitoring. ~~and an EU AI Act high-risk compliance posture~~ — **CORRECTED 2026-08-15: this ADR asserted a high-risk compliance posture as a settled cost. It is not. ADR-003 verified against primary law (Reg (EU) 2024/1689) on 2026-06-24 — the same day this ADR was written — that the layer AS ARCHITECTED HERE (oversight not control, non-actuating, human-in-command) sits OUTSIDE the high-risk perimeter: not high-risk as designed, conditional on the Art 3(14) safety-component test. See ADR-003 §Verification findings; evidence E-2026-06-24-07 (tier A).** Recommended.

## Trade-off analysis

The dominant trade is **speed of proposal vs autonomy of action**. The agent's value is fast, well-evidenced *proposals*, not autonomous safety action. Bounding autonomy by decision class captures the speed (replaying the outage: anomaly flagged in seconds, fallback proposed with predicted impact, duty manager approves a bounded action in one click) while the safety-critical halt/restart stays human-in-command. The two-hour standstill becomes a supervised, minutes-long degraded mode.

## Consequences

**Easier:** anticipation replaces *fassungslos*-after-the-fact (R12); fast, bounded resilience response (R3/R4); decision-ready briefs with named accountability.
**Harder:** a genuine AI management system, agent evaluation, drift and automation-bias metrics. **CORRECTED 2026-08-15 — the original text read "and EU AI Act high-risk obligations (Art 14 oversight, logging, transparency, risk-management system)", asserting high-risk as fact in breach of this project's standing rule that it must not be asserted until verified. ADR-003 verified it: NOT high-risk as designed. The Art 14 / logging / transparency / risk-management obligations therefore do NOT attach automatically — they attach only if the layer becomes a safety component. Adopting them anyway would be a self-inflicted conformity programme. What DOES remain binding is the design constraint that keeps it that way (ADR-003 action item 5): the layer must stay non-actuating and advisory, and any move toward actuation re-triggers the Art 6(1)(a) test.**
**To revisit:** the coupling/autonomy boundary per decision class as 3GPP MCX and model capabilities mature; ~~EU AI Act classification once verified against Annex I and the CCS TSI interface~~ — **VERIFIED 2026-06-24 in ADR-003 (Annex I §B item 17 via Rail Dir (EU) 2016/797; Art 6(1) two-part test; Annex III(2) covers road traffic NOT rail, so no independent trigger). Outcome: not high-risk as designed, conditional on the safety-component test. What remains to revisit is the CONDITION, not the classification — any design change toward actuation.**

## Action items

1. [x] ~~Verify EU AI Act high-risk classification for rail-control AI against Annex I + CCS TSI interface (load-bearing — do not assert until verified).~~ — **DONE 2026-06-24 in ADR-003, closed here 2026-08-15.** This item sat open for seven weeks after it had already been completed in a downstream ADR that this one did not reference. Outcome: **not high-risk as designed**, conditional on the Art 3(14) safety-component test. **Successor obligation (do not drop): carry the safety-component boundary as a verified design constraint — ADR-003 action item 5 — and re-run the Art 6(1)(a) test on any change that moves the layer toward actuation.**
2. [ ] Adopt NIST AI RMF (Govern/Map/Measure/Manage) as the operating spine; wrap with ISO/IEC 42001 + 23894.
3. [ ] Specify each agent's intended use, inputs, and decision class; bind to the HITL table.
4. [ ] Define the SIL-4 boundary: what the agent may read/advise vs what only the certified kernel may actuate.
5. [ ] Build eval harness: accuracy, drift, automation-bias / dissent-rate metrics; incident-replay tests.
6. [ ] Define the evidence chain the Assurance Agent emits for ARB and NSA.
