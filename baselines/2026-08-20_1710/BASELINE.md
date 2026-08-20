# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T15:10:18Z
Files: 75

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 390

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 8 of 10 |
| ADRs Proposed | 2 of 10 |
| ADR action items closed / open | 22 / 54 |
| Evidence rows: revise | 58 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **14%** |


## Changes vs 2026-08-20_1653

- changed: evidence-log.md
- changed: project/08-eba-consultation-2026-08-18.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -446,6 +446,8 @@
 
 | E-2026-08-20-29 | 2026-08-20 | ***VV Methods Safety Assurance Position Paper*, Version 1.0, 15.06.2024** — editors Galbas, Nolte, Eberle, Hungar, Mosebach, Salem, Schittenhelm, Reich, Kirschbaum, Westhofen; project coordination **Robert Bosch GmbH and BMW AG** (VVMethoden consortium, with BASt and TÜV SÜD among partners). The named acquisition from E-2026-08-20-14, obtained | Industry-consortium position paper of a completed publicly funded project | `dlr.de/de/ts/medien/bilder/projektbilder/2023/vvmethoden/vvm-safety-assurance-position-paper.pdf` (free, fetched 2026-08-20; linked from the DLR VVMethoden project page; project site vvm-projekt.de) | **B** (a position paper states an industry consortium's position — not a standard, not a regulator's text; A for what the project says of itself) | **ADR-010 item 11** (primary) · ADR-007 · ADR-004 | **revise** | **THE WRITTEN ANSWER TO THE SIMULATION-TRUST QUESTION, PARAPHRASED IN FOUR PARTS. (a) Toolchain credibility is a FIRST-CLASS CLAIM, not an assumption:** the product-performance branch of the VVM safety argumentation *"considers the **credibility of the technical V&V toolchain** as a first-class argumentation need"* — i.e. the simulation's trustworthiness is its own branch of the assurance argument, with a GSN pattern provided, alongside product performance, process performance and confidence. **(b) Scenario-set validity is a NAMED V&V TASK:** using one ODD metamodel across hazard analysis, design and V&V creates *"the new V&V task of **validating the sufficient validity of the current set of CORE scenarios**"* — evidence that the scenario set adequately covers the real target domain. That is the burden our ODD-relative coverage route (ADR-010 Decision §6) owes and had not yet named as a separate proof. **(c) The anchoring pattern (PEGASUS lineage):** simulation carries the evidential volume; results are *"confirmed by a few coordinated tests performed on proving grounds as well as in real world driving"* — virtual evidence anchored by sparse physical confirmation, not replaced by it. **(d) The dialectic step:** the argumentation structure *"refutes potential counterarguments to the validity of the provided argument, systematically managing uncertainty with respect to this validity"* — the assurance case must record what would defeat it and answer it. ⚠️ **Cross-domain caution applies as always: road ADS, industry-authored, position not norm — the STRUCTURE transfers (credibility branch, scenario-validity task, anchoring, dialectic), the instruments do not.** **MOVES: `revise` — ADR-010 item 11 CLOSED:** the eval strategy adopts the four-part simulation-credibility requirement as a precondition on any simulated/replayed evidence (Decision §7); in rail terms the physical anchor is the ADR-007 environment ladder's test-ring/inactive-side runs. **With items 6, 9, 10 and 11 all closed, ADR-010's decision-shaped content is complete — ready for ARB ratification** (execution items 1–5, 7, 8, 12–14 are build/adoption work sourcing data from ADR-007). |
 
+| E-2026-08-20-30 | 2026-08-20 | **2. DZSF-Forum "Wissenschaft und Praxis" — event page READ AT SOURCE on dzsf.bund.de** (page dated 29.07.2026): *"Automatisiertes Fahren im Schienenverkehr: Rahmenbedingungen und Handlungsfelder"*, **02.09.2026, 13:00–15:00, online, kostenfrei, KEINE REGISTRIERUNG ERFORDERLICH**; Webex dial-in link and calendar entry published on the page | Event page of the research body itself | `dzsf.bund.de/SharedDocs/Termine/DZSF/2026/2026_2_DZSF_Forum.html`, read 2026-08-20 (prompted by the user relaying the page content) | **A** | **project/08 pre-forum checklist** · ADR-002 item 8 · E-2026-08-20-01 caveat | **revise** | **Discharges the E-2026-08-20-01 "RELAYED, NOT READ" caveat — every logistics fact now stands at source. (a) Confirmed:** date, time, the three talks, open Q&A format (*"drei Fachvorträge mit einer sich jeweils anschließenden Diskussion und der Möglichkeit für Rückfragen"* — discussion after EACH talk, not one block at the end: **the primary question to Dr. Mühl goes in HER slot's discussion, not at the close**). **(b) Schedule with times:** 13:10 Klasek (annotated sensor data) · 13:40 Klotz (KI perception test/Nachweis — the finding-1 question) · **14:10 Mühl (Berufsbild Tele-Tf — the primary bearer-availability question)**. **(c) NO REGISTRATION EXISTS — the "register" to-do dissolves**; attendance = opening the published Webex link (`eba-event.webex.com/eba-event/j.php?MTID=m50a386eeb6719a85efc78bc832354a67`) on the day. **(d) NEW WATCH — the series continues 25 November 2026 on "soziale und psychologische Aspekte der Sicherheit im Bahnkontext"** — squarely the ADR-002 item-3 safety-culture/human-factors territory (E-2026-08-18-08, E-2026-08-19-01); mark for attendance when its page appears. **MOVES: `revise` — project/08's "Before the forum" instruction is satisfied and updated (confirmed at source, no registration, dial-in link recorded, per-talk discussion format noted); the 25-Nov follow-up enters the watch list.** |
+
 ## How to append
 
 When something arrives during the day:
```
