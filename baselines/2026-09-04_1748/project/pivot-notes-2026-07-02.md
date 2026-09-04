# Pivot notes — article/letter source pack

**Date:** 2026-07-02 · **Pivot baseline:** `baselines/2026-07-02_1341` · **Evidence log:** 98 entries (E-2026-07-02-33 last)
**Purpose:** the six evidence-chained narrative threads this baseline can carry into articles and letters. Each thread lists its claim in layman terms, the evidence chain, and the honest limits that must travel with it. Companion file: `pivot-prompts-2026-07-02.md` (ready-to-paste arcKit commands for the visuals).

**Outcome anchor for every piece:** *safe, continuous rail operations.* On 23 June, "safe" held and "continuous" failed.

---

## Thread 0 — What worked was the Movement Authority protocol

**Layman claim:** Nobody was endangered on 23 June. Rail's safety design converts silence into standstill: with no radio, no new movement authority is issued, the train's onboard computer enforces its Supervised Location, and movement defaults to *stop*. The safety case worked; what failed was continuity.

**Chain:** incident-annex.md + E-2026-06-27-01/-02/-03 (confirmed mechanism, standstill, manual recovery) · E-2026-07-02-33 (MA/SvL vocabulary: EoA → Danger Point → overlap, SvL as the enforced fail-safe boundary) · E-2026-07-02-26 (the Befehl written-order layer operations degraded onto) · E-2026-07-02-29 (TIMS tri-state: unknown → treated as unsafe) · E-2026-07-02-24 (supervised stop holds even if the driver brakes late; validated safe default = withhold acknowledgement under uncertainty).

**Why it opens, not footnotes:** it pre-empts the alarmist misreading (the incident is not "rail safety is broken"); it sharpens R4 (the estate is provably fail-*safe*, not yet fail-*soft* — R4 is exactly the gap between those two words); and it frames the AI-oversight proposal (thread 2) as conservative — the agents exist to prevent the standstill, never to override the stop.

**Limits:** phrase precisely — "loss of communication degraded to safe standstill by design", NOT "ETCS L2 saved the day" (GSM-R serves voice/REC and ETCS bearer duties; not every affected line runs ETCS L2 MA-over-radio). ACTION before print: the MA/SvL vocabulary currently rests on a D-tier explainer (E-33) — log **ETCS Subset-026 itself as A-tier** before this thread carries weight.

---

## Thread 1 — The backup existed and nobody knew it wouldn't fire

**Layman claim:** DB's redundancy was real and functional. A planned component swap triggered a software fault that raised no alarm — so the automatic failover never engaged, and it took ~90 minutes of manual work to recover, nationwide. The lesson: you must prove redundancy *triggers* under a hidden fault, not that it *exists*.

**Chain:** E-2026-06-27-01/-02/-03 (DB-confirmed cause) · E-2026-06-25-02 (high *calculated* availability for the same estate — calculation is not evidence) · ADR-007 (four-surface test strategy; core principle: test the trigger) · PR5/PR11 + E-2026-06-30-03 (independent out-of-band detection, ITU-T Q.752 — a component that lies about its health cannot be its own alarm) · E-2026-07-01-09 (ETSI TS 103 147 mandates AUTOMATIC switchover → 23-Jun was a non-conformance, not bad luck) · E-2026-07-02-25 (DB's own geo-redundancy doctrine — see taxonomy below).

**The E-25 sharpening (pre-empts the "but DB says manual!" rebuttal):** DB deliberately keeps *disaster-class* site failover manual — a human decision in a regularly practised procedure — while *element-class* fault failover must stay automatic and detection-driven. Two different failure classes; conflating them in either direction is the error.

**The common-mode kicker:** DB's cold-standby design promptly syncs every change to the fallback — by design, one bad update reaches both sides (the identical-config channel PR11 guards against), and DB's own authors concede an isolated cold fallback cannot be fully end-to-end tested (E-25 §5.3). The 23-Jun pattern risk, written down by the operator itself.

**Limits:** replay fidelity is inference-based until DB/EBA publish full telemetry (PR8); no formal regulator report logged yet.

---

## Thread 2 — The industry already agrees with the boundary (AI oversight, not control)

**Layman claim:** Keep the learning AI in an advisory room with one-way glass: it can watch everything, it can warn and explain, but only a human can act on its advice, and the certified safety core never depends on it. This isn't our invention — it's the rail sector's own revealed preference, three times over, in the operator's own words.

**Chain — three in-domain adoptions:** E-2026-07-02-14 (CTMS, DB's flagship AI traffic management, near-verbatim: "not being designed as a safety-critical system"; safety with the interlocking/APS) · E-2026-07-02-19 (AutomatedTrain GoA-4: *deliberate* decision — no AI-based algorithms in safety-critical paths, deterministic landmark localisation preferred) · E-2026-07-02-09 (iLBS in operation: non-SIL/COTS operating layer over a safety-enforcing vital interlocking — the pattern certified and running).

**Platform design-basis evolution:** E-2026-07-02-01 (DB×Siemens SIL4 Data Center) → E-2026-07-02-03 (SIL4-Cloud separation kernel — deterministic mixed-criticality matured) → E-2026-07-02-27 (Cloud4Rail: operator direction = untrusted COTS virtualisation + certified application-level safety layer + NHA; learning-component co-hosting explicitly NOT covered — common-cause failures and replication/voting still open research). NB naming collision: Cloud4Rail's "Architecture B" ≠ ADR-004's Option B.

**Regulatory stake:** the EU AI Act not-high-risk finding (ADR-003, Art 3(14), conditional — never assert as automatic) holds only while this boundary holds. Boundary breach = safety component = high-risk = SIL-4 for a learning system = infeasible. The boundary IS the compliance argument.

**Limits:** ADR-004 is *boundary-designed*, not *evidenced* — FFI/independence analysis, hazard log, ISA/NoBo assessments are open action items. R9 evidence is prototype/simulation-grade (CTMS MARL, E-14).

---

## Thread 3 — The human is the load-bearing component, so bound the load

**Layman claim:** Human oversight fails quietly when the human is overloaded: pile on alerts and approvals become reflexes (rubber-stamping). The rail sector's own answer is emerging — a quantified "reasonableness" budget for how much deciding you may ask of one person, assessed by an independent panel and revalidated at every project phase.

**Chain:** PR4 (automation bias; dissent-rate metric alone insufficient — LOAD BOUND) · E-2026-07-02-13 (TU-Dresden/DB Zumutbarkeit criteria: speed-dependent section lengths, notice counts, decision-rate bounds; proposal to add a REASONABLENESS factor to the CSM-RA significance test; honest withdrawn-proposal admission) · E-2026-07-02-23 (the operationalisation: five-step model — integrated complexity + human-error assessment per VDI 4006, complexity classes, standardised matrix scored by an INDEPENDENT expert team, improvement factors, anchored via the extended CSM process (Ril 809) + TAst phase gates) · supporting colour: E-2026-07-02-24 (validated safe default: withhold acknowledgement under uncertainty → supervised stop) · E-2026-07-02-29 (TIMS tri-state honesty: report "unknown", never coast on stale "confirmed").

**The transferable design:** alert budgets and decision-rate limits for the oversight layer are not AI-ethics hand-waving — they are the same instrument the sector proposes for its own signalling migration, built from released rail artefacts.

**Limits:** all of it is research/proposal state — dissertations ongoing, pilots pending, not adopted regulation. CERSS interest note applies (inspection-services party in pieces arguing about assessment effort).

---

## Thread 4 — Equivalence to what, exactly? (the MCX bar, now sourced)

**Layman claim:** "FRMCS must be as good as GSM-R" only means something if you can point at the bar. The bar exists: two mandatory UIC specifications refined over 25 years of controlled change requests, a 658-page test catalogue with hard numbers (emergency call set-up under 2 seconds, in 95 % of cases), and three named MCX gaps still open in 3GPP. And the sector's own documents show the timeline has already slipped two years.

**Chain:** E-2026-07-02-30 (EIRENE FRS 8.1.0 — functional bar, CCS TSI Annex A mandatory, (MI)-marked set = what certification verifies) · E-2026-07-02-31 (EIRENE SRS 16.1.0 — system bar, the pair mutually consistency-assured; quarter-century CR history) · E-2026-07-02-32 (UIC Doc 3114 NoBo test catalogue: once/live/assessment taxonomy; REC < 2 s / group < 5 s / 95 % / 99th ≤1.5×; coverage −98/−95/−92 dBm bars) · E-2026-07-01-10 (named MCX gaps: rail group affiliation Rel-16/CT1 in progress, functional-alias termination side, E2E security optional/to-be-defined) · E-2026-06-24-18 (Ril 481.0205, the DB operational bar) · timeline slip: E-2026-07-02-28 (c.2021 brochure: products "planned for 2025") vs E-2026-07-02-15 (market-ready 1st Edition/V3: Q3 2027) = ~2 years, from the sector's own documents.

**Limits:** UIC 3114 is a 2013 final *draft* on superseded baselines — methodology stands, test cases need currency-checking. Only (MI)-marked EIRENE requirements are binding — don't overstate the bar. MCX equivalence is validated-in-progress (E-2026-06-29-01), not failed.

---

## Thread 5 — More weight on the bearer, thinner net beneath it

**Layman claim:** The future system deliberately moves more safety communication onto the radio bearer — of nine harmonised written orders, only four survive *if* the radio link holds — while the human-procedural net beneath it thins. Meanwhile the bearer's own resilience is real but incomplete: fallback switching is field-proven at ~2 seconds, but the one mode that needs no trigger at all was only tested in the lab. Availability is becoming the safety-adjacent question.

**Chain:** E-2026-07-02-26 (System Pillar: 4 of 9 European Instructions remain, all conditioned on "reliable radio connection"; named open question = radio-loss ↔ ETCS-reaction interplay; digital Befehl national fragmentation) · E-2026-07-02-21 (5G-RACOM final field results: 2.0 s avg switchover, UCs 1/2/3/5/6 field-tested; UC4 trigger-less REPLICATION lab-only; prototype pre-QoS/policy; n78 not RMR bands) · E-2026-07-02-10 (the design paper; UIC-SRS-bound multipath) · E-2026-07-02-25 (geo-redundancy doctrine for the ground estate) · R3/R4 rows (both open; the matrix's honesty column).

**The synthesis with threads 0/1:** a network that can only stop is safe but not resilient; the target system raises the price of every bearer outage while the record shows the trigger problem (thread 1) is not yet closed for the target either.

**Limits:** MORANE-2/ProRail carries multipath into European validation but results are pending (E-2026-07-02-15); the "thinning fallback" analysis is expert-discussion state, safety considerations explicitly incomplete (E-26).

---

## Caveats that travel with everything published

1. **No status changed** in the traceability matrix during the 07-02 evidence wave — everything validates or watches; no decision flipped.
2. **Tiering:** most sources are A/C (operator first-hand in trade venues); vendor/contractor colouring flagged per entry (InstaDeep, Nextrail, CERSS, Funkwerk/Kontron, Accenture). Clean-A documents: TIMS spec (E-29), EIRENE pair (E-30/-31); A/B: 5GRAIL brochure (E-28); D: MA/SvL explainer (E-33).
3. **Plans ≠ achievements:** certified lab V&V environments, qualified synthetic data, Cloud4Rail deliverables, Zumutbarkeit pilots, warm-standby Zielbild — all pending.
4. **Parked items to fix before reuse:** Nortel ≈58 % share + insolvency year still unsourced (soften or source the open letter); Subset-026 not yet logged A-tier (thread 0 dependency); UIC 3114 currency check.
5. **Copyright discipline:** paraphrase, cite, never paste — S+D/EI/UIC content is copyrighted; the log already follows this.

## Citation trail

Every claim above traces: `current/traceability-matrix.md` (ref columns) → `current/evidence-log.md` (E-rows with tier + note) → frozen at `baselines/2026-07-02_1341`. Cite evidence IDs in drafts; resolve to sources at edit time.
