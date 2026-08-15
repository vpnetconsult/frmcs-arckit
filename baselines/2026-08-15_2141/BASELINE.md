# Baseline 2026-08-15

Frozen (UTC): 2026-08-15T19:41:02Z
Files: 68

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 7 |
| Strengthened post-incident | 1 |
| Open | 3 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 338

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 3 of 9 |
| ADRs Proposed | 6 of 9 |
| ADR action items closed / open | 7 / 51 |
| Evidence rows: revise | 17 |
| Evidence rows: validate | 219 |
| Evidence rows: watch | 98 |
| **Revise rate** | **5%** |

> **Revise rate below 10%.** Incoming evidence is almost never changing a decision.
> That is either a settled question or a disconnected wire — check which.

## Changes vs 2026-08-15_1756

- changed: ADR-001-gsmr-to-frmcs.md
- changed: ADR-002-agentic-governance.md
- added:   project/07-arb-minute-2026-08-15.md
- changed: project/ADR-003-eu-ai-act-classification.md
- changed: project/ADR-009-fleet-retrofit.md
- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -2,7 +2,7 @@
 
 **Scope:** GSM-R → FRMCS transition + agentic decision/governance layer
 **Owner:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud
-**Last revised:** 2026-08-15
+**Last revised:** 2026-08-15 · **ARB-2026-08-15 statuses applied** (see `project/07-arb-minute-2026-08-15.md`)
 **Linked records:** ADR-001 (transition), ADR-002 (agentic decision & oversight layer), incident-annex.md, evidence-log.md
 
 This matrix is the living core of the assessment. Each requirement traces to a decision, a mechanism that addresses it, and a status. The status column is the honest part: it shows what is settled, what last night's outage promoted from assumed to load-bearing-open, and what is still only proposed. Revise statuses as evidence arrives (see evidence-log.md); the daily baseline freezes the state so the evolution is visible.
@@ -17,9 +17,9 @@
 | R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03, -13, E-2026-06-29-01, E-2026-07-01-04, E-2026-07-01-10, E-2026-07-01-14 |
 | R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04, -13, -21, E-2026-06-29-01, E-2026-06-30-04, E-2026-07-01-02, E-2026-07-01-03, E-2026-07-02-15 (MORANE-2 underway — cross-border/domain-transition validation funded + scoped, to CCS TSI 2027) |
 | R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | Recommended — policy-level open | E-2026-06-24-04, E-2026-06-29-01, E-2026-06-29-02, E-2026-07-01-02, E-2026-07-01-11, E-2026-07-02-01, E-2026-07-02-03, E-2026-07-02-09 (SCI-CC_LST — standardised interface + 4-vendor interop IN OPERATION) |
-| R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | Proposed · ADR-002 | E-2026-06-24-17 (CTMS — validates premise), E-2026-07-02-05 (CTMS technical inside view — DRL/GNN disposition PROTOTYPE, offline-evaluated; constrained-envelope pattern), E-2026-07-02-14 (CTMS MARL follow-on — constructive scheduling, generalisation demonstrated, linear compute; explicitly designated NON-safety-critical, safety with APS) |
-| R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | Proposed · ADR-002 (classification verified · ADR-003; eval ADR-010) | E-2026-06-24-05, -07, -17 |
-| R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing · ADR-004 | E-2026-06-24-17 (motivating: CTMS raises the boundary); SIL-4 boundary DESIGN now defined in ADR-004 (unidirectional boundary · human-in-command · EN 50129 FFI/composition); safety-case EVIDENCE (FFI/independence, ISA/NoBo) still to be produced; DESIGN-BASIS grounding in the RCA/OCORA + DB/Siemens SIL4-DC Safe-Computing-Platform reference (E-2026-07-02-01) + the DSD "SIL4 Cloud" / separation-kernel report (E-2026-07-02-03) + the Cloud4Rail safety-architecture comparison (E-2026-07-02-27 — operator direction: untrusted COTS virtualisation + certified application-level safety layer/NHA for existing trackside CCS; learning-component co-hosting still uncovered); underpins E-2026-06-24-07 |
+| R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | **Accepted · ADR-002 (ratified ARB-2026-08-15 R4 — NSA concurrence outstanding)** | E-2026-06-24-17 (CTMS — validates premise), E-2026-07-02-05 (CTMS technical inside view — DRL/GNN disposition PROTOTYPE, offline-evaluated; constrained-envelope pattern), E-2026-07-02-14 (CTMS MARL follow-on — constructive scheduling, generalisation demonstrated, linear compute; explicitly designated NON-safety-critical, safety with APS) |
+| R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | **Accepted · ADR-002 + ADR-003 (ratified ARB-2026-08-15 R2/R4 — NSA concurrence outstanding)** · ⚠️ *eval EVIDENCE still outstanding (ADR-010, blocked on ADR-007): the oversight DECISION is accepted, proof that it works is not yet available* | E-2026-06-24-05, -07, -17 |
+| R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing · ADR-004 · **UNCHANGED at ARB-2026-08-15: the board expressly declined to move R11 on the strength of the ADR-001/-002/-003 ratifications. ADR-004 is not ratified and the EN 50129 FFI/independence analysis does not exist; R11 moves when that evidence does.** | E-2026-06-24-17 (motivating: CTMS raises the boundary); SIL-4 boundary DESIGN now defined in ADR-004 (unidirectional boundary · human-in-command · EN 50129 FFI/composition); safety-case EVIDENCE (FFI/independence, ISA/NoBo) still to be produced; DESIGN-BASIS grounding in the RCA/OCORA + DB/Siemens SIL4-DC Safe-Computing-Platform reference (E-2026-07-02-01) + the DSD "SIL4 Cloud" / separation-kernel report (E-2026-07-02-03) + the Cloud4Rail safety-architecture comparison (E-2026-07-02-27 — operator direction: untrusted COTS virtualisation + certified application-level safety layer/NHA for existing trackside CCS; learning-component co-hosting still uncovered); underpins E-2026-06-24-07 |
 | R12 | Close the awareness gap ("why nobody knew") | Risk Sentinel + Assurance agents | Continuous risk register + evidence chain; decision-ready alert before threshold | Proposed · ADR-002 (eval ADR-010) | E-2026-06-24-02, -09, -17, E-2026-06-27-01, E-2026-06-27-02, E-2026-06-27-03, E-2026-06-30-03, E-2026-06-30-05, E-2026-08-15-03 (ENISA 2019-20 rail survey — EU rail operators HIGH-maturity at logging/incident-reporting but LOW-maturity at DETECTION + logs correlation/analysis + security indicators: the awareness gap measured sector-wide on the security side; justification strengthened, status unchanged) |
 | R13 | Make fleet-scale FRMCS retrofit feasible & funded (16–21k DE vehicles + ~40k mobile / ~3.5k stationary GSM-R devices by 2035) | Sector coordinating body + Bund Förderrichtlinie (up to 100%); Umbaucluster / Serienzulassung approval reform; chipset-supply assurance | Coexistence (R2) depends on rolling-stock readiness; approval burden ~30% of cost; no EU/national fit-obligation today (Bestandsschutz) | Open — external dependency · ADR-009 (Bund ERTMS Koordinierungsstelle established per E-17; funding planned, 20.13% 2025 drawdown a feasibility risk) | E-2026-06-24-11, -13, -17, -21, E-2026-06-25-02, E-2026-06-30-04, E-2026-07-02-06 (D3iP — approval-burden lever actively worked; ETCS-balise acceptance pilot), E-2026-07-02-17 (OPAL — protocol-based acceptance independently assessed safety-suitable §2(2) EBO, practice-trialled), E-2026-08-15-54 (NS/RazorSecure, 4th ERA-ENISA Conf 10.2024 — **first EXECUTABILITY evidence in this row**: a completed fleet-scale on-train cyber retrofit, ~1200-unit target, first fleet in 4 months (final 08/2024), 1 train/day / 4 mechanics, per-train 7 cables + switch/WAP updates + 2 devices. Key lesson: a **3-week series-production delay from a fleet VARIANT (4-coach IP plan) not revealed during testing** → variant-spanning test coverage. NL rolling stock, different operator/fleet/regulatory context; **status unchanged — this does not touch the German funding, approval-throughput or chipset dependencies that actually gate R13**) |
 | R14 | Cybersecurity regulatory conformance — EU Cyber Resilience Act (Reg (EU) 2024/2847) for FRMCS "products with digital elements" AND the agentic-oversight layer; NIS-2 (Dir (EU) 2022/2555) for the operator | Build CRA/NIS-2 conformance into the transition + the oversight layer | CRA: secure-by-design PDE, vulnerability handling over a defined support period, SBOM, security updates, conformity assessment (fully applies 11.12.2027; Art 14 reporting 11.09.2026; Art 64 fines €15M/2.5%). NIS-2: operator risk-management (Art 21) + incident reporting (Art 23). Preserve Rückwirkungsfreiheit vs the safety case (ADR-004); govern the security-update change-stream under change-control (ADR-011 / CSM-RA) | Open — newly recognised · needs ADR (proposed ADR-012) · CRA/NIS-2 VERIFIED E-2026-07-01-06 | E-2026-07-01-05, E-2026-07-01-06, E-2026-07-02-03, E-2026-08-15-53 (ERJU System Pillar Cyber Security, 4th ERA-ENISA Conf 03.10.2024 — the conformance architecture made legible: TSI → SUBSET-146/147/148 → four SP specs (01/2025), split "technical interoperability requirements" vs "process requirements"; 8 shared cybersecurity services; ERA-requested cyber gap analysis + CRs across ALL TSIs from Q1 2025; SP spec is the stated "reference system" for IEC TC9 PT 63452; **FRMCS v3 specs themselves in cyber-review scope**. Justification materially strengthened; **status unchanged — every load-bearing item is a plan dated after the deck and none is confirmed to have happened**. Also surfaces **RED** as a fourth-pointer scope gap → ADR-012) |
```
