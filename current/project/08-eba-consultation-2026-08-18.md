# EBA consultation note — ADR-001, ADR-002, ADR-003

**Drafted:** 2026-08-18 · **Corrected 2026-08-18 (E-2026-08-18-02)** · **Status: DRAFT — not sent**

> **Correction applied before sending.** The Q2 planning-horizon bullet originally cited "31 December 2040 as the outer bound implied by the Class B funding provision". That conflated Class A and Class B: **GSM-R is a Class A radio system without an end-date**, and the 2040 date governs legacy Class B national systems. **The EBA administers precisely this distinction** — sending it uncorrected would have been a self-inflicted credibility loss on first contact.
**Purpose:** discharge the `NSA (C)` consultation the RACI requires for the *Oversight architecture & ADRs* workstream, and clear the `NSA concurrence outstanding` qualifier on the three ADRs ratified at ARB-2026-08-15.

## Before sending — four checks

1. **Capacity.** Vpnet is `A/R` for *Oversight architecture & ADRs*, but `R` only for *Outcome & charter*, where **DB InfraGO (IM) is `A`**. The charter is explicit: **Vpnet is never Accountable for safety.** This letter must therefore go **with the IM's knowledge**, and ideally co-signed or copied to them. Sending it as though Vpnet speaks for the operator would misstate the accountability chain.
2. **Addressee.** Send to the existing EBA counterpart on the FRMCS/*Serienzulassung* track. **Do not** invent a new entry point. **Better-targeted leads now on file (E-2026-08-18-08), all published by their authors:** the **Leiterin Referat 34** and the **Referentin Sicherheitsbescheinigung** at the EBA, and **DZSF's Human Factors lead** — who is also lead author on the AI-perception assurance work cited in Question 1, i.e. DZSF's human-factors group spans **both** safety culture and AI assurance, the exact intersection of this engagement. A generic `sg92@eba.bund.de` address also appears on the EBA TSI chronology (E-2026-08-18-06) but is the contact for corrections to that table — **not** an authorisation counterpart. **None of these is confirmed as the FRMCS counterpart; use them to find the right person, not as the addressee by default.**
3. **Attachments: the three ADRs only.** Do **not** attach `evidence-log.md`. It paraphrases sources carrying eight distinct handling classes (RESTRICTED, "Intern", Restricted©Infrabel, TLP:AMBER/GREEN/CLEAR, reproduction-forbidden). The handling policy is still unwritten — until it exists, the evidence log does not leave the repository.
4. **Question 1 is the one that matters.** If the answer is "no", ADR-003 inverts and a high-risk conformity programme becomes real work. Do not bury it.
5. **Length is a risk.** Rev. 2 carries four sub-questions under Q2. **If the documentary sources (current interoperability order and its "major upgrading" annex; Reg 2023/1695 transitional articles) can be obtained first, delete the corresponding bullets** — the statute may already answer them, and asking a regulator what the law plainly says wastes the one first impression available.

---

## Draft letter — rev. 2 (2026-08-18, after E-2026-08-18-03/-06/-07/-08)

**Subject:** Early consultation — architecture decisions on FRMCS transition and an advisory oversight layer

Dear [name],

We are supporting [IM] on the GSM-R → FRMCS transition and on an associated decision-support and oversight layer. Three architecture decisions were reviewed internally on 15 August 2026 and are recorded as decision records. Before we treat them as settled we would like the EBA's view, as the consultation our governance model requires at this stage.

We are asking early — while these are decisions on paper rather than a change to anything in service — so that any divergence surfaces now rather than at an authorisation gate.

We have read the DZSF's published work on testing and validating AI-based perception systems for GoA 3+, and it has shaped how we frame the first question below.

**Question 1 — is an advisory, non-actuating oversight layer a safety component of the control-command subsystem?**

It may help to state the contrast in the DZSF's own terms. The perception system described in that work ingests sensor data, determines whether obstacle-free travel is possible and initiates **horn, service braking or emergency braking** — it acts on the train, and is accordingly assigned safety requirements at SIL 1–SIL 2.

**Our layer does none of that.** It reads network and operational data and **advises human operators**. It has **no path to actuate any safety-critical function**; safety-critical actuation remains human-in-command and the certified deterministic kernel is untouched by it. On that basis our decision record concludes it sits **outside** the safety-component perimeter of the CCS subsystem.

**That conclusion is not ours to reach alone**, and everything downstream depends on it — including whether the layer attracts high-risk obligations under Regulation (EU) 2024/1689, whose Article 6(1) test turns on precisely this point.

- Does the EBA share that reading?
- If not, what would change it, and what evidence would you expect to see?
- Where a system *is* advisory, does the EBA see the **CSM-RA section 2.4 reference-system route** as relevant — benchmarking against quantified human performance, as the DZSF proposes for perception systems — or does that route not arise at all once a system is outside the perimeter?
- If the AI Act classification is not the EBA's to determine, **who is the correct addressee in Germany?** We would rather be redirected than assume.

**Question 2 — is the migration pattern authorisable as designed, and by what route?**

The decision is a **phased dual-network parallel run** — GSM-R and FRMCS operating together with hybrid on-board equipment and defined handover at coverage boundaries — rather than a cutover.

- Is that pattern authorisable in principle as described?
- **Would an FRMCS on-board or trackside retrofit constitute "major upgrading or renewal" of a structural subsystem**, requiring an authorisation for putting into service? For a fleet of roughly 16,000–21,000 vehicles the answer materially changes the programme's shape, so we would rather plan against it than discover it.
- At what point does the **CSM-RA Article 4(2)** significance test bite, and what NoBo scope do you anticipate for the CCS TSI conformity element?
- The EBA's published TSI chronology notes that TSIs marked "repealed" **may remain applicable to projects in progress**. Across a migration spanning Reg (EU) 2016/919, 2023/1695 and 2026/693, **how should we determine which regime governs a given work package?**
- **Planning horizon:** our working assumption is **coexistence to at least 2035**, informed by the national switch-off plan, the ERA obsolescence window of 2035–2040 and operator positioning — **we do not treat any of these as a legal end-date, since GSM-R remains a Class A radio system without one.** Does that match the EBA's own planning assumption?

**Question 3 — is the oversight layer in scope for safety authorisation at all?**

Related to Question 1 but separable: given the layer never actuates, does the EBA expect it to form part of the authorisation dossier — and if so, in what form?

We would welcome a short written reply, or a meeting if that is easier. If a formal route is more appropriate than this letter, please tell us and we will follow it.

Yours sincerely,
[name], Vpnet Cloud Solutions Sdn. Bhd. — engagement lead
cc: [IM contact]

## On return

Minute the reply — including **"no response by [date]"**, which is itself a recordable consultation outcome. Then:

- **Reply received and consistent** → flip ADR-001/-002/-003 from `Accepted (ARB 2026-08-15) — NSA concurrence outstanding` to `Accepted`, citing the reply.
- **Question 1 answered "it *is* a safety component"** → **ADR-003 reopens**, its ratification is withdrawn, and ADR-002's guardrail needs re-examination against a high-risk compliance posture. Log as a `revise` row; this would be the largest single status movement in the register to date.
- **Redirected to another authority** → follow, and log the redirection as evidence in its own right.
