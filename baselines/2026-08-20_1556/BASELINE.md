# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T13:56:31Z
Files: 73

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 3 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 385

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 4 of 10 |
| ADRs Proposed | 6 of 10 |
| ADR action items closed / open | 17 / 59 |
| Evidence rows: revise | 53 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **13%** |


## Changes vs 2026-08-20_1541

- changed: evidence-log.md
- changed: project/ADR-012-cybersecurity-conformance.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -436,6 +436,8 @@
 
 | E-2026-08-20-24 | 2026-08-20 | **NIS2UmsG — *Gesetz zur Umsetzung der NIS-2-Richtlinie und zur Regelung wesentlicher Grundzüge des Informationssicherheitsmanagements in der Bundesverwaltung*, vom 2. Dezember 2025, BGBl. 2025 I Nr. 301, ausgegeben 5.12.2025** — read from the promulgated Regelungstext PDF (download folder). Closes the last E-2026-07-01-06 verification gap | Primary German law (Bundesgesetzblatt) | `regelungstext.pdf`, download folder, placed by the user 2026-08-20 | **A** | **ADR-012 items 6, 4, 5** · R14 · R12/PR5 | **revise** | **(a) IN-FORCE DATE — the fact the register has carried open since 1 July: Artikel 30, "Dieses Gesetz tritt am Tag nach der Verkündung in Kraft" → in force 6 December 2025** (promulgated 5.12.2025; law dated 2.12.2025). Germany transposed ~14 months after the directive's 17.10.2024 deadline (Art 41 NIS-2, E-2026-07-01-06) — the obligations have been live national law for ~8.5 months as of today. **(b) THE GERMAN REPORTING CADENCE (§ 32 BSIG n.F., Artikel 1):** Erstmeldung **unverzüglich, spätestens 24 h** nach Kenntniserlangung; Meldung **72 h** (confirming/updating, first severity assessment, IoCs); Zwischenmeldung on BSI request; **Abschlussmeldung spätestens EINEN MONAT NACH DER 72-h-MELDUNG** — ⚠️ note the clock start: the one-month final report runs from the *Nummer-2 notification*, not from the incident — a nuance ADR-012 item 4's "24 h / 72 h / 1-month" shorthand must carry. Reports go to a **joint BSI + BBK Meldestelle**. **(c) ⚠️ RAIL IS IN THE ANNEX BY NAME, AND SO IS DISPATCHING: Anlage, Sektor Transport und Verkehr, 2.2.1** — *Betreiber von Eisenbahninfrastruktur nach § 2 Abs. 6/6a AEG* **"einschließlich zentraler Einrichtungen, die den Zugbetrieb vorausschauend und bei unerwartet eintretenden Ereignissen disponiert"** — the German legislator expressly pulls **central traffic-dispositive facilities** (predictive and on unexpected events) into scope; **2.2.2** adds EVU incl. Serviceeinrichtungen (§ 2 Nr. 9 AEG). **That clause is nearly a statutory description of the operational environment the oversight layer serves — the entity running predictive/event-driven train dispositions is a named NIS-2 regulatee in German law, not just a member of a broad sector.** **(d) STATUTORY ATTACK-DETECTION DUTY (§ 31 Abs. 2 BSIG n.F.):** Betreiber kritischer Anlagen must operate **Systeme zur Angriffserkennung** that "kontinuierlich und automatisch" capture and evaluate parameters from live operation, identify threats and provide for remediation, **Stand der Technik**, with a proportionality bound. **This is the German statutory footing for exactly what ADR-012 item 5 and R12/PR5 argue from first principles — independent, continuous detection is not a design preference, it is a KRITIS operator duty.** **MOVES: `revise` — ADR-012 item 6 FULLY CLOSED** (both halves: CRA recall paragraph E-2026-08-20-23e, NIS2UmsG in-force date here); item 4 gains the national reference (§ 32 BSIG n.F., joint Meldestelle, the final-report clock nuance); item 5 gains § 31 Abs. 2 as statutory grounding. **NO STATUS FLIPS — R14 stays Open on its own action items; a transposition date is a fact, not conformance evidence.** |
 
+| E-2026-08-20-25 | 2026-08-20 | **"AutomatedTrain — Integration eines skalierbaren Diagnosekonzepts: Service-Oriented Vehicle Diagnostics für die betriebliche Überwachung komplexer Systeme in automatisierten Zügen"** — Rabe, Renatus, Bäker (TU Dresden, Fahrzeugmechatronik) · **Adelberg (DB InfraGO AG, Teilprojektleiter Diagnose)**; *EI — Der Eisenbahningenieur* 7/2026, S. 44–49. Project **AutomatedTrain**: BMWE + EU funded, nine partners, fully automated staging/stabling runs (GoA 4) around first/last station | Trade-journal article by the project's own researchers | Download folder `0726_Fachartikel_EI_AT_Diagnosekonzept.pdf` (DB-licensed copy — paraphrase only) | **B** (A for project facts, partners and the standards cited; B for capability/benefit claims — self-description of own concept, demonstrated on a minimal camera example, no independent validation) | **ADR-012 items 1, 2** · **R12/PR5** · ADR-002 · ADR-007 · R8/PR13 | **revise** | **What it proposes:** adapt the automotive **SOVD** standard (Service-Oriented Vehicle Diagnostics, ISO/DIS 17978; REST/HTTP/JSON over TCP/IP) as the on-board fault-management layer for ATO GoA 3–4 vehicles — perception-sensor fault memories and degradation estimators exposed as services, on-board processing, **KPIs relayed to the control centre "über GSM-R oder FRMCS"**; shown compatible with the TCN stack (EN 61375-2-5) and Safe4Rail-3 TSN-over-Ethernet. **(a) ⚠️ THE SENTENCE THAT MATTERS FOR R12, and it is the sector conceding the register's premise: without the driver, *"basiert die diagnostische Bewertung der Systeme ausschließlich auf deren Eigendiagnose"* — the driver is named as an important SYMPTOM-GIVER (visual/auditory/olfactory early detection), and removing them leaves diagnosis resting SOLELY on self-diagnosis.** The proposed fix is better self-diagnosis: predictive detection of critical fault patterns, **reported to the control centre BEFORE the fault occurs**. **Two register-relevant readings. (i) That before-the-threshold predictive reporting is functionally the Risk Sentinel's job description, appearing independently in a DB-InfraGO-co-led project — in-domain corroboration that the function is needed. (ii) BUT strengthened self-diagnosis is still SELF-REPORT. 23 June was precisely a self-diagnosis failure (silent fault, no alarm), and the register's standing rule — never rely on a silent system to alarm itself, now statutorily backed by § 31 Abs. 2 BSIG (E-2026-08-20-24) — applies to the diagnosis layer itself: WHO DIAGNOSES THE DIAGNOSER? The article does not ask. Independent, out-of-band detection remains OUR requirement, not the sector's answer.** **(b) ⚠️ SECURITY: SOVD's TLS IS OPTIONAL** (*"deren Nutzung optional"*) — a REST/HTTP diagnostic API with optional encryption on the train network, relaying over the FRMCS bearer. **This is the TS 33.501 lesson again (E-2026-07-26-14): the spec leaves protection optional, so procurement must mandate it.** And an on-board SOVD server is itself a **product with digital elements** the ADR-012 item-1 inventory did not name. **(c) Openness supports R8/PR13:** the article argues open standards (SOVD/UDS/ODX/OTX, OCORA reference architecture, HERD diagnostics harmonisation, R2DATO TCMS Data Service) against *"monolithische proprietäre Diagnosekonzepte"* — the register's unbundling argument, made from inside a DB-co-led project, with named open instruments. **(d) Context for ADR-002 item 3:** the driver-as-sensor loss corroborates the human-factors rows (E-2026-08-19-01) — automation removes not only skills but a detection channel. **MOVES: `revise` — ADR-012 item 1 gains on-board diagnostic servers/APIs as a named PDE class; item 2 gains the diagnostics-interface bid condition (TLS mandatory, not optional; authenticated access; the diagnostics relay declared in the per-device internet-connected determination).** Risk-Sentinel corroboration and the self-report tension recorded here; no status flips — a concept article on a minimal demonstrator is not test evidence. |
+
 ## How to append
 
 When something arrives during the day:
```
