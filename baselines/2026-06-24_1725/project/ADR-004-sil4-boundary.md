# ADR-004: SIL-4 boundary — agent/kernel separation

**Status:** Pending — **stub** opened 2026-06-24 to anchor the R11 load-bearing gap; decision not yet made (P0 detailed-design work)
**Date:** 2026-06-24
**Deciders:** Architecture Review Board · NSA / safety authority liaison · Safety case lead (CENELEC) · Vpnet engagement lead
**Depends on:** ADR-002 (agentic decision & oversight layer); underpins ADR-003 (EU AI Act classification)
**Affects requirements:** R11 (keep the safety case certifiable — deterministic SIL-4 kernel outside the learning agents), with bearing on R9 (autonomy as a separate layer) and R10 (human oversight proportional to risk)

> **This is a stub.** It exists because R11 is marked *load-bearing* in the traceability matrix yet carries **no design evidence**, and because the ADR-003 EU AI Act finding ("conditionally **not** high-risk") holds **only while** the agent/kernel separation below holds (ADR-003 action item #5; `E-2026-06-24-07`). The decision itself — exactly where the boundary sits and what enforces it — is detailed-design work for **P0** and is **not made here**. Do not cite this ADR as a settled decision.

## Context

The agentic oversight layer (ADR-002) advises around a **deterministic SIL-4 kernel** and must **never actuate** safety-critical functions; human-in-command is retained for safety actuation. Two separate guarantees depend on that separation actually being designed, enforced, and certifiable — not merely asserted:

1. **Safety (R11 / CENELEC).** The safety case is only certifiable if the certified core (EN 5012x — EN 50126/50128/50129) is provably isolated from the learning agents, so agent behaviour cannot affect the SIL-4 function.
2. **Regulatory (ADR-003 / EU AI Act).** The "not high-risk" classification rests on Article 3(14): the layer is not a *safety component* because its outputs are advisory and its failure does not endanger safety. The moment the agent can perform — or be relied upon for — a safety function, Annex I §B high-risk re-triggers.

So the boundary is simultaneously a **safety control and a compliance control**. R11 is the single point on which both the safety case and the regulatory classification pivot, and it is currently unevidenced.

## Decision

*To be determined in P0.* This ADR must define and evidence:

- **Where the boundary sits** — the precise interface between the advisory agent plane and the deterministic SIL-4 kernel / human-command path.
- **What enforces non-actuation** — the mechanism (architectural, not procedural) that makes it impossible for an agent output to actuate a safety-critical function, and how that is demonstrated.
- **How "advisory-only" is proven** — the assurance argument and evidence that an agent failure or malfunction cannot endanger safety (satisfying the Art 3(14) carve-out and the EN 5012x separation).
- **Drift detection** — how any future change that would pull the agent inside the safety-component perimeter is caught and routed back to ADR-003 + ADR-002.

## Options considered

*Placeholder — to be developed in P0 detailed design.*

### Option A — <physical/logical separation; certified gateway between planes>
| Dimension | Assessment |
|---|---|
| Complexity | TBD |
| Cost | TBD |
| Safety/assurance | TBD |
| Reversibility | TBD |

### Option B — <to be defined>
…

## Trade-off analysis

*TBD in P0.* The governing trade is expected to be **strength/provability of isolation vs integration cost and latency** of routing agent advice to human-command and the kernel.

## Consequences

- **Easier (once decided):** R11 moves from load-bearing-unevidenced to evidenced; ADR-003's classification gains a cited design constraint; the safety case can argue isolation from primary design evidence.
- **Harder:** requires CENELEC safety-case input and NSA engagement; the boundary must be enforced architecturally, not by process.
- **To revisit:** any later autonomy increase (ADR-008 autonomy ladder) must be checked against this boundary before it is granted.

## Action items
1. [ ] Define the agent/kernel interface and the non-actuation enforcement mechanism (P0 detailed design).
2. [ ] Produce the EN 5012x separation argument and the Art 3(14) advisory-only evidence; log to the evidence log against R11.
3. [ ] Update R11's status in `traceability-matrix.md` from load-bearing-unevidenced once design evidence lands.
4. [ ] Confirm this ADR with ARB + NSA; flip ADR-003 action item #5 to closed and this ADR's status from Pending to Accepted.
