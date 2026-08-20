# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T14:39:28Z
Files: 74

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 388

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 6 of 10 |
| ADRs Proposed | 4 of 10 |
| ADR action items closed / open | 20 / 56 |
| Evidence rows: revise | 56 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **14%** |


## Changes vs 2026-08-20_1630

- changed: evidence-log.md
- changed: project/06-ratification-readiness.md
- changed: project/ADR-011-migration-change-control.md
- changed: project/ADR-013-onboard-retrofit-pattern.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -442,6 +442,8 @@
 
 | E-2026-08-20-27 | 2026-08-20 | **NeGSt — *Neue Generation Signaltechnik*, Schlussbericht (final report), DLR-Institut für Verkehrssystemtechnik, December 2013** (project 09/2011–08/2013, Förderkennzeichen 19P11001A, Projektträger TÜV Rheinland Consulting). Read for the **significance-assessment method** the AutomatedTrain BR 430 change assessment applied in 2026 (E-2026-08-20-26) | Final report of a publicly funded research project | `edocs.tib.eu/files/e01fb14/796268975.pdf` (free, public; fetched 2026-08-20 after egress allow-rule; Downloads folder read-only from the sandbox — cite the URL) | **A** (primary for the method it defines; ⚠️ dated 2013) | **ADR-011 item 1 / scheme Step 2** · ADR-012 item 9b (adjacent) | **revise** | **THE METHOD, PARAPHRASED. The CSM-VO names assessment criteria but NO method** — NeGSt therefore adapted the **Ausfallfolgen-Unsicherheits-Matrix (AUM)** (proposed by Network Rail, adapted by DB AG) into a **semi-quantitative procedure**: **axis 1** — failure-consequence class of the change *in Anlehnung an* EN 50126, tied to SIL: katastrophal/SIL 4 = 4 points · kritisch/SIL 3 = 3 · marginal/SIL 2 = 2 · unbedeutend/SIL 1 = 1; **axis 2** — uncertainty of carrying out the change, assessed from **innovation and complexity**; matrix zones: **green = never significant, red = always significant, yellow = decided by the two binary criteria reversibility and monitorability** (given/not given). The matrix was converted to a **points scheme for manufacturer/DB compatibility: sum the individual scores; ≥ 6 points = significant, < 6 = not significant** (threshold calibrated at "catastrophic × medium uncertainty"). Verified on worked examples (e.g. ESTW fault fix: 4+0+0+0+0 = 4 → not significant; changed technology: 4+2 = 6 → significant). **CROSS-CHECK AGAINST THE ADR-011 SCHEME (the E-2026-08-20-26 task, discharged): (i) ALIGNED —** the AUM covers five of the six Art 4(2) criteria (failure consequence, novelty/innovation, complexity, monitorability, reversibility) and its consequence-dominant arithmetic reproduces the scheme's "Class A → presumed significant" presumption: a catastrophic-consequence change starts at 4 points and crosses the 6-point line on modest uncertainty alone. The scheme's Step 2 and the AUM are the same test at different resolutions; the AUM now serves as the scheme's **named scoring reference** — free, sector-used, and in current DB application (BR 430, 2026). **(ii) ONE GAP, EACH WAY —** the AUM scoring **omits the sixth Art 4(2) criterion, additionality** (the change's interaction with other concurrent changes); the ADR-011 scheme carries additionality and must keep it **outside** the point sum, as a standalone escalator. Conversely the AUM supplies what the scheme lacked: an auditable arithmetic with a calibrated threshold. **(iii) ⚠️ CURRENCY —** a 2013 Schlussbericht citing the pre-amendment CSM era; **its continued use is evidenced by the 2026 BR 430 assessment, so it is living method, not archaeology — but any adoption cites the method as NeGSt-2013-as-applied-2026, and checks the point values against the current CSM-RA text before external use.** **Adjacent note for ADR-012 item 9b:** the AUM's consequence-classes-tied-to-SIL is a second free semi-quantitative safety-side calculus beside the CSM-RA severity classes already adopted — consistent, not competing (both EN 50126-rooted). **MOVES: `revise` — ADR-011 scheme Step 2 gains the AUM as its named scoring reference with the additionality-outside-the-sum rule; the E-2026-08-20-26 cross-check task closes.** No status flips — ADR-011 remains Proposed on item 6 (EIGV/ESiV texts). |
 
+| E-2026-08-20-28 | 2026-08-20 | **The national authorisation trigger, established at source — current EIGV + ESiV read (gesetze-im-internet.de, after egress allow-rule), with the EU layer completing the picture: Dir (EU) 2016/797 Art 21(12), Reg (EU) 2018/545 Arts 15–16, CCS TSI Reg (EU) 2023/1695 §§ 7.4.2–7.4.4 (all Cellar authentic texts).** Discharges ADR-011 item 6 | Primary German + EU law | `gesetze-im-internet.de/eigv/EIGV.pdf` (26.7.2018, last amended 17.6.2020) · `…/esiv_2020/ESiV.pdf` (17.6.2020, in force 24.6.2020, expressly replaces the 2007 ESiV) · Cellar CELEX 32016L0797 · 32018R0545 · 32023R1695 | **A** | **ADR-011 item 6 / scheme** · ADR-009/ADR-013/R13 · ADR-007 surface 5 | **revise** | **(a) THE CURRENT NATIONAL FRAME:** the 2007 TEIV-era texts on file are confirmed superseded — the operative instruments are the **EIGV (2018/2020)** for authorisations and the **ESiV (2020)** for the SMS layer (implements Dir 2016/798). **(b) THE NATIONAL TRIGGER IS A LIST, NOT A PHRASE: EIGV § 9(3)/(4)** — an upgraded (*aufgerüstet*) or renewed (*erneuert*) vehicle or CCS/infrastructure subsystem needs authorisation **iff a measure named in Anlage 4** is performed (Anlage 5 = maintenance exchange, no authorisation). Definitions § 2: *Aufrüstung* = extensive modification work; *Erneuerung* = extensive substitution work not changing overall performance. **(c) THE RADIO-RELEVANT ANLAGE-4 ROWS, TRACKSIDE — and they bite hard: 4.1.6** creation or complete renewal of the **mobile switching centre, rail switching centre or base-station controller**; **4.1.7** creation or complete renewal of **all base stations of an entire GSM-R chain, loop or shunting polygon**. **A trackside FRMCS build is squarely authorisation-triggering**, with the **§ 21 ten-week pre-start notification** (the 2007 text's ten weeks survives, as the infra Anzeige window) including a mandatory Anlage-4 classification. Exemption: component swap / software adaptation **without effect on existing functional and safety requirements**. **(d) VEHICLE SIDE — narrower than feared: Anlage 4 § 4.2 is scoped to Class-B on-board CCS and ZBS**; its rows: **4.2.2 first-time installation of vehicle radio interfaces for voice and data communication**; **4.2.4 changes to train-control or voice/data-communication equipment affecting the safety architecture or protective/safety functions — expressly including 4.2.4.5, the *Notruffunktion beim Zugfunk*** (and brake access, forced braking, traction cut-off, 4.2.4.1); **4.2.3 a designed-in below-threshold path** — changes wholly inside the on-board CCS subsystem, vehicle interfaces unchanged, no effects on the rest of the vehicle, confirmed by a *bestimmte Stelle* certificate → **not authorisation-triggering**. Reference basis = the vehicle state at its last approval (footnote ***). **(e) FOR INTEROPERABLE (CLASS-A) VEHICLES THE OPERATIVE TEST IS EU-LEVEL: Reg 2018/545 Art 15(1)** — every change categorised (a)–(d) by the **entity managing the change** (maintenance-substitution exempt, Art 16(1)); category (d) = new authorisation per **Dir 2016/797 Art 21(12)**: (a) parameter values outside the TSI-acceptable range, **(b) the overall safety level may be adversely affected**, or (c) the relevant TSI requires it. **And the CCS TSI's ch. 7 contains NO blanket radio-fitment trigger:** 7.4.2.2 forces ETCS matters (new Class-B installation; ETCS-part upgrades via 7.4.2.4.x when functions change); RMR voice/data fitment becomes mandatory only on **area-of-use extension** (7.4.2.3(4)/(5)); vehicles already equipped need not upgrade except for technical compatibility (7.4.2.3(2)). ⚠️ Residual: ch. 7 read in the 2023/1695 base act — check Reg (EU) 2026/693 for ch.-7 amendments before external use (its Appendix-B refinements are on file; its ch.-7 delta is not). **(f) THE DETERMINATION ITEM 6 ASKED FOR: an FRMCS retrofit is NOT categorically "major upgrading."** It is **categorisation-dependent, and the ratified two-stage pattern splits exactly along the legal line**: **stage 1** (antennas/cabling/netboxes, interfaces untouched) is engineerable below both triggers — 2018/545 15(1)(a)/(b) EU-side, the 4.2.3 path nationally, exactly as the BR 430 executed (E-2026-08-20-26); **stage 2** (radio swap) concentrates the trigger: **migrating the railway emergency call to MCX touches the *Notruffunktion beim Zugfunk*** — nationally listed (4.2.4.5, where 4.2 applies) and the natural Art 21(12)(b) safety-level question EU-side — so stage 2 is where authorisation happens, **once per type** via the Art 15 type-level categorisation (new version/variant), which is the *Serienzulassung* arithmetic ADR-009's route (a) assumed. **Trackside FRMCS is the harder national case: 4.1.6/4.1.7 make core and RAN-chain builds authorisation-triggering with a ten-week clock per notification — a scheduling input the ADR-011 gate cadence (item 5) must absorb.** **MOVES: `revise` — ADR-011 item 6 CLOSED; the scheme gains Step 5 (parallel authorisation-trigger check, never inferred from CSM-RA significance); ADR-013 gains the stage-split-matches-the-law finding; with item 6 closed, ADR-011's decision-shaped content is complete and it is ready for ARB ratification.** |
+
 ## How to append
 
 When something arrives during the day:
```
