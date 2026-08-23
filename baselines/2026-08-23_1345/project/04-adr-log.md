# ADR log — Agentic AI autonomous oversight

**Date:** 2026-06-24. Every project decision is recorded as an ADR before it is acted on. Renumber to fit the `ibn-core` sequence before circulating.

## Index

| ADR | Title | Status | Phase |
|---|---|---|---|
| ADR-001 | GSM-R → FRMCS transition | Proposed | (assessment) |
| ADR-002 | Agentic decision & oversight layer | Proposed | (assessment) |
| ADR-003 | EU AI Act classification & compliance posture | Pending | P0 |
| ADR-004 | SIL-4 boundary — agent/kernel separation | Proposed | P0 |
| ADR-005 | Telemetry & data sources for the agents | Pending | P1 |
| ADR-006 | Agent intended-use & decision-class assignment | Pending | P2 |
| ADR-007 | Testing & canary strategy — prove R3/R4 by test (replay · shadow · fault-injection · canary-by-segment) | Proposed | P3 (G3) |
| ADR-008 | Autonomy-ladder authorisation per decision class | Pending | P5 |
| ADR-009 | Fleet-scale FRMCS rolling-stock retrofit — feasibility & funding (managed external dependency) | Accepted (ARB 2026-08-20 R1) — settled internally | (assessment) |
| ADR-010 | Agent evaluation strategy — accuracy, automation-bias, drift | Accepted (ARB 2026-08-20/2 R1) — settled internally; eval evidence outstanding | P2/P3 (G4) |
| ADR-011 | Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run | Accepted (ARB 2026-08-20/2 R2) — settled internally | G1–G3 |
| ADR-012 | Cybersecurity regulatory conformance (CRA + NIS-2 + RED) — FRMCS PDEs & the agentic-oversight layer | Accepted (ARB 2026-08-20 R2) — settled internally | G1–G3 |
| ADR-013 | Multi-mode, two-stage on-board FRMCS retrofit pattern (split from ADR-009 per ARB-2026-08-15 R5/#03) | Accepted (ARB 2026-08-15 R5) — settled internally | (assessment) |
| ADR-014 | Two-plane governance — the register is the decision plane, terminating in NIS-2 (Track A) / NACSA (Track B, unevidenced — watch) | Accepted (ARB 2026-08-23 R2) — settled internally | (governance) |

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
