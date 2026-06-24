# ADR-003: EU AI Act classification & compliance posture

**Status:** Pending
**Date:** 2026-06-24
**Deciders:** Architecture Review Board · NSA / safety authority liaison · Vpnet engagement lead
**Depends on:** ADR-002 (agentic decision & oversight layer)
**Affects requirements:** R10 (human oversight proportional to risk), with bearing on R9 (autonomy as a separate layer) and R11 (certified SIL-4 kernel)

## Context

ADR-002 proposes an agentic decision & oversight layer riding over the FRMCS bearer. R10 assumes the system will be **EU AI Act high-risk** and sizes human oversight accordingly. That assumption is **not yet verified** — it is carried as a `watch` item in the evidence log (`E-2026-06-24-05`, source "to verify").

The classification is non-trivial because it turns on two interacting tests, not a single label:

- **Annex I** (Union harmonisation legislation) — Article 6(1) makes an AI system high-risk where it is a safety component of, or is itself, a product covered by the listed sectoral legislation **and** that product requires third-party conformity assessment. The rail interoperability regime sits here.
- **The CCS TSI interface** (Control-Command and Signalling Technical Specification for Interoperability) — determines whether the agentic layer touches the certified control-command boundary at all, and therefore whether it is a *safety component* in the regulatory sense.

The guardrail from ADR-002 is decisive to the analysis: this is autonomous **oversight, not control**. The agents advise around a deterministic SIL-4 kernel and never actuate safety-critical functions (R11). Whether that separation places the system *outside* the CCS TSI safety-component perimeter — or whether oversight that informs safety decisions is still pulled in as high-risk — is exactly the question this ADR must resolve against primary sources before R10 can move from assumed to settled.

Per project policy (CLAUDE.md): **do not assert high-risk classification as fact until verified vs Annex I + CCS TSI.** This ADR opens that verification; it does not pre-judge the outcome.

## Decision

**Proposed (pending verification):** Confirm whether the agentic oversight system is EU AI Act **high-risk**, by verifying its status against **Annex I** (and the Article 6 conformity-assessment test) **and** the **CCS TSI interface** boundary. Until that verification is complete and evidenced to A-tier (primary) sources, the classification remains a `watch` item and high-risk is **not** asserted as fact. The compliance posture (oversight obligations, conformity route, documentation) is then set to match the verified classification.

## Options considered

### Option A — Verify, then classify (treat as undecided until evidenced)
| Dimension | Assessment |
|---|---|
| Complexity | Moderate — requires reading Annex I + Article 6, the CCS TSI, and mapping the oversight/control boundary |
| Cost | Low — desk verification against primary sources; no build impact at this stage |
| Safety/assurance | High integrity — classification is grounded in primary law/standards, not inferred |
| Reversibility | Fully reversible — no commitments made until evidence lands |

Pros: honest to the source-trust discipline; avoids over- or under-scoping oversight; keeps R10 defensible in front of the NSA. Cons: leaves R10 open slightly longer; needs primary-source access and possibly legal input.

### Option B — Assume high-risk and design to the strictest obligations now
| Dimension | Assessment |
|---|---|
| Complexity | Lower up front — single assumed track |
| Cost | Higher — may impose Annex III / high-risk conformity overhead that is not legally required |
| Safety/assurance | Safe-by-assumption, but rests on an unverified premise the safety case cannot cite |
| Reversibility | Hard to walk back once oversight architecture and documentation are built to it |

Pros: conservative; no risk of under-scoping. Cons: violates the "never assert high-risk as fact until verified" guardrail; may bake in disproportionate oversight that no longer traces cleanly to evidence; cost without warrant.

## Trade-off analysis

The key trade is **evidential integrity vs speed of closure on R10.** Option B closes R10 fastest but on an unverified premise — which is precisely the failure mode the arcKit method exists to prevent, and which CLAUDE.md prohibits. Option A keeps R10 open marginally longer but produces a classification the safety case and the NSA can actually rely on. Because the whole credibility of the oversight layer rests on proportionality (R10) and on the oversight/control separation (R9, R11), an unverified high-risk label is not a "safe" default — it is an unsourced one. Option A is preferred.

## Consequences

- **Easier:** R10's oversight model can be sized to a verified classification rather than a guess; the safety case cites primary law; the duopoly/procurement and assurance threads inherit a defensible compliance baseline.
- **Harder:** R10 stays `Proposed`/open until verification completes; requires primary-source (and likely legal) input; the answer may be nuanced (e.g. high-risk only for components that cross the CCS TSI boundary), which the architecture must then reflect precisely.
- **To revisit:** On verification, update `E-2026-06-24-05` from `watch` to `revise`/`validate`, move R10's status in the traceability matrix, and flip this ADR's status from Pending to Accepted (or amend the decision to match the verified finding).

## Action items
1. [ ] Verify the system against **Annex I** + **Article 6** conformity-assessment test — is the agentic layer a safety component of a product under rail Union harmonisation legislation requiring third-party assessment?
2. [ ] Verify against the **CCS TSI interface** — does the oversight layer cross the certified control-command boundary, or does the R11 SIL-4 separation place it outside the safety-component perimeter?
3. [ ] Check applicability of **Annex III** high-risk use cases independently of the Annex I route.
4. [ ] Record findings to A-tier (primary) sources in the evidence log; update `E-2026-06-24-05` accordingly.
5. [ ] On a confirmed classification, set the compliance posture (oversight obligations, conformity route, technical documentation) and flip this ADR to Accepted.
6. [ ] Until all above complete, keep classification a `watch` item — **do not assert high-risk as fact.**
