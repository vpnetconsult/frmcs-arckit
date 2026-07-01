# ADR log — Agentic AI autonomous oversight

**Date:** 2026-06-24. Every project decision is recorded as an ADR before it is acted on. Renumber to fit the `ibn-core` sequence before circulating.

## Index

| ADR | Title | Status | Phase |
|---|---|---|---|
| ADR-001 | GSM-R → FRMCS transition | Proposed | (assessment) |
| ADR-002 | Agentic decision & oversight layer | Proposed | (assessment) |
| ADR-003 | EU AI Act classification & compliance posture | Pending | P0 |
| ADR-004 | SIL-4 boundary — agent/kernel separation | Pending | P0 |
| ADR-005 | Telemetry & data sources for the agents | Pending | P1 |
| ADR-006 | Agent intended-use & decision-class assignment | Pending | P2 |
| ADR-007 | Eval strategy (accuracy, drift, automation-bias, replay) | Pending | P2/P3 |
| ADR-008 | Autonomy-ladder authorisation per decision class | Pending | P5 |
| ADR-009 | Fleet-scale FRMCS rolling-stock retrofit — feasibility & funding (managed external dependency) | Proposed | (assessment) |

ADRs above ADR-002 are placeholders to be opened as their phase begins. Add rows as new decisions arise; never act on a material decision without one.

---

## ADR template

```markdown
# ADR-NNN: <title>

**Status:** Proposed | Accepted | Deprecated | Superseded
**Date:** YYYY-MM-DD
**Deciders:** <who signs off>
**Depends on:** <prior ADRs>
**Affects requirements:** <Rn from traceability-matrix.md>

## Context
<situation, forces, constraints>

## Decision
<the change being proposed>

## Options considered
### Option A — <name>
| Dimension | Assessment |
|---|---|
| Complexity | |
| Cost | |
| Safety/assurance | |
| Reversibility | |
Pros: …  Cons: …
### Option B — <name>
…

## Trade-off analysis
<key trade, with reasoning>

## Consequences
- Easier: …
- Harder: …
- To revisit: …

## Action items
1. [ ] …
```
