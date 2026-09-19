# Legal binding chain — how L7 law reaches the FRMCS stack, and where it stops

**Date:** 2026-09-19 · **Method:** arcKit · **Status:** DRAFT v1
**Outcome anchor:** *safe, continuous rail operations.*
**Companions:** `sdo-mapping-frmcs-gsmr-5gsa.md` (who owns which layer — the technical view) · `12-institutional-map.md` (which bodies the register has met — the roster) · `05-stakeholders.md` (mandate and power) · `ADR-001` items 5, 6, 8 · `ADR-012` · `ADR-013` item 2 · `03-risk-register.md` PR11.

> **What this is.** The register builds the FRMCS stack bottom-up — spectrum, internet protocols, 3GPP, ETSI TC-RT profile, UIC requirements, UNISIG data applications, EU law. This note starts at the top and follows the *binding* downward: which legal instrument names which specification, by what mechanism, at what version, and where the chain runs out. It was written on the day the last two layers were completed (3GPP end to end, E-2026-09-19-02…-18; the UIC v2.1 set, E-2026-09-19-19…-21), so every link below is to a text on file. Nothing here is new evidence; every claim cites the row it rests on.
>
> **Why it exists.** Three versions of the FRMCS specification are in play at once — the one the law binds, the one the demonstrator validates, and the one the next law will bind — and the register had been treating "on record" and "in force" as the same thing. They are not. The chain also shows, layer by layer, that no legal instrument requires detection, redundancy, monitoring or a human hold on automated management: the register's resilience positions are legally unowned, and this note is where that is stated once, with citations, instead of being rediscovered per ADR.

---

## 1. What sits at L7

| Instrument | On file | What it does for this engagement |
|---|---|---|
| **CCS TSI — Reg (EU) 2023/1695** (base act, 10 Aug 2023, 181 pp) | E-2026-08-01-16 | The binding technical specification for control-command and signalling; repeals 2016/919. First act to carry the FRMCS specification set into EU law (Annex A Table A2, "FRMCS Baseline 0"). Note 9 on FRMCS on-board specs "not considered complete for the purpose of tendering" is base-act text, standing since Aug 2023. |
| **Reg (EU) 2026/693** (19 Mar 2026, OJ 15 Apr 2026, 186 pp; in force May 2026) | E-2026-08-01-11 | Replaces Annex I + II of 2023/1695 entirely (recital 6). **Class B funding option to 31 Dec 2040** (Art 1(2)) — the legal dual-run horizon carried by ADR-001. Table A3 software row **EN 50128 → EN 50716:2023** (EN 50128 transitional per App. B). New testing specs (SUBSET-076/094/151/153), reduced-spec system versions 2.1/2.2. **RSC obligations** on infrastructure managers (App. C). Error-correction implementation deadlines in law (App. B Table B1.1: ≤6 months where new authorisation is needed). No NoBo re-notification required (Art 2). |
| **Directive (EU) 2016/797** (interoperability) · **Reg (EU) 2018/545** (vehicle authorisation practical arrangements, Arts 15–16) · **EIGV / ESiV** (German transposition) | E-2026-08-20-28 | The authorisation trigger. EIGV § 9(3)/(4) + Anlage 4: an upgrade or renewal needs authorisation *iff* a listed measure is performed — rows 4.1.6/4.1.7 make a trackside FRMCS build authorisation-triggering; § 21 ten-week pre-start notification. The reason ADR-013's two retrofit stages are two authorisation objects. |
| **Commission Implementing Decision (EU) 2021/1730** (28 Sep 2021) | cited by UIC SRS v2.1 §3.2 (E-2026-09-19-19); the CEPT source ECC(20)02 held (E-2026-08-01-06) | Harmonised RMR spectrum 874.4–880 / 919.4–925 MHz paired, 1900–1910 MHz unpaired — the EU-law form of the CEPT decision; the L0 layer's legal anchor. ⚠️ Decision text itself not held; ECC(20)02 is. |
| **ERA report 2024-REP-Art.12** (3 Dec 2024) | E-2026-07-25-05 | The Agency's Art. 12 deliverable on phasing out ESC/RSC checks: <10 % of tested types showed real train–track incompatibility, most issues are product non-conformities — yet no sector consensus to remove the checks; ten recommendations, stepwise. |
| **ERA Opinion ERA/OPI/2024-10** on FRMCS V2 · **EU-Rail SP-STG Decisions 5/2023, 6/2025** · *Report on FRMCS V2 and V3 Scope and Planning* v2.4 (24 Oct 2025) | E-2026-09-06-07 | **Not law** — the governance process that feeds the next TSI. V3 = "a reduced set of functionalities focussed on a stable minimum viable product"; CCS TSI amendment adoption **best Jun 2028 / worst Jun 2029**; UNIFE dissent on deliverability recorded inside the decision. ERA rec. #2: a final list of interoperability requirements for Notified Bodies, delivered with V3. |
| **Horizontal law** — CRA (Reg 2024/2847), NIS-2 / **BSIG § 31** (NIS2UmsG), **RED DA 2022/30**, **Cybersecurity Act as amended by Reg 2025/37**, **AI Act** | E-2026-07-01-06, E-2026-08-15-09, E-2026-08-20-23/-24, E-2026-08-31-04, E-2026-06-24-07 | Obligations that attach to products and operators regardless of the TSI (see §5). AI Act high-risk is **not** automatic — conditional on the Art 3(14) safety-component test (ADR-003; seeded `watch`, never asserted as fact). |

---

## 2. The binding mechanism — Annex A Table A2

The TSI does not describe FRMCS. It **points at specifications by index and version**, and the pointing is the whole legal link.

**Table A2 header** — the mandated baseline set: *ETCS Baseline 4 Release 1 · RMR: GSM-R Baseline 1 Maintenance Release 1 + FRMCS Baseline 0 · ATO Baseline 1 Release 1* (E-2026-08-01-11).

| Index | Specification | Version bound | Note |
|---|---|---|---|
| 92 | FFFIS-7950 FRMCS FFFIS | **v1.0.0** | |
| 93 | FU-7120 FRMCS FRS | **v1.0.0** | |
| 94 | AT-7800 FRMCS SRS | **v1.0.0** | |
| 95 | FIS-7970 FRMCS FIS | **v1.0.0** | |
| 96 / 97 | FRMCS profile FFFIS · FRMCS test specifications | **reserved** | placeholders — the future legal hook for MORANE-2 D1.1 / UIC T-8900 |
| 99 | TOBA-7510 On-board FRMCS FRS | **v1.0.0** | |
| — | **Note 9** | | FRMCS on-board specifications "in their current version … are not considered complete for the purpose of tendering the on-board equipment" |
| 32 / 33 | EIRENE FRS 8.1.0 · EIRENE SRS 16.1.0 | | **Note 7: only MI-marked requirements are mandated** |
| 65 etc. | EN 301 515 v3.0.0 · TS 102 281 v3.1.1 · TS 103 169 v1.1.1 · MORANE FFFIS SIM 6.0.0 | | the GSM-R side |
| 10x | SUBSET-026 3.6.0 · **SUBSET-037-1/-2/-3** (EuroRadio 4.0.0, Part 3 = FRMCS interface) · SUBSET-146 e2e security 4.0.0 · SUBSET-147 · SUBSET-148 | | ETCS B4R1 — the L6 layer |

**Table A3** — the standards: EN 50126-1:2017 · **EN 50716:2023** · EN 50129:2018+AC:2019 · EN 50159:2010+A1:2020 · EN 50126-2:2017 (+ ISO/IEC 17025 for labs). Applying them "is an appropriate means to fully comply to the risk management process" of Reg 402/2013 (E-2026-08-01-16) — a safe harbour for *process*, not a requirement on *behaviour*.

**Appendix A note** — a normative reference to any document *not* in Table A2 "shall always be understood as an **acceptable means** of compliance … and not as a mandatory specification" (E-2026-08-01-16).

### Three consequences

**(a) Three versions are in play, and they are not the same thing.**

| Version | Status | Who uses it | Source |
|---|---|---|---|
| **v1.0.0** (Feb 2023) | **bound in law** — Table A2, FRMCS Baseline 0 | Notified Bodies; anyone reading "TSI-compliant" today | E-2026-08-01-11 |
| **v2.1.0** (Apr 2025) — "V2" | "the minimum set of requirements for validation" (SRS §4.4.2); "not to be part of a CCS TSI … no impact on the certification tasks of the Notified Bodies" (TOBA-7510 Annex A §10.2.1.1) | MORANE-2; the register's held set | E-2026-09-19-19 |
| **V3.0** (Sep 2027 at best) | "the target version to be included in the TSI, to allow migration … (FRMCS 1st edition)" (SRS §4.4.2); scope agreed as "the absolute minimum viable product" | the next TSI amendment, Jun 2028–Jun 2029 | E-2026-09-06-07, E-2026-09-19-19 |

A product bought in 2027 is bought against a version the sector calls minimum, certified (if at all) against a version two years older, for a law that will bind a third. ADR-001 item 8 carries this.

**(b) The link is circular by design.** UIC SRS v2.1 §3.1: "for a non-specific reference, CCS TSI Annex A applies" (E-2026-09-19-19). The specification resolves the versions of its own references by looking back up to the law. Whatever Table A2 says is the version, is the version — there is no independent UIC currency.

**(c) Only MI-marked clauses cross the legal line.** Note 7 (EIRENE: only MI mandated); TOBA-7510 Annex A "List of MI candidate clauses" — "candidate", because "this FRMCS V2 version is not to be part of a CCS TSI"; ERA rec. #2 asks for the final NoBo list to be delivered with V3. Everything else in the UIC set — including the (M) clauses that are not MI — binds by **contract**, not by law. The register's procurement gate (ADR-012 item 2) is where those clauses are made binding.

---

## 3. The chain, top to bottom

```
L7  CCS TSI 2023/1695 + 2026/693 ──── Annex A Table A2 (index + version) ──────────────┐
    Dir 2016/797 · Reg 2018/545 · EIGV Anlage 4 ── authorisation trigger (ADR-011/-013)  │
    Decision (EU) 2021/1730 ── RMR spectrum ── cited by UIC SRS §3.2                     │
                                                                                          │
L6  UNISIG SUBSET-026 / 037-3 / 146 / 147 / 148  ◄── idx 10x, ETCS B4R1 ──────────────────┤
                                                                                          │
L5  UIC FFFIS · FRS · SRS · FIS · TOBA-7510  ◄── idx 92–99, FRMCS Baseline 0 = v1.0.0 ────┘
    UIC SRS §3.1 ── "non-specific reference → CCS TSI Annex A" ──► back up to L7
    UIC SRS §3.2 ── cites ──► ETSI TS 103 764 / 765-1…-4 / 792 · ECC(20)02 · 3GPP 22.179,
                              23.280 / 282 / 289 / 379, 23.501 / 502 / 503, 24.229 / 482 /
                              484 / 501, 26.179, 33.180 / 203 / 501, 38.331
                              (no TS 22.289 · no SA5 28.x · no 23.288)
    UIC URS FU-7100 v5.0 ──► FRS ──► SRS (qualitative; no availability number, no
                              "redundancy", no "resilience": E-2026-09-19-20)

L4  ETSI TC-RT TS 103 764 / 765-x / 792 / 793 ── EC-mandated profiling of 3GPP ──►
    3GPP TS 23.283 Annex A names TS 103 792 for FRMCS/GSM-R interworking (E-2026-09-19-15)

L3  3GPP MCX Stage 1 → 2 → 3 ── 33.180 ──► IETF SRTP / MIKEY-SAKKE · 24.229 ──► RFC 3261
L2  3GPP 5GS (23.501/502, 24.501) + SA5 (28.312/535/536/104/105, 23.288)
    33.210 §6 ──► RFC 8446 TLS / RFC 4301 IPsec · SA5 ──► NETCONF / YANG / RESTCONF / NMDA
    (RFC 6241 / 7950 / 8040 / 8342) · 28.312 ◄── IRTF RFC 9315

L0  3GPP RAN4 TS 38.101-1 Table 5.2-1 NOTE 21 ── "applicable only in countries subject to
    ECC Decision (20)02, for the FRMCS application" ──► CEPT/ECC ◄── Decision (EU) 2021/1730
```

Every seam in this diagram is grounded on both sides by a text on file (`sdo-mapping` §1b/§4), with one exception: **3GPP SA5 ↔ rail**. No layer above 3GPP cites a management-plane specification; the FRS's management vocabulary is ITU FCAPS (FRS §14.2.3), not SA5. The seam is inferred on the rail side — and now shown to be empty there, not merely unread (§4).

---

## 4. Where the law stops — the gaps the register fills

| Gap | Where the chain runs out | What holds the position instead |
|---|---|---|
| **Management plane** | No TSI index points at an SA5 spec; UIC SRS cites none; FRS §14 "System management and configuration" is **M-V3 without exception**, predictive maintenance O-V3 (E-2026-09-19-19). 28.312 has no approval state, 28.535 marks the consumer-side hold "not supported", 28.536 confirms no pause on the wire (E-2026-09-19-06/-11/-12). | **ADR-002** (hold above the loop; deny list + LOCKED default as the bearer's contribution) · **ADR-011** (vital-object exclusion; producer-created loops as configuration items) |
| **Detection, redundancy, monitoring** | Table A3 binds *process* standards; Table A2's FRMCS entries are v1.0.0; at v2.1 **SRS §17.2 "FRMCS System monitoring" is an empty heading**, on-board gateway redundancy is "out of scope for FRMCS V2", FRS §15.2 resilience/availability/disaster tolerance is "for further study" (E-2026-09-19-19); 23.501 leaves failover to peers "detecting" and redundancy physics "not subject to 3GPP standardization" (E-2026-09-19-05); UGFA: double coverage "is not a target itself", 5G call re-establishment time "FFS" (E-2026-09-19-21) | **PR11** · **ADR-007** surfaces 1 and 3 · ADR-001 item 5(b) — legally unowned at every layer |
| **KPIs** | TS 22.289's 99.9999 % / ≤100 ms is not referenced by the TSI or the SRS, "assumes a dedicated network" (E-2026-09-19-02), and has **no URS ancestor** — the URS asks for degraded and emergency operation to be survivable, never for a number (E-2026-09-19-20) | ADR-001 item 3 (ODD-relative service classes) · item 5(b) (a public-bearer decision must supply the KPI the spec does not) |
| **Logging / post-incident record** | V2 mandates only REC metadata (SRS §22.3.1); all-MCX logging and recording M-V3; 22.280 §6.15.4's field set incl. bearer-side events is a 3GPP requirement the rail spec does not yet ask for; Stage 2 has no architecture for non-communication activities and removed the metadata-to-log parameter at Rel-20 (E-2026-09-19-11/-13/-14/-19) | **ADR-012 item 5** — specified at procurement |
| **Off-network** | URS GN13 asked for it (2020); FRS §4.5.7 defers all off-network requirements past V3 pending a sector decision; SRS v2.1 "out of scope for FRMCS V2"; 23.304 supplies the 5G substrate without a functional alias (E-2026-09-19-18/-19/-20) | ADR-007 surface 5 — parity case deferred with the mode |
| **Interworking equivalence** | 3GPP TS 23.283 defines IWF1–4 and the MC-side flows, with GSM-R-named CRs, but puts "the structure and functionality of the IWF" out of scope (§1); TS 103 792 is a published ETSI TS but only MI-EIRENE clauses are law | **ADR-007 surface 5** · ADR-001 item 5(a) — the two-sided parity bar |
| **Per-corridor behaviour** | The one L7 mechanism that tests a vehicle against a *specific* trackside is **ESC/RSC** (App. C, 2026/693) — and the ERA Art. 12 report records that the sector will not phase it out yet | ADR-001 item 5(c) — the corridor declaration is the operator's form of the RSC statement |

---

## 5. Where horizontal law reaches what the TSI does not

| Instrument | Reaches | Register anchor |
|---|---|---|
| **CRA** (Reg 2024/2847) | Products with digital elements: SBOM, vulnerability handling, support period with an end date, update capability | ADR-012 block A (bid evidence) and block B (the update-capability question, asked before purchase) |
| **BSIG § 31 (NIS2UmsG)** | KRITIS operators: continuous, automatic attack-detection systems at Stand der Technik | ADR-012 item 5 — the statutory footing for out-of-band security detection (E-2026-08-20-24) |
| **RED DA 2022/30** | Any "internet-connected" radio equipment | ADR-001 item 5(b)(i) — a public-network fallback path prices the on-board equipment into cyber scope at procurement, not at conformity assessment (E-2026-08-20-23) |
| **Cybersecurity Act as amended by Reg 2025/37** | Managed security services (Art 2(14a)) | ADR-012 item 5 — a consumed SOC/SIEM sits inside the certification framework once schemes exist; do not wait for one (E-2026-08-31-04) |
| **AI Act** | An oversight layer only if it is a "safety component" under Art 3(14) | ADR-003 — verified not automatic; `watch` |
| **Table A3 standards** (EN 50126 / 50716 / 50129 / 50159) via the TSI | The safety-assurance *process* for anything claimed as a CCS constituent | ADR-004 (SIL-4 boundary) · ADR-010 · ADR-012 |

---

## 6. Open at L7

1. **Decommissioning notice — 7 years vs 5 years.** The register holds "seven years from publication of the FRMCS on-board IC specifications" (E-2026-08-01-16/-25); a 5-year figure has also been seen. Verify against 2023/1695 §7.4 as amended by 2026/693 before either is used in a plan (ADR-001 item 8). *Not done.*
2. **Indices 96 / 97** — reserved placeholders for the FRMCS profile FFFIS and the FRMCS test specifications. When filled (V3), they become the legal hook for MORANE-2 D1.1 / UIC T-8900 (ADR-007 item 5). Until then the demonstrator's test specification has no legal status.
3. **ERA recommendation #2** — the final NoBo list of interoperability requirements for V3. Until it exists, "MI candidate" in TOBA-7510 Annex A is an indication to the reader, not a certification object.
4. **Decision (EU) 2021/1730** — cited by the SRS, not held as text; ECC(20)02 stands in for it. Low priority: the two say the same bands.
5. **"v2.2"** — MORANE-2's stated basis (E-2026-09-06-03) versus the held v2.1 (E-2026-09-19-19). **Now named by UIC itself** as "the FRMCS V2.2 specification set" under large-scale test in MORANE-2 (E-2026-09-19-22, conference invitation, tier B) — so a v2.2 release exists; it is not held and the v2.1→v2.2 delta is unknown.
7. **"V3p — November 2026"** (E-2026-09-19-22, `watch`). UIC's invitation names a "V3p" delivery in November 2026; the governance texts on file give V3.0 in September 2027 (E-2026-09-06-07). Reconcile before either date is used. If a preliminary V3 appears in November it is the first text that can carry the (M-V3) content of §4 — and the point at which this note's "legally unowned" column gets re-read. The **5th UIC Global FRMCS Conference, 24–25 Nov 2026, Paris** is the acquisition venue for it and for MORANE-2 lessons-learned material.
6. **AI Act** — stays `watch`; nothing above changes ADR-003.

---

## 7. What this note changes in how the register reads its own sources

- **"On record" ≠ "in force".** From today, a UIC clause is cited with its applicability marking — (M), (M-V3), (M-Vx) — and a 3GPP clause with its release, because the legal weight of each differs by an order: v1.0.0 binds, (M) in v2.1 binds by contract if the operator writes it in, (M-V3) binds nobody yet.
- **The resilience positions are legally unowned and that is now stated once, here.** PR11, ADR-002, ADR-007 surfaces 1/3, ADR-011, ADR-012 item 5 are the V3 / Vx / "for further study" content written down by an operator that has to run V2 products in 2027. They are not "beyond the spec"; they are the spec's own deferred content, made explicit.
- **The seam that matters most is the one no law crosses.** The 3GPP management plane can act on the bearer with no human inside the loop, and nothing from L7 down to L4 names it. That is the finding this whole register exists to act on, and it is now traceable from the law downward as well as from the spec upward.

*Anchors:* E-2026-08-01-11/-16 (the TSI acts) · E-2026-08-20-28 (authorisation trigger) · E-2026-07-25-05 (Art. 12) · E-2026-09-06-07 (V2/V3 governance) · E-2026-09-19-19/-20/-21 (UIC v2.1 set, URS, TOBA-7540/UGFA) · E-2026-09-19-05/-06/-11/-12/-15/-18 (3GPP core, SA5, interworking, off-network) · E-2026-08-20-23/-24, E-2026-08-31-04, E-2026-06-24-07 (horizontal law).
