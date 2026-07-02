# Phase-gate plan — Agentic AI autonomous oversight

**Date:** 2026-06-24 · **Method:** arcKit. Each gate = ADR decided · matrix updated · evidence logged · baseline cut.

## Phases & gates

### P0 · Mobilise & govern
Anchor the outcome (charter), stand up governance (boards, ADR cadence, baseline discipline, decision-class RACI), and **verify the load-bearing constraints before any build**: EU AI Act high-risk classification (vs Annex I + CCS TSI interface), SIL-4 boundary, IM/NSA safety ownership.
**Gate G0:** charter signed · constraints verified · governance live. *No architecture until passed.*

### P1 · As-is discovery
Map the current decision/incident-response process (the gap the outage exposed), inventory the telemetry the agents will consume (the central-SPOF signature), document the certified-kernel boundary.
**Gate G1:** As-is validated · data sources confirmed · kernel boundary agreed.

### P2 · To-be architecture & ADRs
Specify the two planes, the HITL gate by decision class, each agent's intended use + decision class, and the eval strategy — each a recorded ADR.
**Gate G2:** ADRs decided · ARB endorses the target architecture.

### P3 · Build + eval harness
Build in priority order — Risk Sentinel (closes the awareness gap) → Anomaly/Resilience (runtime) → Assurance/Bid. Eval harness from day one: accuracy, drift, automation-bias / dissent-rate, incident-replay (replay 23–24 Jun).
**Gate G3:** eval thresholds met in lab · incident-replay green.

### P4 · Assure
Safety-case evidence, automation-bias effectiveness tests, ARB + NSA sign-off.
**Gate G4:** assurance evidence accepted.

### P5 · Operate — the autonomy ladder
Climb, never flip:
1. **Shadow** — observes, predicts, logs; zero authority. Validates accuracy/drift.
2. **Advisory** — proposes; human executes all. Validates human-oversight effectiveness + dissent rate.
3. **Bounded autonomy** — only the reversible/no-safety class acts autonomously (audited); operational = human-on-the-loop; irreversible = human-in-the-loop; **safety-critical = always human-in-command.**
Operate on daily baselines + drift monitoring.
**Gate G5:** each ladder step separately authorised by decision class (IM + NSA).

## Gate checklist (applies to every gate)

- [ ] ADR(s) for this phase decided and ARB-endorsed.
- [ ] Traceability matrix statuses updated; no requirement left silently open.
- [ ] Evidence log current; trust tiers honest.
- [ ] Baseline cut; diff vs previous reviewed.
- [ ] Outcome still served — anything that no longer traces to it is cut.

## Indicative sequence (not a commitment)

P0 → G0 before any architecture. P1–P2 run tight. P3 builds the Risk Sentinel as the first value drop (awareness gap) even before the runtime plane matures. P5 is a controlled climb, not a date — each ladder step is gated, and safety-critical never leaves human command.
