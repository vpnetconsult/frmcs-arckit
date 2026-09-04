# Baseline 2026-09-04

Frozen (UTC): 2026-09-04T10:31:51Z
Files: 78

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 419

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 9 of 11 |
| ADRs Proposed | 2 of 11 |
| ADR action items closed / open | 22 / 54 |
| Evidence rows: revise | 82 |
| Evidence rows: validate | 232 |
| Evidence rows: watch | 105 |
| **Revise rate** | **19%** |


## Changes vs 2026-09-04

- changed: traceability-matrix.md

### Living-doc diffs

#### traceability-matrix.md
```diff
@@ -16,7 +16,7 @@
 | R5 | Carry digital-rail capability (ATO, video, dense ETCS L2/3) | Packet-native bearer + MCX (MCData/MCVideo) + slicing | Broadband, low-latency, per-app mission-critical QoS | Accepted · ADR-001 | E-2026-06-24-03, -13, -21, E-2026-06-25-02, E-2026-06-29-01, E-2026-07-01-03, E-2026-07-01-10, E-2026-07-01-14 |
 | R6 | Don't re-qualify ETCS on every transport change | Gateway decoupling (TOBA/OB_GTW), apps via OBapp | Bearer flexibility — transport evolves under a stable application interface | Accepted · ADR-001 | E-2026-06-24-03, -13, E-2026-06-29-01, E-2026-07-01-04, E-2026-07-01-10, E-2026-07-01-14 |
 | R7 | Preserve interoperability + regulatory conformance | Conform to CCS TSI; RMR spectrum (ECC (20)02) | FRS/SRS on the standards track; cross-border validated via MORANE2 | Accepted · ADR-001 | E-2026-06-24-04, -13, -21, E-2026-06-29-01, E-2026-06-30-04, E-2026-07-01-02, E-2026-07-01-03, E-2026-07-02-15 (MORANE-2 underway — cross-border/domain-transition validation funded + scoped, to CCS TSI 2027), **E-2026-08-18-06 (EBA "Chronology of European Railway TSIs", 15.04.2025, tier A as an INDEX not as law): CCS TSI lineage corroborated end to end (2002/731+2006/679 → 2012/88 → Reg 2016/919 → Reg 2023/1695, in force DE 28.09.2023). **New point: the EBA states that TSIs marked "Repealed" MAY REMAIN APPLICABLE FOR PROJECTS IN PROGRESS** — so a decade-plus FRMCS migration may run work packages under 2016/919, 2023/1695 and Reg 2026/693 simultaneously, each with its own conformity route and NoBo scope. Bears on ADR-011 and ADR-001 item 8. Caveat: the sheet predates Reg (EU) 2026/693 and its "in force in Germany" column is unreliable (36 rows share 29.11.2014))** |
-| R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | **Recommended — policy-level open** · ⚠️ **FIRST EU-LAW INSTRUMENT AIMED AT THIS CONCERN NOW EXISTS AS A PROPOSAL (2026-09-04, E-2026-09-04-03 — COM(2026) 11, CSA2 Title IV):** Commission-designated third countries posing cybersecurity concerns (Art 100), implementing-act **lists of high-risk suppliers** assessed on establishment/ownership/control (Art 104), Commission-identified **key ICT assets** + mitigating measures reaching the **NIS-2 Annex I entity population, which includes rail** (Arts 102–103), a **36-month phase-out** of high-risk-supplier components from mobile-network key ICT assets and an **Art 111 prohibition** on using/installing/integrating them, with an exemption route and a public register of decisions (Arts 105–107). **Status deliberately UNCHANGED: a proposal is not law. R8 moves on adoption, not on publication.** Open question, not a finding: whether Title IV Ch. II reaches a **dedicated/private rail network** like FRMCS (written for electronic communications networks, aligned to the proposed Digital Networks Act) — the Arts 102/103 route reaches a rail operator regardless. **Refined from the full IA (E-2026-09-04-05): the horizontal framework is ENABLING (empowerments exercisable only after a coordinated risk assessment + an economic-impact assessment that must weigh "the availability of alternative suppliers"), with Ch. II the directly-applicable carve-out. Score it on USE, not adoption — the Commission's own caveat is that de-risking depends on whether the framework is actually used.** **Procurement vocabulary gained:** the EU coordinated 5G risk assessment names **core network · MANO · RAN** as the key assets from which high-risk-supplier equipment is restricted — **the same decomposition as this requirement's own unbundling strategy (RAN/core/MCX/dispatcher), which is worth stating in any procurement artifact** | E-2026-06-24-04, E-2026-06-29-01, E-2026-06-29-02, E-2026-07-01-02, E-2026-07-01-11, E-2026-07-02-01, E-2026-07-02-03, E-2026-07-02-09 (SCI-CC_LST — standardised interface + 4-vendor interop IN OPERATION) |
+| R8 | Avoid vendor lock-in / Nokia–Kontron concentration | Unbundled tenders (RAN / core / MCX / dispatcher separable) | Open procurement framework; Bid/RFP agent flags concentration + attaches source-trust tiers | **Recommended — policy-level open** · ⚠️ **FIRST EU-LAW INSTRUMENT AIMED AT THIS CONCERN NOW EXISTS AS A PROPOSAL (2026-09-04, E-2026-09-04-03 — COM(2026) 11, CSA2 Title IV):** Commission-designated third countries posing cybersecurity concerns (Art 100), implementing-act **lists of high-risk suppliers** assessed on establishment/ownership/control (Art 104), Commission-identified **key ICT assets** + mitigating measures reaching the **NIS-2 Annex I entity population, which includes rail** (Arts 102–103), a **36-month phase-out** of high-risk-supplier components from mobile-network key ICT assets and an **Art 111 prohibition** on using/installing/integrating them, with an exemption route and a public register of decisions (Arts 105–107). **Status deliberately UNCHANGED: a proposal is not law. R8 moves on adoption, not on publication.** Unresolved question, not a finding: whether Title IV Ch. II reaches a **dedicated/private rail network** like FRMCS (written for electronic communications networks, aligned to the proposed Digital Networks Act) — the Arts 102/103 route reaches a rail operator regardless. **Refined from the full IA (E-2026-09-04-05): the horizontal framework is ENABLING (empowerments exercisable only after a coordinated risk assessment + an economic-impact assessment that must weigh "the availability of alternative suppliers"), with Ch. II the directly-applicable carve-out. Score it on USE, not adoption — the Commission's own caveat is that de-risking depends on whether the framework is actually used.** **Procurement vocabulary gained:** the EU coordinated 5G risk assessment names **core network · MANO · RAN** as the key assets from which high-risk-supplier equipment is restricted — **the same decomposition as this requirement's own unbundling strategy (RAN/core/MCX/dispatcher), which is worth stating in any procurement artifact** | E-2026-06-24-04, E-2026-06-29-01, E-2026-06-29-02, E-2026-07-01-02, E-2026-07-01-11, E-2026-07-02-01, E-2026-07-02-03, E-2026-07-02-09 (SCI-CC_LST — standardised interface + 4-vendor interop IN OPERATION) |
 | R9 | Keep autonomy governable (not inherent to 5G) | Autonomy as a separate layer over the bearer | Agentic decision + runtime planes ride on FRMCS; 5G carries, doesn't decide | **Accepted · ADR-002 (ratified ARB-2026-08-15 R4 — **settled internally; no external validation**)** | E-2026-06-24-17 (CTMS — validates premise), E-2026-07-02-05 (CTMS technical inside view — DRL/GNN disposition PROTOTYPE, offline-evaluated; constrained-envelope pattern), E-2026-07-02-14 (CTMS MARL follow-on — constructive scheduling, generalisation demonstrated, linear compute; explicitly designated NON-safety-critical, safety with APS) |
 | R10 | Human oversight proportional to risk (SIL-4; EU AI Act classification verified — conditional, not automatic high-risk) | HITL gate by decision class (reversibility × safety) | Audit → Supervise → Approve → Command; human-in-command for safety actuation | **Accepted · ADR-002 + ADR-003 (ratified ARB-2026-08-15 R2/R4 — **settled internally; no external validation**)** · ⚠️ *eval EVIDENCE still outstanding (ADR-010, blocked on ADR-007): the oversight DECISION is accepted, proof that it works is not yet available* | E-2026-06-24-05, -07, -17 |
 | R11 | Keep the safety case certifiable | Deterministic SIL-4 kernel outside the learning agents | Agents advise around a certified core (CENELEC EN 5012x); never actuate | Proposed — load-bearing · ADR-004 · **UNCHANGED at ARB-2026-08-15: the board expressly declined to move R11 on the strength of the ADR-001/-002/-003 ratifications. ADR-004 is not ratified and the EN 50129 FFI/independence analysis does not exist; R11 moves when that evidence does.** | E-2026-06-24-17 (motivating: CTMS raises the boundary); SIL-4 boundary DESIGN now defined in ADR-004 (unidirectional boundary · human-in-command · EN 50129 FFI/composition); safety-case EVIDENCE (FFI/independence, ISA/NoBo) still to be produced; DESIGN-BASIS grounding in the RCA/OCORA + DB/Siemens SIL4-DC Safe-Computing-Platform reference (E-2026-07-02-01) + the DSD "SIL4 Cloud" / separation-kernel report (E-2026-07-02-03) + the Cloud4Rail safety-architecture comparison (E-2026-07-02-27 — operator direction: untrusted COTS virtualisation + certified application-level safety layer/NHA for existing trackside CCS; learning-component co-hosting still uncovered); underpins E-2026-06-24-07 |
```
