# ADR-004: SIL-4 boundary — agent/kernel separation

**Status:** Proposed
**Date:** 2026-06-24
**Deciders:** Architecture Review Board · NSA / safety authority liaison · Safety case lead (CENELEC) · Vpnet engagement lead
**Depends on:** ADR-002 (agentic decision & oversight layer); underpins ADR-003 (EU AI Act classification)
**Affects requirements:** R11 (keep the safety case certifiable — deterministic SIL-4 kernel outside the learning agents), with bearing on R9 (autonomy as a separate layer) and R10 (human oversight proportional to risk)

> **Scope & honesty note.** This ADR defines the **boundary design** and the **assurance argument** for keeping the learning agents outside the SIL-4 safety perimeter, grounded in the CENELEC EN 5012x framework and the EU AI Act Article 3(14) "safety component" test. It does **not** claim the *verifying evidence* yet exists: the independence / freedom-from-interference (FFI) analysis, the hazard log, and the independent (ISA) / Notified-Body assessments are **action items still to be produced** in detailed design. The specific EN 5012x / EN 50159 provisions cited below are used at framework level and must be **verified against the standard text and logged as A-tier evidence** before the safety case relies on them (action item 4). This moves R11 from *boundary-undefined* to *boundary-designed* — not to *evidenced*.

## Context

ADR-002 places learning agents (Risk Sentinel, Assurance, decision-support) **over** the FRMCS bearer as autonomous **oversight, not control**. R11 makes the certifiability of that arrangement load-bearing: the safety case is only defensible if the certified SIL-4 core is provably isolated from the agents, so agent behaviour cannot affect a safety function. Two guarantees ride on the *same* separation:

- **Safety (R11 / CENELEC).** Under EN 50126 (RAMS lifecycle), EN 50128 (software) and EN 50129 (safety-related electronic systems / safety case), a SIL-4 function carries a tolerable hazard rate on the order of 10⁻⁹–10⁻⁸ per hour. EN 50129's **composition** principle is decisive: a function's safety integrity cannot exceed that of any component it depends on. If a SIL-4 function depended on an agent output, the agent would inherit SIL-4 — infeasible for non-deterministic, learning components.
- **Regulatory (ADR-003 / EU AI Act).** The "not high-risk" finding (E-2026-06-24-07, tier A) rests on Article 3(14): the layer is not a *safety component* because its outputs are advisory and its failure does not endanger safety. That holds **only while** the separation below holds.

The question is live, not academic: E-2026-06-24-17 records **CTMS**, DB's AI-based Capacity & Traffic Management System that plans and part-automates train movements — a real in-domain AI traffic-decision system that *raises* exactly this boundary question. ADR-002's whole credibility depends on answering it precisely. Update (E-2026-07-02-14): DB has since answered this question for CTMS itself, in its own words — the CTMS "is not being designed as a safety-critical system"; safety responsibility lies with the interlocking-operating system (APS, on the Safe Computing Platform). The in-domain flagship AI thus adopts exactly this ADR's two-domain pattern: the learning system plans within the vital layer's constraints but holds no safety authority.

## Decision

**Proposed:** Adopt a **two-domain architecture with a one-way safety boundary**.

**Vital domain (SIL-4, certified).** The deterministic safety kernel holds the **sole** safety authority and the **sole** actuation capability over safety-critical functions (movement-authority enforcement, emergency braking, interlocking logic, ETCS vital functions). Engineered and assessed to SIL-4 under EN 50126/50128/50129. It is **unchanged by the presence of the agents**.

**Advisory domain (non-vital, agentic).** The ADR-002 agents consume telemetry and produce **advice and alerts to humans** (and, at most, to non-safety planning/operations systems). They have **no command path** into the vital domain.

Three separation properties are enforced **by construction**, not by procedure:

1. **Unidirectional information flow at the boundary.** The advisory domain may *read* vital-domain state (telemetry/observability) but cannot *write* into the vital safety path. The vital gateway accepts only human-authenticated, vital-protocol commands and structurally rejects agent-originated commands. Candidate mechanisms — a data-diode / unidirectional gateway on the read path; the vital command path kept physically/logically separate and protected per **EN 50159** (safety-related communication) — are a P0 detailed-design output; the **unidirectionality property itself is the decision**.
2. **Human-in-command interposition (couples to R10).** No agent output reaches a safety actuation except through a human decision (the R10 HITL gate). The agent advises; a competent human commands; the vital kernel enforces. **The agent cannot close the loop** — the human, not the agent, is the decision authority for any safety-relevant action.
3. **Freedom from interference / independence (EN 50129).** Where advisory and vital functions share any resource (compute, network, timing), spatial and temporal partitioning must be demonstrated **to the SIL of the vital function**; otherwise the agent inherits SIL-4. **Preferred realisation: physical segregation** (distinct hardware and network), so FFI is argued by segregation rather than by a fragile partitioning case.

**Governing principle (EN 50129 composition):** the safety case must show that **no vital function depends, for its integrity, on any agent output.** The agent is strictly *additive*. Its failure modes — wrong or hallucinated advice, unavailability, adversarial manipulation — must fall in the "no effect on the safety function" class, because the vital kernel and the human retain sole authority.

## Assurance argument (evidence to be produced)

- **Hazard analysis** enumerating agent-failure modes, explicitly including **automation bias** — the residual path by which an *advisory* system can still contribute to harm if a human over-trusts its output and issues an unsafe command. This couples R11 to R10: the boundary holds only if the human is a genuine decision-maker, not a rubber stamp. R10's human-oversight design must actively counter automation bias (decision-class gating, surfacing uncertainty, no auto-accept).
- **Independence / FFI analysis** (EN 50129) and **safety-related communications** assessment (EN 50159) for the boundary.
- **Dependency demonstration**: no vital function's safety argument cites an agent output.
- **Independent assessment (ISA)** and, per the CCS TSI, **Notified-Body EC verification** for any constituent touching the certified perimeter.

## Link to ADR-003 (EU AI Act)

The Article 3(14) carve-out (not-high-risk) holds **iff** these properties hold: the agent is non-actuating and its failure does not endanger safety. The FFI + human-in-command + composition argument is *precisely* what keeps the agentic layer outside the safety-component perimeter. The same boundary evidence therefore serves both the safety case (R11) **and** the regulatory classification (ADR-003). Any breach — the agent gains an actuation path, or a vital function comes to rely on agent output — re-triggers Annex I §B high-risk.

## Options considered

### Option A — Segregated two-domain, unidirectional boundary, human-in-command (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | Moderate — distinct hardware/network, vital gateway |
| Cost | Higher hardware (physical segregation) |
| Safety/assurance | Strongest — FFI argued by segregation; clean composition story |
| Reversibility | High — agent is additive; can be removed without touching the vital case |

Pros: simplest, strongest independence and Art 3(14) argument; agent failure provably no-effect. Cons: more hardware; puts real weight on R10 (automation bias).

### Option B — Shared platform with software partitioning (mixed-criticality)
| Dimension | Assessment |
|---|---|
| Complexity | High — temporal/spatial partitioning to SIL-4 on a platform hosting ML |
| Cost | Lower hardware, higher assessment burden |
| Safety/assurance | Fragile — partitioning case for non-deterministic components is hard |
| Reversibility | Lower |

Pros: less hardware. Cons: must argue partitioning to SIL-4 for a platform co-hosting learning components; heavy, brittle FFI case. Possible fallback only if segregation proves impractical.

### Option C — Agents issue (revocable) commands into the vital path with kernel veto
| Dimension | Assessment |
|---|---|
| Complexity | High |
| Cost | — |
| Safety/assurance | Unacceptable |
| Reversibility | Low |

Cons: gives the agent an actuation path → it **becomes a safety component** (Art 3(14) high-risk per ADR-003) and must be built to SIL-4 — infeasible for learning components. **Rejected.** This is the anti-pattern the boundary exists to prevent.

## Trade-off analysis

The governing trade is **assurance strength/simplicity vs platform cost**. Option A's physical segregation costs more hardware but yields the strongest, simplest independence/FFI argument and the cleanest Art 3(14) story. Option B trades hardware for a much harder safety and assessment case. Option C is rejected on both safety and regulatory grounds simultaneously — it collapses the very separation that R11 and ADR-003 depend on. **Grounding (E-2026-07-02-01 — DB × Siemens Mobility "SIL4 Data Center" research report, 2021, on the RCA/OCORA Safe Computing Platform):** the industry reference for exactly this certified vital domain, and it independently supports the Option-A preference — it reports that cloud-like **dynamic resource management directly affects the safety case and cannot easily be met by non-safety-relevant cloud software**, and that mixed-criticality integration/homologation complexity rises dramatically. This is a **design-basis** anchor (RCA/OCORA + EN 5012x homologation), NOT the engagement's own FFI verifying evidence (action items 2/4/5 stand). The SIL4-Cloud follow-on (E-2026-07-02-03 — Thales/SYSGO/Fraunhofer/ESE/DB, 2022) refines the Option-B view: a certified **separation kernel** (SYSGO PikeOS, avionics-derived) makes **deterministic** mixed-criticality (SIL-4 + non-SIL) partitioning mature — but it does **not** cover **learning/non-deterministic** components, and its own residual challenges (dynamism, systematic failures in non-SIL system-software, time-sync) keep the **agent** case hard; so **Option A (segregating the learning agents) stands**, with separation-kernel partitioning at most a path for *deterministic* non-vital co-hosting. An **in-operation** domestic precedent (E-2026-07-02-09 — DB InfraGO iLBS, 9/2024): the AnSi/EiSi procedures shifted safety responsibility out of the dispatcher operating level into the interlocking, making the HMI layer **non-SIL/COTS with simplified approval** while the vital layer enforces safety on every command — certified, running proof of the "non-vital layer over a safety-enforcing vital kernel" pattern and its approval/cost benefit; NB a *deterministic HMI* carrying *human-originated* commands, so it validates the human-command-path design, not agent co-hosting.

## Consequences

- **Easier:** R11 has a defined, certifiable boundary; ADR-003's classification gains its load-bearing design constraint; the safety case can argue independence by segregation.
- **Harder:** physical-segregation cost; the automation-bias obligation puts real weight on R10's human-oversight design; FFI / ISA / NoBo evidence must still be produced.
- **To revisit:** any autonomy increase (ADR-008 autonomy ladder) must be re-checked against this boundary before grant; Option B only if segregation proves impractical, and only with a partitioning case assessed to SIL-4.

## Action items
1. [ ] Detailed design: specify the vital gateway + unidirectional read-path mechanism (data-diode / UDG; EN 50159 boundary comms); confirm physical segregation.
2. [ ] Produce the FFI / independence analysis (EN 50129) and the hazard log incl. automation-bias modes; demonstrate no vital function depends on agent output.
3. [ ] Co-design with R10: human-oversight measures that counter automation bias (decision-class gating, uncertainty surfacing, no auto-accept).
4. [ ] Verify the cited EN 50126/50128/50129 and EN 50159 provisions against the standard text; log as A-tier evidence before the safety case relies on them.
5. [ ] ISA + CCS-TSI NoBo engagement; on evidence completion, update R11's status, confirm ADR-003 action item #5 closed, and flip this ADR from Proposed to Accepted.
