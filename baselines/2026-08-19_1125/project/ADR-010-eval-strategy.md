# ADR-010: Agent evaluation strategy — accuracy, automation-bias, and drift

**Status:** Proposed
**Date:** 2026-06-27
**Deciders:** Architecture Review Board · NSA / safety authority liaison · Vpnet engagement lead (assurance & evaluation)
**Depends on:** ADR-002 (agentic oversight layer), ADR-004 (SIL-4 boundary / automation-bias), ADR-007 (test surfaces supply the eval data), ADR-008 (autonomy-ladder authorisation)
**Affects requirements:** R10 (human oversight proportional to risk), R12 (awareness / detection), with bearing on R9 (autonomy governable) and R11 (certifiable safety case)

## Context

ADR-002's agents are **advisory** — oversight, not control, around a deterministic SIL-4 kernel they never actuate (ADR-004). But "advisory" is only safe under two measured conditions: **(1)** the advice is accurate enough and *stays* accurate, and **(2)** the humans around it actually exercise judgement rather than rubber-stamp it (automation bias — PR4, R10). Neither is safe to assume; both must be evaluated.

ADR-007 defines the test **surfaces** (incident-replay, shadow-on-legacy, fault-injection, canary-by-segment). A surface produces *data* — it does not by itself say whether an agent is good enough or fit to advance. The metrics and acceptance criteria that turn that data into a pass/fail and a ladder-promotion decision have no decision home: the former ADR-007 placeholder bundled "accuracy, drift, automation-bias, replay," but **replay** moved to ADR-007, **automation-bias** touches ADR-004/PR4, **drift** sits as risk PR6 — leaving **accuracy/eval unhomed** and the three eval dimensions scattered rather than coherent.

The autonomy ladder (ADR-008) also needs eval criteria to gate each rung; without them, "promote the agent" is a judgement call, not an evidenced one — the same assertion-instead-of-evidence trap ADR-007 rejects for the bearer, applied to the agents.

## Decision

Establish a single **agent-evaluation framework** of four measured dimensions, evaluated **continuously** and tied to the autonomy ladder (ADR-008), with **automatic demotion on breach**:

1. **Accuracy / quality, per agent role.** Risk Sentinel: detection precision/recall, decision-ready **lead-time before threshold**, false-alarm rate. Assurance agent: evidence-chain completeness/correctness. Measured against ground truth from **incident-replay + shadow-on-legacy** (ADR-007).
2. **Oversight effectiveness / automation-bias.** Human **dissent rate**, override rate, decision latency, and calibration (do humans correctly accept good advice and reject bad). This measures that R10's human-in-the-loop is *real*, not a rubber stamp (PR4). Counts toward Gate G4.
3. **Drift.** Monitor accuracy on the **daily baselines**; on threshold breach **auto-demote** the agent to a lower autonomy rung (advisory/shadow) until re-validated. Consolidates PR6 and gives it an automatic action.
4. **Eval gates per autonomy rung.** The evidence from (1)–(3) required to **promote** a rung (ADR-008) and the triggers that **demote**; no rung advance without an eval pass.

**Core principle: an advisory agent is only as safe as its measured accuracy *and* the measured effectiveness of the human oversight around it — evaluate both, continuously, and demote automatically on breach.**

## Options considered

### Option A — Leave accuracy/eval unhomed / ad hoc
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | Low |
| Safety/assurance | Weak — promotion becomes unevidenced judgement |
| Reversibility | n/a |
Pros: no framework to build. Cons: the assertion trap (ADR-007) applied to the agents; the safety case cannot cite eval evidence. **Rejected.**

### Option B — Single agent-evaluation framework (accuracy + automation-bias + drift), ladder-gated, fed by ADR-007 surfaces (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | Medium–High |
| Cost | Medium (reuses ADR-007 surfaces as data sources) |
| Safety/assurance | Strong — evidences both halves of "safe advisory" |
| Reversibility | High — auto-demote on breach |
Pros: ladder promotions become evidenced; R10/R12 measurable; drift gets an owner + automatic action. Cons: defining ground truth (depends on replay corpus, PR8); oversight-effectiveness instrumentation.

### Option C — Accuracy only (ignore automation-bias)
| Dimension | Assessment |
|---|---|
| Complexity | Medium |
| Cost | Low–Medium |
| Safety/assurance | Insufficient — an accurate advisor with rubber-stamping humans still fails |
| Reversibility | — |
Pros: simpler. Cons: leaves the dominant failure mode (automation bias, R10/PR4) unmeasured. **Rejected.**

## Trade-off analysis

The governing trade is **breadth of measurement vs eval cost/complexity**. Option C is cheaper but leaves automation bias — the failure mode by which even an *accurate* advisory system causes harm — unmeasured, which is precisely the residual risk ADR-004 flags and R10 exists to bound. Option B costs more but is the only one that evidences both halves of "safe advisory," and it reuses ADR-007's surfaces as data sources, so the marginal cost is the metrics/instrumentation layer, not a second test programme.

## Consequences

- **Easier:** autonomy-ladder promotions (ADR-008) become evidenced; R10's oversight proportionality and R12's detection quality are measurable; drift (PR6) gets an owner and an automatic demotion action; the safety case (R11) can cite eval evidence.
- **Harder:** defining accuracy ground truth (depends on the replay corpus — PR8); measuring automation bias well needs oversight-effectiveness instrumentation; continuous-eval infrastructure.
- **To revisit:** per-rung metric thresholds as evidence accrues; accuracy ground-truth fidelity once DB/EBA telemetry lands (PR8).

## Action items
1. [ ] Define per-role accuracy metrics + targets (Risk Sentinel: detection/lead-time/false-alarm; Assurance: evidence-chain).
2. [ ] Define oversight-effectiveness / automation-bias metrics (dissent, override, latency, calibration); tie to Gate G4 (PR4 / R10). **Add a SKILL-RETENTION measure (NEW 2026-08-19, E-2026-08-19-01):** dissent and override rates measure whether the human disagrees, **not whether they are still capable of doing the task unaided.** The ERA/DZSF human-factors position is that automation degrades the underlying skill unless the task is deliberately handed back during low-load periods for regular practice. Measure retained unaided capability, and treat a falling skill measure as a gate condition in its own right — an operator who can no longer perform the task is not exercising oversight regardless of what the dissent rate says.
3. [ ] Stand up drift monitoring on the daily baselines with auto-demote-to-shadow on breach (consolidate PR6).
4. [ ] Map eval pass/fail to autonomy-ladder rungs (ADR-008); no promotion without eval evidence.
5. [ ] **Adopt the DZSF assurance frame (NEW 2026-08-18, E-2026-08-18-07) — it is the NSA's own research centre's methodology, and this ADR currently has NO metrics defined.** Transplant four things: **(a) an ODD (Operational Design Domain)** for the oversight layer — where, under what conditions and against what data it is claimed to work; **(b) the scenario hierarchy** functional → logical → concrete, with concrete scenarios as the test cases (feeds ADR-007's surfaces); **(c) the COMPLETENESS ARGUMENT** — since exhaustive testing is impossible, define **evaluable, sufficiently evident completeness criteria** for coverage of the scenario space and a means of checking a test set against them; **(d) the CSM-RA §2.4 REFERENCE-SYSTEM benchmark** — measure the layer against quantified *human* performance on the same task, which is the route DZSF proposes for approving AI-based perception and is directly analogous to this engagement's dissent-rate and oversight-effectiveness metrics. Also adopt DZSF's **"What" vs "How"** split (is the task solved correctly / on what basis was the decision made) and the **interpretability vs explainability** distinction. **Provenance is the point: an eval strategy built on the safety authority's own research frame is far more defensible when this ADR goes to the NSA for ratification (item 6).** Note DZSF's own caution — poor detection scores may reflect the **data** rather than the model, so precise system requirements must precede performance assessment; that is **PR8 (ground-truth gaps) observed independently.** **Data and test discipline (NEW 2026-08-19, E-2026-08-19-05):** **(a) the D1/D2/D3 taxonomy** — **D1** input/correct-result pairs (needed to train and verify), **D2** event probabilities for groups of inputs, **D3** severity of the discrepancy between computed and correct result. **The load-bearing relation is that D2 and D3 STEER the D1 collection — deliberately seeking the case combinations where a failure would cause serious damage — and supply the sufficiency argument. The risk model drives the data collection, not the reverse.** **(b) DIN SPEC 13266** requires, on top of repeated cross-validation during development, **a separate test dataset used ONCE on the final model** — adopt it, as a discipline against overfitting the evaluation itself. **(c)** Dataset quality: the AI Act's data-governance provision (Art 10(3) as cited by DZSF against the Feb-2023 draft — **verify the numbering against Reg (EU) 2024/1689 before relying on it**) requires training, validation and test sets to be **relevant, representative, error-free and complete**, covering the system-definition functions across operational scenarios and environmental conditions **including unusual, irregular and deliberately damaging scenarios**. **(d)** Synthetic data is cheaper and more voluminous but **"presumably cannot fully replace" real data.** **(e)** DZSF's own honest caveat: **"the extent of the required test scenarios and data is currently not known"** — so size the eval programme as open-ended and instrument it, rather than committing to a fixed coverage target.
6. [ ] Source eval data from ADR-007 surfaces (replay + shadow); flag ground-truth gaps (PR8); ARB + NSA ratify; flip to Accepted.
