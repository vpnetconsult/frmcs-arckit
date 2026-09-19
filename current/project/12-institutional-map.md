# Institutional map — SDOs, regulatory authorities, research and validation bodies, sector groups

**Date:** 2026-09-15 · **Method:** arcKit · **Status:** DRAFT v1
**Outcome anchor:** *safe, continuous rail operations.*
**Companions:** `sdo-mapping-frmcs-gsmr-5gsa.md` (which SDO owns which *layer* of the FRMCS stack — the technical view) · `13-legal-binding-chain.md` (how L7 law names the layers by index and version, and where it stops — the legal view) · `05-stakeholders.md` (power/interest and mandate — the political view) · `traceability-matrix.md` · `evidence-log.md`.

> **What this is.** A roster of every standards, regulatory, research and sector body the register has actually met, sorted by **the function it performs in the GSM-R → FRMCS transition and in the oversight architecture** — not by how important it is. Built on 2026-09-15 by sweeping `evidence-log.md` (462 rows) for institution names and reading the anchoring rows; the *rows* column is the count of evidence rows mentioning the body, which measures **how much this register has read about it**, not the body's weight. Every entry cites the evidence rows it rests on. **A body that is not here is a body this register has not read — that is a fact about the register, not about the world** (§6 names the known gaps).
>
> **Why it exists.** The three companion documents each answer a different question. The SDO map says *who owns the bearer's behaviour*; the stakeholder map says *who holds the mandate and how much it bears on the outcome*. Neither lists the research institutes, the comitology committee, the assessment-body functions or the operator-side expert groups in one place — and the 2026-09-15 evidence (E-2026-09-15-02, a VDV deck for a joint ERA/EBA workshop) was the third time in a fortnight that a body in the register's own stakeholder set turned out to hold material the register had never read (RSEG on 09-05, ERORAT on 09-10, VDV on 09-15). A roster with the artefacts *on file* per body makes that gap visible before it is discovered by accident.

---

## 0. How the bodies connect — the pipeline the specifications travel

```
RESEARCH & VALIDATION      ERJU System Pillar + Innovation Pillar (ex-Shift2Rail) · FP2-MORANE-2 · 5GRAIL · 5G-RACOM
                           DZSF · DLR-TS · Fraunhofer · universities · DSD research reports · academic venues
        │  feeds requirements, threat models, validated test cases
        ▼
STANDARDS (SDOs)           3GPP ──profiled by──▶ ETSI TC-RT ◀── UIC (URS/FRS/SRS, TOBA)      [bearer + service]
                           IEC TC 9 / ISA-IEC 62443 ──profiled by──▶ CLC/TC 9X (TS 50701 → IEC 63452)   [cyber]
                           CENELEC EN 5012x · UNISIG SUBSETs · CEPT/ECC (spectrum) · IETF (protocols)
        │  ERA folds FRS/SRS + SUBSETs into the CCS TSI; ERA opinions enable pilots (CIR 2023/1695 Art 10)
        ▼
EU LEGAL LAYER             European Commission (DG MOVE) ── RISC comitology ──▶ CCS TSI (Reg 2023/1695 + 2026/693)
                           ERA (opinions, recommendations, OSS authorisations) · ENISA (NIS2 / cyber good practice)
                           Council of the EU (Cyber Blueprint) · CRA · NIS2 · RED · AI Act
        │  transposition + national instruments
        ▼
NATIONAL AUTHORITIES (DE)  EBA (NSA: EIGV/ESiV authorisation, supervision, Fachmitteilungen) · BSI (NIS2UmsG, CRA market
                           surveillance, TR-03183) · BNetzA (RMR spectrum) · BMDV/BMV (strategy, Förderrichtlinie) · BMF
        │  assessment before authorisation
        ▼
ASSESSMENT FUNCTIONS       NoBo (TSI conformity) · DeBo (national rules) · AsBo (CSM-RA) · ISA (EN 50129)   — no engaged occupant on file for any of the four
        │
        ▼
OPERATORS & THEIR GROUPS   DB InfraGO / DSD · RUs / NE-Bahnen · IM peers (SNCF, ProRail, Infrabel, SBB, ÖBB, RFI, ADIF, Trafikverket, Network Rail)
        ▲  operator-side feedback INTO the specs and the law:
        │  RSEG/ESCG (ERTMS Users Group) → ERJU System Pillar Security · Sektorinitiative FRMCS-Fahrzeugmigration → BMDV
        │  CER / EIM → ERA + Commission · VDB / VDV → BSI, EBA · ER-ISAC → ENISA
```

Two things the picture is drawn to show. **(1) The operator-side loop is real and under-read:** RSEG, the Sektorinitiative, CER/EIM and the VDV each write requirements *into* the bodies above them, and each was found to hold primary material the register lacked. **(2) The assessment layer is four functions, not one body** (`05-stakeholders.md` §1 caution) — and for FRMCS the NoBo requirement list does not yet exist (E-2026-09-06-07, ERA Rec. #2).

---

## 1. Standards development organisations

| Body | Level · type | Function in this transition | Instruments / artefacts ON FILE | Rows | Anchors | Register links |
|---|---|---|---|---|---|---|
| **3GPP** (WGs on file: SA1, SA2, SA3, SA5, SA6, CT1, RAN4, RAN5) | Global · partnership project of regional SDOs (ETSI among them) | The technology core: 5G SA, MCX, IMS, security, management, RAN — **with rail work items on its own roadmap** (MONASTERY → FRMCS_Ph6; SA6 GSM-R interworking CRs in TS 23.283 from Rel-17; RAN4 NR_RAIL_EU_900MHz / _1900MHz_TDD / _HPUE_n100_n101) | TS 22.289 (FRMCS reqs), 22.261, 22.889 (study), MCX Stage 1/2/3 sets at Rel-19/20 (22.280/179, 23.280/281/282/379/283, 24.x), 5GS 23.501/502/24.501, SA5 28.312/530/535/536/104/105 + 23.288, 33.501/33.180/33.210/33.117, RAN4 38.101-1/38.104; the official 3GPP Work Plan | 92 | E-2026-07-01-10 · E-2026-07-26-14..-20 · E-2026-07-31-02/-04 · E-2026-08-01-02/-03/-22/-23 · **E-2026-09-19-02/-04..-17 (the pillar read Stage 1→3, core→management→RAN)** | ADR-001, ADR-007(e), ADR-012, R5/R6/R7/R14, PR15; `sdo-mapping` §1a/§4 |
| **ETSI TC-RT** (Railway Telecommunications) | European · SDO committee | Implementor / interop-governance tier — profiles 3GPP into the normative FRMCS architecture (the GSMA-role for rail) | TR 103 459, TS 103 764, TS 103 765-4, TS 103 792 (GSM-R interworking) | 20 | E-2026-07-01-10 · E-2026-07-26-11/-12/-13 | ADR-001, R2, R6 |
| **ETSI TC CYBER** | European · SDO committee | Consumer-device protection profiles that GSMA MDSCert certifies against — the model for the **missing** FRMCS-terminal certification route | TS 103 732 series (via GSMA FS.56) | 4 | E-2026-08-01-08 · E-2026-08-02-14 | ADR-012, R14 |
| **UIC** (International Union of Railways) | Global · sector association acting as the requirements SDO for rail radio | Apex of the requirements chain: EIRENE (GSM-R) → FRMCS URS/FRS/SRS; TOBA on-board specs; FRMCS-T; leads FP2-MORANE-2 | EIRENE FRS/SRS; FRMCS SRS §15; TOBA-7510, TOBA-7515, FFFIS-7950; ERA/UIC webinar 2022 | 93 | E-2026-06-24-10 · E-2026-07-12-02 · E-2026-08-01-21/-25 · E-2026-09-04-20/-21 · E-2026-09-06-06 | ADR-001 items 4/6/8, ADR-013, R1, R6 |
| **CEN / CENELEC** (rail: **CLC/TC 9X**, WG26 for cyber) | European · formal SDO | Railway safety + cyber framework wrapped around the bearer: EN 5012x RAMS/SIL, **CLC/TS 50701** (rail cybersecurity, 2021) | EN 50128 A1/A2 (harmonisation + 62443 delegation); CLC/TS 50701 via SIST adoption; watch EN 50716 | 43 | E-2026-07-26-15 · E-2026-07-31-05 · E-2026-08-01-01 · E-2026-08-01-12 | ADR-004, ADR-012, R14 |
| **IEC TC 9** (PT 63452) | Global · formal SDO committee | Successor to TS 50701: **IEC 63452 ED1** "Railway applications – Cybersecurity" at CDV, ~2028, CENELEC parallel vote | prEN IEC 63452:2025 (CDV via SIST); PT 63452 status deck (Benoliel, Alstom) | 7 | E-2026-08-01-17 · E-2026-08-01-20 · E-2026-08-15-21 | ADR-012 (successor watch), R14 |
| **ISA / IEC 62443** | Global · formal SDO series | The OT-cyber core TS 50701 profiles — "the 3GPP-role for security"; SL-T vocabulary ERORAT maps onto | IEC 62443-2-1:2024 (preview); -3-2/-3-3 paywalled, NOT on file | 131 mentions | E-2026-07-31-03 · E-2026-09-10-01 (SL mapping) | ADR-012 items 9/9b/11, ADR-004 |
| **ISO / ISO-IEC JTC 1** | Global · formal SDO | Management-system layer (ISO/IEC 27001/27002/27005) that NIS2 and EN 50128/A2 point to; ISO 26262 as the automotive comparator | Referenced, not held as primary | 32 | E-2026-07-02-07 · E-2026-07-06-11 · E-2026-08-01-01 | ADR-012 item 4 (SMS), ADR-010 |
| **IETF** (+ **IRTF** research arm) | Global · open standards body | Protocols the SBA/IMS/MCX layer and the FRMCS OBapp API run on; management-plane substrate (NETCONF/YANG/RESTCONF/NMDA); IRTF RFC 9315 IBN = the intent anchor for ADR-002 | SIP 3261, HTTP/2 9113, JSON 8259, TLS 1.3 8446, CMP/OCSP, JWT, MPTCP 8684, NETCONF/YANG/RESTCONF/NMDA, RFC 9315 | 16 | E-2026-08-01-03/-21 · E-2026-08-03-02..-08 | ADR-002, R4 (MPTCP), `sdo-mapping` §1b |
| **ITU** (Radio Regulations) | Global · treaty body | Defines what a "safety service" is — RMR is **not** one (RR No. 1.59); frames the CEPT designation | RR No. 1.59 via ECC(20)02 | 8 | E-2026-08-01-06 | ADR-001 (spectrum premise), R4 |
| **CEPT / ECC** | European · regulators' conference | Harmonised RMR spectrum (874.4–880 / 919.4–925 MHz paired; 1900–1910 MHz) — **non-exclusive** designation | ECC Decision (20)02, complete text | 37 | E-2026-08-01-06 · E-2026-06-24-04 | ADR-001, BNetzA row below, R4 |
| **UNISIG** (under UNIFE) | European · industry consortium writing binding specs | ETCS/ERTMS application specs riding the bearer, made law via the CCS TSI; meets ETSI TC-RT at the OBapp boundary | SUBSET-078 (RBC FMEA); SUBSET-137/-146 (E2E security, KMS); SUBSET-026 referenced | 19 | E-2026-07-25-07 · E-2026-08-01-15/-18 | ADR-004, ADR-012, R6 |
| **EULYNX · OCORA · RCA** | European · sector specification initiatives (IM/RU-led; now in the ERJU System Pillar orbit) | Interlocking interfaces (EULYNX), open on-board architecture (OCORA), reference CCS architecture (RCA); RSEG exchanges with all three | Named in RSEG/ESCG objectives and DSD material; specs themselves not on file | 14 / 11 / 11 | E-2026-07-02-01/-03 · E-2026-08-15-19 · E-2026-09-05-01 | ADR-001 item 4, ADR-011 (legacy estate) |
| **DIN / DKE / VDE** | National (DE) · SDO + electrotechnical committee | National pre-standards the German safety case reaches for: **DIN VDE V 0831-103/-104** (decided NOT purchased, 2026-08-20); DIN EN (IEC) 62290-1 / 62267 (acquisition re-pointed 2026-09-04) | Catalogue metadata only; no clause bodies on file | 93 / 1 / 25 | E-2026-08-01-37 · E-2026-09-04-04/-26 · § Open threads (−103/−104) | ADR-012 item 9b (residual discharged 09-10), ADR-004 item 1 |
| **GSMA** | Global · mobile-industry body (not a formal SDO) | Consumer-mobile structural analogue of ETSI TC-RT; **operational interconnect/roaming security has no rail owner** — the §4a gap | FS.40, FS.57 MoTIF, FS.61, FS.56 (public); FS.11/19/20 member-only | 27 | E-2026-08-01-04/-07/-08/-09 | ADR-012, R14; `sdo-mapping` §4a |
| **NIST** | National (US) · standards agency | Referenced frameworks (CSF, SP 800-series) in secondary sources; no rail mandate | Referenced only | 17 | E-2026-07-14-01 · E-2026-07-29-11 | ADR-012 (vocabulary) |
| **MITRE** (ATT&CK) | US FFRDC · knowledge base, not an SDO | Attack-technique taxonomy the threat rows and GSMA MoTIF map onto | Referenced via vendor and GSMA material | 11 | E-2026-07-24-01 · E-2026-07-29-04/-05 | ADR-007 surface 6, ADR-012 |
| **OWASP** | Community · guidance | Secure-development practice cited in the CRA-compliance talk | Referenced only | 1 | E-2026-08-15-29 | ADR-012 item 2 |

---

## 2. Regulatory and authority bodies

### 2a. European Union

| Body | Function in this transition | Instruments / artefacts ON FILE | Rows | Anchors | Register links |
|---|---|---|---|---|---|
| **European Commission** (DG MOVE) | Legislator and TSI adopter; commissions ERA opinions; owns CRA / NIS2 / RED / AI Act / CIR 2023/1695 Art 10 pilot route | CCS TSI Reg (EU) 2023/1695 + 2026/693; CSM-RA 402/2013 + 2015/1136; Reg 2018/545; Dir 2016/797/798; AI Act 2024/1689; CRA 2024/2847; RED delegated acts; NIS2 (all Cellar authentic texts) | 46 | E-2026-06-28-06 · E-2026-08-01-11/-13 · E-2026-08-20-22/-23/-28 | ADR-001, ADR-003, ADR-011, ADR-012 |
| **RISC** (Railway Interoperability and Safety Committee — comitology) | Where the CCS TSI amendment is voted; the V3 timeline's RISC step is *best Dec 2027–Mar 2028 / worst Sep 2028–Mar 2029* | Named in the ERA guide and the SP-STG report timeline | 4 | E-2026-07-05-09 · E-2026-09-06-07 | ADR-001 item 8 |
| **Council of the EU** | Cyber Blueprint (2025) — rail = "n/a" in the Union crisis mechanism | Council doc 9794/25 | 2 | E-2026-07-29-02 | ADR-012, R14 (sector-crisis gap) |
| **ERA** (European Union Agency for Railways) | System authority for interoperability: writes/maintains the CCS TSI, issues **opinions** (ERA/OPI/2024-10 on FRMCS V2) and recommendations, runs the One-Stop-Shop vehicle authorisations, receives NSA annual reports; co-hosts the ERA-ENISA conference series | ERA/OPI/2024-10; Art-12 CCS TSI report 2024; ERA/GUI/01-2008/SAF; ERA-REC-116-2015-GUI (CSM-DT guide, E-2026-07-07-04); ERA/UIC webinar 2022; conference decks 2019–2025; **Interoperable Data Programme (public GitLab `era-europa-eu/public/interoperable-data-programme/era-ontology/`): the ERA Ontology v3.3.4 (`ontology.ttl`, SHACL, SKOS), Telematics TSI technical documents TD100/TD105/Ontology v4.0, xsd2rdf, era-kg-mappings, Rail Data Forum 2025 training group — the Agency's controlled machine-readable layer; ERA's, not EBA's. Siblings (E-2026-09-19-26): Route Compatibility Check backend (32 RINF×ERATV SPARQL checks, 8 CCS/radio, GSM-R-shaped, paused), ISS ontology for the draft CSM ASLP (occurrence scenarios; risk-control-measure function = detect/diagnose/act), RINF+ release registry, VPA authorisation ontology, DCAT-AP LDES feed** | 124 | E-2026-07-05-09 · E-2026-07-19-01 · E-2026-07-25-05 · E-2026-08-01-25 · E-2026-08-15-02 · E-2026-09-06-07 · E-2026-09-19-23/-24/-25 | ADR-001 items 5(c)/8, ADR-002 item 9, ADR-004 item 5, ADR-007 surface 5, ADR-011 Step 5, ADR-012, R1/R2/R11; `13-legal-binding-chain.md` |
| **ENISA** | EU cyber agency: NIS2 support, rail good-practice reports, SCSA methodology, ERA-ENISA conference co-host | *Railway Cybersecurity: Good practices in cyber risk management* (2021); threat-landscape material; conference agendas 2022/2024/2025 | 92 | E-2026-07-20-01 · E-2026-08-15-07 · E-2026-08-15-22 | ADR-012 items 4/5, R14 |
| **Europe's Rail JU — System Pillar Steering Group (SP-STG)** | *Governance* seat of ERJU (research body in §3): adopts the FRMCS V2/V3 scope-and-planning reports by Decision (5/2023, 6/2025) with recorded UNIFE dissent | SP-STG Decisions 5/2023 and 6/2025; Report v2.4 (24.10.2025) | 3 | E-2026-09-05-11/-12 · E-2026-09-06-07 | ADR-001 item 8, ADR-012 item 8 |

### 2b. Germany

| Body | Function in this transition | Instruments / artefacts ON FILE | Rows | Anchors | Register links |
|---|---|---|---|---|---|
| **EBA** (Eisenbahn-Bundesamt — NSA) | Authorisation (EIGV, Anlage 4/5; OSS for area-of-use DE), supervision (Art 19 report), *Serienzulassung*; **Fachmitteilungen** (No. 11/2021 settled the GSM-R module-swap target-functionality question); named 2025 supervision foci = GSM-R fallback + CSM-RA change discipline | EBA Art-19 safety report 2024; EIGV/ESiV texts; the 2021 VDV/ERA/EBA workshop deck; `08-eba-consultation-2026-08-18.md` | 48 | E-2026-06-30-05 · E-2026-08-20-28 · E-2026-09-15-02 | ADR-011 Step 5, ADR-013 c6, ADR-009 items 8/11, R13, PR17b |
| **BSI** (Bundesamt für Sicherheit in der Informationstechnik) | National cyber authority: NIS2UmsG supervision, CRA market surveillance, TR-03183 (SBOM); **Allianz für Cyber-Sicherheit** = the one peer-exchange channel open to Vpnet | NIS2UmsG (BGBl. 2025 I Nr. 301); TR-03183; `09-acs-enquiry-2026-08-18.md` | 26 | E-2026-07-01-05 · E-2026-08-20-24 | ADR-012 items 4/5/6, R14 |
| **BNetzA** (Bundesnetzagentur) | National spectrum regulator — implements ECC(20)02 nationally; the n101 premise in ADR-001 depends on it | ⚠️ **No BNetzA instrument on file** — named via ECC and a DZSF report | 2 | E-2026-08-01-06 · E-2026-08-19-03 | ADR-001 (spectrum), R4 — **gap, §6** |
| **BMDV / BMV** (Federal Transport Ministry) | Digitalisation strategy, ETCS/FRMCS timeline, Förderrichtlinie owner (fleet retrofit; 2021 *Störfester Zugfunk*), answers Bundestag questions | Bundestag Drucksache 21/6477 (BMV answer, 12.06.2026); Sektorinitiative position paper | 8 | E-2026-06-24-17 · E-2026-06-24-11/-13 | R13, ADR-009 items 4/11, PR17a |
| **BMF** (Federal Finance Ministry) | Fiscal gate on the retrofit Förderrichtlinie (advocacy claim, unverified) | Advocacy sources only | 2 | E-2026-07-01-07/-08 | ADR-009 item 4, C-1 — **thin, §6** |
| **BMWK / BMWE** (Economy Ministry) · **BMBF** (Research Ministry) | Funders of the automation/AI research the oversight argument leans on (AutomatedTrain, ARTE, PEGASUS/VVMethoden, SynDRA-BBox) | Project pages and reports | 10 / 3 | E-2026-07-02-08 · E-2026-08-20-04/-14 · E-2026-09-03-01 | ADR-002, ADR-010, R8/PR13 |
| **Bundestag · Bundesrat · Bundesregierung** | Parliamentary record of programme status; NIS2UmsG legislative trail | Drucksache 21/6477; BGBl. 2025 I Nr. 301 | 4 / 2 / 3 | E-2026-06-24-17 · E-2026-07-11-04 · E-2026-09-04-27 | ADR-001 item 8, ADR-012 item 6 |
| **Bund / ERTMS-Koordinierungsstelle** | Sector coordinating body for the *Sondervermögen* route | Named once | 1 | E-2026-06-24-17 | R13 — **thin, §6** |

### 2c. Other Member States and third countries (on file)

| Body | Function | Artefacts ON FILE | Rows | Anchors |
|---|---|---|---|---|
| **EPSF** (France — NSA) | Cyber strategy action with the French sector; the NSA voice at ERA-ENISA 2025 | Garnier decks (Tallinn 2025) | 29 | E-2026-08-15-35 · E-2026-08-15-02 |
| **ANSSI** (France — cyber authority) | Referenced for national rail-cyber guidance | Secondary references | 11 | E-2026-07-19-01 · E-2026-07-25-09 |
| **NCSC-EE / CERT-EE** (Estonia) | Regional threat landscape for critical infrastructure | Auväärt deck (Tallinn 2025) | 11 / 3 | E-2026-08-15-25/-26 |
| **Other NSAs** (11 responded to the EU-Rail questionnaire) | Rolling-stock authorisation "long and complex", NoBo-capacity dependent | FRMCS Deployment Questionnaire 2025 | — | E-2026-09-06-03 |
| **ORR / RSSB** (UK) | ⚠️ Effectively absent — one incidental mention | — | 0 / 1 | — (**§6**) |

### 2d. Assessment functions (independent bodies the law requires)

| Function | Legal basis | What it assesses here | Occupants on file | Anchors | Register links |
|---|---|---|---|---|---|
| **NoBo** — Notified Body | Dir 2016/797; CCS TSI ch. 6/7 | TSI conformity of affected basic parameters (e.g. Table 4.1 rows for a radio swap); **FRMCS requirement list for NoBo verification does not yet exist** (ERA Rec. #2) | none engaged on file — TÜV SÜD and TÜV Rheinland appear only as research-project partner / administrator (E-2026-08-20-14, E-2026-08-20-27) | E-2026-09-06-07 · E-2026-09-15-02 | ADR-004 item 5, ADR-013 c6 |
| **DeBo** — Designated Body | national rules (EIGV) | National-rule conformity | — | E-2026-08-15-35 | ADR-011 Step 5 |
| **AsBo** — Assessment Body | CSM-RA 402/2013 Arts 5/6 | Significant-change risk assessment | — | E-2026-06-28-06 · E-2026-07-07-01 | ADR-011, PR12 |
| **ISA** — Independent Safety Assessor | EN 50129 | Safety-case independence for the SIL-4 boundary | — | E-2026-06-24-24 · E-2026-07-02-14 | ADR-004 |
| **bestimmte Stelle** | EIGV Anlage 4 § 4.2.3 | Certifies the below-threshold path (in-subsystem, interfaces unchanged) | — | E-2026-08-20-28 · E-2026-08-20-26 | ADR-013 c6, ADR-011 Step 5 |

---

> **Note added 2026-09-15 (E-2026-09-15-09, SNS4SNS '26).** Beneath the SDO layer sits an **open-source substrate the §0 pipeline did not draw**: the ETSI **Software Development Groups** (TeraFlowSDN, OpenSlice, OpenCAPIF, OpenOP, OSM) and the **SNS JU** projects that contribute to them (SNS-OPS 2025: TFS 9, OSL 8, OAI 3 approved contributions). These are ETSI groups producing *code*, not standards — listed here as a note rather than as a body class, because nothing on file connects any of them to FRMCS. Also on file from the same event: **ETSI ISG ENI GR 055** (14.10.2025, agentic-AI core use cases; supporters incl. Deutsche Telekom, IMEC, INRIA — E-2026-09-15-11) as a pre-normative watch item for R9, and the Commission's statement that EU-funded 6G work must *"prioritise security and sovereignty"* (DG CNECT, E-2026-09-15-09) as a funding condition bearing on R8/PR13.

## 3. Research and validation bodies and programmes

| Body / programme | Type · funder | Function for this register | Artefacts ON FILE | Rows | Anchors | Register links |
|---|---|---|---|---|---|---|
| **Europe's Rail JU (ERJU / EU-Rail)** — System Pillar (incl. Cyber Security Domain, Operational Harmonisation) + Innovation Pillar; ex-**Shift2Rail** | EU joint undertaking · Horizon Europe | Target architecture and the four SP-SEC specs (v1.1, 03/2026); FRMCS Deployment Management Team; formal TSI route via CCS TSI Art 11; Shift2Rail lineage (X2Rail, **CYRail** → TS 50701, SAFE-10-T) | SP-SEC CommSpec/CompSpec/PrgmReq/SuppEssFunc; FRMCS Deployment Questionnaire 2025; SP Cybersecurity deck (Wischy); CYRail 2018 | 56 | E-2026-07-30-07 · E-2026-08-15-53 · E-2026-09-05-13 · E-2026-09-06-03 | ADR-012 (items 5, 8, Q-17), ADR-001 item 8, ADR-009 item 4, ADR-013 item 2 |
| **FP2-MORANE-2** | Horizon Europe (EU-Rail + SNS JUs) · UIC-led; **37 participants + 11 associated partners per CORDIS (E-2026-09-17-05)** — supersedes the "11 IMs / 13 suppliers / 2 MNOs", "20" and "21 + 7" counts in earlier sources; EU contribution €13,499,875; DB AG / DB InfraGO at €0.01 each (self-funded participation) | Validates FRMCS V2.2/Edition 1: unified system test cases (not published), 3 vendor labs (Ericsson, Nokia, Kontron), field lines from 2027 on ADIF/DB InfraGO/ProRail/Trafikverket | S+D article 5/2025; project news 06/2026 | 26 | E-2026-07-02-15 · E-2026-09-06-06 | ADR-001 items 6/8, ADR-007 item 5, ADR-012 item 2b |
| **5GRAIL** (H2020 GA 951725) | EU H2020 · Nokia WP lead | First primary end-to-end FRMCS lab evidence (Nokia Budapest, 5G SA); two-year-stale roadmap the register over-relied on until 09-06 | D3.3 First Lab Test Report | 14 | E-2026-06-29-01 · E-2026-07-25-09 | ADR-001, ADR-012 item 2b |
| **5G-RACOM** | DE (BMWK) · DB InfraGO / SNCF-Réseau-coordinated; Funkwerk, Kontron, TU Chemnitz, TU Ilmenau | Multipath protocol tests for hybrid FRMCS networks → MPTCP candidate for R4 | S+D 5/2026 | 15 | E-2026-07-02-21 | ADR-001 (multipath), R4 |
| **DZSF** (Deutsches Zentrum für Schienenverkehrsforschung — the EBA's research centre) | Federal · research arm of the NSA (expressly not EBA policy) | The ATO/AI-assurance and cyber-research corpus the oversight argument leans on most; **OSDaR23** rail-native dataset; Bericht 55 abuse-case corpus; ERORAT-adjacent risk work | Conference reports, Berichte, OSDaR23 paper | 46 | E-2026-08-18-07 · E-2026-08-19-01..-13 · E-2026-09-03-02 | ADR-002, ADR-007 item 7, ADR-010, R10 |
| **DLR-TS** (Institut für Verkehrssystemtechnik) + DLR Institute for Communications | Federal research centre | 108-project landscape (`11-dlr-project-landscape.md`); Remote Operation / Teleassistenz / Telefahren position; NeGSt significance method; PEGASUS coordinator | Project pages; NeGSt Schlussbericht 2013; Tele-Tf article | 33 | E-2026-08-20-02/-20/-21/-27 | ADR-002/R10 item 8, ADR-011 (significance method), R8/PR13 |
| **Fraunhofer** (SIT, IAIS, IESE, AISEC, IIS) | Applied-research institutes | Security forecasting (with DZSF), SIL4 Cloud (IESE), AI assurance | Co-authored reports | 9 | E-2026-07-02-03 · E-2026-08-19-04/-08/-09 | ADR-004, ADR-010 |
| **Universities** — TU Dresden, TU Chemnitz, TU Berlin, TU Darmstadt, TU Braunschweig, TU Ilmenau, Universität Passau, University of Rostock, TU Delft, others incidental | Academic | Vehicle diagnostics (Dresden), multipath (Chemnitz/Ilmenau), ARTE/rail operations (Berlin), PEGASUS (Darmstadt), security-forecast and 'IT security cannot be demonstrated' tension (Passau, with Fraunhofer SIT); IFB Institut für Bahntechnik on the cyber-maturity survey, SIL4 Cloud (Rostock) | Articles and reports | 4–6 each | E-2026-07-02-06/-10/-21 · E-2026-08-19-03/-13 · E-2026-08-20-09/-14/-25 | ADR-009 item 7, ADR-013 c5, R13 |
| **Digitale Schiene Deutschland (DSD)** + **DB Systemtechnik** + **DB Systel** | Operator's programme and engineering arms | Primary technical source: SIL4 Cloud / SIL4 Data Center research reports, Kontron MCX design, BR 430 retrofit (AutomatedTrain) | Research reports; S+D/ETR/EI articles | 41 / 4 / 8 | E-2026-07-01-10 · E-2026-07-02-03 · E-2026-08-20-26 | ADR-004, ADR-013 c5, R6 |
| **Named DE research projects** — AutomatedTrain, ARTE, RemODtrAIn, STREAMLINE (completed Vorstudie), KIRA, Cloud4Rail, PEGASUS/VVMethoden (automotive ancestor), BASt | BMWK/BMWE/BMBF/Land funding | GoA4 retrofit practice, remote operation, approval methodology, cloud-hosted SIL-4 | Project pages, articles, position paper | 1–9 each | E-2026-07-02-08/-27 · E-2026-08-20-04/-05/-09/-14/-29 | ADR-002, ADR-009 items 8/9, ADR-013 c4/c5 |
| **Independent automotive-AI perception lineage** — Virtual Vehicle (Graz) / SETLabs (Munich) / Sant'Anna (Pisa) | Academic-industrial, BMWK-funded | SynDRA-BBox — the one source lineage independent of the Siemens/DZSF/ERJU cluster | arXiv 2507.16413 | 1 | E-2026-09-03-01 | `05-stakeholders.md` §1, source-independence caution |
| **Academic venues** — ACM CCS, SAFECOMP, IEEE | Peer-reviewed venues (not bodies) | 5G-core attack classes; safety-assurance papers | Papers | 2 / 2 / 6 | E-2026-07-24-01 · E-2026-07-06-10 · E-2026-08-19-12 | ADR-007 surface 6, ADR-012 |
| **IRTF** | Research arm of the IETF | RFC 9315 Intent-Based Networking — the primary intent anchor for the oversight loop | RFC 9315 | 2 | E-2026-08-03-03 | ADR-002; `sdo-mapping` §1b |

---

## 4. Sector associations and expert groups (write inputs into §1–§2; hold primary material)

| Body | Type | Function | Artefacts ON FILE | Rows | Anchors | Register links |
|---|---|---|---|---|---|---|
| **RSEG / ESCG** — Rail Security Expert Group, ERTMS Security Core Group (EEIG **ERTMS Users Group**; EULYNX Security Cluster) | Operator-side expert group | **Official operator mirror of the ERJU System Pillar Security Group**; writes security requirements for future TSI subsets; 14-document open library; **ERORAT** method + template (the source that discharged ADR-012 item 9b) | ERORAT Guideline v3.01 + Template v3.05; Legacy Security Measures 25E157; Legacy Network Protection 24E122; ESCG guidelines deck 2022 | 26 | E-2026-08-15-19 · E-2026-09-05-01/-07 · E-2026-09-10-01 | ADR-012 items 9b/11, ADR-007 item 7, ADR-011 (legacy estate) |
| **UIC FRMCS working groups** — Functional WG (FWG) · Architecture & Technology WG (ATWG) · TOBA group · FIS/FFFIS WGs · FRMCS 3GPP Task Force — with ETSI TC RT | Sector spec-writing groups (UIC) | **The write path from MORANE-2 results into FRMCS V3** — the project's exploitation plan names *"permanent liaison"* with exactly these six groups; results loop back as spec amendments. No independent assessor sits in the loop. **Venue: 5th UIC Global FRMCS Conference, 24–25 Nov 2026, Paris — UIC names "V3p" delivery (Nov 2026) and V2.2 as the MORANE-2 test set (E-2026-09-19-22, tier B, `watch`)** | D5.1 CDEP (the liaison list); the spec map of May 2026 (versions); the conference invitation | — | E-2026-09-17-03 · E-2026-09-17-01 · E-2026-09-19-22 | ADR-001 items 6/8, ADR-007 item 5, ADR-013 item 2 |
| **CER** (Community of European Railway and Infrastructure Companies) · **EIM** (European Rail Infrastructure Managers) | EU RU/IM associations | Drove the FRMCS public-networks feasibility study (FRMCS-T option); CER's *"absolute minimum viable product"* verdict on V3 scope; exchange with RSEG on CCS TSI text | Via ERA/UIC webinar and SP-STG report | 23 / 11 | E-2026-08-01-25 · E-2026-09-06-07 | ADR-001 items 5/8 |
| **UNIFE** (European rail supply industry; parent of UNISIG) | Supply-industry association | **Recorded dissent** inside SP-STG Decision 6/2025 on the V3 timeline; co-host of MORANE-2 mid-term conference | SP-STG Decision 6/2025; MORANE-2 news | 31 | E-2026-09-06-06/-07 | ADR-001 item 8 |
| **VDB** (Verband der Bahnindustrie) — Cybersecurity Rail Sector Group | DE supply-industry association | CRA-Leitfaden (SRAC/SecRAC responsibility split) | CRA-Leitfaden 2026 | 9 | E-2026-07-01-05 | ADR-012, C-4 |
| **VDV** (Verband Deutscher Verkehrsunternehmen) | DE operators' association | Coordinated the 2021 *Störfester Zugfunk* retrofit authorisation approach with ERA/EBA (Forum GSM-R); co-signatory of the 2026 open letter | 2021 workshop deck (38 slides); open letter | 6 | E-2026-06-28-05 · E-2026-09-15-02 | ADR-009 item 11, ADR-011 Step 5, ADR-013 c6 |
| **Sektorinitiative FRMCS-Fahrzeugmigration** | DE sector initiative (RUs, VDV, VDB) | Positionspapier: cost breakdown (approval ~30%), up-to-100% Förderrichtlinie proposal, chipset/Release-19 timeline | Positionspapier | 7 | E-2026-06-24-11/-12/-13 | R13, ADR-009 |
| **Allianz pro Schiene** | Advocacy coalition | Political pressure on the retrofit funding | Press material | 4 | E-2026-07-01-07/-08 | C-1, ADR-009 item 4 |
| **ER-ISAC** | Sector information-sharing centre (candidate sector-CERT) | Operator-security layer with ENISA; the GSMA-role candidate rail lacks | Referenced via ENISA/ERA material | 25 | E-2026-08-01-20 · E-2026-08-01-36 | ADR-012, R14 (§4a gap) |
| **BSI Allianz für Cyber-Sicherheit** | Cooperation network | The one channel Vpnet legitimately holds (peer exchange, nothing asked) | `09-acs-enquiry-2026-08-18.md` | — | — | `05-stakeholders.md` |
| **ERA-ENISA conference series** (2019 → 2022 Lille → 2024 Lille → 2025 Tallinn) | Recurring venue, not a body | Where NSAs, ERJU, RSEG, IEC PT 63452 and vendors present — the single richest primary-deck source in the register | Agendas + decks, 2019–2025 | — | E-2026-07-19-01 · E-2026-08-15-02..-53 | ADR-012 |
| **IM peers on file** — SNCF (Réseau), ProRail, Infrabel, SBB, ÖBB, RFI, ADIF, Trafikverket, Network Rail, Bane NOR, BaneDanmark, Väylävirasto | Operators (MORANE-2 members; questionnaire respondents) | Field-line hosts 2027+ (ADIF, DB InfraGO, ProRail, Trafikverket); the switch-off survey population; NS (RU) retrofit rate, E-2026-08-15-54 | MORANE-2 news; Deployment Questionnaire | 37 / 15 / 17 / 13 / 11 / 12 / 7 / 9 / 10 | E-2026-07-02-15 · E-2026-07-25-03/-04 · E-2026-09-06-03/-06 | ADR-001 items 6/8, ADR-009 item 6, ADR-013 |

---

## 5. Who occupies which function — the one-page view

| Function | EU | Germany | France / others on file | Sector / operator side |
|---|---|---|---|---|
| Legislator | Commission (DG MOVE), Council, Parliament | Bundestag, Bundesrat, Bundesregierung | — | — |
| Rail system authority / NSA | **ERA** | **EBA** | EPSF (FR); 11 NSAs in the questionnaire | — |
| Comitology / adoption | **RISC** | — | — | SP-STG (ERJU governance) |
| Cyber authority | **ENISA** | **BSI** | ANSSI (FR), NCSC-EE (EE) | ER-ISAC |
| Spectrum | CEPT/ECC (ITU frame) | **BNetzA** (not on file) | — | — |
| Funding / strategy | Horizon Europe, EU-Rail JU | BMDV/BMV, BMF, BMWK/BMWE, BMBF, ERTMS-KoSt | — | Sektorinitiative, Allianz pro Schiene |
| Safety research | ERJU (research side) | **DZSF**, DLR-TS, Fraunhofer, universities | — | DSD, DB Systemtechnik |
| Requirements SDO (rail radio) | ETSI TC-RT | — | — | **UIC** |
| Technology SDO | — | DIN/DKE/VDE (national pre-standards) | — | 3GPP, IETF, IEC, ISO, CENELEC, UNISIG |
| Validation | MORANE-2, 5GRAIL, 5G-RACOM | — | — | vendor labs (Ericsson, Nokia, Kontron) |
| Assessment | NoBo / DeBo / AsBo / ISA (functions) | bestimmte Stelle (function); no occupant engaged on file | — | — |
| Operator input into specs | — | VDV, VDB | — | **RSEG/ESCG**, CER, EIM, UNIFE |

**For Track B (`05-stakeholders.md` function set):** this table is the EU/DE occupancy of the role-equivalence template. The two lessons carry unchanged — one function may be several bodies (four assessment functions), and a function may be empty (no Union-level rail cyber-crisis mechanism; no rail body in GSMA's operational interconnect role).

---

## 6. Coverage — where the register is thin, stated so nobody mistakes row-count for knowledge

| Body | Rows | What is missing | Why it matters |
|---|---|---|---|
| **BNetzA** | 2 | No national spectrum instrument on file; the RMR designation is held only at CEPT level | ADR-001's n101 / 1900 MHz premise rests on national implementation the register has not read |
| **BMF** | 2 | Only advocacy claims about the blocked Förderrichtlinie | C-1 and ADR-009 item 4 argue from an unverified premise |
| **ERTMS-Koordinierungsstelle** | 1 | One Bundestag mention | R13 names it as the coordinating body |
| **RISC** | 4 | No RISC minute or vote record; timeline only via the SP-STG report | ADR-001 item 8's CCS TSI adoption dates run through it |
| **DKE / DIN VDE V 0831-103/-104** | 1 / catalogue | Clause bodies deliberately not purchased (owner decision 2026-08-20); residual discharged via ERORAT | Any claim resting on −103/−104 content stays second-hand |
| **UNISIG SUBSET-026** | referenced | Not on file; SUBSET-078/-137/-146 are | ETCS application-layer claims lean on secondary readings |
| **EULYNX / OCORA / RCA specs** | named | No spec text on file | ADR-001 item 4's on-board architecture cites OCORA by name only |
| **IEC 62443-3-2 / -3-3** | paywalled | Zones/conduits + SL system requirements not held | ADR-012's SL-T vocabulary is grounded via ERORAT's reproduction, not the standard |
| **ORR / RSSB (UK)** | 0 / 1 | Absent | Network Rail is a MORANE-2 consortium member; no UK regulatory view held |
| **EBA Fachmitteilung 11/2021 · 2021 Förderrichtlinie** | named 09-15 | Not held — acquisition target ADR-009 item 11 | The executed precedent for a funded fleet-wide radio retrofit |
| **CCS TSI Table 7.1 (2023/1695 as amended)** | ch. 7 read in the base act | The RMR/FRMCS row wording unverified | ADR-013 constraint 6's sharpening (09-15) is verified against it before external use |

**Maintenance rule.** When an evidence row introduces a body not in this roster, add it here in the same sitting with its anchor — the same discipline as the traceability matrix. When a body's artefact moves from "referenced" to "on file", update the artefact column; that column is the point of the document.

---

**Generated:** 2026-09-15, by sweeping `evidence-log.md` for institution names (462 rows) and reading the anchoring rows; counts are approximate where names collide with common words and were re-checked with word boundaries. **Amended:** — · **ArcKit version:** v5.11.0
