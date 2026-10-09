# Pivot notes — FP2-MORANE-2 anchored at UIC, and what plays its role elsewhere

**Date:** 2026-09-27 · **Pivot baseline:** `ls -d baselines/2026-09-27* | tail -1` · **Evidence:** E-2026-09-27-13 (EU-Rail System Pillar report on FRMCS V2/V3, tier A), E-2026-09-27-14 (worldwide scan, A for the EU-Rail page, B/C for the rest), plus the held rows named below · **Companions:** `pivot-notes-2026-09-27-open-letter-ai.md`, `sdo-mapping-frmcs-gsmr-5gsa.md`, `12-institutional-map.md`
**Purpose:** put FP2-MORANE-2 in its institutional place — a UIC-anchored programme that exists to feed European law — and name the programmes in other regions that occupy the same slot, so that any article or letter that says "Europe is doing X" can say, correctly, what everyone else is doing.

**Outcome anchor for every piece:** *safe, continuous rail operations.* MORANE-2's job is to prove that FRMCS can replace GSM-R "without major risks"; that phrase is the System Pillar's, and it is the register's outcome in the sector's words.

---

## 1. The anchor — UIC's global plan, and the law it feeds

**Layman claim:** FRMCS is not a European standard that others may copy. It is a UIC specification, written for global use like the GSM-R specifications before it, that Europe alone has wired into law. MORANE-2 is the test programme that law requires before the specification can be cited in it.

**Chain (E-2026-09-27-13, tier A; E-2026-07-02-15; E-2026-08-02-06):**

- **UIC owns the top of the stack.** The System Pillar's specification map has five layers: UIC user requirements and use cases; UIC system specifications (trackside and on-board: FRS, SRS AT-7800, FIS-7970, FFFIS-7950, TOBA-7510); 3GPP MCX, carrying UIC's use cases introduced into 3GPP; ETSI TC-RT technical specifications transposing both; and the FRMCS test cases, first written by UIC inside 5GRail. UIC "has set a global plan … inside a global initiative", and the report's own information is "sourced from the UIC FRMCS Program … as per the MoU established between EU-Rail and UIC".
- **The pipeline is legal, and it has a clock.** UIC V2 (final June 2024) → ETSI TSs (3Q 2024) → ERA technical opinion (4Q 2024) → Morane 2 as "a full TRL 8 project" → UIC V3 "market ready" by end 2026 → adoption 2Q 2027 → "June 2027: adoption of CCS TSI by the Commission after a positive vote of the RISC". The report also prints the downside: Morane 2 end of testing Sep 2026 → Jul 2027, V3 draft → Oct 2027, EECT → Oct 2028, RISC → Mar 2029, **CCS TSI amendment → Jun 2029**. **Superseded on 24.10.2025 by Version 2.4 of the same report (E-2026-09-06-07, already in ADR-001 item 8):** MORANE-2 end of testing Sep 2027, V3.0 Sep 2027, **TSI adoption best case June 2028 / worst case June 2029**, V3 cut to a "minimum viable product", UNIFE dissenting from the timeline, ERA calling it "extremely challenging". The register carries both branches (watch C7); the June 2027 nominal is history.
- **MORANE-2 as it stands (E-2026-09-27-14, A for the EU-Rail page):** € 13.5 m grant, 34 months, Dec 2024 – Sep 2027, 43 partners, linked to FP2 and FP6; three integration labs (Ericsson, Nokia, Kontron) validating "FRMCS connectivity, interworking with GSM-R, and inter-vendor interoperability"; five field lines in Spain, Germany, Sweden, the Netherlands; the first unified system test-case set on FRMCS v2.2 published July 2026 (Railway Gazette, C); a July 2026 end-to-end validation on DB InfraGO trains at 1900 MHz "as preparation" (Ericsson, B, E-2026-09-27-12). UIC: "2026 marks a pivotal year, with the delivery of the UIC FRMCS V3p Specifications and the start of testing of the FRMCS V2.2 specification set".
- **What MORANE-2 is for, in the sector's words:** "a FRMCS system capable to substitute without major risks to GSM-R and managing voice services, ETCS and ATO GoA1/2"; a second phase for GoA3/4 and "multi-networks transitions … evolution of the interconnection GSM-R hubs currently managed by railways through the UIC ENIR group".

**Limits:** every date is a plan or a risk scenario in a March 2025 document; no MORANE-2 deliverable is published on the Europe's Rail page as of today; the GSM-R↔FRMCS interworking is validated in the three labs, not on the field lines (E-2026-09-26-02/-11, E-2026-09-27-12).

---

## 2. The programmes elsewhere — same slot, different shape

**Layman claim:** every large railway is replacing GSM-R or its equivalent, and every one of them does it as a national programme on a national spectrum plan. Europe is the only region that runs a shared, multi-vendor system validation of one specification set, because Europe is the only region with a law that will cite it.

| Region | Programme | Technology and spectrum | Stage (search-level, E-2026-09-27-14) | What it shares with MORANE-2 | What it lacks |
|---|---|---|---|---|---|
| **Europe** | FP2-MORANE-2 (EU-Rail JU, UIC-anchored) | FRMCS on 5G; RMR 1900 MHz (n100/n101) + 900 MHz | labs since 2025, field from summer 2026, end Sep 2027 | — | — |
| **South Korea** | Korea National Railway nationwide **LTE-R** conversion (KTX first, 2017) | 4G LTE-R, dedicated band; replaces VHF/TRS | final 12-line tender 2026; 3,523 km target; Gyeongbu section for end-2026 | a national-scale replacement of legacy radio with a 3GPP-based railway network; Samsung/KT, Nokia | not FRMCS: LTE, not MCX-over-5G; no multi-IM interoperability test because one IM; no TSI |
| **China** | China State Railway Group **5G-R** | dedicated 5G in 2100 MHz (10 + 10 MHz FDD); own standards | MIIT test-frequency permission Sep 2023 (Beijing loop line); three-year action plan since 2020; replacement of GSM-R by ~2030 forecast | the same problem (GSM-R obsolescence at national scale) and 3GPP as the base | a national standard and spectrum plan; no UIC specification set; no external interoperability programme |
| **India** | Indian Railways LTE at 700 MHz around **Kavach** ATP; NCRTC private LTE for RRTS | LTE, 5 MHz paired at 700 MHz (2021) + 5 MHz recommended (TRAI 2024) | Kavach LTE upgrade tenders 2023–24; RRTS running ETCS L2/L3 + ATO over private LTE | mission-critical voice and ATP over a dedicated LTE network | no FRMCS; no interoperability programme; the spectrum dispute with DoT is the governing constraint |
| **Australia** | ARA telecom sub-committee roadmap GSM-R → FRMCS 2025–2035; Queensland "The Wave"; Sydney Trains NextGen DTRS | FRMCS-pathway systems, procured line by line | Queensland stage 1 awarded 2026 (Ericsson, UGL, Frequentis; Alstom ETCS L2); Sydney Trains business case with Systra | UIC specifications as the target; the same vendors | no shared validation programme — each network procures; the 2026 Telstra-4G outage (E-2026-07-12-01) shows the public-carrier dependency being migrated away from |
| **Saudi Arabia** | SAR – Ericsson MoU (Oct 2025) | 5G / FRMCS use cases | MoU: lab, training, trial on one line | FRMCS as the declared target | MoU stage; single vendor |
| **Japan** | no FRMCS programme found; local-5G trials (Hanshin, Tokyo Metro) | local 5G for platform and crossing safety | trials | 5G on the railway estate | no GSM-R legacy, no common train radio programme |
| **North America** | PTC on 220 MHz (PTC-220 consortium, FCC); private-5G CBTC in two metros | 220 MHz PTC data radio; private 5G for CBTC | operational (PTC); metros procuring | 3GPP-based private networks for train control (metros) | no FRMCS, no UIC-type specification, no interoperability law |

**The UIC thread.** UIC's Asia-Pacific Executive Board includes CR (China), Indian Railways, JR East, KORAIL, KTZ and UBTZ; UIC states the FRMCS specifications "are intended for global use, much like the current UIC GSM-R Specifications"; UIC hosts the FRMCS Plugtests with ETSI and a Global FRMCS Conference. Membership and specification are shared. **What is not shared is the law:** there is no CCS TSI outside the EU, so no region outside Europe needs a MORANE-2 — a programme whose deliverable is a specification a regulator can cite. Korea and China each have *one* infrastructure manager and *one* national standard; interoperability across IMs, which is what MORANE-2's three labs and five lines exist to prove, is not their problem.

**Limits:** every non-European fact above is search-level (vendor releases, trade press, one journal paper, one government release not fetched); none is read at source; B33 lists the primaries. The table is for orientation and for the letter's framing, not for a decision.

---

## 3. What this does to the register's positions

- **ADR-001 (GSM-R → FRMCS, phased parallel run).** Confirmed from the sector's own planning text: MORANE-2's purpose is substitution "without major risks", with voice, ETCS and ATO GoA1/2 first and GoA3/4 later. The ADR's phasing matches the programme's. New: the CCS TSI date has an official nominal (June 2027) and an official delay scenario (June 2029). **Watch, not a change.**
- **The open letter's "FRMCS centralises more" (§1) and "every fallback must demonstrably carry safety traffic" (§3).** The System Pillar §8.1 says the same about public networks: "subject to national regulatory, liability and legal constraints", feasibility "has to be proven". The letter can cite the sector's agenda for its ask.
- **The untested seam (E-2026-09-26-02/-11).** MORANE-2 validates GSM-R interworking in labs; the field lines validate FRMCS. The System Pillar's second phase names "multi-networks transitions" as *later* work. The register's finding that the GSM-R↔MCX seam has no external field test stands, and now has the programme's own phasing as the reason.
- **The framework's row J (no rail autonomy text anywhere).** None of the programmes above carries autonomy or AI content; the worldwide scan changes nothing there.
- **The citation-form rule (`CLAUDE.md` §Always).** The specification map is the rule in one figure: UIC requirements → 3GPP MCX → ETSI transposition. Rail-pinned specs are cited in ETSI form because that is the layer the law cites.

## 4. Threads an article or letter can carry

1. **"Europe tests together because Europe legislates together."** MORANE-2 is unique not because Europe is ahead but because the CCS TSI needs a specification it can cite, and a specification needs a TRL-8 validation across vendors and IMs before a regulator will cite it. Korea finished an LTE-R network first; China will finish 5G-R on its own standard; neither had to prove interoperability to anyone.
2. **"The clock has two branches, and the sector wrote both down."** The March 2025 plan said June 2027; the October 2025 revision says best case June 2028, worst case June 2029, with a reduced V3 scope, the supply industry dissenting and the regulator calling the timeline "extremely challenging" (E-2026-09-06-07). Any national migration plan pinned to 2028 is standing on the optimistic branch and should say so — the point ADR-001 item 8 already makes about the Deployment Questionnaire's switch-off dates.
3. **"The public network is a backup by law, not by engineering."** The 2020 Strategic Deployment Agenda and the System Pillar make the fallback a matter of national regulation, liability and proof. That is the letter's §3(3) in the sector's words, and TMF931's pre-onboarded, purchased offer in the operator's.
4. **"Interworking is a lab result."** For the letter's centralisation thesis: the seam between the old system and the new is validated on benches in Ericsson's, Nokia's and Kontron's labs; the field lines run FRMCS. The transition years will be lived on that seam.

## Caveats that travel with everything published

- Tiers as marked: the System Pillar report and the EU-Rail page are A; UIC statements are B at search level (uic.org unreachable through the proxy today); everything outside Europe is B/C and unread at source.
- Plans are not outcomes: no MORANE-2 deliverable is public; V3p is announced, not held; the July 2026 DB InfraGO validation is vendor-asserted.
- No status changed in the traceability matrix; both rows are `watch`.
- Copyright discipline: paraphrase, cite, never paste.

## Citation trail

`current/traceability-matrix.md` → `current/evidence-log.md`: E-2026-09-27-13, -14, -12; E-2026-07-02-15, -28; E-2026-08-02-06; E-2026-09-26-02, -11, -21; E-2026-07-12-01 → ADR-001, `CLAUDE.md` §Always (citation nomenclature), `14-next-acts.md` B33 and the C-list TSI watch.
