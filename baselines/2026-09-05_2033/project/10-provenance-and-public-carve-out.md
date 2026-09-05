# Provenance, SDO alignment, and the public carve-out

**Written:** 2026-08-20 · **Baseline:** `baselines/2026-08-20_1030` (360 evidence rows) · **Purpose:** establish, from the git history rather than from memory, **when each ADR was written and on what information**; assess whether the corpus since has validated them against the standards bodies' actual work; and define what may and may not go into a **public** repository.

---

## 1. How it started — the short version

The engagement was opened on **24 June 2026**, the day after the **23–24 June DB GSM-R nationwide outage** — a roughly two-hour standstill caused by a planned component swap that triggered a **silent software fault**: redundancy was present, the failover signal never fired, and recovery took ~90 minutes of manual work. That event is the origin and remains the empirical anchor of everything in the register.

The founding move was to treat the outage not as a safety failure — safety held; silence degraded to standstill by design — but as a **continuity** failure, and to ask what would have had to exist for someone to have known in time. That question produced the outcome anchor the whole register still hangs on: **safe, continuous rail operations**, and the guardrail that follows from it — **autonomous oversight, not autonomous control.**

---

## 2. Who wrote the ADRs, when, and on what information

**All nine ADRs were written by the engagement lead (Dr. Roland Karl Pfeifer) in the first eight days, in two sittings.** From `git log --diff-filter=A`:

| Sitting | ADRs created | Date | Evidence rows in existence |
|---|---|---|---|
| **Day 1** | **ADR-001** (GSM-R → FRMCS) · **ADR-002** (agentic oversight layer) · **ADR-003** (EU AI Act classification) | 2026-06-24 | **26** — logged the same day |
| **Day 8** | **ADR-004** (SIL-4 boundary) · **ADR-007** (testing & canary) · **ADR-009** (fleet retrofit) · **ADR-010** (eval strategy) · **ADR-011** (change-control) · **ADR-012** (cyber conformance) | 2026-07-01 | **49–63** |

**The register today holds 360 rows. Roughly 297 of them — about 83% — were logged after every ADR already existed.**

### ⚠️ What that means, stated plainly

**The ADRs were not derived from the evidence base. They were hypotheses written early, and the evidence base is the falsification campaign that has been running against them ever since.**

This is a legitimate and, on the whole, a strong methodological posture — it is how a testable position is built, and it is far more honest than a register that quietly retro-fits its decisions to whatever arrived last. **But it must never be described the other way round.** Any claim that the ADRs "follow from 360 pieces of evidence" would be false. The correct claim is:

> Nine architecture decisions were taken early on limited information, written down with their options and consequences, and then exposed to 297 further pieces of evidence — of which two overturned a load-bearing premise and the rest corroborated or refined.

---

## 3. Has the corpus validated them?

**Action split across 360 rows: 30 `revise` · 226 `validate` · 104 `watch`.**

**226 corroborations against 2 documented reversals** is the substantive answer: the early decisions have largely held. The reversals matter more than the ratio, and both are recorded in place rather than edited away:

| Failure | What was wrong | How long it stood |
|---|---|---|
| **ADR-001** | Carried a **GSM-R switch-off date** premise the evidence log had itself marked superseded **on day one** | 7 weeks, 338 rows |
| **ADR-002** | Asserted an **EU AI Act high-risk posture** as settled cost — disproved by **ADR-003, written the same day** | 7 weeks, 338 rows |

**Neither failure was caused by missing evidence. Both contradictions were visible in the register the entire time; nothing forced anyone to look.** That is the origin of the decision-health block in every baseline, the quarterly review dates on ADR-001/-002, and the rule that every evidence row must end in `MOVES:` or `NO DECISION MOVED — because …`.

**Current decision health:** 3 of 9 ADRs ratified (internally — see §5), **8 of 66 action items closed**, revise rate **8%**. A full log is not evidence of health.

---

## 4. Alignment with the standards bodies' work

Corpus coverage, by body, with word-boundary counts over the evidence log:

| Body | Rows | What the register actually holds |
|---|---|---|
| **ERA** | 118 | TSI CCS, authorisation, obsolescence window |
| **3GPP** | 92 | 5G SA, MCX, TS 33.501 security architecture |
| **UIC** | 86 | FRMCS FRS/SRS/URS, FRMCS-T |
| **ENISA** | 86 | Rail cybersecurity, NIS investment |
| **ETSI** | 84 | TC-RT, TS 103 147 (automatic switchover) |
| **IEC** | 73 | 62443, TC 9 / PT 63452 |
| **EBA** | 39 | Supervision foci, TSI chronology, national rules |
| **CENELEC** | 38 | EN 50126/28/29/159 — **cited throughout, texts not held (paywalled)** |
| **ISO** | 25 | 42001, 21448, 23053, 22989 |
| **ERJU** | 19 | System Pillar, four cyber specs, shared services |
| **DZSF** | 17 | ATO position, AI assurance, ATO-RISK, attack graphs |
| **BSI** | 16 | CRA/NIS-2, TR-03183, ACS |
| **DIN** | 16 | **SPEC 92005, 92001-3, 13266 — held and read first-hand** |
| **NIST** | 9 | CSF, AI RMF |

**Assessment.** The ADRs' technical spine — 5G SA + MCX as the FRMCS bearer, the two-domain separation of learning components from a certified deterministic kernel, change-control under CSM-RA, security and safety sharing one change gate — **is aligned with, and in several places anticipated, what the SDOs have since published.** Three specific convergences are worth naming because they were reached independently and then corroborated:

1. **Failover must be detection-driven and automatic** (ADR-007) — later matched by **ETSI TS 103 147**, which mandates automatic switchover, making 23 June a non-conformance rather than bad luck.
2. **Learning components stay outside the vital layer** (ADR-004/R11) — later stated by **DZSF** as a technical impossibility, not a design preference: for ML perception, an analytical proof excluding errors on unknown inputs is not available in principle.
3. **Independent, out-of-band detection** (PR5/PR11, from ITU-T Q.752) — later restated as a published AI requirement in **DIN SPEC 92005 §7.5**: uncertainty quantification must be independent of the model it judges.

⚠️ **Three honest qualifications.**
- **The CENELEC EN 5012x texts are not held.** They are cited 38 times and paywalled. Every CENELEC-based statement in the register is second-hand.
- **DIN VDE V 0831-101/-103/-104 are not held** and are the highest-value acquisition gap; two decision-shaped items depend on them.
- **Source independence is thinner than the row count suggests.** Siemens authorship sits behind both the ERJU and DZSF streams; Benoliel recurs across three affiliations. Corroboration counted twice is corroboration once.

---

## 5. What is sourced, and what is yours — the carve-out

This is the section to get right before anything is published, because the register's value in public rests on the reader being able to tell the two apart.

### Sourced — traceable to a named instrument or publication

The FRMCS technical target and spectrum position; the CSM-RA limbs and the explicit-risk-estimation route; the EU AI Act Art 6(1) test and Annex I chain; CRA/NIS-2/RED obligations; the CENELEC and IEC 62443 frameworks; the ATO GoA definitions; the incident's proximate cause as confirmed by the operator; the DIN SPEC transparency, calibration and explainability criteria; Heinrich's incident-to-hazard transformation; the DZSF sector maturity figures.

### ⚠️ Original — the contribution that is actually yours

These are not in any source. They are the reason the assessment exists, and they should be the visible spine of a public repository:

1. **"Autonomous oversight, not autonomous control"** as a *falsifiable architectural guardrail* rather than a slogan — with the SIL-4 boundary as the thing that polices it.
2. **The two-plane split** — a decision plane governing the architecture and a runtime plane governing the live network — as distinct agent populations with distinct accountability.
3. **The decision-class HITL ladder**, autonomy bounded by reversibility × safety impact, with a named human role per class.
4. **Fail-safe is not fail-soft (R4).** The estate is provably fail-*safe*; the 23-June standstill proves it is not yet fail-*soft*. That distinction is the engagement's sharpest single sentence and it appears in no source.
5. **The silent-failover reading of 23 June** — that the lesson is *prove the trigger fires under a hidden fault*, not *have redundancy*. Reconstructed from public sources before the VDE ITG briefing independently corroborated it (E-2026-07-29-09).
6. **The exclusion-composite finding** — four German instruments, four defensible scope exclusions, all landing on the same seam, and nobody's remit covering it. This is a synthesis, not a citation, and it is the strongest original claim in the register.
7. **The safety/security adjudication problem** (ADR-012 item 9) — that a single change gate must reconcile two methodologically incompatible bodies of evidence, since security risk has no probability in the safety sense.
8. **The implementation-class rule** (ADR-002, decided 2026-08-20) — implementation class bound to decision class, hybrid propose/gate, correctable-over-tunable, and the **anti-laundering clause**: an output's class is set by the highest decision class it materially informs.
9. **The decision-drift method itself** — the decision-health block, the mandatory `MOVES:`/`NO DECISION MOVED` answer per row, and review dates on load-bearing ADRs. This is a reusable governance contribution independent of rail.

---

## 6. The public repository — what to build, and what must not travel

### ⛔ The evidence log must not be published as it stands

`evidence-log.md` paraphrases sources carrying **eight distinct handling classes** (RESTRICTED, "Intern", Restricted©Infrabel, TLP:AMBER/GREEN/CLEAR, reproduction-forbidden), and now also summarises **licensed, watermarked DIN SPEC texts**. **The handling policy is still unwritten. Publishing the log wholesale would breach source handling and licence terms in a single commit, irreversibly.**

### What a public repo should carry instead

| Include | Why |
|---|---|
| The **nine ADRs**, with their corrections visible | The decisions and the honest record of two that drifted |
| The **traceability matrix** | The spine — requirements ↔ decisions ↔ status |
| A **curated evidence subset**: the **30 `revise` rows** plus named load-bearing sources, re-checked individually for handling class and rewritten to cite-not-paraphrase | These are the rows that actually drove decisions; the other 330 are corroboration and context |
| The **incident annex** and the three `finding-*` documents | Original analysis, publicly sourced |
| The **charter §Standing** and the **ARB composition note** | Without these the ADRs read as a mandated programme, which is the one thing they must never do |
| `scripts/baseline.sh` and the **decision-health method** | The reusable contribution |

| Exclude | Why |
|---|---|
| `evidence-log.md` in full | Handling classes and licensed content |
| Any DIN/CENELEC text or close paraphrase | Licensed, watermarked to Vpnet Consulting LLC |
| The **DZSF letter** and **ACS enquiry** | Unsent private correspondence naming a real individual |
| Named individual contacts | Published by their authors for professional contact, not for republication |

### Sequence I would follow

1. **Write the handling policy first.** It is the one prerequisite, it is still unwritten, and every publication decision depends on it.
2. Stand up the public repo with **arcKit + plugins** and the layout above — `current/` for the working set, `baselines/` for the freeze, the same daily loop.
3. Port the **ADRs and matrix** unchanged, corrections and all. The drift record is an asset, not an embarrassment.
4. Curate the evidence subset **row by row**, deciding handling class for each. Do not bulk-copy.
5. Put §5's **original contributions** in the README as the repo's claim, with the sourced material clearly framed as the evidence base beneath it.
6. Carry **§Standing verbatim**. A public repo makes the no-client, no-mandate position more important, not less.

---

**Status of this document:** internal analysis, written from git history and the current baseline. It is not an evidence row and moves no decision. It is the seed for the public carve-out.
