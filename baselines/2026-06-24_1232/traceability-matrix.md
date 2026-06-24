# Requirements ↔ decisions traceability matrix

**Scope:** GSM-R → FRMCS transition + agentic decision/governance layer
**Owner:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud
**Last revised:** 2026-06-24
**Linked records:** ADR-001 (transition), ADR-002 (agentic decision & oversight layer), incident-annex.md, evidence-log.md

This matrix is the living core of the assessment. Each requirement traces to a decision, a mechanism that addresses it, and a status. The status column is the honest part: it shows what is settled, what last night's outage promoted from assumed to load-bearing-open, and what is still only proposed. Revise statuses as evidence arrives (see evidence-log.md); the daily baseline freezes the state so the evolution is visible.

| # | Requirement (driver / constraint) | Decision | How it's addressed | Status | Evidence ref |
|---|---|---|---|---|---|
| R1 | Remove obsolescence risk (2G/GSM-R obsolescence ~2030; DE national switch-off planned 2035) | Adopt FRMCS (5G SA + 3GPP MCX) | Standards-anchored successor (UIC / ERA / ETSI TC RT / 3GPP) | Accepted · ADR-001 | E-2026-06-24-03, -11 |
| R2 | No break in live safety service during cutover | Phased dual-network parallel run | GSM-R ↔ FRMCS coexist a decade+; hybrid cab radios/dispatchers; boundary handover | Accepted · ADR-001 | E-2026-06-24-03, -11 |
| R3 | Eliminate the central single point of failure | Geo-redundant 5GC + IMS, N+1 MCX, no shared failure domain | The nationwide-simultaneous failure mode designed out | Strengthened post-incident — open | E-2026-06-24-01 |
| R4 | Guarantee fail-soft; no full standstill on core loss | Defined degraded mode + multi-bearer fallback | Safety-critical voice + movement authorities stay alive locally; public-5G/satellite as a designed path | Open — primary PoC objective | E-2026-06-24-01 |
| R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03 |
| R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03 |
| R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04 |
| R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | Recommended — policy-level open | E-2026-06-24-04 |
| R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | Proposed · ADR-002 | — |
| R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | Proposed · ADR-002 (classification verified · ADR-003) | E-2026-06-24-05, -07 |
| R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing | — |
| R12 | Close the awareness gap ("why nobody knew") | Risk Sentinel + Assurance agents | Continuous risk register + evidence chain; decision-ready alert before threshold | Proposed · ADR-002 | E-2026-06-24-02 |

## Reading notes

1. **Status is the honesty.** R1–R2 and R5–R7 are settled in ADR-001. R3–R4 were nominally covered ("availability — strong by design") but the 23–24 June outage promoted them from assumed to load-bearing-open — they are now things a safety case must actively prove, not assert. R9–R12 are a proposed extension (ADR-002), not yet decided.
2. **R3 and R4 trace to the incident.** The DB GSM-R outage is not an anecdote; it is the validation evidence for two specific requirements, each with a named remediation decision.
3. **R9–R11 are where the arcKit lens bites on autonomy.** Each bounds the AI rather than empowering it: a separate layer (R9), proportional oversight (R10), a certified core left untouched (R11). That is how "agentic" survives contact with a SIL-4 safety authority.

## Status legend

- **Accepted** — decision ratified, mechanism defined.
- **Strengthened post-incident** — previously assumed; the 23–24 Jun outage raised it to a must-prove item.
- **Open** — decision direction set; design/validation outstanding.
- **Proposed** — not yet decided; carried in ADR-002.
- **Recommended** — policy-level position, decision sits above the architecture team.
