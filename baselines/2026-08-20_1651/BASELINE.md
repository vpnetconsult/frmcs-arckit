# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T14:51:37Z
Files: 74

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 389

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 6 of 10 |
| ADRs Proposed | 4 of 10 |
| ADR action items closed / open | 21 / 55 |
| Evidence rows: revise | 57 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **14%** |


## Changes vs 2026-08-20_1639

- changed: evidence-log.md
- changed: project/06-ratification-readiness.md
- changed: project/ADR-010-eval-strategy.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -444,6 +444,8 @@
 
 | E-2026-08-20-28 | 2026-08-20 | **The national authorisation trigger, established at source — current EIGV + ESiV read (gesetze-im-internet.de, after egress allow-rule), with the EU layer completing the picture: Dir (EU) 2016/797 Art 21(12), Reg (EU) 2018/545 Arts 15–16, CCS TSI Reg (EU) 2023/1695 §§ 7.4.2–7.4.4 (all Cellar authentic texts).** Discharges ADR-011 item 6 | Primary German + EU law | `gesetze-im-internet.de/eigv/EIGV.pdf` (26.7.2018, last amended 17.6.2020) · `…/esiv_2020/ESiV.pdf` (17.6.2020, in force 24.6.2020, expressly replaces the 2007 ESiV) · Cellar CELEX 32016L0797 · 32018R0545 · 32023R1695 | **A** | **ADR-011 item 6 / scheme** · ADR-009/ADR-013/R13 · ADR-007 surface 5 | **revise** | **(a) THE CURRENT NATIONAL FRAME:** the 2007 TEIV-era texts on file are confirmed superseded — the operative instruments are the **EIGV (2018/2020)** for authorisations and the **ESiV (2020)** for the SMS layer (implements Dir 2016/798). **(b) THE NATIONAL TRIGGER IS A LIST, NOT A PHRASE: EIGV § 9(3)/(4)** — an upgraded (*aufgerüstet*) or renewed (*erneuert*) vehicle or CCS/infrastructure subsystem needs authorisation **iff a measure named in Anlage 4** is performed (Anlage 5 = maintenance exchange, no authorisation). Definitions § 2: *Aufrüstung* = extensive modification work; *Erneuerung* = extensive substitution work not changing overall performance. **(c) THE RADIO-RELEVANT ANLAGE-4 ROWS, TRACKSIDE — and they bite hard: 4.1.6** creation or complete renewal of the **mobile switching centre, rail switching centre or base-station controller**; **4.1.7** creation or complete renewal of **all base stations of an entire GSM-R chain, loop or shunting polygon**. **A trackside FRMCS build is squarely authorisation-triggering**, with the **§ 21 ten-week pre-start notification** (the 2007 text's ten weeks survives, as the infra Anzeige window) including a mandatory Anlage-4 classification. Exemption: component swap / software adaptation **without effect on existing functional and safety requirements**. **(d) VEHICLE SIDE — narrower than feared: Anlage 4 § 4.2 is scoped to Class-B on-board CCS and ZBS**; its rows: **4.2.2 first-time installation of vehicle radio interfaces for voice and data communication**; **4.2.4 changes to train-control or voice/data-communication equipment affecting the safety architecture or protective/safety functions — expressly including 4.2.4.5, the *Notruffunktion beim Zugfunk*** (and brake access, forced braking, traction cut-off, 4.2.4.1); **4.2.3 a designed-in below-threshold path** — changes wholly inside the on-board CCS subsystem, vehicle interfaces unchanged, no effects on the rest of the vehicle, confirmed by a *bestimmte Stelle* certificate → **not authorisation-triggering**. Reference basis = the vehicle state at its last approval (footnote ***). **(e) FOR INTEROPERABLE (CLASS-A) VEHICLES THE OPERATIVE TEST IS EU-LEVEL: Reg 2018/545 Art 15(1)** — every change categorised (a)–(d) by the **entity managing the change** (maintenance-substitution exempt, Art 16(1)); category (d) = new authorisation per **Dir 2016/797 Art 21(12)**: (a) parameter values outside the TSI-acceptable range, **(b) the overall safety level may be adversely affected**, or (c) the relevant TSI requires it. **And the CCS TSI's ch. 7 contains NO blanket radio-fitment trigger:** 7.4.2.2 forces ETCS matters (new Class-B installation; ETCS-part upgrades via 7.4.2.4.x when functions change); RMR voice/data fitment becomes mandatory only on **area-of-use extension** (7.4.2.3(4)/(5)); vehicles already equipped need not upgrade except for technical compatibility (7.4.2.3(2)). ⚠️ Residual: ch. 7 read in the 2023/1695 base act — check Reg (EU) 2026/693 for ch.-7 amendments before external use (its Appendix-B refinements are on file; its ch.-7 delta is not). **(f) THE DETERMINATION ITEM 6 ASKED FOR: an FRMCS retrofit is NOT categorically "major upgrading."** It is **categorisation-dependent, and the ratified two-stage pattern splits exactly along the legal line**: **stage 1** (antennas/cabling/netboxes, interfaces untouched) is engineerable below both triggers — 2018/545 15(1)(a)/(b) EU-side, the 4.2.3 path nationally, exactly as the BR 430 executed (E-2026-08-20-26); **stage 2** (radio swap) concentrates the trigger: **migrating the railway emergency call to MCX touches the *Notruffunktion beim Zugfunk*** — nationally listed (4.2.4.5, where 4.2 applies) and the natural Art 21(12)(b) safety-level question EU-side — so stage 2 is where authorisation happens, **once per type** via the Art 15 type-level categorisation (new version/variant), which is the *Serienzulassung* arithmetic ADR-009's route (a) assumed. **Trackside FRMCS is the harder national case: 4.1.6/4.1.7 make core and RAN-chain builds authorisation-triggering with a ten-week clock per notification — a scheduling input the ADR-011 gate cadence (item 5) must absorb.** **MOVES: `revise` — ADR-011 item 6 CLOSED; the scheme gains Step 5 (parallel authorisation-trigger check, never inferred from CSM-RA significance); ADR-013 gains the stage-split-matches-the-law finding; with item 6 closed, ADR-011's decision-shaped content is complete and it is ready for ARB ratification.** |
 
+| E-2026-08-20-29 | 2026-08-20 | ***VV Methods Safety Assurance Position Paper*, Version 1.0, 15.06.2024** — editors Galbas, Nolte, Eberle, Hungar, Mosebach, Salem, Schittenhelm, Reich, Kirschbaum, Westhofen; project coordination **Robert Bosch GmbH and BMW AG** (VVMethoden consortium, with BASt and TÜV SÜD among partners). The named acquisition from E-2026-08-20-14, obtained | Industry-consortium position paper of a completed publicly funded project | `dlr.de/de/ts/medien/bilder/projektbilder/2023/vvmethoden/vvm-safety-assurance-position-paper.pdf` (free, fetched 2026-08-20; linked from the DLR VVMethoden project page; project site vvm-projekt.de) | **B** (a position paper states an industry consortium's position — not a standard, not a regulator's text; A for what the project says of itself) | **ADR-010 item 11** (primary) · ADR-007 · ADR-004 | **revise** | **THE WRITTEN ANSWER TO THE SIMULATION-TRUST QUESTION, PARAPHRASED IN FOUR PARTS. (a) Toolchain credibility is a FIRST-CLASS CLAIM, not an assumption:** the product-performance branch of the VVM safety argumentation *"considers the **credibility of the technical V&V toolchain** as a first-class argumentation need"* — i.e. the simulation's trustworthiness is its own branch of the assurance argument, with a GSN pattern provided, alongside product performance, process performance and confidence. **(b) Scenario-set validity is a NAMED V&V TASK:** using one ODD metamodel across hazard analysis, design and V&V creates *"the new V&V task of **validating the sufficient validity of the current set of CORE scenarios**"* — evidence that the scenario set adequately covers the real target domain. That is the burden our ODD-relative coverage route (ADR-010 Decision §6) owes and had not yet named as a separate proof. **(c) The anchoring pattern (PEGASUS lineage):** simulation carries the evidential volume; results are *"confirmed by a few coordinated tests performed on proving grounds as well as in real world driving"* — virtual evidence anchored by sparse physical confirmation, not replaced by it. **(d) The dialectic step:** the argumentation structure *"refutes potential counterarguments to the validity of the provided argument, systematically managing uncertainty with respect to this validity"* — the assurance case must record what would defeat it and answer it. ⚠️ **Cross-domain caution applies as always: road ADS, industry-authored, position not norm — the STRUCTURE transfers (credibility branch, scenario-validity task, anchoring, dialectic), the instruments do not.** **MOVES: `revise` — ADR-010 item 11 CLOSED:** the eval strategy adopts the four-part simulation-credibility requirement as a precondition on any simulated/replayed evidence (Decision §7); in rail terms the physical anchor is the ADR-007 environment ladder's test-ring/inactive-side runs. **With items 6, 9, 10 and 11 all closed, ADR-010's decision-shaped content is complete — ready for ARB ratification** (execution items 1–5, 7, 8, 12–14 are build/adoption work sourcing data from ADR-007). |
+
 ## How to append
 
 When something arrives during the day:
```
