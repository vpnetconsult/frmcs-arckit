# Pivot notes — security source pack

**Date:** 2026-09-15 · **Pivot baseline:** `baselines/2026-09-15` (12:56 UTC, 461 rows) plus the two rows logged since (`E-2026-09-15-01`, `-02`); freeze the `_HHMM` cut after this sitting and re-point here. · **Predecessor:** `pivot-notes-2026-07-02.md` (98 rows; six threads on the outage and the oversight boundary). Companion: `pivot-prompts-2026-09-15-security.md`.
**Purpose:** the security threads the register can now carry into articles and letters, each with a layman claim, the evidence chain, and the limits that must travel with it. The July pivot had one security thread (SS7/probe). Since then the register has logged ~360 rows, ratified ADR-012, read the sector's own four security specifications and the operator-side RSEG library, discharged the −104 residual, and — this morning — found a worked security-versus-availability trade-off inside its own incident annex. **That is the pivot: security is no longer a footnote to the outage story; it is a second spine with its own falsifiable claims.**

**Outcome anchor for every piece:** *safe, continuous rail operations.* On 23 June "safe" held, "continuous" failed — and the register learned today that a security rule was part of *why* continuity took two hours to restore.

**The guardrail, restated so no piece drifts:** oversight, not control. Security controls advise, detect and protect; they never autonomously actuate a safety-critical function (ADR-012 Decision, boundary clause). Every thread below is compatible with that or it is cut.

---

## Thread 0 — It wasn't an attack. Ruling that out was on the critical path.

**Layman claim:** The 23 June outage was a software fault, not a cyberattack — DB said so, and the register has held that since June. What the register missed until today is *where* that finding sat: under DB's own rules for this scenario, staff had to exclude a cyberattack **before** they were allowed to switch manually to the redundancy that had not engaged by itself. The security procedure was not a footnote to the investigation; it was a step in the two-hour recovery. A security rule cost availability, at national scale, and nobody had written that down as a trade-off.

**Chain:** `incident-annex.md` (corrected 2026-09-15) · **E-2026-09-15-01** (Golem/Sawall reporting DB's 26.06 statement: *"erst einen Cyberangriff ausschließen, bevor sie manuell … umschalteten"*) · E-2026-06-27-01/-03 (DB-confirmed mechanism: silent software fault, auto-failover not engaged, manual recovery) · `finding-failover-trigger-flow-gap.md` (the technical gate) → **now two gates in series on the same recovery path, one technical, one procedural** · **E-2026-09-05-13** (`SP-SEC-SuppEssFunc` — the sector's own register of security requirements that have an *adverse effect on essential functions*, each listed with its mitigation: e.g. a CRL update terminating a live session, mitigated by a revocation process *with a predetermined time*) · **Q-17** (`06-ratification-readiness.md`) — the proposal that any security-triage obligation standing between detection and recovery carries a **time box and a named authority** who may proceed.

**Why it opens:** it converts "security vs availability" from an abstract tension into a dated, sourced, national-scale instance in the register's own case study — and the sector already has the form to record it in (SuppEssFunc). It also disciplines the argument: the rule exists for a reason (failing over during an actual compromise can propagate it), so the piece asks whether an **unbounded** gate on a safety-relevant recovery path is defensible, not whether the gate should exist.

**Limits:** (i) DB said *"a switch"*; the "core switch" identification is the journalist's inference and is **not adopted** — the register records "a switch, swapped under planned maintenance". (ii) Two trade-press sources on one DB statement; the EBA report remains the outstanding primary. (iii) Q-17 is **open and unratified** — ADR-012 item 5 is decision text in an Accepted ADR and has not been changed; the piece may describe the proposal, not claim it as the register's position. (iv) Whether ADR-012 (a conformance decision) is even the right home for an operating-procedure rule, versus the operator's SMS, is itself the open question.

---

## Thread 1 — A compromised component is a silent fault with an adversary choosing the silence

**Layman claim:** On 23 June a component that was trusted to report its own health stayed silent, and the silence *was* the failure. A hacked component is the same arrangement with someone choosing what it says. So the fix is the same fix: never let a component be the only witness to its own state. Watch it from outside, on a path it cannot influence.

**Chain:** PR5/PR11 (`03-risk-register.md`) + **E-2026-06-30-03** (ITU-T Q.752 out-of-band monitoring — the principle) · **E-2026-07-01-09** (ETSI TS 103 147 mandates *automatic* GSM-R core switchover — 23 June was a non-conformance, not bad luck) · **ADR-012 Decision item 5 + action item 5** (extended 2026-09-04: *a security event affecting a component may not be detected solely by that component*; attack detection fed out-of-band) · **E-2026-07-29-02** (Council Cyber Blueprint — detection and shared situational awareness as the doctrinal first step; and rail = "n/a" in the Union crisis machinery) · **E-2026-08-01-36** (GSMA 2026 landscape §2.3 — *pre-positioning* attacks: a bridgehead placed quietly for later use is by definition a component that reports itself healthy) · **E-2026-07-24-01** (ACM CCS '25 — hidden paths in production 5G SA cores: protocol tunnelling and boundary bridging, the attack class FRMCS inherits by reuse).

**Why it matters:** it is the single principle that unifies the outage story and the security story, and it makes the oversight layer's *detection* role (Risk-Sentinel, R12) a safety argument rather than an AI feature. It also explains why the register keeps refusing "the vendor's dashboard says green" as evidence.

**Limits:** Q.752 is an SS7-era instrument; its 5G-SA analogue (SBA tracing, SEPP/N32 monitoring) is inferred from GSMA/3GPP material, not from a rail deployment. The GSMA landscape is institutional opinion, dated Feb 2026. The Cyber Blueprint is a recommendation — it validates framing, never conformance. No FRMCS estate exists on which any of this has been tested.

---

## Thread 2 — Safety and security do not share a risk calculus, and pretending they do is the error

**Layman claim:** Safety risk is a probability — how often a component fails per hour, measured over decades. An attack has no such number: nobody can say "one hack per 10⁹ hours". The German programme's own answer is to run them as separate projects (ATO-RISK excludes cyber by scope). So "one gate for change" cannot mean "one risk number". It means: the security finding walks up to the safety gate speaking the safety gate's language — *this attack would corrupt / delay / delete / withhold that message* — and is judged as the hazard it maps to. If it maps to no known hazard, that is itself the alarm.

**Chain:** **E-2026-08-19-06** (Heinrich/DZSF: a threat's occurrence does not follow a stochastic process; attack-graph method, open-source tooling) · **E-2026-08-19-07** (Braband, ATO-RISK scope condition R4 — cyber explicitly out) · **E-2026-08-19-12** (Heinrich dissertation ch. 8 — express the security output in the safety system's certified vocabulary at the point of detection; prefer corruption to silent discard so continuity counters keep working) · **ADR-012 "The gate's adjudication rule"** (decided 2026-08-20: instruments per half, no common currency *by decision*, unmappable finding → escalate the change one class) · **E-2026-09-10-01** (ERORAT scales: exposure × vulnerability → likelihood; likelihood + impact − 1 → risk; risk → SL-T 0–4 — the security half now has its own end-to-end, citable derivation) · **E-2026-09-05-08** (ERORAT process: zones/conduits → threats → SL-T → IEC 62443 SRs → iterate).

**Why it matters:** it is the most transferable methodological finding in the register and it is counter-intuitive to a policy audience, who expect "integrate safety and security" to mean one matrix. It also carries the register's cleanest self-correction: a residual declared *permanent* on 2026-08-20 (DIN VDE V 0831-104 not purchased, therefore no attacker scales) was discharged on 2026-09-10 by two free documents from a body already on the stakeholder map — one of them sitting unread in the register's own possession for five days. **The lesson is about elapsed time and re-asking the question, not about −104.**

**Limits:** −103/−104 normative content remains unheld; no conformity with either is claimed anywhere. ERORAT's tables reproduce TS 50701 §6.3.1 in a sector tool — adequate for this register, not a substitute for the standard in a safety case; guideline v3.01 vs template v3.05 version mismatch is recorded. Heinrich ch. 8 answers runtime composition; the transplant is the vocabulary principle only, and secure *update* is outside its scope.

---

## Thread 3 — Two clocks on one estate: patch in hours, change under authorisation

**Layman claim:** The cyber authority says a serious vulnerability must be triaged and fixed in minutes to a few hours; "a few days" is not an adequate response. The railway authorisation regime says every change to a live safety-carrying system is assessed, classed and gated — and that takes as long as it takes. Both are law, both bind the same operator, and no amount of urgency squares them. The register's answer is not to pick a winner but to **split the estate by population**: IT-side equipment runs on the BSI clock with no rail gate; vital, safety-certified equipment runs on the rail gate without exception — and the slow-patch exposure that creates is written down as an accepted cost, not discovered later.

**Chain:** **PR16** (re-characterised ARB-2026-09-04/3 R3d: a structural conflict between two regimes, resolved by population split) · **E-2026-09-04-17** (BSI: triage-to-rollout in minutes to hours; observed median time-to-exploitation *minus seven days*) · **ADR-012 items 1 (PDE inventory schema, field iii = patch-tempo population), 2 (the pre-purchase question: *can this product take a security update at all, by what means, how fast, for how long*), 3 (updates enter ADR-011's classes by population, never by urgency)** · **E-2026-09-04-14** (DZSF Bericht 55: much of the rail estate frequently cannot be updated) · **ADR-011** (Class A/B change control; the 23 June change-on-live-legacy lesson) · **ADR-012 item 4** (three reporting clocks on three anchors: NIS-2 Art 23 / § 32 BSIG n.F. / `SP-SEC-PrgmReq` 13.3.1 — 24 h / 72 h / 14 days after a fix is *available*, to CSIRT, ENISA **and affected customers**) · **E-2026-08-20-23** (RED delegated acts: no rail derogation, applies since 1 Aug 2025; EN 18031 presumption restricted).

**Why it matters:** it is the security analogue of the outage's root cause — an ungoverned change to a live element — with a security trigger instead of a maintenance one, and it is the thread a procurement audience can act on tomorrow (ask the update-capability question before buying).

**Limits:** the population split is the register's decision, not a regulator's guidance; the BSI information is an advisory, not an order; the CRA applies fully from 11.12.2027 and its reporting duties from 11.09.2026 — dates, not experience. The PDE inventory has a schema and no rows, because there is no estate.

---

## Thread 4 — "Legacy" is a capability gap, not an age — and the dual run inherits the old interconnect

**Layman claim:** In railway cybersecurity, "legacy" does not mean old. The operator-side expert group defines it as *any* system lacking the security capabilities required from today's perspective — including equipment delivered new last month, if it was not built to current specifications. So a decade-long GSM-R/FRMCS parallel run is not "old network beside new network": it is one estate in which the weakest interconnect sets the attacker's price, and the 2G-era interconnect — the layer where the GTPDOOR class of implant lives — stays live until GSM-R is switched off.

**Chain:** **E-2026-09-05-07** (RSEG 25E157 §3.2 — time-independent definition of legacy; 24E122 legacy network protection: segmentation, availability/performance constraints, crypto opening) · **ADR-011 §"The legacy estate has an architecture, and the sector supplies no path to it"** · **`sdo-mapping-frmcs-gsmr-5gsa.md` §4a** (GSMA's operational interconnect/roaming security role has no rail owner; GTPDOOR/LightBasin as the exemplar; SEPP shrinks but does not close it) · **E-2026-08-01-03 + E-2026-08-01-02** (TS 33.210 Annex B GTP protection; TS 33.117 SCAS GTP filtering — spec-side defences exist; SCAS's own boundary: *not about security in operations and deployments*) · **E-2026-07-20-01** (ENISA transport landscape: the telecom-dependency analysis is *explicitly missing* from the EU baseline; RADIO-STOP 2023 — unauthenticated legacy VHF broadcast stop commands halting trains; DSB 2022 — ICT-provider attack → safety-critical IT outage → hours stopped) · **E-2026-07-26-13** (TS 103 792 — the interworking gateway as the bridge and the seam) · **R2** (coexistence).

**Why it matters:** it reframes the migration's security argument from "FRMCS will be more secure" (vendor register) to "the transition *period* is the exposure, and its length is a security parameter" — which ties security directly to the switch-off timeline threads in ADR-001 and to ADR-011's change-control on live legacy.

**Limits:** GSMA FS.11/19/20 (the interconnect guidelines themselves) are member-only and not on file — the gap is evidenced by the gating, not by their content. RADIO-STOP is analogue VHF, not GSM-R; the class transfers (simplicity weaponised), the mechanism does not. Whether DB or any rail body has T-ISAC/GSMA access is unverified.

---

## Thread 5 — Everything on the shelf is build-to, not proof

**Layman claim:** Ask "is FRMCS equipment certified secure?" and the honest answer in 2026 is: there is nothing to certify against yet. The sector's four security specifications say in their own release note that certification and CE conformity are *not included*. The EU Agency's opinion on the FRMCS specs says it may not be used for conformity assessment. The list of interoperability requirements a notified body would verify does not exist yet — the Agency has asked for it to be written. The successor standard that would graduate rail cybersecurity from a technical specification to a full standard is due around 2028. A buyer can *demand* all of this in a contract; nobody can yet *attest* it.

**Chain:** **E-2026-09-05-12/-13** (`SP-SEC` v1.1 release note: *"cybersecurity certification aspects and EU CE conformity requirements are not included"*; CompSpec is a *candidate* for a CSA-compatible scheme pending IEC 62443-6-2) · **E-2026-09-06-07** (ERA/OPI/2024-10: expressly non-binding; *shall not be used for conformity assessment … nor for EC verification*; Rec. #2 — a final NoBo requirement list is *necessary* and does not exist) · **ADR-012 Decision item 1, the ceiling clause** (*requirements to BUILD TO … may NEVER treat them as discharging conformance*) · **E-2026-09-06-02 + ADR-012 item 2b** (5GRAIL: multi-vendor interoperability *not demonstrated*; ForTeS: no conformance-demonstration route for signalling subsystems; MORANE-2: under way, not complete) · **E-2026-08-01-17** (IEC 63452 ED1 at CDV, ~2028) · **E-2026-08-20-23** (EN 18031 harmonised-standard citation *restricted* — presumption of conformity narrower than the standard's text) · **ADR-004 item 5** (NoBo bottleneck quantified: hundreds of first-of-class vehicles at 1–2 years each).

**Why it matters:** it is the corrective to every "FRMCS is secure by design" headline, and it is what makes the procurement gate (Thread 3) honest: the gate can cite clause-exact requirements (`SP-SEC-Tax-2-8`: FRMCS is a Wireless Component carrying IEC 62443-4-2 NDR 1.6 / CR 2.2) while stating that meeting them proves conformance to nothing yet.

**Limits:** this is a *timing* finding, and it ages: the 63452 date, the CSA scheme and the NoBo list are all moving targets — re-check before print. The ERA opinion is 2024; V3 planning is the 24.10.2025 report. Nothing here says the specs are bad; it says they are not yet evidence.

---

## Thread 6 — Security maturity scales with size, and the gate we wrote would filter out the small

**Layman claim:** The German safety-research centre measured it: cybersecurity maturity in rail and public transport correlates with company size (r = .42). The retrofit population includes the non-federal railways and small operators least able to secure what they install. Then the sector's own supplier-qualification clauses — ISO 27001 plus IEC 62443-4-1 at maturity level 3 — were adopted into this register's procurement gate, and the register minuted the consequence rather than discovering it later: **the clause is a size filter.** The pattern that gets small operators through must be *supported*, not merely *required*.

**Chain:** **E-2026-08-19-13** (DZSF study: maturity ↔ size, r = .42) · **ADR-013 constraint 3** (a supported variant for operators without an in-house security function) · **ADR-009 item 7 / PR17d** (cyber maturity as a named fleet-retrofit dependency) · **ADR-012 item 1 gate, the minuted consequence** (ISO 27001 + CMMI ML 3 hard-codes a size filter) · **E-2026-08-15-54** (NS/RazorSecure — an executed legacy-train security retrofit: 1 train/day, 4 mechanics, field-replaceable units — used for the *execution shape*, never for the vendor's "391 %" figure) · **E-2026-09-15-02 + ADR-009 item 11** (the sector has already run one funded, coordinated fleet-wide radio retrofit; its close-out figures are an acquisition target).

**Why it matters:** it is the equity argument inside the security argument, and it is where security meets funding (R13) and authorisation predictability (PR17b). It also keeps the piece from reading as "raise the bar" — the finding is "raise the bar *and* build the ramp".

**Limits:** the r = .42 comes from a 6-page summary; the full DZSF report (doi 10.48755/dzsf.220011.01) is not held. The NS deck is tier B (vendor co-presented); only the operator-side execution facts are used. The 2021 retrofit precedent is one authorisation-slice deck — no numbers from it may be quoted.

---

## Thread 7 — The watcher is a product too

**Layman claim:** An AI layer that watches the network for silent faults and compromises is software with digital elements — so the Cyber Resilience Act applies to *it*, exactly as to a cab radio: secure by design, a declared support period, a bill of materials, coordinated disclosure. And the same rule that keeps it out of the safety case (it advises, it never actuates) is what keeps it out of the AI Act's high-risk list. The boundary is simultaneously the safety argument, the AI-regulation argument, and the security-scope argument.

**Chain:** **ADR-012 Context + Decision item 1** (the agentic-oversight layer is itself a PDE in CRA scope) · **ADR-002 / ADR-004** (oversight, not control; SIL-4 boundary; freedom from interference as the shared boundary for safety changes *and* security updates — Decision item 3) · **ADR-003** (EU AI Act: conditional not-high-risk, Art 3(14) safety-component boundary — *never* asserted as automatic) · **E-2026-08-20-22** (AI Act Art 5(1)(f) test answered at source) · **ADR-010** (autonomy-ladder promotions gated on measured oversight effectiveness) · **E-2026-09-04-17** (BSI on AI's effect on organisational cybersecurity — the authority's own framing of AI as attack-surface multiplier) · **E-2026-08-03-03** (RFC 9315 IBN — inner autonomic loop + outer human loop: the guardrail as a network-engineering pattern).

**Why it matters:** it pre-empts the two obvious objections to an AI oversight layer — "you've added an attack surface" and "you've added an unregulated AI" — with the same answer, and that answer is already the architecture.

**Limits:** ADR-004 is boundary-designed, not evidenced (FFI analysis, hazard log, ISA assessment open). The AI Act classification stays `watch`. R9 evidence is prototype-grade. No oversight layer exists to be assessed.

---

## What no piece may say

- That the 23 June outage was, or might have been, an attack. It was not; DB ruled it out; the finding is about the *cost of ruling it out*.
- That any product, specification or vehicle is "certified secure" for FRMCS. Nothing is (Thread 5).
- That DIN VDE V 0831-103/-104 content is known. It is not held; every scale used is engagement-defined or ERORAT's.
- That the ARB, EBA, BSI, ERA or any named body concurs with anything here. `Accepted (ARB)` is one person in a room; no external party has seen this work (`05-stakeholders.md` §"The author's own position").
- That a rail body holds GSMA's interconnect-security role. None does; that is the finding.
- The "391 %" figure, the "core switch" identification, or any number from the 2021 retrofit programme.

## Source-discipline note carried into every piece

Three of the eight threads rest on material the register found late — RSEG's library (09-05), ERORAT's tables (09-10), the procedural gate in its own annex (09-15). Each was in a body already on the stakeholder map or in a document already on file. The pieces should say so where it strengthens them (Thread 2 does), because a register that reports its own blind spots is more credible than one that does not, and because it is the honest reason `12-institutional-map.md` §6 exists.

---

**Threads → requirements / ADRs:** T0 → R3/R4, ADR-012 item 5, Q-17 · T1 → PR5/PR11/R12, ADR-012 item 5 · T2 → ADR-012 items 9/9b/11, ADR-011 · T3 → PR16, ADR-012 items 1–4, ADR-011 · T4 → R2, ADR-011, R14 §4a · T5 → ADR-012 item 1 ceiling, ADR-004 item 5, ADR-001 item 8 · T6 → R13, ADR-013 c3, ADR-009 items 7/11 · T7 → ADR-002/-003/-004/-010, R10.
