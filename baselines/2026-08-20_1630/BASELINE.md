# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T14:30:10Z
Files: 74

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 387

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 6 of 10 |
| ADRs Proposed | 4 of 10 |
| ADR action items closed / open | 19 / 57 |
| Evidence rows: revise | 55 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **14%** |


## Changes vs 2026-08-20_1626

- changed: evidence-log.md
- changed: project/ADR-011-migration-change-control.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -440,6 +440,8 @@
 
 | E-2026-08-20-26 | 2026-08-20 | **"Umrüstung eines S-Bahn-Elektrotriebzuges der BR 430 für das Förderprojekt AutomatedTrain — Herausforderungen bei Fahrzeugumbau & Integration in Vorbereitung für den fahrerlosen Betrieb unter ATO-GoA4"** — **Hoffmann (DB Systemtechnik, Teilprojektleiter Fahrzeug)** · Lehnert · Weinbeer (both DB Regio, S-Bahn Stuttgart); *ETR* 6/2026, S. 52–57. BR 430 retrofit with obstacle-detection sensing (6 lidars, 2 IR cameras, radar, ultrasonic, GNSS+INS), data logger, measurement runs in the public Stuttgart S-Bahn network since 02/2026 | Trade-journal article by the project's own leads | Download folder `0626_Fachartikel_ETR_Fahrzeugumbau_Integration_AT.pdf` (DB-licensed copy — paraphrase only) | **B** (A for the process facts, instruments named, dates and citations; B for capability claims — self-description, milestone report) | **ADR-011** (scheme + item 6) · **ADR-013/ADR-009/R13** · **ADR-004/R11** · ADR-012 item 2 · ADR-003 | **revise** | **THE REGISTER'S CHANGE-CONTROL AND BOUNDARY ARGUMENTS, EXECUTED ON A REAL VEHICLE — the most directly load-bearing retrofit evidence since the NS row (E-2026-08-15-54). (a) ⚠️ A WORKED, CURRENT RUN OF THE ADR-011 PROCESS:** integration of the AT system required a change-impact analysis per **Reg (EU) 402/2013 through DB Regio's SMS** — description/justification → safety-relevance screening (structural vs functional areas) → **significance analysis by the NeGST method** (Neue Generation Signaltechnik, DLR; criteria incl. monitorability, degree of innovation, failure consequences, complexity, mapped in a failure-consequence/uncertainty matrix) → hazards + mitigations. Outcome: **50 change points individually assessed; many safety-relevant; ALL assessed NOT significant** — governed under existing rulebooks, assessed *in Anlehnung an* EN 50129 **by an independent specialised company**. **Two takes for the scheme: (i) live confirmation of the Art 2(2)(b) route ADR-011's scheme encodes — safety-relevant-but-not-significant, documented, independently checked; (ii) NeGST is a NAMED, PUBLIC German operationalisation of the significance criteria (free DLR PDF, edocs.tib.eu) — obtain and cross-check the scheme's Step 2 against it.** **(b) ⚠️ THE ADVISORY-BOUNDARY PATTERN IN METAL (ADR-004/ADR-003):** ODS and data logger were retrofitted **under the explicit premise of *Rückwirkungsfreiheit*** — no access to vehicle control, driver keeps driving; the APM test module equally non-interfering, deriving reactions and *assigning* them to vehicle functions (horn, emergency brake) without itself being the control path. The shared odometer signal (WIG, part of the ETCS type approval) was doubled via signal splitters and cleared through **SVoC (Safety Validation of minor Change) by the integrator Alstom** — proof that no new hazards arise from reading an existing certified sensor. **That is the register's central claim — an advisory layer can be added to a certified estate without re-opening its safety case, if and only if it provably cannot write — accepted in practice by an integrator and an independent assessor on a passenger vehicle. Cite as precedent-in-kind for the ADR-004 boundary argument; do NOT over-claim it: a GoA4 sensing retrofit on one EMU is not a network-scale oversight layer.** **(c) THE TWO-STAGE PATTERN CORROBORATED ON THE DKS FLEET ITSELF (ADR-013):** the BR 430 was already ETCS-retrofitted under Digitaler Knoten Stuttgart and offered *"eine geeignete Grundlage"* for this second integration; **ATO-OB follows in a named second Ausrüstungsstufe** — the ratified stage-1/stage-2 pattern, in the wild, on the fleet ADR-013's precedent cites. Practical constraints worth carrying: **UIC 651 driver sight-field** limits camera placement behind the windscreen; **antenna minimum separations against the ETCS antennas** (mutual non-interference) drove the layout of eight new antennas; **reversibility (einfacher Rückbau) was a contractual premise** — mounts reuse existing fixing points, drillings restored at removal. **(d) CONNECTIVITY THE RETROFIT ADDS (ADR-012 item 2):** the data logger generates **~1.5 GB/s**, offloads via **four WiFi antennas** at stabling to DB InfraGO's **Data Factory**, and carries **two 5G antennas for remote access and cloud monitoring** — a retrofitted vehicle acquiring internet-connected radio equipment, i.e. a live instance of the per-device Del Reg 2022/30 determination the procurement gate now requires. **(e) ⚠️ THE NATIONAL-LAW POINTER ADR-011 ITEM 6 NEEDS: the operative instrument is the EIGV** — the runs proceed as measurement runs (*Gelegenheitsverkehr*) because the retrofit does not touch the vehicle's operating approval; the summary states the requirements for a test drive per **§ 15(4) EIGV** were not met. **So the current national authorisation layer is the EIGV (Eisenbahn-Inbetriebnahmegenehmigungsverordnung) — the acquisition target for item 6 is the current EIGV text, and this article is a live example of a change staying deliberately BELOW its authorisation threshold.** Delta specifications for ATO-OB/ETCS-OB software are announced for sector release — watch. **MOVES: `revise` — ADR-011's scheme gains the worked example + NeGST cross-check task; item 6 gains the EIGV as named acquisition target; ADR-013 gains the in-the-wild corroboration + integration constraints; ADR-004 gains the precedent-in-kind note.** No status flips — a project milestone article is not assurance evidence, and the ADRs it touches are already Accepted or evidence-bound. |
 
+| E-2026-08-20-27 | 2026-08-20 | **NeGSt — *Neue Generation Signaltechnik*, Schlussbericht (final report), DLR-Institut für Verkehrssystemtechnik, December 2013** (project 09/2011–08/2013, Förderkennzeichen 19P11001A, Projektträger TÜV Rheinland Consulting). Read for the **significance-assessment method** the AutomatedTrain BR 430 change assessment applied in 2026 (E-2026-08-20-26) | Final report of a publicly funded research project | `edocs.tib.eu/files/e01fb14/796268975.pdf` (free, public; fetched 2026-08-20 after egress allow-rule; Downloads folder read-only from the sandbox — cite the URL) | **A** (primary for the method it defines; ⚠️ dated 2013) | **ADR-011 item 1 / scheme Step 2** · ADR-012 item 9b (adjacent) | **revise** | **THE METHOD, PARAPHRASED. The CSM-VO names assessment criteria but NO method** — NeGSt therefore adapted the **Ausfallfolgen-Unsicherheits-Matrix (AUM)** (proposed by Network Rail, adapted by DB AG) into a **semi-quantitative procedure**: **axis 1** — failure-consequence class of the change *in Anlehnung an* EN 50126, tied to SIL: katastrophal/SIL 4 = 4 points · kritisch/SIL 3 = 3 · marginal/SIL 2 = 2 · unbedeutend/SIL 1 = 1; **axis 2** — uncertainty of carrying out the change, assessed from **innovation and complexity**; matrix zones: **green = never significant, red = always significant, yellow = decided by the two binary criteria reversibility and monitorability** (given/not given). The matrix was converted to a **points scheme for manufacturer/DB compatibility: sum the individual scores; ≥ 6 points = significant, < 6 = not significant** (threshold calibrated at "catastrophic × medium uncertainty"). Verified on worked examples (e.g. ESTW fault fix: 4+0+0+0+0 = 4 → not significant; changed technology: 4+2 = 6 → significant). **CROSS-CHECK AGAINST THE ADR-011 SCHEME (the E-2026-08-20-26 task, discharged): (i) ALIGNED —** the AUM covers five of the six Art 4(2) criteria (failure consequence, novelty/innovation, complexity, monitorability, reversibility) and its consequence-dominant arithmetic reproduces the scheme's "Class A → presumed significant" presumption: a catastrophic-consequence change starts at 4 points and crosses the 6-point line on modest uncertainty alone. The scheme's Step 2 and the AUM are the same test at different resolutions; the AUM now serves as the scheme's **named scoring reference** — free, sector-used, and in current DB application (BR 430, 2026). **(ii) ONE GAP, EACH WAY —** the AUM scoring **omits the sixth Art 4(2) criterion, additionality** (the change's interaction with other concurrent changes); the ADR-011 scheme carries additionality and must keep it **outside** the point sum, as a standalone escalator. Conversely the AUM supplies what the scheme lacked: an auditable arithmetic with a calibrated threshold. **(iii) ⚠️ CURRENCY —** a 2013 Schlussbericht citing the pre-amendment CSM era; **its continued use is evidenced by the 2026 BR 430 assessment, so it is living method, not archaeology — but any adoption cites the method as NeGSt-2013-as-applied-2026, and checks the point values against the current CSM-RA text before external use.** **Adjacent note for ADR-012 item 9b:** the AUM's consequence-classes-tied-to-SIL is a second free semi-quantitative safety-side calculus beside the CSM-RA severity classes already adopted — consistent, not competing (both EN 50126-rooted). **MOVES: `revise` — ADR-011 scheme Step 2 gains the AUM as its named scoring reference with the additionality-outside-the-sum rule; the E-2026-08-20-26 cross-check task closes.** No status flips — ADR-011 remains Proposed on item 6 (EIGV/ESiV texts). |
+
 ## How to append
 
 When something arrives during the day:
```
