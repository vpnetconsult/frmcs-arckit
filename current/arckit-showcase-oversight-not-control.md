# Oversight, not Control

**arcKit in practice: a 15-week architecture assessment of the GSM-R → FRMCS transition and an agentic AI oversight layer, run entirely as an evidence-logged, ADR-recorded, daily-frozen register, with every load-bearing claim anchored to a named standard.**

Repository: [github.com/vpnetconsult/frmcs-arckit](https://github.com/vpnetconsult/frmcs-arckit) · Started 2026-06-24 · Status as of 2026-10-09

---

## The case in one paragraph

On the night of 23–24 June 2026 Germany's rail network stopped for about two hours. The GSM-R train radio failed nationwide after a scheduled component swap triggered a silent software fault. Redundancy existed. The automatic failover never fired, because no alarm was raised. Recovery was manual, and the operator's own rules required staff to rule out a cyberattack before they were allowed to switch over. That outage became the empirical anchor for an independent shadow assessment of the GSM-R successor, FRMCS (the UIC Future Railway Mobile Communication System: 5G Standalone transport with a 3GPP Mission-Critical Services layer over an IMS core), and of whether an agentic AI layer can watch a safety-carrying network without ever being allowed to drive it. The register opened the next morning.

## The guardrail that names the project

The AI layer **observes, detects, recommends and audits. It does not actuate.** Every agent is bound to a decision class, and the class of an output is set by the highest decision it materially informs, so a recommendation cannot be laundered into a safety action by routing it through a human read-out. Safety-critical actuation (class 4) stays human-in-command on a deterministic SIL-4 kernel, certified under CENELEC EN 50126 / EN 50128 / EN 50129 (software now EN 50716), that sits outside the learning agents. The human-oversight ladder runs Audit → Supervise → Approve → Command, and the layer's autonomy ceiling is a property of each task in a scenario, as 3GPP TS 28.100 and TM Forum IG1252 both define it, never of the system.

That rule was then applied to the method itself. ADR-014 records that **the register is the decision plane**: the same evidence rows, decision questions, board ratification and frozen baselines that govern the architecture also govern the AI assistant that helped build it. The board ratifies. Nothing else does.

## The reference frame, by body

| Body | What the register takes from it |
|---|---|
| **UIC** | FRMCS FRS / SRS, FFFIS-7950 (OBapp), FIS-7970, TOBA-7510: the application-to-transport decoupling the whole bearer-flexibility argument rests on |
| **ETSI TC RT** | TS 103 765-x (FRMCS rail profile), TS 104 069-1/-2 and TS 104 070 (MCX conformance), TS 103 147 (GSM-R core redundancy: the standard the 23 June outage did not meet) |
| **3GPP SA6 / SA3 (MCX family)** | TS 22.280, 23.280–23.283, 24.379–24.484, 33.180, cited as ETSI transpositions at the version the rail documents pin |
| **3GPP SA5** | TS 28.100 (autonomy levels), 28.312 (intent), 28.533 (management architecture), 28.541 (NRM), 28.561 / 28.567 (closed loops), 28.532 (provisioning) |
| **ETSI ENI / ZSM / AFI** | GS ENI 005, GR ENI 007 / 010, GS ZSM 001 / 002 / 009-1, TS 103 195-2 (GANA), TR 104 180 (data quality): the recommendation-mode and knowledge-plane lineage |
| **TM Forum** | Autonomous Networks programme (IG1251 reference architecture, IG1252 level evaluation, IG1253 intent), SID GB922 v26.0 / R20.0 associations, Open APIs TMF620 / 641 / 642 / 664 |
| **ERA / EU-Rail (ERJU)** | CCS TSI (Reg (EU) 2023/1695, Reg (EU) 2026/693), SUBSET-146/147/148, System Pillar cyber specs, the ISS occurrence ontology, MORANE-2 field programme, OCORA / RCA |
| **CENELEC / IEC** | EN 50126 / 50128 / 50129 / 50716, IEC 62443, the SIL-4 freedom-from-interference bar |
| **EU law** | AI Act (Reg (EU) 2024/1689), Cyber Resilience Act (Reg (EU) 2024/2847), NIS-2 (Dir (EU) 2022/2555, transposed as NIS2UmsG), Radio Equipment Directive 2014/53/EU with EN 18031, CSM-RA (Reg (EU) 402/2013), ECC Decision (20)02 for the 1900 MHz RMR band |
| **Cross-cutting** | NIST AI RMF, ISO/IEC 42001 (cited, paywalled, never reproduced) |

Every 3GPP text is cited in one of two classes: *rail-pinned* (named in a held ETSI TC RT or UIC normative reference, or in the MCX family) in its ETSI form at the pinned version, or *common* in its 3GPP form at the latest release. The class of all 172 specifications is generated from the evidence log, never hand-edited.

## What arcKit produced

| Artefact | Count (2026-10-09) |
|---|---|
| Tier-graded evidence rows (two logs) | 731 |
| Requirements traced (R1–R14) | 14 |
| Architecture Decision Records | 15 opened · 9 Accepted · 3 Proposed |
| Architecture Review Board minutes | 17 |
| Frozen baselines with sha256 manifests | 214 |
| ETSI / 3GPP specifications on record | 172 |
| Evidence rows that moved a decision (revise rate) | 32 % |

Every evidence row carries a trust tier (A primary · B vendor · C trade press · D aggregator), the requirements it touches, and an explicit answer to one question: *does this move a decision, and which one?*

## What the method caught

**Decision drift, in our own register.** At 338 rows the log was immaculate and the decisions were stale. Zero of nine ADRs were ratified, the revise rate was 5 %, and both founding decisions were wrong in ways the log had already recorded: ADR-001 still carried a GSM-R switch-off date that Reg (EU) 2026/693 had superseded on day one, and ADR-002 asserted an EU AI Act high-risk posture that ADR-003 had disproved against Annex I the same day it was written. Nothing forced anyone to re-read a "settled" document. The fix was cheap: every row must end with `MOVES:` or `NO DECISION MOVED — because …`, load-bearing ADRs carry a review date, and every baseline prints a decision-health block. Six weeks later the revise rate is 32 % and 9 of 12 ADRs are ratified.

**A standing we never had.** The original charter named a client and acceptance by a National Safety Authority as a success criterion. Neither was true. The charter was amended on 2026-08-19 to say so: this is an independent assessment with no client, no mandate and no external validation, and nothing in it may be presented to the EBA, ERA, a Notified Body or an Independent Safety Assessor as endorsed. Findings are shared as contributions, never submitted for concurrence.

**A corrupted audit trail, preserved rather than repaired.** On 2026-09-04 scripted whole-file rewrites left 15 zero-byte files across eight baselines, and the manifests hashed the corrupt bytes, so the baselines verified against themselves. The damaged freezes were marked with `CORRUPTED.md`, never re-cut. The freeze script now verifies before it freezes and aborts rather than vouch for what it cannot read. Register files are edited, never regenerated.

**A fabricated ratification, refused.** Ratification is the board's act. An ADR status flips only when a minute exists to point at. Action items are split into decision-shaped ones, which block ratification, and implementation ones, which do not. ADR-004, the SIL-4 boundary, remains Proposed because the EN 50129 freedom-from-interference analysis does not exist yet, and a premature "Accepted" there is the one place it would do real harm.

## What the evidence settled, and what it did not

- **Settled (internally):** FRMCS on 5G SA with 3GPP MCX and UIC gateway decoupling; a decade-plus dual-network parallel run under CSM-RA change control; cybersecurity conformance across CRA, NIS-2 and the Radio Equipment Directive; a two-stage on-board retrofit pattern aligned to OCORA and ETCS Baseline 4; a six-agent oversight layer with class-bound implementation constraints.
- **Promoted by the outage from assumed to must-prove:** no central single point of failure, and a fail-soft degraded mode. Both are now test objectives under ADR-007, not assertions.
- **Deliberately not asserted:** the EU AI Act high-risk classification stays at `watch` until verified against Annex I and the CCS TSI. The classification is only as firm as the certified-kernel boundary it rests on.
- **Found in the standards, not invented:** the 23 June failure is a non-conformance to ETSI TS 103 147 §4.2, which requires switchover without manual intervention. The class-3 "recommend, do not execute" hold is 3GPP TS 28.567's `NOTIFY_RECOMMENDATION` closed-loop behaviour and ETSI GS ENI 005's recommendation mode. TM Forum's own L4 target for core fault management keeps execution manual. Oversight-not-control is what the industry's autonomy standards already describe for a core; the register only adds the safety class that makes it mandatory.

## What arcKit is here

Four files and a script. An ADR set, a traceability matrix, an evidence log with trust tiers, and a daily freeze that diffs today against yesterday and prints whether evidence is still wired to decisions. Around that sit an open-reference autonomy framework (ADR-015, Proposed) that maps TM Forum AN, 3GPP SA5 and ETSI ENI/ZSM onto one task-level scale with a decision-class ceiling, and a generated inventory of every specification the register cites. The discipline costs minutes a day. Its value showed up on the days it was embarrassing: a drifted founding decision, a charter that overclaimed, a baseline that lied about its own integrity. Each is in the trail, dated, with the correction beside it.

*Everything above is settled internally only. No infrastructure manager, safety authority, standards body or vendor named in the register has commissioned, reviewed or endorsed it. Evidence IDs for every claim are in the repository.*
