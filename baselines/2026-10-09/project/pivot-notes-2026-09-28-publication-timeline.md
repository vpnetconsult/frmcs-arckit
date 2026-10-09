# Pivot notes — the road ahead, Q4 2026 to end 2027: dates that fix a paper on two-plane automation governance

**Date:** 2026-09-28 · **Pivot baseline:** `ls -d baselines/2026-09-28* | tail -1` · **Evidence:** E-2026-09-28-06 (venue and deadline scan, tier C) plus the dated rows named below · **Companions:** `pivot-notes-2026-09-27-open-letter-ai.md` (the argument), `pivot-notes-2026-09-27-morane2-uic-worldwide.md` (the programme clock), `ADR-002`, `ADR-014`, `ADR-015`
**Purpose:** if the lead publishes a paper on the register's two-plane approach — a *decision plane* that governs the architecture and is already running as this register (ADR-014), a *runtime plane* that governs the live network under a per-class ceiling and a per-action hold (ADR-002, framework v0.3) — which external dates fix what the paper can claim, and which venue deadlines fix when it must be written. Every date below is marked **A** (in a primary text on file), **B** (announced by the body, not read at source) or **est.** (estimated from the previous edition; verify before relying on it).

**Outcome anchor:** *safe, continuous rail operations.* A paper is worth publishing only where it changes what someone decides about that.

---

## 1. What the paper can claim, by date — the four clocks

| Clock | Where it stands (Sep 2026) | Next fixed point | What it does to the paper's claims |
|---|---|---|---|
| **Law: the CCS TSI** | Reg. 2026/693 in force; FRMCS Baseline 0 in Appendix A under Note 9; ERA: "no legally binding implementation requirements related to FRMCS … yet applicable" (A, E-2026-09-28-05) | V3 TSI amendment **best June 2028 / worst June 2029** (A, System Pillar v2.4, E-2026-09-06-07; watch C3/C7) | Through 2027 the paper writes about a bearer whose binding specification does not yet exist. That is the paper's *strength* (governance designed before the law fixes the object) and its caveat (nothing conformity-relevant can be claimed). |
| **Law: AI** | AI Act Digital Omnibus (Reg. 2026/1744) in force 27 July 2026; rail item Annex I §B 17 untouched; high-risk obligations **2 Dec 2027 (Annex III) / 2 Aug 2028 (Annex I)** (A, E-2026-08-23-02); ADR-003: not high-risk while the oversight-not-control boundary holds | 2 Dec 2027 | A paper published before Dec 2027 argues the classification *test*, not a compliance record. After Dec 2027 the Annex III route is live and the boundary argument becomes checkable against practice. |
| **Law: cyber** | CRA Art. 14 reporting in force since 11 Sep 2026; **CRA fully applicable 11 Dec 2027**; NIS2UmsG in force 6 Dec 2025 (A, E-2026-07-01-06/-10-02, ADR-012) | 11 Dec 2027 | The decision plane's Track A terminal (ADR-014) is citable now; the runtime plane's product-side conformance story is complete only after Dec 2027. |
| **Standards: the autonomy texts** | 3GPP Rel-20 in progress (TS 28.567/28.561/28.313 at V20.1.0); LTE SON per-action approval precedent found (TS 32.500, E-2026-09-27-08); ETSI ENI/ZSM/GANA complete on file; TM Forum L4 evidence bar in question (E-2026-09-26-26) | **Rel-20 Stage 3 freeze Mar 2027, ASN.1/OpenAPI freeze Jun 2027** (B, 3GPP); Rel-21 functional freeze Dec 2028 (B) | Cite Rel-20 as "working" until March 2027, then as frozen. The `desiredBehavior` object is stable in the frozen Rel-19 ETSI edition already (E-2026-09-26-16) — cite that for anything load-bearing. |

**The programme clock beneath all four:** UIC V3p specifications **Nov 2026** (B, invitation); MORANE-2 field trials summer 2026 → **end of testing Sep 2027**, V3.0 **Sep 2027**, ERA EECT best Sep–Dec 2027 (A, v2.4). A paper in 2027 sits inside the field-trial year and before any published result.

---

## 2. The calendar — Q4 2026 to Q4 2027

Register-internal dates in *italics*; venue dates as marked.

| When | What | Mark | Bearing on the paper |
|---|---|---|---|
| **Oct 2026** | *A19: lead decides the open letter's next version (bearer question authorised; "Automatisierung" ask and evidence bar proposed)* · *A16: ARB on ADR-015 (framework adoption)* | — | If ADR-015 is adopted, the paper cites the framework as the register's position, not a draft. If the letter goes out, the paper has a public antecedent. |
| Oct–Nov 2026 | ESREL 2027 abstract call (ETH Zürich / PSI host; ESREL 2026 abstracts closed autumn 2025) | est. | Earliest reliability-community venue; 300-word abstract, full paper later. Fit: the hold as a control, the KEI comparator. |
| **15 Nov 2026** | *ADR-001 and ADR-002 quarterly read-back due* | — | Both founding ADRs must be re-read before anything is submitted that cites them. |
| **24–25 Nov 2026** | **5th UIC Global FRMCS Conference, Paris** — V3p delivery, MORANE-2 lessons (C1, B2) | B | Not a paper venue, the place to hear whether the Sep 2026 lab exit held and whether V3p is what it says. Attend or obtain the deck (C1 has an owner rule since ARB-2026-09-04 R5). |
| Nov 2026 – Jan 2027 | DTW Ignite 2027 Catalyst and speaker calls open (TM Forum; Catalyst proposals precede the June event by ~6 months) | est. | The one venue where an *autonomous-network* audience hears a rail governance case; Catalyst = a demonstrable slice (UC7, the register as decision plane, is the only running instance). |
| **Dec 2026** | *Framework v0.3 → v1.0 target if ADR-015 adopted; regenerate `18-standards-on-record.md` at each fetch* | — | Version the framework before citing it. |
| Jan–Feb 2027 | SAFECOMP 2027 abstract/paper deadlines (46th edition; SAFECOMP 2026 Valencia 22–25 Sep with spring deadlines) | est. | The computer-safety venue; fit: "one bound, four realisations", the per-action approval precedent, the class ceiling as a safety argument. |
| **Mar 2027** | **3GPP Rel-20 Stage 3 freeze** | B | From here TS 28.567/28.561 Rel-20 are citable as frozen protocol; before, "working". |
| Mar–Apr 2027 | ERA ERTMS conference cycle (Valenciennes, biennial — Apr 2026 held) | est. | Off-year; watch the ERA event calendar. |
| **Jun 2027** | **3GPP Rel-20 ASN.1/OpenAPI freeze** · ESREL 2027 (Zürich, June est.) | B / est. | — |
| ~Jun 2027 | RSSRail 2027 paper deadline (7th conference, **Dresden, hosted by DZSF**; programme chairs Collart-Dutilleul, Lecomte; Springer LNCS) | est. | **The best-fit venue:** rail, reliability-safety-security, hosted by the body whose Tele-Tf work the register's bearer-dependency question addresses, Springer-indexed. Dates and deadline not yet published; check `eba.bund.de/WebS/RSSRail2027` monthly (host blocked from the sandbox). |
| **29 Jun – 1 Jul 2027** | **DTW Ignite 2027, Copenhagen** — Autonomous Networks mission summit | B | The Race-to-2030 checkpoint; the L4 evidence-bar argument lands here. |
| Sep 2027 | SAFECOMP 2027 (location not yet announced) · **MORANE-2 end of testing** · **UIC FRMCS V3.0** | est. / A | The paper's field-trial year ends; anything published after Sep 2027 can cite MORANE-2 results if the programme publishes them. |
| Sep–Dec 2027 | ERA EECT on V3 (best case) | A (plan) | — |
| Q4 2027 | RSSRail 2027 (Dresden, est.) · WCRR triennial cycle → 2028, abstract call likely 2027 | est. | RSSRail is the deliverable venue for a rail-safety paper in 2027; WCRR 2028 is the wider-audience follow-on. |
| **2 Dec 2027** | **AI Act high-risk obligations, Annex III route** | A | The classification argument becomes checkable in practice. |
| **11 Dec 2027** | **CRA fully applicable** | A | Runtime-plane product-side story complete. |
| **2028** | TSI amendment best case Jun 2028 · AI Act Annex I route 2 Aug 2028 · TRA 2028 · InnoTrans 2028 · WCRR 2028 · Rel-21 freeze Dec 2028 | A / B | The year the object of governance gets its binding specification. |

---

## 3. Venue fit, and what each needs from the register first

| Venue | Deadline (mark) | Fit for the two-plane paper | Must be true in the register before submitting |
|---|---|---|---|
| **RSSRail 2027**, Dresden (DZSF) | ~Jun 2027 (est.) | Best. Rail-specific, safety-security, LNCS. The class ceiling, the hold, the untested GSM-R↔MCX seam, the 23 June class as UC1. | ADR-015 adopted (A16); ADR-004 boundary and ADR-007 surfaces at least ratified as *design*; the letter's status settled (A19) so the paper and the letter do not contradict each other. |
| **SAFECOMP 2027** | Jan–Feb 2027 (est.) | Strong for the safety-argument core: "one bound, four realisations", TS 32.500 precedent, EG 203 341 + WP 5 testing of the adaptive system. | The framework versioned (v1.0); the 18-standards inventory current; the tier discipline visible in the paper's reference list. |
| **ESREL 2027**, Zürich | Oct–Nov 2026 abstract (est.) | Reliability community; the KEI comparator, the availability-cost measure (R4), the alpha-tool caveat on published L4s. | The self-score file's Method-2 label and the benchmark-report caveat (§7.6 item 8) in the text. |
| **DTW Ignite 2027**, Copenhagen | Catalyst Nov 2026–Jan 2027; speakers ~Feb 2027 (est.) | The autonomous-network audience; a Catalyst needs a demonstrable slice — UC7 (the register as decision plane) is the only running instance. | Track B / ADR-014 story; TM Forum licence hygiene (A17) for anything shown. |
| **UIC Global FRMCS Conference 2026** | 24–25 Nov 2026, no CFP found | Listening venue, and the place to put the bearer-dependency question to the people who can answer it. | C1 owner named; B2 (V3p) captured. |
| Journals: *Signal+Draht* / *ETR* (DE trade), *IEEE Trans. ITS*, TM Forum *Inform* | rolling | S+D/ETR reach the operators and the ministry the letter addresses; IEEE for the control-class argument; Inform for the AN audience. | Same as above; German-language version of the letter's §3 ask for S+D. |

**The one scoping rule for any of these:** the paper describes a *rule set* and *one running instance* (the decision plane, ADR-014). It may not describe the runtime plane as a system — ADR-004 and ADR-007 are Proposed, the test surfaces unbuilt. The honest title is the two-plane *design* and the evidence discipline that produced it, with UC1 as the worked case.

---

## 4. Caveats that travel

- Every **est.** date is inferred from the previous edition; the conference hosts' pages (eba.bund.de, esrel2027prd.ethz.ch, wikicfp, showsbee, railmarket) are blocked from the sandbox — B34 lists them for the lead to check or open.
- The System Pillar's two-branch TSI plan (Jun 2028 / Jun 2029) is the sector's own; the paper must carry both branches (ADR-001 item 8).
- Nothing rail-autonomy-specific exists in any SDO text on file; the paper cannot cite one, and should say so as a finding.
- No status changed in the traceability matrix for this note.

## Citation trail

`current/traceability-matrix.md` → `current/evidence-log.md`: E-2026-09-28-06 (venue scan); E-2026-08-23-02 (AI Act omnibus dates); E-2026-07-01-06 / E-2026-07-10-02 (CRA/NIS-2 dates); E-2026-09-06-07 (System Pillar v2.4 timeline); E-2026-09-19-22 (V3p Nov 2026); E-2026-09-28-05 (ERA guide); E-2026-09-26-16 (frozen Rel-19 ETSI editions) → ADR-001 item 8, ADR-002, ADR-003, ADR-012, ADR-014, ADR-015; `14-next-acts.md` A16, A19, B34, C1–C3, C7, C8.
