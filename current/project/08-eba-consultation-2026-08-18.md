# DZSF findings-sharing letter — FRMCS transition and an advisory oversight layer

*(Addressee changed to DZSF 2026-08-19. Filename is legacy — see the note below.)*

**Drafted:** 2026-08-18 as a *consultation note* · **Corrected 2026-08-18 (E-2026-08-18-02)** · **REWRITTEN 2026-08-19 as a findings-sharing letter** · **Status: DRAFT — not sent**

> **⚠️ WHAT CHANGED AND WHY, 2026-08-19.** The original was a **consultation**: it asked the EBA to give its view so that a `NSA concurrence outstanding` qualifier could be cleared and three ADRs flipped to `Accepted`. **That letter could not honestly be sent.** It assumed a client ("We are supporting [IM]"), a governance model that required an NSA consultation, and an authority relationship that has never existed. Under `00-charter.md` §Standing there is **no client and no authorising body**, and **approval-, concurrence- or endorsement-seeking is out of scope permanently** — not until the assessment concludes, but at any point.
>
> **What is in scope is peer exchange: sharing findings and claiming nothing.** This rewrite is that letter. It states the standing in its opening lines, offers what the assessment found, shows the reasoning so it can be checked, and **asks for nothing**. A correction would be valuable; no reply is an entirely acceptable outcome and is not a blocked dependency.
>
> **The filename is legacy** (referenced from the charter and the evidence log) and is kept for traceability. The word "consultation" in it no longer describes the document.

> **Correction retained from 2026-08-18 (E-2026-08-18-02).** An earlier draft cited "31 December 2040 as the outer bound implied by the Class B funding provision". That conflated Class A and Class B: **GSM-R is a Class A radio system without an end-date**; the 2040 date governs legacy Class B national systems. **The EBA administers precisely this distinction.** The error is recorded here rather than quietly removed — it is the reason the letter below now leads with its own limits.

## Before sending — six checks

1. **The standing declaration is not optional and belongs in the first paragraph.** Independent assessment · no client · no mandate · nothing requested. A letter that lets a regulator infer a mandate that does not exist is the single most damaging thing this engagement could send — and burying the disclaimer at the bottom is the same error with better manners.
2. **No cc to any infrastructure manager, and no "we are supporting…" formulation.** The original carried `cc: [IM contact]` and opened by claiming to support an IM. Both are gone. Vpnet speaks for Vpnet.
3. **Addressee — DECIDED 2026-08-19: DZSF first, not the EBA.** The reasoning, recorded so it is not re-litigated: **DZSF is a research body and authorises nothing**, so no part of the exchange can be mistaken for an authorisation contact — which is the specific failure mode this rewrite exists to avoid. The letter engages directly with **its own published work** and with research **it commissioned**, so it arrives as a response to something rather than out of nowhere. And its **Human Factors lead** (published contact, E-2026-08-18-08) is also lead author on the AI-perception assurance work the letter engages with — DZSF's human-factors group spans both safety culture and AI assurance, which is this engagement's exact intersection.
   **The EBA is not ruled out; it is sequenced second and would need its own letter.** The authorisation-regime material (the repealed-TSI question) has been **removed from this letter** because DZSF cannot answer it and including it would blur the research/authorisation line the choice of recipient is meant to draw. It is parked in §"Held for a possible EBA letter" below. Published EBA leads remain on file (Leiterin Referat 34; Referentin Sicherheitsbescheinigung). The generic `sg92@eba.bund.de` on the TSI chronology (E-2026-08-18-06) is for corrections to that table and is not a counterpart for either letter.
4. **Attachments: none, or the three ADRs only.** Do **not** attach `evidence-log.md`. It paraphrases sources under eight distinct handling classes (RESTRICTED, "Intern", Restricted©Infrabel, TLP:AMBER/GREEN/CLEAR, reproduction-forbidden), and the handling policy is still unwritten. The letter is written to stand alone with no attachments at all.
5. **Addressee CONFIRMED 2026-08-20 — and one open point on the spelling of her name.** The intended recipient is **Dr. Mühl at DZSF**, corroborated from two directions: the **ETR byline (2022)** gives *Referentin Human Factors, muehlk@dzsf.bund.de*, and her **own LinkedIn profile** gives *Scientific Officer, Deutsches Zentrum für Schienenverkehrsforschung, 2021 – Present, Dresden*, with frequent current posting. **"Referentin" and "Scientific Officer" are the German and English renderings of the same federal-agency role, so the two agree; the 2021–present tenure spans the 2022 byline, so the CURRENCY QUESTION IS CLOSED — she has held the role continuously and is active.**
   ⚠️ **THE FIRST NAME IS NOT SETTLED. The published ETR byline reads "Dr. Kristin Mühl". The LinkedIn reading is "Dr Kerstin Muehl". The email `muehlk@dzsf.bund.de` is surname+initial and is consistent with either, so it does not disambiguate.** One of the two is wrong — a journal byline typo and a misreading are equally possible — and **getting a recipient's name wrong in the opening line is precisely the self-inflicted credibility loss this file already caught once over Class A/Class B radio systems.**
   **Resolved for now by German convention rather than by guessing: the salutation is `Dear Dr. Mühl` — title and surname, which is the correct formal form in German business correspondence in any case (`Sehr geehrte Frau Dr. Mühl`) and makes the first name unnecessary.** If her name is needed anywhere else, take the spelling from **her own profile, which outranks a journal byline on the spelling of her own name** — and prefer the umlaut form `Mühl` in prose, reserving `Muehl` for the email address.

6. **Expect no reply, and design for that.** An unsolicited letter from an unknown independent party to a federal authority most likely receives nothing. **That is not a failure and blocks nothing** — the assessment concludes on its own evidence either way (`00-charter.md`, Track A). Do not build any dependency on a response.

---

## Draft letter — rev. 5 (2026-08-19, findings-sharing, addressed to DZSF; finding 2 extended to four instruments)

**Subject:** Findings from an independent assessment — FRMCS transition and an advisory, non-actuating oversight layer

Dear Dr. Mühl,

I write as an independent party, not on behalf of any railway undertaking or infrastructure manager, and I am writing to the DZSF rather than to a supervisory body deliberately: nothing here concerns authorisation, and I would not want it mistaken for an approach that does. **There is no client behind this letter, I hold no mandate from anyone in the sector, and I am not asking for a decision, an opinion or any form of concurrence.** I am sharing the findings of an assessment I have carried out from public sources, because two of them touch on your work directly and because if I have read something wrongly I would rather learn that than publish it. **Your published research is the single largest source in what I have built**, which is both why I am writing and why I would rather you saw the conclusions than found them later.

Over recent months I have built an evidence-based architecture assessment of the GSM-R → FRMCS transition and of using an agentic AI layer for oversight — advisory only, never actuating. It rests entirely on published material: primary legal texts, ERA and ERJU output, **your own research publications and the work you have commissioned**, and the operator's own account of the June 2026 GSM-R outage. Three findings seem worth putting in front of you.

**1. A contrast drawn from your published work — and the boundary it implies.**

Your work on testing and validating AI-based perception systems for GoA 3+ describes a system that ingests sensor data, determines whether obstacle-free travel is possible, and initiates **horn, service braking or emergency braking** — it acts on the train, and is accordingly assigned safety requirements at SIL 1–SIL 2.

The layer I have assessed does none of that. It reads network and operational data and **advises human operators**; it has **no path to actuate any safety-critical function**, and the certified deterministic kernel is untouched by it. My assessment concludes that such a layer sits **outside** the safety-component perimeter of the control-command subsystem, and that this is the hinge on which its treatment under Regulation (EU) 2024/1689 Article 6(1) turns.

**I hold that as a reading, not as a settled position, and it is the single conclusion in the whole assessment most likely to be wrong.** If the perimeter is drawn differently in practice — or if the advisory/actuating distinction does not do the work I am asking it to do — that inverts a substantial part of what I have written, and I would want to know.

**2. A gap I did not expect to find, and the one I think is most worth your attention.**

Reading the German instruments together, each of them **excludes the intersection the others leave open**:

- the **ATO-RISK** work you commissioned sets risk-acceptance criteria for automated driving but states expressly, as a scope condition, that **cyber security is not within scope**, and handles human performance separately in ATO-SENSE;
- **DIN SPEC 92005** (uncertainty quantification in machine learning) expressly **excludes uncertainty criteria for safety functions and for assistance systems**;
- the Fraunhofer IAIS AI assessment catalogue is a thorough generic instrument with **no rail content at all**, and predates the adopted AI Regulation;
- and the one piece of work I have found that **does** compose the two at runtime — Markus Heinrich's TU Darmstadt dissertation on security engineering in safety-critical railway signalling, whose later research you went on to commission — **expressly places secure update out of scope**, treating it as a supervised maintenance-phase concern.

**Every one of these exclusions is defensible on its own terms**, and I want to be clear that I am not criticising any of them — a scope boundary honestly declared is better practice than a scope quietly overreached, and each of these documents declares its boundary plainly.

**The difficulty is the composite.** Taken together, they mean the safety-critical, human-facing, security-relevant case — which is where an oversight layer for railway operational communications actually sits — **falls into the space between every instrument, and I cannot find anyone whose remit is to close it.**

The fourth item is the one I find most telling, and it is why I am writing rather than filing this away. Heinrich's methodology **does** solve the composition problem at runtime, and elegantly: the security control expresses its reaction in the safety layer's existing hazard vocabulary, so an attack reaches the safety core as something it is already designed to handle. **And it still leaves the update seam open.** So the gap is not simply that nobody has looked — the work that comes closest looks directly at it and stops at the same edge as everything else.

I may be unaware of work that closes this, and if so I would be genuinely glad to be pointed at it — that would be the most useful reply this letter could get. If there is none, then it seemed worth saying out loud to the people best placed to know.

**3. One smaller observation, offered in case it is useful.**

- My working planning assumption is **coexistence to at least 2035**, informed by the national switch-off plan, the ERA obsolescence window and operator positioning. **I do not treat any of these as a legal end-date, since GSM-R remains a Class A radio system without one** — a distinction I initially got wrong in my own notes and corrected.

I am conscious that unsolicited letters create work. **Nothing here needs a response, and no part of my assessment waits on one** — it will conclude on its evidence and state its limits either way. If any of the above is mistaken, a single line saying so would be more valuable to me than a long reply. And if this would be better directed elsewhere, I would welcome being told where.

Yours sincerely,

**Dr. Roland Karl Pfeifer** — Vpnet Cloud Solutions Sdn. Bhd.
*Independent assessment; no client, no mandate, nothing requested.*

---

## On return

Minute whatever comes back, including **"no response by [date]"** — which is a recordable outcome and **not** a blocked dependency.

- **A correction, or a pointer to work I have missed** → log as an evidence row, tiered on **attribution and expertise, not on how informally it arrived** (`00-charter.md`, Track A). If it lands, **apply it to the ADR rather than defending the ADR.** A correction that changes a load-bearing conclusion is the most valuable thing this letter could produce.
- **Finding 1 contradicted — the layer *is* a safety component** → **ADR-003 reopens and ADR-002's guardrail needs re-examination** against a high-risk posture. Log as a `revise` row; it would be the largest single movement in the register to date. **Note this is now a matter of getting the assessment right, not of clearing a status: no reply flips any ADR to `Accepted`, because `Accepted` here means settled internally and always did.**
- **Redirected elsewhere** → follow it, and log the redirection as evidence in its own right.
- **No reply** → nothing happens. The assessment concludes as planned.

**What must never follow from any reply:** treating an acknowledgement, a meeting, or a courteous non-answer as concurrence, endorsement or a mandate. It is none of those, whatever its tone.

## Held for a possible EBA letter (not sent, not drafted)

Removed from the DZSF letter because the DZSF does not authorise anything and cannot answer them. **Parked, not abandoned** — if an EBA letter is ever written it starts here, and it would need the same standing declaration in its opening lines.

- **Which TSI regime governs a given work package.** The EBA's published TSI chronology notes that TSIs marked "repealed" may remain applicable to projects in progress. Across a migration spanning Reg (EU) 2016/919, 2023/1695 and 2026/693, this is not resolvable from the published material alone (E-2026-08-18-06).
- **Whether an FRMCS on-board or trackside retrofit constitutes "major upgrading or renewal"** of a structural subsystem requiring authorisation for putting into service — from rev. 2, and still unresolved. For a fleet of roughly 16,000–21,000 vehicles it materially changes the programme's shape (ADR-009).
- **Where the CSM-RA Art 4(2) significance test bites, and the NoBo scope** for the CCS TSI conformity element (ADR-011).

⚠️ **All three are authorisation questions, and an independent assessment with no client cannot ask them without inviting exactly the inference this rewrite exists to prevent.** If they are ever put to the EBA it must be as *"here is what I could not resolve from the published texts"* — an observation about the accessibility of the regime, not a request for a ruling on a programme.
