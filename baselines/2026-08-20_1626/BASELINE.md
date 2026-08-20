# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T14:26:05Z
Files: 74

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 386

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 6 of 10 |
| ADRs Proposed | 4 of 10 |
| ADR action items closed / open | 19 / 57 |
| Evidence rows: revise | 54 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **13%** |


## Changes vs 2026-08-20_1610

- changed: evidence-log.md
- changed: project/ADR-004-sil4-boundary.md
- changed: project/ADR-011-migration-change-control.md
- changed: project/ADR-013-onboard-retrofit-pattern.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -438,6 +438,8 @@
 
 | E-2026-08-20-25 | 2026-08-20 | **"AutomatedTrain — Integration eines skalierbaren Diagnosekonzepts: Service-Oriented Vehicle Diagnostics für die betriebliche Überwachung komplexer Systeme in automatisierten Zügen"** — Rabe, Renatus, Bäker (TU Dresden, Fahrzeugmechatronik) · **Adelberg (DB InfraGO AG, Teilprojektleiter Diagnose)**; *EI — Der Eisenbahningenieur* 7/2026, S. 44–49. Project **AutomatedTrain**: BMWE + EU funded, nine partners, fully automated staging/stabling runs (GoA 4) around first/last station | Trade-journal article by the project's own researchers | Download folder `0726_Fachartikel_EI_AT_Diagnosekonzept.pdf` (DB-licensed copy — paraphrase only) | **B** (A for project facts, partners and the standards cited; B for capability/benefit claims — self-description of own concept, demonstrated on a minimal camera example, no independent validation) | **ADR-012 items 1, 2** · **R12/PR5** · ADR-002 · ADR-007 · R8/PR13 | **revise** | **What it proposes:** adapt the automotive **SOVD** standard (Service-Oriented Vehicle Diagnostics, ISO/DIS 17978; REST/HTTP/JSON over TCP/IP) as the on-board fault-management layer for ATO GoA 3–4 vehicles — perception-sensor fault memories and degradation estimators exposed as services, on-board processing, **KPIs relayed to the control centre "über GSM-R oder FRMCS"**; shown compatible with the TCN stack (EN 61375-2-5) and Safe4Rail-3 TSN-over-Ethernet. **(a) ⚠️ THE SENTENCE THAT MATTERS FOR R12, and it is the sector conceding the register's premise: without the driver, *"basiert die diagnostische Bewertung der Systeme ausschließlich auf deren Eigendiagnose"* — the driver is named as an important SYMPTOM-GIVER (visual/auditory/olfactory early detection), and removing them leaves diagnosis resting SOLELY on self-diagnosis.** The proposed fix is better self-diagnosis: predictive detection of critical fault patterns, **reported to the control centre BEFORE the fault occurs**. **Two register-relevant readings. (i) That before-the-threshold predictive reporting is functionally the Risk Sentinel's job description, appearing independently in a DB-InfraGO-co-led project — in-domain corroboration that the function is needed. (ii) BUT strengthened self-diagnosis is still SELF-REPORT. 23 June was precisely a self-diagnosis failure (silent fault, no alarm), and the register's standing rule — never rely on a silent system to alarm itself, now statutorily backed by § 31 Abs. 2 BSIG (E-2026-08-20-24) — applies to the diagnosis layer itself: WHO DIAGNOSES THE DIAGNOSER? The article does not ask. Independent, out-of-band detection remains OUR requirement, not the sector's answer.** **(b) ⚠️ SECURITY: SOVD's TLS IS OPTIONAL** (*"deren Nutzung optional"*) — a REST/HTTP diagnostic API with optional encryption on the train network, relaying over the FRMCS bearer. **This is the TS 33.501 lesson again (E-2026-07-26-14): the spec leaves protection optional, so procurement must mandate it.** And an on-board SOVD server is itself a **product with digital elements** the ADR-012 item-1 inventory did not name. **(c) Openness supports R8/PR13:** the article argues open standards (SOVD/UDS/ODX/OTX, OCORA reference architecture, HERD diagnostics harmonisation, R2DATO TCMS Data Service) against *"monolithische proprietäre Diagnosekonzepte"* — the register's unbundling argument, made from inside a DB-co-led project, with named open instruments. **(d) Context for ADR-002 item 3:** the driver-as-sensor loss corroborates the human-factors rows (E-2026-08-19-01) — automation removes not only skills but a detection channel. **MOVES: `revise` — ADR-012 item 1 gains on-board diagnostic servers/APIs as a named PDE class; item 2 gains the diagnostics-interface bid condition (TLS mandatory, not optional; authenticated access; the diagnostics relay declared in the per-device internet-connected determination).** Risk-Sentinel corroboration and the self-report tension recorded here; no status flips — a concept article on a minimal demonstrator is not test evidence. |
 
+| E-2026-08-20-26 | 2026-08-20 | **"Umrüstung eines S-Bahn-Elektrotriebzuges der BR 430 für das Förderprojekt AutomatedTrain — Herausforderungen bei Fahrzeugumbau & Integration in Vorbereitung für den fahrerlosen Betrieb unter ATO-GoA4"** — **Hoffmann (DB Systemtechnik, Teilprojektleiter Fahrzeug)** · Lehnert · Weinbeer (both DB Regio, S-Bahn Stuttgart); *ETR* 6/2026, S. 52–57. BR 430 retrofit with obstacle-detection sensing (6 lidars, 2 IR cameras, radar, ultrasonic, GNSS+INS), data logger, measurement runs in the public Stuttgart S-Bahn network since 02/2026 | Trade-journal article by the project's own leads | Download folder `0626_Fachartikel_ETR_Fahrzeugumbau_Integration_AT.pdf` (DB-licensed copy — paraphrase only) | **B** (A for the process facts, instruments named, dates and citations; B for capability claims — self-description, milestone report) | **ADR-011** (scheme + item 6) · **ADR-013/ADR-009/R13** · **ADR-004/R11** · ADR-012 item 2 · ADR-003 | **revise** | **THE REGISTER'S CHANGE-CONTROL AND BOUNDARY ARGUMENTS, EXECUTED ON A REAL VEHICLE — the most directly load-bearing retrofit evidence since the NS row (E-2026-08-15-54). (a) ⚠️ A WORKED, CURRENT RUN OF THE ADR-011 PROCESS:** integration of the AT system required a change-impact analysis per **Reg (EU) 402/2013 through DB Regio's SMS** — description/justification → safety-relevance screening (structural vs functional areas) → **significance analysis by the NeGST method** (Neue Generation Signaltechnik, DLR; criteria incl. monitorability, degree of innovation, failure consequences, complexity, mapped in a failure-consequence/uncertainty matrix) → hazards + mitigations. Outcome: **50 change points individually assessed; many safety-relevant; ALL assessed NOT significant** — governed under existing rulebooks, assessed *in Anlehnung an* EN 50129 **by an independent specialised company**. **Two takes for the scheme: (i) live confirmation of the Art 2(2)(b) route ADR-011's scheme encodes — safety-relevant-but-not-significant, documented, independently checked; (ii) NeGST is a NAMED, PUBLIC German operationalisation of the significance criteria (free DLR PDF, edocs.tib.eu) — obtain and cross-check the scheme's Step 2 against it.** **(b) ⚠️ THE ADVISORY-BOUNDARY PATTERN IN METAL (ADR-004/ADR-003):** ODS and data logger were retrofitted **under the explicit premise of *Rückwirkungsfreiheit*** — no access to vehicle control, driver keeps driving; the APM test module equally non-interfering, deriving reactions and *assigning* them to vehicle functions (horn, emergency brake) without itself being the control path. The shared odometer signal (WIG, part of the ETCS type approval) was doubled via signal splitters and cleared through **SVoC (Safety Validation of minor Change) by the integrator Alstom** — proof that no new hazards arise from reading an existing certified sensor. **That is the register's central claim — an advisory layer can be added to a certified estate without re-opening its safety case, if and only if it provably cannot write — accepted in practice by an integrator and an independent assessor on a passenger vehicle. Cite as precedent-in-kind for the ADR-004 boundary argument; do NOT over-claim it: a GoA4 sensing retrofit on one EMU is not a network-scale oversight layer.** **(c) THE TWO-STAGE PATTERN CORROBORATED ON THE DKS FLEET ITSELF (ADR-013):** the BR 430 was already ETCS-retrofitted under Digitaler Knoten Stuttgart and offered *"eine geeignete Grundlage"* for this second integration; **ATO-OB follows in a named second Ausrüstungsstufe** — the ratified stage-1/stage-2 pattern, in the wild, on the fleet ADR-013's precedent cites. Practical constraints worth carrying: **UIC 651 driver sight-field** limits camera placement behind the windscreen; **antenna minimum separations against the ETCS antennas** (mutual non-interference) drove the layout of eight new antennas; **reversibility (einfacher Rückbau) was a contractual premise** — mounts reuse existing fixing points, drillings restored at removal. **(d) CONNECTIVITY THE RETROFIT ADDS (ADR-012 item 2):** the data logger generates **~1.5 GB/s**, offloads via **four WiFi antennas** at stabling to DB InfraGO's **Data Factory**, and carries **two 5G antennas for remote access and cloud monitoring** — a retrofitted vehicle acquiring internet-connected radio equipment, i.e. a live instance of the per-device Del Reg 2022/30 determination the procurement gate now requires. **(e) ⚠️ THE NATIONAL-LAW POINTER ADR-011 ITEM 6 NEEDS: the operative instrument is the EIGV** — the runs proceed as measurement runs (*Gelegenheitsverkehr*) because the retrofit does not touch the vehicle's operating approval; the summary states the requirements for a test drive per **§ 15(4) EIGV** were not met. **So the current national authorisation layer is the EIGV (Eisenbahn-Inbetriebnahmegenehmigungsverordnung) — the acquisition target for item 6 is the current EIGV text, and this article is a live example of a change staying deliberately BELOW its authorisation threshold.** Delta specifications for ATO-OB/ETCS-OB software are announced for sector release — watch. **MOVES: `revise` — ADR-011's scheme gains the worked example + NeGST cross-check task; item 6 gains the EIGV as named acquisition target; ADR-013 gains the in-the-wild corroboration + integration constraints; ADR-004 gains the precedent-in-kind note.** No status flips — a project milestone article is not assurance evidence, and the ADRs it touches are already Accepted or evidence-bound. |
+
 ## How to append
 
 When something arrives during the day:
```
