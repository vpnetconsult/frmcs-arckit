# Summary — "Untersuchung ETCS im Kernnetz der S-Bahn Stuttgart" (Abschlussbericht)

**Document:** Final report, v2.0, 31.01.2019 · 422 pp · Vorgangs-Nr. 17FEI27440
**Authors:** Engineering consortium (InGe) — WSP Infrastructure Engineering, NEXTRAIL, quattron management consulting, VIA Consulting & Development, Railistics. Technical PM: Steffen Jurtz (NEXTRAIL).
**Trust tier:** **A (primary)** — commissioned engineering feasibility study; named authors, methodology, recommendations.
**Relevance to arcKit:** corroborates R1 (GSM-R obsolescence / FRMCS successor), R5 (digital-rail: ATO, dense ETCS L2), R6 (gateway decoupling / bearer flexibility), and — at the GSM-R transport layer — R3 (designing out shared failure domains).

## What it is

A feasibility study ("Machbarkeitsstudie") into introducing ETCS Level 2 and ATO (Automatic Train Operation, GoA2) on the heavily-loaded Stuttgart S-Bahn core line (Stammstrecke) — 24 trains/hour/direction at peak. The driver is operational quality: rising ridership has overloaded the Stammstrecke, and the study looks for ways to run trains closer together and recover delays faster.

## Headline findings

- **ETCS Level 2 + ATO GoA2 are technically manageable and operationally sensible** for the Stuttgart S-Bahn. Framed as a one-off innovation opportunity and the basis for stable, punctual service.
- **Chosen carrier system: "ETCS+"** (decided March 2018) — ETCS L2 as the *leading* signalling system (driver runs on cab display, lineside Ks signals dark and retained only as a technical fallback, with far fewer outdoor signals). Requires retrofit of the **entire S-Bahn fleet with ETCS by mid-2025**.
- **Phased automation:**
  - 2025 — ETCS+ with **"ATO-Light"**: full ATO onboard, but the trackside ATO server sends only static, timetable-based profiles once at start of run (no dynamic adjustment).
  - 2028 — **ATO/TMS** target scenario: dynamic control via a Traffic Management System, unlocking further capacity. The 2025 equipment is built to be upgradeable to this.
- **The FRMCS dependency (key for arcKit):** the report states explicitly that the 2028 ATO/TMS scenario requires **GSM-R to be replaced by the future 5G-based radio system, FRMCS** ("Als notwendige technische Basis muss GSM-R durch das zukünftige Funksystem auf Basis der 5G-Technologie (FRMCS) ersetzt werden"). For the 2025 step, GSM-R with a data-radio upgrade is judged sufficient.

## Quantified operational benefit

- ETCS+ reduces average delay per train by **~19.3 s** versus Ks signalling across the study area.
- ETCS+ with ATO-Light: **25.6 s** less delay built up vs Ks — net up to **15.6 s of delay recovered**.
- Enables S-Bahn headways **under 2.5 minutes** between Schwabstraße, Vaihingen and the airport — opening room for additional lines.
- Deliverable with today's ESTW (and DSTW) interlocking technology; 2025 ATO-Light commissioning judged achievable.

## GSM-R transport-layer recommendations (note for R3)

Even at the radio/backhaul layer the study designs against shared failure domains — relevant to the SPOF theme:
- **GS-4:** limit ring loading — initially only 3 BTS per fixed-network loop.
- **GS-5:** alternating ring connection — neighbouring BTS attached to *different* loops, so one loop failure doesn't blank a contiguous stretch.
- **GS-6:** dedicated ETCS-BSC — base stations used for ETCS hang off a BSC carrying only ETCS BTS.
- Plus slot-cable (Schlitzkabel) coverage in tunnels >500 m, tighter co-channel interference and RxQual planning criteria.

## How this slots into the engagement

This is the strongest primary corroboration so far that the GSM-R → FRMCS move is not vendor framing but the documented engineering precondition for next-generation automated rail operation: an official DB-commissioned study, years before the 2026 outage, already names FRMCS as the required basis for dynamic ATO/TMS. Suggested evidence-log action: **validate** against R1/R5/R6; the GS-4/5/6 ring-segmentation recommendations are worth citing under R3 as evidence the shared-failure-domain problem was understood at the transport layer.
