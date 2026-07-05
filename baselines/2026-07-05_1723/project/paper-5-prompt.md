# Paper 5 — cowork drafting prompt

**Paper:** 5 of the series · "Equivalence to what, exactly? — the measurable bar the new rail radio must clear" (pivot thread 4)
**Date:** 2026-07-03, updated 2026-07-05 (standards-lineage point added, E-2026-07-05-03/-04/-06/-07) · **Owner:** Vpnet engagement lead
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 4 + the caveats section)
2. `current/project/diagrams/ARC-FRMCS-DIAG-005-flow-frmcs-bar-v1.0.md` (the layered bar + timeline strip)
3. Evidence rows (or the full `current/evidence-log.md`): E-2026-07-02-30, E-2026-07-02-31, E-2026-07-02-32, E-2026-07-01-10, E-2026-06-24-18, E-2026-07-02-28, E-2026-07-02-15, E-2026-06-29-01, E-2026-07-03-02, and the standards-lineage set E-2026-07-05-03/-04/-06/-07
4. Optional: `current/project/ADR-007-testing-canary-strategy.md` (surfaces (d)/(e)), `current/project/03-risk-register.md` (PR15 row)

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 5 of a series derived from an evidence-logged architecture
engagement on the German rail radio outage of 23 June 2026 and the GSM-R→FRMCS
transition. Papers 1–4 covered the incident, the silent-fault lesson, the AI
boundary, and the human load. Paper 5 turns to the transition itself: everyone
now demands "move to FRMCS faster" — this paper asks the unfashionable
question: faster to WHAT standard, proven HOW? Work ONLY from the attached
source files — do not add facts from your own knowledge. Every factual claim
must trace to an evidence ID (E-…) or a named document, exactly as the sources
cite them.

DELIVERABLE
An article of 1,400–1,800 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "Equivalence
to what, exactly? — the measurable bar the new rail radio must clear".
Register: calm, precise, constructive scepticism — pro-transition but
anti-hand-waving. No jargon left unexplained.

THE ARGUMENT (from pivot-notes thread 4 — follow this arc)
1. Open with the post-outage chorus: expert bodies now publicly demand the
   FRMCS transition be forced through faster (the VDE reaction,
   E-2026-07-03-02). Reasonable — GSM-R is obsolescing and centralistic. But
   "as good as GSM-R" is an engineering claim, not a slogan, and it only
   means something if you can point at the bar.
2. The bar exists, in three stacked layers (the attached diagram): LAYER 1 —
   the EIRENE Functional Requirements Specification: WHAT railways
   functionally need (emergency calls, group calls, priority pre-emption,
   functional addressing) (E-2026-07-02-30). LAYER 2 — the EIRENE System
   Requirements Specification: HOW a compliant network must behave
   (E-2026-07-02-31). Both are MANDATORY under EU law (CCS TSI Annex A), and
   both were refined over roughly 25 YEARS of controlled change requests —
   the target being replaced is a deeply debugged specification, not a paper
   one. LAYER 3 — a 658-page harmonised test catalogue by which an
   independent notified body PROVES conformity (E-2026-07-02-32).
3. Deepen the bar with its lineage (standards set logged 5 July): the bar
   did not stay a railway island — it was progressively absorbed into the
   commercial mobile standard itself, in three checkable steps. (i)
   2001/2004: the umbrella European Standard EN 301 515 defines railway GSM
   by PINNING roughly 36 commercial GSM specifications at fixed late-1990s
   versions, with the rule that subsequent revisions do not apply
   (E-2026-07-05-03). (ii) Through the mid-2010s: some fifteen years of
   railway-driven change requests flowed INTO the official 3GPP process —
   group-call race conditions, pre-emption edge cases, dispatcher
   functions — catalogued in ETSI TS 102 281, with an explicit precedence
   rule for disputes: where a fix and the EIRENE SRS conflict, EIRENE
   prevails (E-2026-07-05-04). (iii) 2020–2024: the railway features now
   live as ordinary, currently maintained 3GPP specifications on the same
   conveyor as the commercial mobile stack — the group-call spec reissued
   at Release 16 (2020), the broadcast spec at Release 18 (May 2024)
   (E-2026-07-05-06/-07). Why this matters for equivalence: "as good as
   GSM-R" means matching not just the headline features but a
   QUARTER-CENTURY of curated fix-lore absorbed into the commercial
   standard. And give the reader the quotable symmetry: Release 16 is
   simultaneously where the legacy group-call spec consolidated AND where
   MCX rail group affiliation — one of the three named gaps — begins; the
   old and new bearers hand over inside one release number
   (E-2026-07-05-06, E-2026-07-01-10). FRMCS is repeating the same
   absorption pattern with 5G — which is the argument FOR the transition's
   design, and precisely why its rail features must clear the same proof
   machinery the GSM-R lore went through.
4. The bar is quantified — give the lay reader the numbers: a railway
   emergency call must set up in under 2 seconds, a group call in under 5,
   achieved in 95 percent of cases with the 99th percentile within 1.5 times
   the limit; radio coverage at 95 percent probability at defined signal
   strengths (E-2026-07-02-32). Any "equivalent" successor meets these
   numbers or consciously, publicly re-baselines them.
5. The gaps, honestly: on the FRMCS/MCX side three items were still open in
   the international standards process per the record — rail-specific group
   affiliation, functional-alias handling, and end-to-end security (optional,
   to be defined) (E-2026-07-01-10). Equivalence is validated-in-progress,
   not failed (E-2026-06-29-01) — but "in progress" is not "done", and the
   safety case needs "done".
6. The clock has already slipped — from the sector's own papers: the 2021
   project brochure said FRMCS products would reach the market in 2025
   (E-2026-07-02-28); by 2025 the first MARKET-READY specification edition
   was planned for Q3 2027 (E-2026-07-02-15). A documented two-year slip in
   announced timelines. The currently reported public schedule — test fields
   from 2026, main corridors 2028–2032, nationwide by 2035
   (E-2026-07-03-02) — deserves the same discount. State the implication for
   the demand side: "accelerate" rhetoric that ignores spec maturity buys
   risk, not speed.
7. The Paper-2 principle applied to the migration: asserted capability is
   not proven capability. The same expert coverage that demands acceleration
   also praises FRMCS's "integrated failover functions" and "self-healing"
   (E-2026-07-03-02) — but GSM-R also HAD integrated failover on 23 June.
   The successor's resilience claims must be proven the way its predecessor's
   functionality was: by a harmonised test catalogue, independently assessed.
8. What responsible acceleration looks like (from the engagement's testing
   strategy): feature-parity regression against the (MI)-marked EIRENE
   requirements for every change; NO percentage-of-traffic experiments on
   safety-critical traffic — rollout by geographic segment, each with a
   manual safety gate and a fallback to GSM-R under the parallel run. Faster
   is fine; unproven is not.
9. Close: the transition is necessary (Paper 1's obsolete bearer), urgent
   (Paper 2's structural lesson), and fundable — but "as good as GSM-R" is
   a measurable promise, and the measuring instruments already exist. Use
   them. Series pointer: the final paper asks what happens to the system's
   shape as ever more safety weight moves onto this one bearer.

VISUAL
Embed or reference both blocks of DIAG-005 ("The bar FRMCS must clear" and
the timeline strip) with the caption verbatim: "'As good as GSM-R' is
measurable — and the clock that measures it has already slipped two years."

BINDING CONSTRAINTS (non-negotiable — from the source files)
- Scope honesty on the bar: only the (MI)-marked requirements of the EIRENE
  pair are certification-binding — do not present all EIRENE text as equally
  normative (E-2026-07-02-30 foreword).
- The test catalogue (UIC Doc 3114) is a 2013 FINAL DRAFT built on since-
  superseded baseline versions: the methodology and the KPI figures stand as
  the historical bar, but say "the catalogue as issued in 2013" and note it
  would need a currency check before literal reuse (E-2026-07-02-32).
- Standards-lineage honesty (point 3): use the timeline at DATE and RELEASE-
  NUMBER level only — the record's copies carry flags that forbid clause-level
  citation (EN 301 515 on file is a FINAL DRAFT of the later-published EN;
  TS 102 281 was read from a watermarked reseller preview; the Rel-16/18
  editions were logged from cover/identification pages only). Dates, release
  numbers, document roles and the §4.0 precedence rule are solid; clause
  content is not verified.
- Keep the lineage cut both ways: "still maintained in 3GPP in 2024" must not
  be used to deny obsolescence (the bearer is still 2G-era radio technology,
  and the pinned baseline was frozen by design) — and "obsolete" must not be
  used to imply abandonment (the feature set was on the 3GPP conveyor two
  years before the outage). Hold both facts; that tension IS the point.
- MCX equivalence is VALIDATED-IN-PROGRESS, not failed — the three gaps are
  open items in a live standards process, not verdicts. No doom framing.
- The two-year slip compares ANNOUNCED PLANS with ANNOUNCED PLANS (a
  dissemination brochure vs a project article) — phrase as "a documented
  slip in the announced timeline", not as delivery failure.
- The 2028–2032/2035 schedule and the n101 test-network commissioning are
  reported by trade press citing an expert body (E-2026-07-03-02) — attribute
  as reported; the n101 fact still needs primary verification, so use it
  cautiously or omit.
- VDE advocacy interest note carries over: an electrotechnical association
  advocating acceleration of an electrotechnical programme — aligned
  advocacy, mark as such if quoted.
- No vendor names, no vendor-bashing; the argument is about proof
  obligations, not suppliers.
- Carried-over series discipline: 23 June cause = "a network distribution
  component", ~2 hours, not a cyberattack; oversight-not-control if the AI
  layer is mentioned (≤1 sentence); EU AI Act conditional if mentioned at all.
- Paraphrase everything; never paste text from UIC/EIRENE/ETSI/press sources.
- Mark opinion as opinion (points 6–8 contain engagement judgement — flag
  it). Include the "Sources and method" endnote: evidence-logged engagement,
  daily frozen baselines, evidence IDs available on request
  (repo: github.com/vpnetconsult/frmcs-arckit).

STRUCTURE HINT (adapt freely): hook (the chorus says faster — faster to
what?) → the three-layer bar, plainly → the lineage (the bar absorbed into
the commercial 3GPP stack; the Release-16 handover symmetry) → the numbers →
the honest gaps → the slipped clock → asserted vs proven (the Paper-2
principle) → responsible acceleration → close and final-paper pointer. Short paragraphs, one diagram
(two blocks), no headings deeper than one level.

Before you finish: re-check every number and claim against the attached
files; list at the end (for the editor, not for publication) any claim you
could not trace to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] (MI)-marked scoping stated; EIRENE not presented as monolithically binding
- [ ] UIC 3114 dated as 2013 final draft with currency-check caveat
- [ ] Lineage timeline at date/release level only; final-draft (EN 301 515), reseller-preview (TS 102 281) and cover-only (Rel-16/18) flags respected; no clause quotes
- [ ] Lineage cuts both ways: maintained-through-2024 ≠ not-obsolete; obsolete ≠ abandoned
- [ ] MCX gaps framed as open items in a live process, not failure
- [ ] Slip framed as announced-timeline slip (plans vs plans)
- [ ] 2028–2032/2035 schedule + n101 attributed as press-reported; n101 cautious or omitted
- [ ] VDE advocacy interest noted if quoted
- [ ] No vendor names/bashing; proof-obligation framing throughout
- [ ] Series discipline intact (culprit wording, ~2 hours, not cyberattack, guardrails)
- [ ] Engagement judgement in points 5–7 marked as opinion
- [ ] No pasted source text; endnote present; untraceable-claims list resolved
