# Finding: DB InfraGO's GSM-R core is Rel-4 (BICN) — the trace of the architecture choice

> Standalone finding. Traces the evidence showing that DB's GSM-R core network was
> modernised to the **more modern, 3GPP-aligned Release-4 (Bearer Independent Core
> Network)** architecture rather than the Release-99 baseline. Every claim carries its
> evidence tier; the load-bearing DB-specific rows are **C-tier (trade press)** — read
> the confidence section before any external use.

## Document control

| Field | Value |
|---|---|
| Document ID | ARC-FRMCS-FIND-DBCORE-REL4-v1.0 |
| Type | Finding (evidence trace) |
| Project | FRMCS arcKit — GSM-R→FRMCS transition + agentic oversight |
| Classification | INTERNAL (C-tier estate attribution — verify at DB/TED before external use) |
| Status | DRAFT · Version 1.0 · 2026-07-26 · Owner: Vpnet engagement lead |
| Companion | `master-architecture-reference.md` (Part B); `diagrams/ARC-FRMCS-DIAG-007…` (Rel-4 box); `gsmr-e2e-equipment-map.md` (§5 NSS) |

---

## 1. Finding

**DB InfraGO's GSM-R core network is a Release-4 Bearer Independent Core Network (BICN)** —
the signalling/media-split, IP-based, 3GPP-aligned architecture — **not** the monolithic
Release-99 baseline. The choice was made in **2011** (Kapsch CarrierCom modernisation
contract, completion ~mid-2014) and the record names a topology that is unambiguously
BICN. Confidence is **medium-high**, but the DB-specific evidence is **C-tier**
(trade press recapping vendor PR); the A-tier corroboration is architectural, not
DB-named. Verify at DB/TED primary for any load-bearing use.

## 2. Why "Rel-4" means "more modern / 3GPP-aligned"

TS 103 066 (E-2026-07-26-03, A) sets the fork explicitly: **Rel-99 is the mandated GSM-R
baseline; Rel-4 BICN is the OPTIONAL, more modern variant** some operators chose. The
difference is architectural generation:

| | **Rel-99 (baseline)** | **Rel-4 BICN (DB's choice)** |
|---|---|---|
| Core model | **Monolithic MSC** — switching + voice media in one box | **Split**: MSC-Server (signalling) + CS-MGW (media) via the Mc reference point; BICC call control |
| Transport | TDM-bound | **Bearer-independent — ATM or IP** |
| CP/UP separation | None | **Yes — the first step** of the control/user-plane split that completes at 5G SA |
| Lineage | GSM/ETSI-SMG-era (frozen base, e.g. GSM 02.02 = EN 300 904, E-2026-07-26-07) | **3GPP-aligned** (BICN introduced in 3GPP Rel-4) |
| Evolvability toward FRMCS | Low | **Higher** — IP-native, closer to the 5GC/IMS target |

Choosing Rel-4 in 2011 was therefore a **forward-leaning choice**: DB adopted the
IP-based, 3GPP-aligned, control/user-plane-separated core a decade before the FRMCS 5G SA
target that continues the same separation. The **"Call Server + Media Gateway"** vocabulary
in the DB topology (§3) is the BICN signature — a pure Rel-99 core would be named as
monolithic MSCs.

## 3. The evidence trace (history)

| # | Date | Evidence | Tier | What it establishes |
|---|---|---|---|---|
| 1 | (framework) | **TS 103 066** V1.1.1/V1.1.2 (E-2026-07-26-03) | **A** | The fork: Rel-99 baseline vs **optional Rel-4 BICN** (MSC-S + CS-MGW, bearer-independent); does not name DB |
| 2 | **Jul 2011** | **Kapsch CarrierCom contracted to modernise DB's GSM-R core/NSS to 3GPP Release 4 / IP-based** (~€15m, completion ~mid-2014) — railuk.com (E-2026-06-24-20) | **C** (trade press recapping Kapsch PR) | **The DB-specific choice.** Named topology: **2 geo-redundant Call Servers, 7 Media Gateways, 2 HLRs, 1 Service Control Point** — textbook BICN (Call Server = MSC-Server; Media Gateway = CS-MGW). "World's largest GSM-R network" (discount as PR) |
| 3 | 2011→ | **DB core/NSS = Kapsch CarrierCom → Kontron** (regionally-split multi-vendor estate: RAN Nokia south / Siemens+Huawei north; core Kapsch→Kontron) — railway-technology/gazette/pro (E-2026-06-29-02) | **C** (trade press + vendor PR) | The core vendor is the one that did the Rel-4 modernisation — consistent chain |
| 4 | 2012 | **TEN multi-vendor interoperability test plans** (NSN + Kapsch), Phases 9.1–9.3 (E-2026-07-06-02/-03) | **A** | General architecture mapping: **Kapsch CarrierCom NSS = Release 4**, NSN NSS = Release 99. Independent A-tier corroboration that a Kapsch core is Rel-4 |
| 5 | (mechanism) | **TS 123 236** MSC-pool/RANflex (E-2026-07-05-08, A); **TS 103 147** automatic-switchover mandate + GCSMSC/GCR redundancy (E-2026-07-01-09, A) | **A** | The Rel-4 core + pooling + **2 geo-redundant Call Servers** = the standard 3GPP redundancy architecture the 23-June auto-failover should have engaged |

**The logic:** (1) establishes Rel-4 is the modern option; (2) states DB chose it and names a
BICN topology; (3) confirms DB's core vendor is the one that supplies Rel-4; (4) independently
(A-tier) confirms that vendor's NSS *is* Rel-4; (5) places DB's "2 geo-redundant Call Servers"
in the standard 3GPP redundancy lineage.

## 4. Confidence and caveats (honest)

- **Load-bearing DB evidence is C-tier.** Both the direct claim (E-2026-06-24-20) and the
  core-vendor attribution (E-2026-06-29-02) are **trade press recapping vendor PR**, carrying
  the repo's standing flag *"verify against primary DB/TED records."* The A-tier support
  (TEN plans) is **architectural, not DB-named** — it proves *Kapsch NSS = Rel-4*, not
  *DB's specific deployment*. The conclusion is a well-corroborated inference, **not** a
  primary-verified fact.
- **Temporal scope.** The choice is dated **2011, completion ~2014** → DB's core has been
  **Rel-4 since ~2014**. E-2026-06-24-20's own note warns the 2011 architecture "has very
  likely evolved since." A reversion to Rel-99 is implausible (backwards); further Rel-4+
  evolution is unevidenced either way.
- **Vendor-PR discount.** "World's largest GSM-R network" and similar are promotional; the
  *architecture* claim (Rel-4/IP, Call-Server/Media-Gateway topology) is the citable part.
- **Not the culprit layer.** The 2 geo-redundant Call Servers are core redundancy; the
  23-June fault was placed by DB in *"a network distribution component"* — a different
  (transmission/distribution) layer. **This finding does not touch the culprit quarantine.**
- **To upgrade to A-tier:** obtain the DB/Kapsch 2011 core-modernisation contract or the
  TED award record; that would move this from "well-inferred (C)" to "confirmed (A)."

## 5. What it means

1. **The 23-June lesson is sharper, not softer.** DB chose the *more modern* Rel-4 core with
   **2 geo-redundant Call Servers** — redundancy was present and standard — yet the nationwide
   outage still happened because the **automatic failover trigger was defeated by a silent
   fault** (E-2026-06-27-01/-03). **Architecture modernity did not substitute for proving the
   trigger fires** (PR11 / ADR-007). A modern, 3GPP-aligned, geo-redundant core is exactly the
   estate where "redundancy exists, readiness unproven" bites.
2. **DB is already one CP/UP-separation generation into the FRMCS journey.** Rel-4 BICN began
   the control/user-plane split that 5G SA completes — so DB's GSM-R→FRMCS core transition is
   *architectural continuation*, not a standing start (supports R6 gateway-decoupling framing,
   ADR-001).
3. **Sharpens the master reference.** `master-architecture-reference.md` Part B / DIAG-007
   currently say generically "the GSM-R Rel-4 core in the record = Kapsch→Kontron." This
   finding lets those be sharpened to: **DB InfraGO specifically runs a Kapsch/Kontron Rel-4
   BICN core** (2 Call Servers / 7 Media Gateways / 2 HLRs / 1 SCP), with the C-tier flag.

## 6. Requirements traceability

| Requirement | Bearing |
|---|---|
| R3 (no central SPOF) | The 2 geo-redundant Call Servers = the core redundancy R3 concerns; centralised HLR/SCP is the concentration R3 designs out |
| R6 (bearer flexibility / no re-qualify) | Rel-4 BICN's bearer-independence is the CP/UP-separation lineage R6/OBapp continues |
| R8 / PR7 (vendor concentration) | DB core = Kapsch→Kontron (a single core-vendor lineage) |
| PR11 (silent-fault / proving discipline) | Modern redundant core ≠ proven trigger — the core finding's edge |

## 7. Evidence refs

**DB-specific (C-tier):** E-2026-06-24-20 (Kapsch Rel-4 core modernisation, topology) · E-2026-06-29-02 (DB core = Kapsch→Kontron; regional estate).
**Architectural (A-tier):** E-2026-07-26-03 (TS 103 066 — Rel-99 baseline / Rel-4 optional) · E-2026-07-06-02/-03 (TEN plans — Kapsch NSS = Rel-4, NSN = Rel-99) · E-2026-07-05-08 (TS 123 236 pooling) · E-2026-07-01-09 (TS 103 147 auto-switchover).
**Lineage/context:** E-2026-07-26-07 (EN 300 904 / GSM 02.02 — SMG-era frozen base) · E-2026-06-27-01/-03 (23-June silent-fault) · ADR-001 · ADR-007 · PR11.

*Honesty constraints from `gsmr-e2e-equipment-map.md §10` apply: the culprit layer stays quarantined; DB estate attribution is C-tier; verify at DB/TED primary before external reuse.*
