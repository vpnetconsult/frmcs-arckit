# Stakeholder analysis — GSM-R → FRMCS transition + agentic autonomous-oversight

**Date:** 2026-07-01 · **Method:** arcKit
**Outcome anchor:** *safe, continuous rail operations.*
**Owner:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud
**Linked records:** `00-charter.md`, `01-governance-and-raci.md` (project-internal RACI — this document extends it to the full multi-party universe), `02-phase-gate-plan.md` (G0–G5), `03-risk-register.md` (PR1–PR16), `04-adr-log.md`, `traceability-matrix.md` (R1–R14), `frmcs-partner-responsibility.md`.

> **⚠️ STANDING — corrected 2026-08-19, read before the tables.** This map was written on 2026-07-01 under a charter that named a client. **There is no client** (`00-charter.md` §Standing). Vpnet holds **no engagement with any party in this document**; every entry is compiled from **public statements and published sources**, and **naming a party is not approaching them**. Accordingly the old **"Engagement strategy"** column — which read *"Co-own the spine"*, *"Early + continuous"* — has been replaced by **"Mandate held"**, because that is what the map actually knows and the only thing it can honestly assert. The analytical content is unchanged and remains valid; what changed is the claim the map made about Vpnet's relationship to it.
>
> **What the map is FOR, restated:** (1) knowing which party holds which mandate, so findings are addressed to the right function on the merits; (2) **role-equivalence — the function set is the template for locating the Malaysian counterparts**, which is Track B's first deliverable. Outreach, where it happens, is **peer exchange: sharing findings, claiming nothing.** Approval-, concurrence- or endorsement-seeking is out of scope permanently.

> **Scope note.** This is the external + internal stakeholder map. `01-governance-and-raci.md` already holds the internal 4-role RACI (Vpnet · IM · NSA · Vendor prime) and the decision-class oversight model; both are carried here and widened to every party. Governing constraint retained: **Vpnet is never Accountable for safety** — the IM and NSA are.
>
> **Layout note.** arcKit's `stakeholders` skill targets the plugin `projects/` scaffold and adds UK-Gov roles (SRO/GDS/CDDO); this is an EU/German-rail engagement in the `current/` layout, so those UK-specific elements are omitted and the artifact is written as `current/project/05-stakeholders.md`.

## 1. Power–Interest grid — who holds what

> **Read this as a map of mandates, not of relationships.** Vpnet has no engagement with any party below (`00-charter.md` §Standing). Every entry is compiled from **public statements and published sources**; naming a party is not approaching them. The quadrant labels describe **how much a party's mandate bears on the outcome**, not how we intend to handle them.

```
                    HIGH INTEREST                         LOWER INTEREST
        ┌───────────────────────────────────┬───────────────────────────────┐
  HIGH  │ DECISIVE                          │ INFLUENTIAL                   │
 POWER  │ DB InfraGO (IM) · EBA (NSA)       │ BMF (Finance Ministry)        │
        │ BMDV (Transport) · Bund/ERTMS-KoSt│ European Commission           │
        │ ERA / ERJU                        │ BNetzA (spectrum) · BSI (cyber)│
        │ Nokia · Kontron  [concentration]  │ AsBo / NoBo / ISA (assessors) │
        ├───────────────────────────────────┼───────────────────────────────┤
 LOWER  │ AFFECTED                          │ PERIPHERAL                    │
 POWER  │ DSD · EVU/RUs · NE-Bahnen         │ Passengers · Freight customers│
        │ VDB / CSRG · Allianz pro Schiene  │ Tour operators                │
        │ Ericsson·Siemens·Funkwerk·Vodafone│                               │
        │ 3GPP·ETSI TC-RT·UIC·CENELEC·Unions│                               │
        └───────────────────────────────────┴───────────────────────────────┘
   [concentration] = Nokia/Kontron hold structural power via the duopoly (R8/PR7/PR13),
   so they are tracked as a dependency risk, not merely as suppliers.
   Vpnet and the ARB are deliberately absent from this grid: neither is an external
   stakeholder, and placing the author inside their own power map was an error of the
   original version. Both are described in §"The author's own position" below.
```

> **Added 2026-09-03 (E-2026-09-03-01/-02).** Researching whether rail AI perception reuses automotive/car data due to greater availability turned up a genuinely new, independent actor type this map had not named: **research labs applying automotive-AI-perception methods to rail as a cross-domain exercise, with no rail mandate at all.** Added to the table below in the Peripheral quadrant (not drawn into the ASCII grid, to avoid re-flowing its fixed alignment). The evidence also deepened the existing **DZSF** row (below) with the primary artifact — OSDaR23 — that E-2026-08-19-05 had only named second-hand.

| Stakeholder | Power | Interest | Quadrant | **Mandate held — the function to role-match in Malaysia** |
|---|---|---|---|---|
| DB InfraGO (Infrastructure Manager) | High | High | Decisive | **Infrastructure manager.** Owns and operates the federal network estate; would be Accountable for safety and go-live in any real deployment. Subject of the 23–24 Jun incident analysis |
| EBA (Eisenbahn-Bundesamt, NSA) | High | High | Decisive | **National safety authority.** Authorisation and supervision; *Serienzulassung*; GSM-R fallback + CSM-RA change discipline are named 2025 supervision foci (E-2026-06-30-05) |
| DZSF (Deutsches Zentrum für Schienenverkehrsforschung) | Med-High | High | Decisive | **Safety-research institute of the safety authority.** Commissions and publishes the ATO/AI-assurance research the assessment leans on most heavily (E-2026-08-19-01/-02/-05/-06/-07). Research perspective, expressly not EBA policy. Its own response to rail's documented data scarcity is to build **rail-native open data** — primary artifact **OSDaR23** (Tagiew et al., arXiv:2305.03001, E-2026-09-03-02): 45 subsequences, Hamburg 09/2021, 204,091 annotations / 20 object classes, "first publicly available multi-sensor dataset" for rail |
| Virtual Vehicle Research GmbH (Graz) / SETLabs Research GmbH (Munich) + Scuola Superiore Sant'Anna (Pisa) | Low | Low | Peripheral | **Independent automotive-AI-perception research lineage, no mandate over this outcome.** Authors of SynDRA-BBox (Diaz et al., arXiv:2507.16413, E-2026-09-03-01): an automotive/autonomous-driving lab (Virtual Vehicle is the parent of Munich-based SETLabs) porting a domain-adaptation method "originally developed for automotive perception" to rail obstacle/object detection, BMWK-funded. Named here because it is the concrete, primary-sourced case of the hypothesis tested 2026-09-03 — rail perception AI reusing automotive-domain methods/data because rail-native data is scarcer — and because it is a source lineage independent of the Siemens/DZSF/ERJU cluster the register's own §7 flags as thin |
| BMDV (Federal Transport Ministry) | High | High | Decisive | **Transport ministry.** Digitalisation strategy, programme timeline, funding alignment |
| BMF (Federal Finance Ministry) | High | Medium | Influential | **Finance ministry.** Fiscal control; releases the retrofit funding directive |
| Bund / ERTMS-Koordinierungsstelle | High | High | Decisive | **Sector coordinating body.** Cross-operator coordination; *Sondervermögen* funding route |
| ERA / ERJU | High | High | Decisive | **Supranational agency + joint undertaking.** TSI/FRMCS specification and conformance; the ERJU System Pillar owns the four cyber specs (E-2026-08-15-53) |
| European Commission | High | Medium | Influential | **Legislator.** CRA, NIS-2, RED, TSI, spectrum instruments — the legal layer that does *not* transfer to Track B |
| BNetzA (spectrum) | Med-High | Medium | Influential | **National spectrum regulator.** 900 / 1900 MHz allocation; the n101 premise in ADR-001 depends on the ECC-harmonised equivalent existing at all |
| BSI (cyber authority) | Med-High | Medium | Influential | **National cyber authority.** CRA/NIS-2 supervision, TR-03183. **Its *Allianz für Cyber-Sicherheit* is a cooperation network Vpnet holds membership of — the one peer-exchange channel already legitimately open** (`09-acs-enquiry-2026-08-18.md`) |
| AsBo / NoBo / ISA | Med-High | Medium | Influential | **Independent assessment bodies.** CSM-RA assessment body, TSI notified body, EN 50129 independent safety assessor — three distinct functions often conflated |
| Nokia | High | High | Decisive | **Network vendor.** 5G RAN + core; concentration risk (R8) |
| Kontron Transportation | High | High | Decisive | **Mission-critical-comms vendor.** MCX/IMS/dispatcher; concentration risk (R8) |
| Digitale Schiene Deutschland (DSD) | Medium | High | Affected | **Operator's digitalisation programme.** DB's FRMCS/ATO delivery arm; a primary technical source for the corpus |
| UIC (Head of FRMCS) | Medium | High | Affected | **International sector body.** FRMCS specification owner (FRS/SRS/URS, FRMCS-T); contacts per E-2026-08-01-25 |
| EVU / RUs + NE-Bahnen | Medium | High | Affected | **Railway undertakings + non-federal railways.** Fleet retrofit dependency (R13); bear the dual-run cost |
| Ericsson · Siemens · Funkwerk · Vodafone · R&S | Medium | High | Affected | **Secondary vendors.** The alternatives that make unbundling credible. ⚠️ Siemens also sits inside ERJU *and* the DZSF research stream (E-2026-08-19-07) — not an independent corroboration source |
| 3GPP · ETSI TC-RT · UIC · CENELEC · ECC | Medium | Medium | Affected | **Standards development organisations.** MCX, FRS/SRS, EN 5012x, spectrum harmonisation |
| EIM · CER | Medium | High | Affected | **EU IM/RU associations.** Drove the FRMCS public-networks feasibility study → the FRMCS-T/public-MNO option (E-2026-08-01-25/-24); agenda influence on the migration path |
| **RSEG — Rail Security Expert Group** (ESCG, part of EEIG **ERTMS Users Group** · **EULYNX Security Cluster**) | Medium | High | Affected | **⚠️ THE OPERATOR-SIDE MIRROR of the ERJU System Pillar Security Group — added 2026-09-05, E-2026-09-05-01.** Feeds operator security input INTO ERJU; ESCG's stated objectives include developing **requirements and specifications for security in ERTMS for future TSI subset releases**, best-practice guidance for existing implementations, exchange with **EULYNX, RCA and OCORA**, and exchange on TSI CCS text with **CER**. **Publishes a 14-document open library** (threat and risk analysis, security concept, procurement, security logging/SIEM, penetration testing, KMS, legacy network protection, IAM, secure commissioning) — **the register held none of it until now.** Note the function-set consequence: this is a body whose whole purpose is that OPERATORS write security requirements for the specs that will bind them, which is a role the Track A function set does not name |
| IEC TC 9 / PT 63452 · GSMA · ER-ISAC | Medium | Medium | Affected | **Successor-standard body · operator-security layer · candidate sector-CERT** (E-2026-08-01-17/-20) |
| VDB / Cybersecurity Rail Sector Group | Medium | High | Affected | **Industry association.** CRA guidance and sector consensus |
| Allianz pro Schiene (advocacy) | Low-Med | High | Affected | **Advocacy coalition.** Agenda pressure on government (E-2026-07-01-07) |
| Workforce (dispatchers/drivers/maint.) + unions (EVG/GDL) | Medium | High | Affected | **The humans the oversight layer is designed around.** HOF/safety culture; human-in-command is their authority, not an abstraction |
| Passengers · Freight · Tour operators | Low | High | Peripheral | **End-affected.** The people for whom "continuous" failed on 23 June |

### The function set — the transferable artefact

Strip the names and what remains is the **role-equivalence template**, which is the point of this map for Track B:

**infrastructure manager / operator · national safety authority · safety-research institute · transport ministry · finance ministry · sector coordinator · supranational spec + conformance body · spectrum regulator · cyber authority · independent assessors (assessment body / notified body / ISA) · network vendor · mission-critical-comms vendor · standards development organisations · railway undertakings · industry association · advocacy · organised workforce · end-affected public**

**Track B's first deliverable is to establish who occupies each of these roles in Malaysia, from primary domestic sources.** Two cautions the EU/D map itself teaches: functions that look like one body may be several (AsBo / NoBo / ISA are three), and a function may have **no local occupant at all** — an absent safety-research institute or an absent sector-CERT is a finding, not a gap to paper over.

### The author's own position

Neither of these is an external stakeholder, and the original version's placement of both inside the power grid was a category error:

- **Vpnet Cloud Solutions Sdn. Bhd.** — author of the assessment. **Accountable for its honesty and its published claims; never Accountable for safety.** Holds no mandate over any party above and no engagement with any of them.
- **Architecture Review Board (ARB)** — a **working session chaired by the Vpnet engagement lead**, not a convened board of the named deciders (`07-arb-minute-2026-08-15.md`). `Accepted (ARB)` settles a decision *internally* and is not an external position.

## 2. Drivers (the WHY) — key parties

| Stakeholder | Primary driver | Type | Intensity |
|---|---|---|---|
| DB InfraGO (IM) | Restore + guarantee continuous safe operation after the 23-Jun outage; avoid repeat + reputational/regulatory fallout | RISK / OPERATIONAL | CRITICAL |
| EBA (NSA) | Enforce the safety framework; GSM-R fallback + CSM-RA change discipline are named 2025 supervision foci (E-2026-06-30-05); no authorisation without a safety case | COMPLIANCE / RISK | CRITICAL |
| BMDV | Deliver the digitalisation strategy (ETCS/FRMCS) on the EU 2030/DE 2035 timeline; answer for slow progress | STRATEGIC / POLITICAL | HIGH |
| BMF | Fiscal control; release funding only against a defensible case (funding-flow at 20.13% 2025 drawdown, E-17) | FINANCIAL | HIGH |
| ERA / ERJU | FRMCS/ERTMS interoperability across the EU; normative specs (TSI, FRS/SRS) | STRATEGIC / COMPLIANCE | HIGH |
| BSI | Product + operator cybersecurity conformance (CRA 11.12.2027 / NIS-2), ADR-012 | COMPLIANCE / RISK | HIGH |
| Nokia / Kontron | Win + retain the FRMCS core/MCX build; protect installed base | FINANCIAL / STRATEGIC | HIGH |
| EVU / RUs + NE-Bahnen | Keep running during the ~decade dual-run; affordable, timely fleet retrofit (R13) | OPERATIONAL / FINANCIAL | HIGH |
| Vpnet | Deliver a certifiable, lawful oversight architecture; protect the "oversight, not control" guardrail | STRATEGIC / PERSONAL(reputation) | HIGH |
| Workforce / unions | Safe, workable operations; role clarity as automation rises (automation bias, PR4) | PERSONAL / OPERATIONAL | MEDIUM |
| Allianz pro Schiene | Accelerate modernisation; public pressure on government (E-2026-07-01-07) | STRATEGIC(advocacy) | MEDIUM |

## 3. Drivers → Goals → Outcomes (selected SMART chains)

| # | Driver (stakeholder) | Goal (SMART) | Outcome / KPI (proof) |
|---|---|---|---|
| G-1 | Continuous safe operation (IM) | Prove R3/R4 by test at G3 — detection-driven failover triggers under a silent fault (ADR-007c) | Zero un-triggered failovers in fault-injection; incident-replay pass. **Leading:** silent-fault detection rate; **lagging:** no repeat nationwide standstill |
| G-2 | Enforce safety framework (NSA) | Every Class-A change carries a CSM-RA significance assessment + AsBo report before switchover (ADR-011) | 100% Class-A changes with AsBo sign-off; zero "routine-maintenance" mis-classifications |
| G-3 | Deliver digitalisation timeline (BMDV) | Nationwide GSM-R→FRMCS transition on track to ~2035; DB-own FRMCS from ~2025 (E-07-01-04) | % lines FRMCS-ready; ETCS coverage trend (from <2%) |
| G-4 | Fiscal control (BMF) vs retrofit need (EVU/R13) | Retrofit *Förderrichtlinie* released + drawdown > 50% in-year | Funding-flow % (baseline 20.13% 2025, E-17); fleet retrofit rate vs 2035 target |
| G-5 | Cyber conformance (BSI) | CRA secure-by-design + SBOM + support-period into procurement; NIS-2 Art 21/23 in the SMS (ADR-012) | % PDEs with CRA evidence; reporting-chain drill pass (Art 14/23) |
| G-6 | Certifiable oversight (Vpnet) | SIL-4 boundary designed + FFI evidence produced; agents advise, never actuate (ADR-004) | FFI/independence analysis complete; zero agent-actuation paths in the safety case |
| G-7 | Feature-fidelity (IM/NSA) | MCX reproduces every GSM-R safety feature; named gaps closed (PR15, E-07-01-10) | MCX feature-parity regression pass (REC/Notruf, group calls, eMLPP, functional alias) |

## 4. Cross-party RACI — keyed to decisions, gates & decision classes

R = Responsible · A = Accountable · C = Consulted · I = Informed. Extends the 4-role RACI in `01-governance-and-raci.md`.

> **⚠️ This table is a FINDING, not a description of an existing arrangement.** No party below has accepted any of these roles, because none has been engaged. Read it as **the accountability structure a real deployment would require** — the assessment's answer to "who would have to own what" — derived from the legal instruments and the published mandates. **It is an output of the analysis, and it is also a transferable one:** the *shape* of the allocation is what Track B re-derives against Malaysian bodies, once §1's function set has local occupants.

| Decision / gate | IM (DB InfraGO) | NSA (EBA) | BSI | ARB | Vpnet | Funding (BMDV/BMF/Bund) | Standards (ERA/ERJU/ETSI) | Assessors (AsBo/NoBo/ISA) | Vendor prime (Nokia/Kontron) |
|---|---|---|---|---|---|---|---|---|---|
| Outcome & charter (G0) | A | C | I | C | R | C | I | I | I |
| ADR-001 FRMCS transition | A | C | I | R | C | C | C | I | C |
| ADR-002 oversight architecture | C | C | I | A | R | I | I | I | C |
| ADR-004 SIL-4 boundary / safety case | A | A | C | C | C | I | C | R | C |
| ADR-007 test & assurance (G3) | A | A | I | C | R | I | I | C | C |
| ADR-011 Class-A change approval | A | A | C | C | R | I | C | R | C |
| ADR-012 cyber conformance (CRA/NIS-2) | A | I | A | C | R | I | C | C | R |
| Fleet retrofit + funding (R13) | C | I | I | I | C | A | C | I | C |
| Spectrum 900/1900 MHz | C | I | I | I | I | C(BNetzA=A) | C | I | C |
| Go-live authorisation (per ladder step) | A | A | C | C | C | I | I | C | I |
| Safety-critical actuation (runtime) | A | A | I | I | I | I | I | I | I |

**Decision-class oversight** (from `01`, carried): Reversible/no-safety → Ops analyst (on-the-loop); Reversible/operational → Duty manager (on-the-loop); Irreversible/financial → Programme lead (in-the-loop); **Safety-critical actuation → Signaller/duty manager, human-in-command, never autonomous** (ADR-004, PR1).

## 5. Conflict analysis

| # | Tension | Parties | Nature | Resolution strategy |
|---|---|---|---|---|
| C-1 | Funding restraint vs modernisation pace | BMF ↔ BMDV + DB + EVU | Financial vs operational; the retrofit-directive bottleneck (advocacy claim E-07-01-07, *unverified* E-07-01-08) | Tie funding release to gate evidence; stage retrofit to show early wins; keep R13 as an *external-dependency* risk (ADR-009), not an architecture assumption |
| C-2 | Safety-assurance rigour vs migration velocity | EBA/NSA + AsBo ↔ IM + BMDV | Compliance vs schedule | The gates *are* the reconciliation: ADR-007 makes R3/R4 test-evidenced; ADR-011 binds change to CSM-RA — velocity earned by passing gates, not skipping them |
| C-3 | Vendor concentration vs open procurement | Nokia + Kontron ↔ IM + Vpnet + procurement | Structural power (R8) vs anti-lock-in | Unbundled tenders (RAN/core/MCX/dispatcher separable); Bid/RFP agent flags concentration; CRA SBOM/support-period evidence mandatory (PR13); keep secondary vendors (Ericsson/Siemens/Funkwerk) as leverage |
| C-4 | SRAC/SecRAC responsibility | VDB/industry ↔ IM/operator | Who owns residual security/safety conditions (CRA-Leitfaden, E-07-01-05) | Mutual acceptance of application conditions *without* shifting CRA responsibility; govern under ADR-012; verify vs primary law before relying |
| C-5 | Federal vs non-federal scope + all-EVU fleet | IM ↔ NE-Bahnen + all RUs | Coordination + affordability (R13) | Sector coordinating body (Bund ERTMS-KoStelle); Serienzulassung/Umbaucluster approval reform; funding up to 100% |
| C-6 | Oversight vs control (the guardrail) | Vpnet (autonomy) ↔ NSA + IM (human-in-command) | Automation ambition vs safety authority (PR1/PR4) | Hard charter boundary: agents advise/observe, never actuate (ADR-002/004); autonomy-ladder promotions gated on measured oversight-effectiveness (ADR-010, G4) |

## 6. Reconciliation to the risk register & ADR deciders

**Risk owners (PR1–PR16) → named stakeholders:**
- "IM + Vpnet" (PR1, PR5, PR11, PR13, PR16, …) = **DB InfraGO** (A for safety) + **Vpnet** (R for architecture).
- "Vpnet + NSA" (PR2) = **Vpnet** (R) + **EBA** (A for classification acceptance).
- "IM + Vpnet + procurement" (PR13, PR16) = adds **procurement** + **BSI** (cyber) + **AsBo** (assessment).
- "Vpnet" (PR4, PR6, PR10) = engagement-owned oversight-effectiveness/eval risks.
- Existential G0 risks (PR1/PR2/PR3) map to **ARB + NSA + Vpnet** — none deferrable past mobilisation.

**ADR deciders (from the ADRs) → stakeholders:** ARB (endorse) · IM/DB InfraGO (safety A) · NSA/EBA (authorisation A) · CISO/**BSI** (cyber, ADR-012) · **Vpnet** (architecture R). No ADR is Accountable to a vendor.

## 7. Disposition analysis — who would resist, and why it matters to the argument

> **This replaces the original "Engagement plan" (champions · fence-sitters · resisters) and its comms cadence.** That section set out weekly ARB, per-gate reviews with an "NSA + BSI interface", and quarterly syncs with BMDV/Bund — **a schedule of meetings with bodies that have no relationship to this work.** It described a delivery engagement that does not exist. What is genuinely useful in the original is the *disposition* reading — who would push back on the argument and on what grounds — because an assessment that has not modelled its own opposition is untested. That is what remains below.

| Disposition | Parties | The position they would take | What the assessment owes them |
|---|---|---|---|
| **Aligned with the argument** | DSD, ERJU, DZSF, Allianz pro Schiene | Already publishing in the same direction — separation of learning components from the vital layer, explicit risk estimation for novel functions, modernisation urgency | Cite them precisely and **do not overclaim their support**. DZSF's own disclaimer applies: research perspective, not authority policy. Convergence is not endorsement |
| **Would need convincing on evidence** | BMF, BNetzA, secondary vendors, unions | Cost, spectrum availability, commercial position, role clarity under rising automation | Evidence they can check: funding-flow data, the n101 dependency stated as a dependency, the automation-bias treatment (PR4) written for the people it affects |
| **Structural friction with the conclusions** | Concentration incumbents on unbundling (C-3); schedule-versus-rigour pressure (C-2) | Unbundled procurement erodes installed-base advantage; gate rigour costs time | Argue it on the record (R8/PR13, ADR-007/-011) and **never trade the guardrail for velocity**. Their objection is legitimate and should be stated at its strongest before it is answered |
| **Authorities — the parties the argument must survive** | EBA, BSI, ERA, AsBo/NoBo/ISA | They hold the mandates; they have not seen this work and owe it nothing | **Precision.** Every claim about what they require must be traceable to a primary instrument, not to a secondary reading. **Their concurrence is not sought and is not available** — what is sought is that nothing said about their regime is wrong |

**The opposition case, stated plainly** — the assessment's most exposed flanks, held here so they are not discovered by someone else first:

1. **No mandate, no operational data.** Everything rests on public sources. An IM with the incident telemetry could contradict parts of the 23-June reconstruction, and would be right to.
2. **Track B has no evidence base.** 355 rows about Europe say nothing about Malaysia (`00-charter.md` Track B).
3. **Source independence is thinner than the row count suggests.** Siemens sits behind both the ERJU and DZSF streams (E-2026-08-19-07); Benoliel recurs across three affiliations. Corroboration counted twice is corroboration once.
4. **The ARB is one person in a room.** `Accepted (ARB)` means internally settled, nothing more.

**Cadence — internal only.** Daily evidence + `baseline.sh`; ADR read-backs on the review dates ADR-001/-002 carry (next due **2026-11-15**). **There is no external cadence, because there is no external party.** Peer exchange, when it happens, is episodic and initiated by Vpnet with nothing asked in return.

---

**Generated by:** `/arckit:stakeholders`, adapted to the `current/` layout (complements `01-governance-and-raci.md`)
**Generated on:** 2026-07-01 · **Amended:** 2026-08-19 (standing corrected: "Engagement strategy" → "Mandate held"; function set added for Track B role-equivalence; §7 engagement plan replaced by disposition analysis) · 2026-09-03 (new Peripheral-quadrant stakeholder — automotive-AI cross-domain research lineage, E-2026-09-03-01; DZSF row deepened with OSDaR23, E-2026-09-03-02) · **Status:** DRAFT
**ArcKit version:** v5.11.0
**AI model:** claude-opus-4-8[1m]
**Generation context:** Built from the charter, governance/RACI, phase-gate plan, risk register (PR1–PR16), traceability matrix (R1–R14), partner-responsibility artifact, and evidence log (esp. E-17, E-2026-06-30-05, E-2026-07-01-02/-04/-05/-07/-08/-10).
