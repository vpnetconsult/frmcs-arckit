# ADR log — Agentic AI autonomous oversight

**Date:** 2026-06-24. Every project decision is recorded as an ADR before it is acted on. Renumber to fit the `ibn-core` sequence before circulating.

## Index

| ADR | Title | Status | Phase |
|---|---|---|---|
| ADR-001 | GSM-R → FRMCS transition | Accepted (ARB 2026-08-15) — settled internally; next review due 2026-11-15 | (assessment) |
| ADR-002 | Agentic decision & oversight layer | Accepted (ARB 2026-08-15) — settled internally; next review due 2026-11-15 | (assessment) |
| ADR-003 | EU AI Act classification & compliance posture | Accepted (ARB 2026-08-15) — settled internally; classification stays `watch` | P0 |
| ADR-004 | SIL-4 boundary — agent/kernel separation | Proposed | P0 |
| ADR-005 | Telemetry & data sources for the agents | Pending — undrafted. Its subject is currently carried by ADR-007 surface 2 / item 2, PR5, and ADR-002 item 9 (grounding layer, opened 2026-09-15); decide whether to draft it as the home for item 9 or record item 9 as where it lives | P1 |
| ADR-006 | Agent intended-use & decision-class assignment | **Superseded by ADR-002 item 3** (six agents, each bound to a decision class, specified 2026-09-04; acceptance-mode constraints ARB-2026-09-05/4 R3). Index corrected 2026-09-16; no separate record will be drafted | P2 |
| ADR-007 | Testing & canary strategy — prove R3/R4 by test (replay · shadow · fault-injection · canary-by-segment) | Proposed — 0 of 7 items closed; item 8 `[D]` (G3 criteria + ratification) is the gate | P3 (G3) |
| ADR-008 | Autonomy-ladder authorisation per decision class | Pending — undrafted, but cited as load-bearing by ADR-002 item 2 and ADR-010 item 4 (promotion/demotion rule); the *authorisation* — who promotes a rung, on what evidence, with what demotion trigger — has no record | P5 |
| ADR-009 | Fleet-scale FRMCS rolling-stock retrofit — feasibility & funding (managed external dependency) | Accepted (ARB 2026-08-20 R1) — settled internally | (assessment) |
| ADR-010 | Agent evaluation strategy — accuracy, automation-bias, drift | Accepted (ARB 2026-08-20/2 R1) — settled internally; eval evidence outstanding | P2/P3 (G4) |
| ADR-011 | Migration change-control policy — changes to live legacy/proprietary systems during the bridged parallel run | Accepted (ARB 2026-08-20/2 R2) — settled internally | G1–G3 |
| ADR-012 | Cybersecurity regulatory conformance (CRA + NIS-2 + RED) — FRMCS PDEs & the agentic-oversight layer | Accepted (ARB 2026-08-20 R2) — settled internally; amended ARB-2026-09-04 R1, 2026-09-05 R3, 2026-09-06 R2/R4, **2026-09-17 R1/R2** (recovery-path bound; model provenance evidence) | G1–G3 |
| ADR-013 | Multi-mode, two-stage on-board FRMCS retrofit pattern (split from ADR-009 per ARB-2026-08-15 R5/#03); scope restated ARB-2026-09-19 R1 (Q-19) to the combined FRMCS + ETCS intervention — stage 2 split 2a cab radio / 2b ETCS Variant 3 | Accepted (ARB 2026-08-15 R5) — settled internally; condition discharged ARB-2026-09-06 R6; scope restated ARB-2026-09-19 R1 | (assessment) |
| ADR-014 | Two-plane governance — the register is the decision plane, terminating in NIS-2 (Track A) / NACSA (Track B, unevidenced — watch) | Accepted (ARB 2026-08-23 R2) — settled internally | (governance) |
| ADR-015 | Adopt an open-reference autonomy framework (`17-open-autonomy-framework.md` v0.1) as the engagement's reference frame — TM Forum AN mapped as comparator; decision-class ceiling on the level scale; out-of-band monitor, vital gateway and class-3 hold as mandatory elements | **Proposed** (opened 2026-09-26 on the lead's pivot direction; adoption is the ARB's act — item 1 `[D]`) | (method / assessment) |

ADR-005 and ADR-008 remain placeholders to be opened as their phase begins; ADR-006 is superseded (2026-09-16). Add rows as new decisions arise; never act on a material decision without one. **This index mirrors each ADR's own `Status` line and is corrected when they diverge (last reconciled 2026-09-16 — it had shown 001/002/004 as Proposed and 003 as Pending since June); the ADR file is authoritative, this table is not.**

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
