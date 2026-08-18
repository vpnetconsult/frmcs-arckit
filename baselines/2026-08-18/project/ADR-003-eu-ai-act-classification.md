# ADR-003: EU AI Act classification & compliance posture

**Status:** Accepted (ARB 2026-08-15) — NSA concurrence outstanding
**Ratified:** ARB-2026-08-15, Resolution 2 — see `project/07-arb-minute-2026-08-15.md`. **Not usable in a safety case, conformance submission or any statement to a regulator until NSA concurrence is minuted.**
**Decision:** the agentic oversight layer is **not high-risk as designed**, conditional on the Art 3(14) safety-component test.
**Date:** 2026-06-24 (verification added 2026-06-24)

> **Status note:** classification **verified** 2026-06-24 against primary sources (see *Verification findings* — conditional, not automatic high-risk); the compliance posture awaits ARB/NSA ratification, at which point this ADR flips to Accepted. Status normalised to the controlled vocabulary (Proposed/Accepted/Deprecated/Superseded) on 2026-07-02 — wording change only, no substantive change.
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

## Verification findings (2026-06-24)

Verified against the primary text of the EU AI Act (Regulation (EU) 2024/1689) and the rail interoperability / CCS TSI framework. **Sources are A-tier (primary law).** The classification is **conditional, not automatic** — it turns on a single test, the "safety component" question.

**Headline:** As architected in ADR-002 — autonomous **oversight, not control**; advises around a deterministic SIL-4 kernel; never actuates safety-critical functions; human-in-command retained (R9, R11) — the agentic layer sits **outside** the EU AI Act high-risk perimeter. It is **not** high-risk *as designed*. High-risk would be triggered only if the layer became a *safety component* of the rail control-command system.

The four legal pillars checked:

1. **Article 6(1) two-part test.** An AI system is high-risk only where **(a)** it is a safety component of, or is itself, a product covered by Annex I harmonisation legislation, **and (b)** that product must undergo third-party conformity assessment. *Both* limbs must hold. (AI Act Art 6(1)(a),(b).)
2. **Annex I — rail is in scope (limb b satisfied for CCS).** Directive (EU) 2016/797 (interoperability of the rail system) is listed in **Annex I Section B, item 17**. Under that Directive and the CCS TSI (Implementing Regulation (EU) 2023/1695, successor to 2016/919), CCS subsystems and interoperability constituents undergo **Notified Body (third-party) EC verification**. So Article 6(1)(b) is met for the CCS product. The live variable is therefore **only Article 6(1)(a)** — is *our* layer a safety component?
3. **Article 3(14) "safety component" — the decisive test (limb a).** Defined as a component that "fulfils a safety function … or the failure or malfunctioning of which endangers the health and safety of persons or property." The ADR-002 design is built to fall outside this: the SIL-4 kernel and human command remain the safety authority; the agent cannot actuate, and its outputs are advisory, so its failure does not itself endanger safety. **On that design, limb (a) is not satisfied → not high-risk via the Annex I route.** This is a design-dependent, not a permanent, conclusion (see consequences).
4. **Annex III does not independently catch it.** The critical-infrastructure high-risk category, Annex III(2), covers "critical digital infrastructure, **road traffic**, or … water, gas, heating or electricity" — **rail traffic is not listed.** No independent Annex III trigger applies to rail management here.

**Secondary point — even if it *were* high-risk:** for Section B products, **Article 2(2)** provides that *only* Article 6(1), Articles 102–109 and Article 112 of the AI Act apply directly. The substantive high-risk obligations (Chapter III Section 2 — risk management, data governance, technical documentation, Art 14 human oversight) are **deferred to integration into the rail sectoral framework** (CCS TSI / CSM-RA), not imposed directly by the AI Act. So a high-risk finding would route compliance through rail safety law, not a parallel AI Act regime.

**Net:** classification verified as **conditionally not high-risk**. The architectural guardrail (oversight-not-control, certified kernel untouched, no actuation) is what keeps it out of scope — so the guardrail is now a **compliance control**, not just a safety one. Any drift that lets the agent perform, or be relied upon for, a safety function — or whose failure could endanger safety — re-triggers Annex I Section B high-risk.

*Sources:* EU AI Act (Reg (EU) 2024/1689) Arts 2(2), 3(1), 3(14), 6(1), Annex I §B item 17, Annex III(2) — artificialintelligenceact.eu / EUR-Lex; CCS TSI Implementing Reg (EU) 2023/1695 under Dir (EU) 2016/797 — EUR-Lex. Logged as `E-2026-06-24-07` (tier A). **Corroborated 2026-07-10** (`E-2026-07-10-02`, tier A): Arts 2(2), 3(14), 6 and Annex I §B item 17 re-retrieved verbatim from EUR-Lex via a second independent tool (Ansvar gateway) — all current, wording unchanged; Annex III(2) not re-pulled (the 2026-06-24 check stands).

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
1. [x] Verify the system against **Annex I** + **Article 6** conformity-assessment test — *done 2026-06-24.* Rail Dir (EU) 2016/797 is Annex I §B item 17; CCS requires NoBo third-party assessment, so Art 6(1)(b) is met. The open limb is Art 6(1)(a) — safety-component status.
2. [x] Verify against the **CCS TSI interface** — *done 2026-06-24.* The R11 SIL-4 separation (oversight-not-control, no actuation) places the layer outside the Art 3(14) safety-component perimeter as designed → not high-risk via Annex I.
3. [x] Check applicability of **Annex III** high-risk use cases — *done 2026-06-24.* Annex III(2) critical-infrastructure covers road traffic, not rail; no independent trigger.
4. [x] Record findings to A-tier (primary) sources in the evidence log — *done 2026-06-24.* `E-2026-06-24-05` revised; `E-2026-06-24-07` added (tier A).
5. `[D]` **STANDING CONSTRAINT — ratified ARB-2026-08-15 R2; never closes.** Carry the safety-component boundary as a verified design constraint — detailed design must keep the agentic layer non-actuating and advisory so Art 6(1)(a) stays unsatisfied; any change re-opens this ADR (link to ADR-004 SIL-4 boundary). **Now defined in ADR-004 (Proposed): unidirectional boundary, human-in-command, EN 50129 FFI/composition; verifying evidence (FFI/independence, ISA/NoBo) pending.**
6. [x] `[D]` ~~ARB + NSA to ratify the compliance posture (not-high-risk, conditional) and flip this ADR to **Accepted**.~~ — **ARB ratified 2026-08-15 (Resolution 2). NSA concurrence OUTSTANDING — this item is not fully discharged until it is minuted.**
