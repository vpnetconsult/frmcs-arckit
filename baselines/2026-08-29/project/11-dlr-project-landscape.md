# DLR Institut für Verkehrssystemtechnik — complete project landscape

**Surveyed:** 2026-08-20 · **Method:** all **108** projects enumerated from the institute's own Plone API and read at source, nine parallel readers, one rubric · **Status:** working document for inclusion decisions. **Nothing here is an evidence row yet.**

> ⚠️ **Sourcing caveat that applies to every line below.** These are institutional project pages: promotional in register, no negative results, no KPIs, no stated failures. **Tier A for factual metadata** (funder, runtime, partners, volume); **closer to B for any claim about outcome or capability.** Limitations quoted are the ones the pages volunteered — absence of a stated limitation is not evidence there is none.

## Coverage

| | Count |
|---|---|
| Projects enumerated and read | **108** |
| Rated HIGH | **38** (20 rail) |
| Rated MEDIUM | ~30 |
| Rated LOW / NONE | ~40 |
| DZSF-commissioned | **5** — Teleoperation ATO · ATO-Sense · ATO-Einsatzszenarien · ForTeS · **MKB** |

---

## ⚠️ Corrections to rows already committed (E-2026-08-20-04, -05, -06)

1. **STREAMLINE ended 06/2017.** Logged in the present tense as if current. It is a **completed *Vorstudie*, ~9 years old**, which itself defers substantiation to "a later, broader European project" for which we have no evidence. The Swiss-benchmark reasoning stands; the currency claim does not.
2. **RemODtrAIn's ODD is narrow.** Remote operation and obstacle detection are scoped to **Bereitstellungs-, Werks- und Depotfahrten** — positioning, works and depot movements — **not open-line revenue service.** Both demo sites fit that. Certification is explicitly **outside** the project ("die Basis für die *spätere* Zertifizierung"). **DZSF is absent from the partner list** despite certification being the endpoint.
3. **FASaN attribution was thin.** Coordinator is **INAVET**, not DLR; operator partner is **ODEG, a non-DB private operator**; runtime 10/2021–12/2024. And it carries a publication the register needs: **Schnücker, Naumann, Salge (2024), "A neural network to measure train operators' compliance with driver assistance systems"** — measuring whether the human actually *follows* the advice.

---

## The three cross-cutting findings

### 1. ⚠️ The bearer is absent from every remote-operation programme

**Remote Operation hub (+ both children) · RemoteReadyMove (€5.9 m) · RemODtrAIn (€40 m) · ACT4Transformation (€17.3 m) · GAIA-X 4 ROMS (€20 m) · TraCo · InTra · STADT:up · KIRA · IMoGer · AUTOGVZ.**

**Not one states a latency budget, bandwidth requirement, QoS class, coverage assumption, or link-failure behaviour.** TraCo and InTra list the DLR Institute for Communications and Navigation as a partner and still say nothing. The only degraded-mode handling stated anywhere is vehicle-side and *pre-link*: the vehicle stops, then requests help.

**This is the gap this engagement sits in.** Everyone builds up to the seam; nobody publishes across it. Treat as a gap in the sources, not proof the projects have not specified it internally — but it is the sharpest available statement of why ADR-002 item 8 is worth asking.

### 2. ⚠️ Siemens across the whole register, not just the rail cluster

Across 108 projects Siemens appears in **ATO-Sense · RemODtrAIn (coordinator) · Rail2X · SMARAGD (coordinator) · KoMoDnext · KI-Systeme · X2Rail-5 · HALI_Berlin · HEAT · RealLabHH · IMPACT-1**. With **ERJU cyber (Wischy)** and **ATO-RISK (Braband)** from prior evidence, that is **~13 touchpoints**, including the coordinator role on the €40 m remote-operation programme and a seat in the Shift2Rail work that feeds CCS TSI.

**R8/PR13 must be restated: the concentration is in the evidence base, not only in supply.** ERJU, DZSF and the national demonstrator programme cannot be counted as mutually corroborating.

### 3. The advisory/actuating split is already codified in road law

- **Teleassistenz** — *"der Operateur übernimmt nicht die Fahraufgabe, sondern gibt lediglich **Empfehlungen** ans Fahrzeug"* — EU Reg 2022/1426 + **AFGBV**. Availability of a *Technische Aufsicht* is a **precondition of operation**.
- **Telefahren** — direct remote control — **StVFernLV, in force 1 December 2025**, split into continuous and event-based.

DLR is separately researching **whether those legal requirements are fit for purpose**, and how the two regimes **couple**. This is the closest legal template to oversight-not-control the register has found, and it is live law rather than a proposal.

---

## TIER 1 — recommended for inclusion (changes or closes an open item)

| Project | Domain | Why it lands |
|---|---|---|
| **ATO-Cargo** | rail | DB Cargo coordinator + DSD + ProRail, €18.9 m, Betuwe, to 12/2025. **Remote Supervision & Control desk as the ATO fallback**; human keeps the role of ***zentrale Steuerungsinstanz***. States there is **"noch keine Vorlage"** for such a control centre in today's rail system. → **ADR-002 item 8** |
| **ARTE** | rail | Alstom coordinator, €14 m, to 12/2024. Automation **without trackside ETCS** by retrofitting camera-based signal recognition — because *"es wird Jahrzehnte dauern"* until ETCS is nationwide. Targets a **generic component authorisation** and an approval roadmap for **GoA 3, GoA 4 and RTO agreed with the authorities**; names *Remote Operator* and *Zugbegleiter-Plus*. → **ADR-009/R13, ADR-002 item 8** |
| **5G-Reallabor Braunschweig-Wolfsburg** | multi | €12 m BMDV. Use cases run on ***public* 5G networks under normal commercial network planning**, requiring synchronisation with MNO release cycles. Media list includes *"Ferngesteuerter Zug fährt mit 5G durch das Erzgebirge."* → **ADR-001 — a remotely driven train on a public bearer** |
| **Rail2X-Smart Services** | rail | DB Systel coordinator, Siemens partner, €3.81 m. **Automotive Car2X — not FRMCS — carrying a safety-adjacent rail function** (*Anrufschranke*), on the Erzgebirgsbahn. → **ADR-001, R8** |
| **X2Rail-5** | rail | **DLR-coordinated**, €33.9 m, Shift2Rail. **Adaptable communications** as the backbone for next-generation rail automation; cyber-security with a **protection-profile** approach; formal methods at *system-of-systems* level; **route stated into CCS TSI**. Partner list is the entire supplier base plus five infrastructure managers. → **ADR-001, ADR-012, R8** |
| **EGNSS MATE** | rail | SBB coordinator, ESA NAVISP, to 01/2025. Onboard GNSS + map-assisted localisation inside ERTMS/ETCS; trackside localisation *"kann reduziert werden"* but onboard must be **both *genau* and *sicher***; **jamming and spoofing treated as first-class rail threats**; Galileo HAS/OSNMA. → **ADR-012 (safety/security co-engineering), ADR-001** |
| **VVMethoden** | road | BMW/Bosch-led, BASt **and TÜV SÜD inside**, to 12/2023. PEGASUS successor. Deliverable is a **process framework for the *Sicherheitsnachweis***, not a test catalogue. DLR's own burden: *"Nachweis, dass die Simulationen verlässliche Resultate liefern."* → **ADR-010, ADR-007** |
| **PEGASUS** | road | BMWE, 17 partners, to 06/2019. The lineage ATO-Einsatzszenarien inherited. States our completeness problem: current procedures *"sind nicht für eine Zulassung … ausgelegt, da sie hierfür entweder sehr aufwändig oder **nicht vollständig** sind."* Human-performance baseline as the yardstick. → **ADR-010 item 9 (I wrote its route in without reading its source)** |
| **Schwelle 3.0** | rail | **DB Systemtechnik client, DB InfraGO partner**, to 12/2024. CNN crack detection on **~54 million concrete sleepers**; *Streckenverantwortliche* adjudicate findings and their adjudications become training labels. ⚠️ **The page never mentions Zulassung or Sicherheitsnachweis** — a deployed advisory AI on safety-relevant infrastructure, approval boundary drawn by keeping it advisory. → **ADR-002 item 6, ADR-004** |
| **Digitale Weiche 2** | rail | **DB Netz AG** end client, TÜV Rheinland in consortium, **to 12/2027 — live**. AI fault detection on **650 operational switches**. DB Netz aims to establish predictive maintenance ***"technisch und regulatorisch"***. → **ADR-004, ADR-010 — a real approval-throughput and ground-truth datapoint** |
| **KoKoVI** | road | DLR, €16.2 m, to 12/2024. Remote supervision **does not scale by escalation**: *"wenn automatisierte Shuttledienste künftig jedoch auf größere Flotten … ausgeweitet werden, ist diese Lösungsstrategie nicht mehr handhabbar."* Also: *"Aktuell gibt es keine implementierte Lösungsansätze"* for a vehicle that stops and cannot proceed. → **ADR-010/PR4, ADR-002** |
| **InTra (TP3)** | rail | DLR own funds, €12 m, to 2025. Trustworthiness must hold *"während der Entwicklung, **aber auch während ihres Betriebes**"* — a one-time pre-service safety case cannot discharge an adaptive component. → **ADR-004, ADR-010** |
| **MKB — Multikuppelbarkeit** | rail | **DZSF-commissioned**, TU Stuttgart. Mechanical coupling converged (~90 % Scharfenberg Type 10); **electronic coupling and train control stayed incompatible *"durch eine fehlende Normung"***, cause named as ***"losweise Beschaffung"***. Standardisation *"sehr zeitaufwändig"*, needs federal neutral coordination. **Citable DZSF report: doi 10.48755/dzsf.230002.01, 103 pp.** → **R8/PR13 — the same layering that decides whether FRMCS is multi-vendor in fact or only in name** |
| **Remote Operation (hub + Teleassistenz + Telefahren)** | road | The legal split above — AFGBV vs StVFernLV. → **ADR-002 item 8, and the strongest legal precedent for oversight-not-control** |

## TIER 2 — worth including, corroborative or second-order

**Next Generation Railway System** (rail — *Zentraler Fernsteuerungsarbeitsplatz als Ausweichlösung*; **RailSiTe®** accredited ETCS conformance lab; *"Automatisierung der Zulassung"*) · **TraCo** (rail — *"zulassungsfähige Automation"* as one objective with human-technology interaction; **Automationsinsel** as a migration path that avoids fleet-wide authorisation) · **AUTOGVZ** (road — **simulation-derived evidence accepted for an AFGBV operating permit**, regular service intended to survive project end) · **IMoGer** (road, €39.2 m — nine-module fleet authorisation, safety rests on *technische Aufsicht* + intelligent infrastructure) · **KIRA** (road, DB Regio Bus coordinator — **scalability of the *Technische Aufsicht* across a fleet**, processes co-developed with the approval authorities) · **STADT:up** (road — DLR builds the **teleoperator workstation** for the AFGBV *technische Aufsicht*; pairs with ATO-Cargo's RSC desk as one body of method) · **RealLabHH** (rail TP8 — *Digitales Andreaskreuz*, level-crossing state by radio, output is a **regulatory test recommendation**; TP4 driverless-fleet control room) · **KoMoDnext** (road — **hybrid ITS-G5/5G/LTE with redundant paths**, functional-safety concept, and **fusion of *latenzbehaftete* external data with on-board LiDAR**) · **SUMO-Spurplan-4/5** (rail, **DB AG client** — DB uses SUMO to train and evaluate **AI dispatching interventions already in production**; simulation fidelity is the load-bearing link in that evidence chain, and this project exists because it was insufficient) · **GAIA-X 4 PLC-AAD** (road — **validated simulation** built against field observation before scenarios are run) · **VIVID** (road — *"Wie sicher ist sicher genug?"*, coverage argument from the physics of false positives/negatives) · **KI-Familie** (road — *KI-Absicherung*, the AI safety-demonstration family) · **HEiDi** (rail — already logged) · **ACT4Transformation** (road, €17.3 m — prototypes the **safe state transition** between driving unaided and driving with outside support, security co-engineered on the channels)

## TIER 3 — note only

HI-DRIVE (ODD extension, €60 m) · GAIA-X 4 ROMS (ODD monitoring → remote workstation) · GAIA-X 4 AMS (**continuous in-operation ODD conformance checking**) · GAIA-X 4 AGEDA (four-rung escalation ladder ending in full remote control, no safety case attached) · SynthBAD · KI-DeltaLearning (**domain shift — what must be re-evidenced after a delta**) · L3Pilot · HALC (in-cab supervisory attention) · AutoAkzept (**operator-state sensing** — pairs with the HMI4Rail Art 5 question) · DIGEST · TrackScan · OnboardEU · SMARAGD · RangierTerminal4.0 · HavenZuG · IMPACT-1 · MaDe4Rail · KoTAM · Road2Simulation · UDRIVE · XCYCLE

## Excluded — ~40 projects, and why

Urban mobility, cycling and pedestrian safety, on-demand rural buses, smart cities, air quality, crowd management, maritime ETA, quantum traffic signals, passenger information and accessibility, serious games, regional industrial strategy. **None engages any of the nine questions.** Named for auditability: aim4it · VABENE++ · RelAiS · KoFeMo · Landpartie · MITHOS · HUB CHAIN · MWK-Zukunftslabor · SAFIRA · SIRENE · MERMAID · VITAL · interACT · AUTOPILOT · ProTrain · CoMove · MoCKiii · VRIEDRICH · CroMa-PRO · QI-TraSiCo · eUVM · VM50kCity · iUSIM · Eddy · KI4Safety · LTSA · ViVre · HEAT · ITSforAsia · TRIPS · ReTraSON · MPSC · ErlebensAtlas · NIKKI · ODIN-MP · VS Trier · Digitaler Atlas 2.0 · ALFRIED · Digitaler Knoten 4.0 · Qualität für Streckenbeeinflussungsanlagen · HALI_Berlin · 5G Smart Country (DLR page is a content-free stub).
