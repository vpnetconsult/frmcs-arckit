# Next acts — named targets, exact locations, exact searches

**Date:** 2026-09-19 · **Method:** arcKit · **Status:** LIVE list — edit in place; an act leaves this file when its evidence row is logged
**Rule for this file (set by the engagement lead, 2026-09-19):** every act names the exact document, version and clause it needs; if the document is held, the path; if not, the **search** that finds it — a URL, a repository path, or a literal query string. No "the spec set", no "the relevant clause". An act that cannot be written this way is not ready to be an act.

---

## A. Acts that close or move an action item

| # | Act | Target — exact identifier | Held? / where / search | Closes or moves |
|---|---|---|---|---|
| A1 | Read the Reg 2018/545 SHACL shapes and list the node shapes per Annex I / II / III | ERA `va-m2m`, folder `shapes/2018-545/` | **Not read.** `https://gitlab.com/era-europa-eu/public/interoperable-data-programme/era-ontology/efficient-vehicle-authorisation/va-m2m/-/tree/main/shapes/2018-545` · guide `https://eva-cld-guide-06fc8d.gitlab.io/` | ADR-013 item 3.1 |
| A2 | Build and validate `stage-1.ttl`, `stage-2a.ttl`, `stage-2b.ttl` | as A1 + `era-railway-resources` | `npm install era-railway-resources` · repo `…/efficient-vehicle-authorisation/era-rdf-ts-resources` · runner: `va-m2m/Makefile` | ADR-013 item 3.2 |
| A3 | List which ADR-013 on-board facts have an ERATV property and which do not; file extension issues | `ontology.ttl` v3.3.4 — search terms `era:gsmRSetsInDrivingCab`, `era:gsmRVersion`, `era:voiceRadioCompatible`, `era:otherCCSRadioSystemOnboard`, `era:tsiCompliantRadioObjParameter` | **Held:** `Downloads/era-ontology-v3.3.4/ontology.ttl` · issues to `https://gitlab.com/era-europa-eu/public/interoperable-data-programme/era-ontology/eratv-extension/-/issues` | ADR-013 item 3.3 |
| A4 | Write the six-class injection catalogue incl. class 6 (organisational gate) in ISS terms | `incident-annex-iss-occurrence-scenario.md` §5 FRCM-4; ISS property `iss:introducesThreatToEventMitigation` | **Held** (this register) | ADR-007 item 3 |
| A5 | Set the time-box number and the named authority for the cyber-exclusion procedure | DB InfraGO's rule for the 23-June scenario (text not held; existence confirmed by DB statement 26.06.2026, E-2026-09-15-01) | **Not held.** Search: `"Cyberangriff" "ausschließen" "GSM-R" Ril 481` and `site:deutschebahn.com "GSM-R" "Redundanz" 2026`; the rule is likely a DB InfraGO *Richtlinie* — ask the IM for the Ril number | ADR-012 item 4 |
| A6 | Write the MCX parity suite against SRS v2.1 §21.2.4.1 (M list) with the Stage 1→2→3 citations | UIC SRS AT-7800 v2.1.0 §21.2; TS 22.179 §6.2.3.7; TS 23.379 V20.3.0 §10.9.1.3.1a/.2.1/.6; TS 24.380 V20.0.0 §6.3.4.4.7a; TS 23.283 V20.1.0 §10.14 | **All held** (`Downloads/uic_frmcs_srs_at-7800_v2.1_0.pdf`, `23379-k30.docx`, `24380-k00.docx`, `23283-k10.docx`) | ADR-007 item 5 (build) |
| A7 | Fetch MORANE-2 D1.1 / UIC T-8900 "FRMCS Test Specification" | FP2-MORANE-2 deliverable D1.1; UIC T-8900 v0.1 | **Not held, no public route.** Search: `"T-8900" FRMCS`, `"D1.1" "FRMCS Test Specification" MORANE`, `site:fp2morane2.eu deliverable`; CORDIS project page `https://cordis.europa.eu/project/id/101196125 (GA 101196125, E-2026-09-17-05)` (result pages, if published); ask at the UIC Global FRMCS Conference 24–25 Nov 2026 | ADR-007 item 5 (bar) |

## B. Acquisition targets — documents the register cites and does not hold

| # | Document — exact identifier | Search / location | Which position it sharpens |
|---|---|---|---|
| B1 | **UIC FRMCS v2.2 specification set** (SRS AT-7800, FRS FU-7120, FIS-7970, FFFIS-7950, TOBA-7510 v2.2.0) | `https://uic.org/rail-system/frmcs/` → "FRMCS specifications" downloads (the v2.1 files came from here); query `site:uic.org FRMCS "2.2.0"`; if not public, UIC FRMCS Programme office via the conference | ADR-001 item 8 (V2.2 delta); ADR-007 item 5 (what MORANE-2 tests) |
| B2 | **UIC "FRMCS V3p specifications"** (Nov 2026, per invitation E-2026-09-19-22) | same page; query `site:uic.org FRMCS "V3p"`; conference 24–25 Nov 2026, UIC HQ Paris | ADR-001 item 8 (V3p vs V3.0 Sep 2027) |
| B3 | **3GPP TS 28.541** (5G NRM, Stage 2/3), latest Rel-19/20 | `https://www.3gpp.org/ftp/Specs/archive/28_series/28.541/` — take the highest `28541-k*.zip` (Rel-20) or `28541-j*.zip` (Rel-19); note: `3gpp.org` returns 403 from the sandbox — fetch on the host | ADR-002 item 9 rule (x); ADR-011 configuration items |
| B4 | **3GPP TS 28.622** (generic NRM Stage 2) · **TS 28.623** (Stage 3) | `…/28_series/28.622/`, `…/28_series/28.623/` (highest `-k*.zip`) | as B3 |
| B5 | **3GPP TS 28.532** (generic MnS) · **TS 28.550** (PM) · **TS 28.111** (FM) | `…/28_series/28.532/`, `…/28_series/28.550/`, `…/28_series/28.111/` | ADR-011 (provisioning), PR11 (the measurement and alarm objects an out-of-band monitor names) |
| B6 | **ITU-T M.3010** (2000) "Principles for a telecommunications management network" · **M.3400** (2000) "TMN management functions" | free: `https://www.itu.int/rec/T-REC-M.3010` · `https://www.itu.int/rec/T-REC-M.3400` (itu.int returns 403 from the sandbox — fetch on the host) | FRS §14.2.3's FCAPS model at source |
| B7 | **TM Forum GB921 eTOM · GB922 SID · IG1230 "Autonomous Networks Technical Architecture" · TMF639 Resource Inventory Management API** | `https://www.tmforum.org/resources/` search each ID; membership-gated — check `https://www.tmforum.org/oda/open-apis/` for TMF639 public spec; IG1230 sometimes public via `https://www.tmforum.org/autonomous-networks/` | ADR-002 (AN levels, OSS process/resource model) |
| B8 | **3GPP TS 23.304 companion TS 33.503** (5G ProSe security) | `…/33_series/33.503/` | off-network security — not load-bearing |
| B9 | **Commission Implementing Decision (EU) 2021/1730** (RMR spectrum) | `https://eur-lex.europa.eu/eli/dec_impl/2021/1730/oj` | L0 legal anchor (ECC(20)02 held; low priority) |
| B10 | **Reg (EU) 2023/1694** (RINF) and **Reg (EU) 2026/253** (Telematics TSI) | `https://eur-lex.europa.eu/eli/reg_impl/2023/1694/oj` · `https://eur-lex.europa.eu/eli/reg_impl/2026/253/oj` | legal-chain §1 rows currently cited via ERA documents |
| B11 | **CSM ASLP delegated act** (draft; "CDR (EU) 2024/xxxx") | Search: `"assessment of the safety level and safety performance" delegated regulation ERA`; ERA page `https://www.era.europa.eu/domains/safety-management/common-safety-methods_en`; Have-Your-Say `https://ec.europa.eu/info/law/better-regulation/have-your-say` query `CSM ASLP` | legal-chain §1 (draft → law watch); ISS re-expression |
| B12 | **EBA Fachmitteilung 11/2021** · **2021 Förderrichtlinie "Störfester Zugfunk"** | `site:eba.bund.de "Fachmitteilung" "11/2021"` · `site:bmv.de OR site:bmdv.bund.de Förderrichtlinie GSM-R Störfestigkeit 2021` · Bundesanzeiger `https://www.bundesanzeiger.de` query `Störfestigkeit Zugfunk Förderrichtlinie` | ADR-009 item 11 |
| B13 | **Prior German GSM-R outages (dated, sourced)** — to populate `isRelatedToRecord` | `site:heise.de GSM-R Störung`; `site:golem.de GSM-R Ausfall`; `"GSM-R" "Störung" "bundesweit" 2019..2025`; EBA *Jahresberichte* `site:eba.bund.de Jahresbericht GSM-R` | incident annex §1 gap; systemic factor "Learning from incidents" |
| B14 | **FRMCS parameters in RINF** — whether any RINF CR / ERA Ontology issue proposes them | `https://gitlab.com/era-europa-eu/public/interoperable-data-programme/era-ontology/era-ontology/-/issues?search=FRMCS`; ERA RINF application guide changes `https://data-interop.era.europa.eu/era-vocabulary/rinf-appGuide` search "FRMCS" | legal-chain §6 item 8; ADR-001 item 5(c) |
| B15 | **TS 22.263 / 23.303 / 24.385–386 / 24.486** | held; **no act** — out of scope, listed so nobody re-fetches them | — |

## C. Watches with a date

| # | What | When / where | Owner of the watch |
|---|---|---|---|
| C1 | UIC "V3p" delivery; V2.2 basis; MORANE-2 lessons learned | 5th UIC Global FRMCS Conference, 24–25 Nov 2026, UIC headquarters, Paris | ADR-001 item 8 |
| C2 | V3.0 specifications (SP-STG v2.4 timeline) | Sep 2027 | ADR-001 item 8 |
| C3 | CCS TSI amendment carrying V3 → the event that lifts Note 9 **and** starts the 5-year switch-off clock (§7.3.1.2) | best Jun 2028 / worst Jun 2029 | ADR-001 items 6, 8; legal-chain §2(b′) |
| C4 | ERA Ontology v4.0.0 (RC tagged 7 Sep 2026) | `https://gitlab.com/era-europa-eu/public/interoperable-data-programme/era-ontology/era-ontology/-/releases` | ADR-002 item 9 |
| C5 | CSM ASLP adoption | Have-Your-Say / OJ | legal-chain §1 |

## D. Done today, listed so the trail is visible

- **7-year vs 5-year decommissioning notice** — verified against the consolidated CCS TSI (`Downloads/CELEX_02023R1695-20260505_EN_TXT.pdf`): **§7.3.1.2, one 5-year clock, gated on the V3 amendment**; the 7-year figure withdrawn (E-2026-09-19-29).
- ADR-013 item 2 — closed by ARB-2026-09-19 R1 (Q-19).
- `incident-annex.md` re-expressed as an ISS occurrence scenario.
