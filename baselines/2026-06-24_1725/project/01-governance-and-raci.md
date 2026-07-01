# Governance & RACI — Agentic AI autonomous oversight

**Date:** 2026-06-24 · **Method:** arcKit

## Operating cadence

| Cadence | Forum | Purpose |
|---|---|---|
| Daily | Delivery standup + `baseline.sh` | Log evidence, revise statuses, freeze a baseline |
| Weekly | Architecture Review Board (ARB) | Endorse ADRs, review traceability movement |
| Per gate | Gate review (ARB + AI-governance + NSA interface) | Pass/hold/reject against gate criteria |
| Per incident | Incident review | Feed runtime evidence back to the matrix |

## arcKit artefacts (the governance instruments)

- `traceability-matrix.md` — requirements ↔ decisions ↔ status (the spine).
- `evidence-log.md` — dated evidence, trust tiers, affected requirements.
- ADRs (`04-adr-log.md` + template) — every decision recorded with options and consequences.
- `baselines/<date>/` — frozen daily state + diff (the audit trail).

## Decision-class oversight (who is in command)

Authority is bounded by reversibility × safety impact. The agent's authority never exceeds the class.

| Decision class | Autonomy | Accountable human role |
|---|---|---|
| Reversible, no safety impact | Autonomous (audited) | Ops analyst — on-the-loop |
| Reversible, operational | Human-on-the-loop | Duty manager — can intervene |
| Irreversible / financial | Human-in-the-loop | Programme lead — approves first |
| Safety-critical actuation | None (never autonomous) | Signaller / duty manager — human-in-command |

## RACI (roles × workstreams)

R = Responsible · A = Accountable · C = Consulted · I = Informed

| Workstream | Vpnet | IM | NSA | Vendor prime |
|---|---|---|---|---|
| Outcome & charter | R | A | C | I |
| Oversight architecture & ADRs | A/R | C | C | C |
| Agent build & eval harness | A/R | I | I | C |
| FRMCS bearer integration | R | C | I | A |
| Safety case & SIL-4 boundary | C | A | A | C |
| Human-oversight model & training | R | A | C | I |
| Go-live authorisation (per ladder step) | C | A | A | I |

Key line: **Vpnet is never Accountable for safety.** Vpnet is Accountable for the *oversight architecture*; the IM and NSA are Accountable for safety and for authorising each autonomy-ladder step.

## Standards baseline

- **NIST AI RMF** (Govern / Map / Measure / Manage) — operating spine.
- **ISO/IEC 42001** (AI management system) + **23894** (AI risk).
- **EU AI Act** — high-risk obligations (Art 14 oversight, logging, transparency) — *pending classification verification, ADR-002 #1*.
- **CENELEC EN 50126/28/29** — SIL-4 boundary for the kernel.
- **CCS TSI** — rail interoperability interface.
