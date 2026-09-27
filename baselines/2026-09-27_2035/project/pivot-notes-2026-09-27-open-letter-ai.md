# Pivot notes — the open letter, three months on: recap, latest status, and what AI does to its argument

**Date:** 2026-09-27 · **Pivot baseline:** `baselines/2026-09-27` (first cut; the day's later cut is `ls -d baselines/2026-09-27* | tail -1`) · **Evidence log:** E-2026-09-27-11 last · **Companions:** `pivot-notes-2026-07-02.md` (the six threads the letter was built from), `17-open-autonomy-framework.md` v0.3, `ADR-002`, `ADR-014`, `ADR-015`
**Purpose:** what the 28 June letter said, what has happened to each of its claims since, and how the register's two-plane approach (ADR-002: a *decision plane* that governs the architecture and a *runtime plane* that governs the live network) changes the letter's argument now that the autonomous-network texts of 3GPP, ETSI and TM Forum are on file. Written for the lead's next-version decision on the letter; the letter has not been changed since 28 June and has not been sent (ARB-2026-09-04 R4: drafting authorised, sending expressly not).

**Outcome anchor for every piece:** *safe, continuous rail operations.* On 23 June, "safe" held and "continuous" failed. Nothing below changes that sentence.

---

## 1. Recap — what the letter says (28 June 2026, `current/offener-brief-frmcs-risiko-kommunikation.md`, ~1,900 words, five sections)

| Section | Claim, in one line | Register anchor then | Status of the anchor now |
|---|---|---|---|
| §1 Why now | FRMCS is the technical precondition for ATO/TMS; "the question is not whether but how"; **FRMCS centralises more, not less** (IMS/SIP core, MCX servers, central registers) | ADR-001; E-2026-06-28-05 | **Stronger.** The GSM-R↔MCX seam has no external test anywhere (TCCE interoperability, TC RT conformance, MORANE-2 system — none covers it, E-2026-09-26-02/-11); MCX multi-vendor interop was barely executed at the Plugtests; TR 103 627 (E-2026-09-27-10) is the only text placing autonomics on IMS and it leaves the IMS functions untouched by design |
| §2 The real error | A component swap on a central shared element treated as "routine maintenance" instead of a **significant change under CSM-RA** (Reg. (EU) 402/2013 Art. 4(2), six criteria, independent AsBo, staged rollout, tested rollback); the letter names the question, not a proven breach; the cascade mechanism is not published | E-2026-06-28-06 (framework verified at primary law) | **Unchanged and still unanswered publicly.** The register has since built the same distinction in its own vocabulary: an act on a class-3 object needs a human decision *before* execution (ADR-002 ceiling table) — see §3 below |
| §2a The legacy | Proprietary GSM-R lineage (Nortel → Kapsch → Kontron; STP as a *structural* example, expressly not the 23 June cause) | E-2026-06-29-02 | Kapsch→Kontron confirmed (C-tier); the ≈58 % share and insolvency year **still unsourced** — soften or source before any re-issue (parked since 07-02) |
| §3 Risk management asks | (1) CSM-RA discipline binding, also for FRMCS; (2) **resilience as a funding and approval condition** — geo-redundant core, a defined fallback that keeps voice and movement authorities alive locally; (3) every fallback path (public 5G, satellite) must **demonstrably** carry safety traffic or not count | ADR-001 §1.7, ADR-004 | (2) now has a measurable comparator (TM Forum KEI ranges, MTTR < 60 min at L4 — comparator, not target, E-2026-09-26-26); (3) has a precise shape: the public-MNO fallback is a **purchased offer, pre-onboarded** (TMF931/IG1318, E-2026-09-27-01), CAMARA exposes no safety function, and onboarding has no emergency path |
| §4 Communication asks | Publish the cascade and the significance classification; close the gap between the technical level (which knew GSM-R was fragile) and the decision level; structured risk reporting; crisis communication | ADR-002 Risk Sentinel (R12) | The "why nobody knew" gap is now the register's own operating problem: decision drift (`linkedin-post-decision-drift.md`); the decision-health block exists because of it |
| §5 Offer | An independent party offers to contribute to a joint format (ministry, supervisor, DB, industry) on resilience and change requirements for FRMCS | `00-charter.md` | Unchanged. ARB-2026-09-04 R4 fixes the posture for any addition: independent party, asks a question, claims no mandate |

**What the letter does not contain:** any mention of AI, automation or autonomous networks (one occurrence of "Aufsicht", meaning the supervisory authority). The **bearer-dependency question** (does the remote-command concept for automated operation, Tele-Tf, depend on the bearer, and with what loss-of-command behaviour) was **authorised for drafting** on 4 September and **has not been drafted** — the file's last change is the commit of 1 July.

---

## 2. Latest status — the register behind the letter (freeze 2026-09-27)

- **Decision health:** 9 of 12 ADRs Accepted, 65 action items closed / 31 open, revise rate 32 % (from 5 % on 15 August). The wire between evidence and decisions is connected; the letter's claims can be traced row by row.
- **The two planes (ADR-002, Accepted):** the **decision plane is running** — ADR-014 (Accepted 2026-08-23) designates this register as its operating instance, terminating in NIS-2 (Track A) and NACSA (Track B). The **runtime plane is not in operation** and stays out until ADR-007's test surfaces produce evidence; ADR-004 (safety boundary), ADR-007 (testing) and ADR-015 (open framework) are Proposed, awaiting the board.
- **What arrived since 20 September (the pivot to ETSI / 3GPP / TM Forum):** the open-reference autonomy framework (v0.3) with a decision-class ceiling on every 3GPP TS 28.100 task; all ETSI ENI/ZSM, 3GPP SA5 and TM Forum AN texts read at source; the GANA lineage complete (TS 103 195-2, TS 103 194, WP 16, six TRs, six PoC white papers, EG 203 341); the LTE SON set; the TM Forum Open APIs and the March 2026 benchmark report; 172 specifications on record (`18-standards-on-record.md`, regenerated today).
- **Two facts that did not exist on 28 June and matter to the letter:**
  1. **Every published TM Forum Level 4 certificate was scored on alpha questionnaires now withdrawn from the service; no core-network fault-management validation reached Level 4 on any tool version** (TM Forum's own report, E-2026-09-26-26). The "autonomous network" the market advertises for the bearer FRMCS will run on is, for the scenario 23 June belongs to, not there.
  2. **3GPP itself specified a per-action human approval for network automation — in 2008, for LTE SON — and removed it for 5G SON.** TS 32.500 REQ-SON-CON-05: in open-loop mode "the implementation of any update proposed by the SON function shall take effect only after a response by the Operator", behind a "manual intervention/pause point" removed "all at once or gradually" as trust is gained. TS 28.313 (5G SON) has no open-loop mode, no pause point, no trust-gated transition (E-2026-09-27-08).

---

## 3. The pivot — what AI does to the letter's argument

**Layman claim:** the letter asked one question about one night: was a change to a central shared element treated as routine or as significant? The autonomous-network texts now on file show that the same question is about to be asked of software every hour, and that the industry has already answered it twice in opposite directions. LTE-era 3GPP said: proposals from automation take effect only after an operator responds, until trust is earned. 5G-era 3GPP and the TM Forum Level 4 target say: closed loop, "eliminating the need for manual review" (IG1326 Table 2, 2023), with a review clause reinstated only for "high-risk commands" a year later. **The letter's significance test and the register's class-3 hold are the same instrument.** Applied to a person with a maintenance ticket in June, it is CSM-RA. Applied to a closed loop in 2030, it is `NOTIFY_RCOMMENDATION` on the loop object (TS 28.567), a pause point (ZSM 009-1), recommendation mode (ENI 005), or open-loop SON (TS 32.500) — four standard realisations of one bound, none of which is per-action for 5G today.

**Chain:**

- **The bound exists in every body's vocabulary and in none of their defaults.** ENI 010's responsibility index keeps escalation at L5; TM Forum's blueprint keeps "high-risk command review" until L5 while IG1326 defines L4 as no manual review; GANA governs by objectives in and recommendations and escalations out (TS 103 195-2 §4.5, TR 103 747); TC INT AFI's own words: telecom networks "shall never be self-governing" (PoC WP 4, 2019). E-2026-09-26-06/-17, E-2026-09-27-02/-04/-05.
- **The one per-action approval in a standard is the one 5G dropped.** TS 32.500 REQ-SON-CON-05 and §5.4.2 (2008); TS 32.541 REQ_SH_CON_001 "confirmed by the IRPManager before they are executed" (2009); TS 28.313 (2026): enable/disable, targets, ranges — nothing else. E-2026-09-27-08.
- **The hold has a place to live in the 5G management plane.** `ClosedControlLoop.desiredBehavior` ∈ {DECISION_ACTIVATION, NOTIFY_RCOMMENDATION, DO_NOTHING} in TS 28.567 (frozen ETSI edition V19.3.0 citable); a task API (TMF664) has no hold state, so the hold sits in the loop or the order (TMF641 `pending`, point of no return). E-2026-09-26-09/-16/-23/-24.
- **The 23 June class is exactly what automation does not see.** The alarm that never came is what an alarm API observes (TMF642); the register's out-of-band monitor is what a management-plane consumer cannot be. Data quality is the industry's own top implementation challenge (61 %, benchmark report). E-2026-09-26-22/-26.
- **The two planes, seen from the letter.** The *decision plane* is the letter's §4 ask made operational: a register that forces the decision question on every piece of evidence so that "the technical level knew and the decision level did not" cannot recur silently — it is running, AI-assisted, under the same guardrail (ADR-014). The *runtime plane* is the letter's §3 ask made testable: a fallback that "demonstrably carries safety traffic" is a class-3 decision taken by a human, in advance, on paper (TMF931 onboarding), and a loop that proposes degraded mode but does not actuate it (ADR-002 Resilience Orchestration Agent). It does not run until ADR-007 shows it can be tested — and EG 203 341 plus PoC WP 5 now give the method for testing an adaptive system (recreate the trigger, allow the delay, reset the algorithm's memory, stability first).

**The pivot itself — three additions the next version of the letter can carry, each traced:**

1. **The bearer-dependency question** (authorised ARB-2026-09-04 R4; not yet drafted). Does the automated-operation concept depend on the bearer, with what preconditions per decision class and what loss-of-command behaviour? Bound by the counter-fact that the sector keeps on-board staff ("Zugbegleiter-Plus") in normal scenarios, so the exposure bites in the unattended case the project treats as its best case (E-2026-09-04-18; `06-ratification-readiness.md`).
2. **A new ask under §3: "Automatisierung."** Changes to central shared FRMCS elements proposed by *software* should meet the same test as changes proposed by *people*: significance assessed, and for significant ones a human response before the change takes effect — the open-loop mode 3GPP specified for LTE SON and did not carry into 5G. The ask is not "no automation"; it is the LTE rule for 5G, on the bearer that carries movement authorities. Trace: TS 32.500 REQ-SON-CON-05; TS 28.567 `NOTIFY_RCOMMENDATION`; ADR-002 class 3.
3. **A bar for the word "autonomous" in any funding or approval condition.** If §3(2) becomes a condition, "autonomous network" claims about the rail bearer should rest on generally-available evaluation tools with objective indicators, not on the alpha-tool certificates the industry's own report has since disowned — and on independent, out-of-band monitoring of the core, since the industry's own top obstacle is data quality. Trace: E-2026-09-26-26; framework §7; TR 104 180 data-quality rules.

**Limits that travel with this pivot:**

- **Nothing rail, nothing safety, in any autonomous-network text on file.** Not ENI, ZSM, SA5, TM Forum, GANA or the PoC series; the only rail case is a live broadcast on a high-speed train over a public MNO (IG1326). The framework's row J stays empty; the letter cannot cite an SDO for rail autonomy because none has written one.
- **The register's runtime plane is a design, not a system.** ADR-004 and ADR-007 are Proposed. The letter may describe the *rule* (hold, envelope, out-of-band monitor); it may not claim an *instance*.
- **The letter has not been changed or sent.** ARB R4 authorises drafting of one question; additions 2 and 3 above are the register's proposal to the lead, not board decisions. Sending is the lead's act on the day, against the text as it then stands.
- **Two claims still need sourcing or softening before re-issue:** the Nortel ≈58 % share and insolvency year; and the cascade mechanism remains officially unpublished, so the letter's "names the question, not a breach" posture must stay.
- **Tiers.** The strongest new facts are tier A (3GPP TS 32.500/32.541/28.313/28.567; ETSI TS 103 195-2; EG 203 341). The TM Forum benchmark report and IG1326 are tier B; the PoC white papers are tier B. Say so wherever they are used.

---

## 4. What the lead decides

- **A19** — whether the bearer-dependency question is now drafted into the letter (authorised) and whether additions 2 and 3 go to the board as a proposal for the letter's next version.
- **A16** — ARB adoption of ADR-015, which would let the letter cite the framework as the register's position rather than a working draft.
- Nothing here requires re-opening ADR-001 or ADR-002.

## Citation trail

Every claim above traces: `current/traceability-matrix.md` → `current/evidence-log.md` (E-rows with tier) → ADRs named. Rows most used: E-2026-06-28-05/-06 (the letter and CSM-RA at primary law) · E-2026-09-04-18 (the gate event) · E-2026-09-26-02/-06/-09/-11/-16/-17/-22/-23/-24/-26 · E-2026-09-27-01/-02/-04/-05/-08/-10. Copyright discipline as always: paraphrase, cite, never paste.
