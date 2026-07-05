# Stakeholder analysis — GSM-R → FRMCS transition + agentic autonomous-oversight

**Date:** 2026-07-01 · **Method:** arcKit
**Outcome anchor:** *safe, continuous rail operations.*
**Owner:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud
**Linked records:** `00-charter.md`, `01-governance-and-raci.md` (project-internal RACI — this document extends it to the full multi-party universe), `02-phase-gate-plan.md` (G0–G5), `03-risk-register.md` (PR1–PR16), `04-adr-log.md`, `traceability-matrix.md` (R1–R14), `frmcs-partner-responsibility.md`.

> **Scope note.** This is the external + internal stakeholder map. `01-governance-and-raci.md` already holds the internal 4-role RACI (Vpnet · IM · NSA · Vendor prime) and the decision-class oversight model; both are carried here and widened to every party. Governing constraint retained: **Vpnet is never Accountable for safety** — the IM and NSA are.
>
> **Layout note.** arcKit's `stakeholders` skill targets the plugin `projects/` scaffold and adds UK-Gov roles (SRO/GDS/CDDO); this is an EU/German-rail engagement in the `current/` layout, so those UK-specific elements are omitted and the artifact is written as `current/project/05-stakeholders.md`.

## 1. Power–Interest grid

```
                    HIGH INTEREST                         LOWER INTEREST
        ┌───────────────────────────────────┬───────────────────────────────┐
  HIGH  │ MANAGE CLOSELY                    │ KEEP SATISFIED                │
 POWER  │ DB InfraGO (IM) · EBA (NSA)       │ BMF (Finance Ministry)        │
        │ BMDV (Transport) · Bund/ERTMS-KoSt│ European Commission           │
        │ ERA / ERJU · ARB · Vpnet (lead)   │ BNetzA (spectrum) · BSI (cyber)│
        │ Nokia · Kontron  [concentration]  │ AsBo / NoBo / ISA (assessors) │
        ├───────────────────────────────────┼───────────────────────────────┤
 LOWER  │ KEEP INFORMED                     │ MONITOR                       │
 POWER  │ DSD · EVU/RUs · NE-Bahnen         │ Passengers · Freight customers│
        │ VDB / CSRG · Allianz pro Schiene  │ Tour operators                │
        │ Ericsson·Siemens·Funkwerk·Vodafone│                               │
        │ 3GPP·ETSI TC-RT·UIC·CENELEC·Unions│                               │
        └───────────────────────────────────┴───────────────────────────────┘
   [concentration] = Nokia/Kontron hold structural power via the duopoly (R8/PR7/PR13),
   so they are managed closely as a dependency risk, not merely as suppliers.
```

| Stakeholder | Power | Interest | Quadrant | Engagement strategy |
|---|---|---|---|---|
| DB InfraGO (Infrastructure Manager) | High | High | Manage closely | Co-own the spine; A for safety & go-live |
| EBA (Eisenbahn-Bundesamt, NSA) | High | High | Manage closely | Early + continuous; A for authorisation |
| BMDV (Federal Transport Ministry) | High | High | Manage closely | Strategy + funding alignment |
| BMF (Federal Finance Ministry) | High | Medium | Keep satisfied | Funding case; the retrofit-directive gate |
| Bund / ERTMS-Koordinierungsstelle | High | High | Manage closely | Sector coordination; funding (Sondervermögen) |
| ERA / ERJU | High | High | Manage closely | TSI/FRMCS specs; conformance interface |
| European Commission | High | Medium | Keep satisfied | CRA/NIS-2/TSI/spectrum conformance |
| BNetzA (spectrum) | Med-High | Medium | Keep satisfied | 900/1900 MHz allocation |
| BSI (cyber authority) | Med-High | Medium | Keep satisfied | CRA/NIS-2, TR-03183 (ADR-012) |
| AsBo / NoBo / ISA | Med-High | Medium | Keep satisfied | Independent assessment sign-off |
| Nokia | High | High | Manage closely | 5G RAN + core; concentration risk (R8) |
| Kontron Transportation | High | High | Manage closely | MCX/IMS/dispatcher; concentration risk (R8) |
| Architecture Review Board (ARB) | High | High | Manage closely | Endorses ADRs, gate pass/hold |
| Vpnet (engagement lead) | Medium | High | Manage closely | A for oversight architecture; never A for safety |
| Digitale Schiene Deutschland (DSD) | Medium | High | Keep informed | DB's FRMCS programme; technical partner |
| EVU / RUs + NE-Bahnen | Medium | High | Keep informed | Fleet retrofit dependency (R13) |
| Ericsson · Siemens · Funkwerk · Vodafone · R&S | Medium | High | Keep informed | Secondary vendors; anti-lock-in leverage |
| 3GPP · ETSI TC-RT · UIC · CENELEC · ECC | Medium | Medium | Keep informed | Standards track (MCX, FRS/SRS, EN 5012x) |
| VDB / Cybersecurity Rail Sector Group | Medium | High | Keep informed | Industry consensus; CRA guidance |
| Allianz pro Schiene (advocacy) | Low-Med | High | Keep informed | Pro-rail lobby; agenda pressure |
| Workforce (dispatchers/drivers/maint.) + unions (EVG/GDL) | Medium | High | Keep informed | HOF/safety culture; human-in-command |
| Passengers · Freight · Tour operators | Low | High | Monitor | End-affected; comms via DB |

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

## 7. Engagement plan (champions · fence-sitters · resisters)

| Posture | Parties | Approach |
|---|---|---|
| **Champions** | DSD, ERJU, Allianz pro Schiene, ARB | Amplify; use their momentum to unblock funding (C-1) and standards |
| **Fence-sitters** | BMF, BNetzA, secondary vendors, unions | Convert with evidence (gate passes, funding-flow data, role-clarity) |
| **Resisters / friction** | Concentration incumbents on unbundling (C-3); schedule-vs-rigour pressure (C-2) | Contain via procurement structure + non-negotiable gates; never trade the guardrail |
| **Authorities (non-negotiable)** | EBA, BSI, ERA, AsBo/NoBo | Engage early + continuously; their sign-off is a gate, not a stakeholder to "win" |

**Comms cadence** (extends `01` operating cadence): weekly ARB; per-gate review (ARB + AI-governance + **NSA + BSI** interface); quarterly funding/strategy sync with **BMDV/Bund**; standards liaison with **ERA/ERJU/ETSI TC-RT** per release.

---

**Generated by:** `/arckit:stakeholders`, adapted to the `current/` layout (complements `01-governance-and-raci.md`)
**Generated on:** 2026-07-01 · **Status:** DRAFT
**ArcKit version:** v5.11.0
**AI model:** claude-opus-4-8[1m]
**Generation context:** Built from the charter, governance/RACI, phase-gate plan, risk register (PR1–PR16), traceability matrix (R1–R14), partner-responsibility artifact, and evidence log (esp. E-17, E-2026-06-30-05, E-2026-07-01-02/-04/-05/-07/-08/-10).
