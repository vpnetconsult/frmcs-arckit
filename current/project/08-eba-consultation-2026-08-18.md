# EBA findings-sharing letter — FRMCS transition and an advisory oversight layer

**Drafted:** 2026-08-18 as a *consultation note* · **Corrected 2026-08-18 (E-2026-08-18-02)** · **REWRITTEN 2026-08-19 as a findings-sharing letter** · **Status: DRAFT — not sent**

> **⚠️ WHAT CHANGED AND WHY, 2026-08-19.** The original was a **consultation**: it asked the EBA to give its view so that a `NSA concurrence outstanding` qualifier could be cleared and three ADRs flipped to `Accepted`. **That letter could not honestly be sent.** It assumed a client ("We are supporting [IM]"), a governance model that required an NSA consultation, and an authority relationship that has never existed. Under `00-charter.md` §Standing there is **no client and no authorising body**, and **approval-, concurrence- or endorsement-seeking is out of scope permanently** — not until the assessment concludes, but at any point.
>
> **What is in scope is peer exchange: sharing findings and claiming nothing.** This rewrite is that letter. It states the standing in its opening lines, offers what the assessment found, shows the reasoning so it can be checked, and **asks for nothing**. A correction would be valuable; no reply is an entirely acceptable outcome and is not a blocked dependency.
>
> **The filename is legacy** (referenced from the charter and the evidence log) and is kept for traceability. The word "consultation" in it no longer describes the document.

> **Correction retained from 2026-08-18 (E-2026-08-18-02).** An earlier draft cited "31 December 2040 as the outer bound implied by the Class B funding provision". That conflated Class A and Class B: **GSM-R is a Class A radio system without an end-date**; the 2040 date governs legacy Class B national systems. **The EBA administers precisely this distinction.** The error is recorded here rather than quietly removed — it is the reason the letter below now leads with its own limits.

## Before sending — five checks

1. **The standing declaration is not optional and belongs in the first paragraph.** Independent assessment · no client · no mandate · nothing requested. A letter that lets a regulator infer a mandate that does not exist is the single most damaging thing this engagement could send — and burying the disclaimer at the bottom is the same error with better manners.
2. **No cc to any infrastructure manager, and no "we are supporting…" formulation.** The original carried `cc: [IM contact]` and opened by claiming to support an IM. Both are gone. Vpnet speaks for Vpnet.
3. **Addressee.** Published leads on file (E-2026-08-18-08), all published by their authors: the **Leiterin Referat 34** and the **Referentin Sicherheitsbescheinigung** at the EBA, and **DZSF's Human Factors lead** — who is also lead author on the AI-perception assurance work the letter engages with, i.e. DZSF's human-factors group spans both safety culture and AI assurance, which is this engagement's exact intersection. **For a findings-sharing letter, DZSF is arguably the better first recipient than the EBA**: it is a research body, the letter engages with its published work, and it does not authorise anything — so nothing about the exchange can be mistaken for an authorisation contact. The generic `sg92@eba.bund.de` on the TSI chronology (E-2026-08-18-06) is for corrections to that table and is **not** a counterpart for this.
4. **Attachments: none, or the three ADRs only.** Do **not** attach `evidence-log.md`. It paraphrases sources under eight distinct handling classes (RESTRICTED, "Intern", Restricted©Infrabel, TLP:AMBER/GREEN/CLEAR, reproduction-forbidden), and the handling policy is still unwritten. The letter is written to stand alone with no attachments at all.
5. **Expect no reply, and design for that.** An unsolicited letter from an unknown independent party to a federal authority most likely receives nothing. **That is not a failure and blocks nothing** — the assessment concludes on its own evidence either way (`00-charter.md`, Track A). Do not build any dependency on a response.

---

## Draft letter — rev. 3 (2026-08-19, rewritten as findings-sharing)

**Subject:** Findings from an independent assessment — FRMCS transition and an advisory, non-actuating oversight layer

Dear [name],

I write as an independent party, not on behalf of any railway undertaking or infrastructure manager. **There is no client behind this letter, I hold no mandate from anyone in the sector, and I am not asking for a decision, an opinion or any form of concurrence.** I am sharing the findings of an assessment I have carried out from public sources, because two of them touch on your work directly and because if I have read something wrongly I would rather learn that than publish it.

Over recent months I have built an evidence-based architecture assessment of the GSM-R → FRMCS transition and of using an agentic AI layer for oversight — advisory only, never actuating. It rests entirely on published material: primary legal texts, ERA and ERJU output, the DZSF's research publications, and the operator's own account of the June 2026 GSM-R outage. Three findings seem worth putting in front of you.

**1. A contrast drawn from the DZSF's own published work — and the boundary it implies.**

The DZSF's work on testing and validating AI-based perception systems for GoA 3+ describes a system that ingests sensor data, determines whether obstacle-free travel is possible, and initiates **horn, service braking or emergency braking** — it acts on the train, and is accordingly assigned safety requirements at SIL 1–SIL 2.

The layer I have assessed does none of that. It reads network and operational data and **advises human operators**; it has **no path to actuate any safety-critical function**, and the certified deterministic kernel is untouched by it. My assessment concludes that such a layer sits **outside** the safety-component perimeter of the control-command subsystem, and that this is the hinge on which its treatment under Regulation (EU) 2024/1689 Article 6(1) turns.

**I hold that as a reading, not as a settled position, and it is the single conclusion in the whole assessment most likely to be wrong.** If the perimeter is drawn differently in practice — or if the advisory/actuating distinction does not do the work I am asking it to do — that inverts a substantial part of what I have written, and I would want to know.

**2. A gap I did not expect to find, and the one I think is most worth your attention.**

Reading the German instruments together, each of them **excludes the intersection the others leave open**:

- the DZSF-commissioned ATO-RISK work sets risk-acceptance criteria for automated driving but states expressly that **cyber security is not within scope**, and handles human performance in a separate project;
- **DIN SPEC 92005** (uncertainty quantification in machine learning) expressly **excludes uncertainty criteria for safety functions and for assistance systems**;
- the Fraunhofer IAIS AI assessment catalogue is a thorough generic instrument with **no rail content at all**, and predates the adopted AI Regulation.

Each exclusion is defensible on its own terms. Taken together, they mean **the safety-critical, human-facing, security-relevant case — which is where an oversight layer for railway operational communications actually sits — falls between every instrument, and no one appears to be composing them.** I may simply be unaware of work that closes this; if so I would be glad to be pointed at it. If not, it seemed worth saying out loud.

**3. Two smaller observations, offered in case they are useful.**

- Your published TSI chronology notes that TSIs marked "repealed" may remain applicable to projects in progress. For a migration spanning Reg (EU) 2016/919, 2023/1695 and 2026/693, **determining which regime governs a given work package is not obvious from the published material**, and I have not been able to resolve it from the texts alone.
- My working planning assumption is **coexistence to at least 2035**, informed by the national switch-off plan, the ERA obsolescence window and operator positioning. **I do not treat any of these as a legal end-date, since GSM-R remains a Class A radio system without one** — a distinction I initially got wrong in my own notes and corrected.

I am conscious that unsolicited letters create work. **Nothing here needs a response, and no part of my assessment waits on one** — it will conclude on its evidence and state its limits either way. If any of the above is mistaken, a single line saying so would be more valuable to me than a long reply. And if this would be better directed elsewhere, I would welcome being told where.

Yours sincerely,

[name] — Vpnet Cloud Solutions Sdn. Bhd.
*Independent assessment; no client, no mandate, nothing requested.*

---

## On return

Minute whatever comes back, including **"no response by [date]"** — which is a recordable outcome and **not** a blocked dependency.

- **A correction, or a pointer to work I have missed** → log as an evidence row, tiered on **attribution and expertise, not on how informally it arrived** (`00-charter.md`, Track A). If it lands, **apply it to the ADR rather than defending the ADR.** A correction that changes a load-bearing conclusion is the most valuable thing this letter could produce.
- **Finding 1 contradicted — the layer *is* a safety component** → **ADR-003 reopens and ADR-002's guardrail needs re-examination** against a high-risk posture. Log as a `revise` row; it would be the largest single movement in the register to date. **Note this is now a matter of getting the assessment right, not of clearing a status: no reply flips any ADR to `Accepted`, because `Accepted` here means settled internally and always did.**
- **Redirected elsewhere** → follow it, and log the redirection as evidence in its own right.
- **No reply** → nothing happens. The assessment concludes as planned.

**What must never follow from any reply:** treating an acknowledgement, a meeting, or a courteous non-answer as concurrence, endorsement or a mandate. It is none of those, whatever its tone.
