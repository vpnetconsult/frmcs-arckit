# Paper 4 — cowork drafting prompt

**Paper:** 4 of the series · "The budgeted human — why oversight fails quietly, and how the rail sector is fixing it" (pivot thread 3)
**Date:** 2026-07-03 · **Owner:** Vpnet engagement lead
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 3 + the caveats section)
2. `current/project/diagrams/ARC-FRMCS-DIAG-004-flow-alert-budget-v1.0.md` (the two-loop visual)
3. `current/project/03-risk-register.md` (the PR4 row — the LOAD BOUND mitigation)
4. Evidence rows (or the full `current/evidence-log.md`): E-2026-07-02-13, E-2026-07-02-23, E-2026-07-02-24, E-2026-07-02-29
5. Optional: `current/project/ADR-004-sil4-boundary.md` (automation-bias hazard coupling), `current/project/ADR-010-eval-strategy.md`, `current/project/ADR-011-migration-change-control.md`

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 4, the closing paper of a series derived from an
evidence-logged architecture engagement on the German rail radio outage of
23 June 2026 and the GSM-R→FRMCS transition. Paper 1: safety held, continuity
failed. Paper 2: the failure was a silent fault — prove the trigger, don't
assert the backup. Paper 3: watchful AI can be added around the safety core,
with a human holding the only key between advice and action. Paper 4 protects
that human. Work ONLY from the attached source files — do not add facts from
your own knowledge. Every factual claim must trace to an evidence ID (E-…) or
a named document, exactly as the sources cite them.

DELIVERABLE
An article of 1,300–1,700 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "The budgeted
human — why oversight fails quietly, and how the rail sector is fixing it".
Register: calm, humane, concrete; this is a human-factors piece grounded in
engineering practice, not an ethics essay. No jargon left unexplained.

THE ARGUMENT (from pivot-notes thread 3 — follow this arc)
1. Open where Paper 3 ended: the whole architecture puts a human at the one
   door between machine advice and real-world action. That design stands or
   falls on a question rarely asked out loud: how much deciding can one
   person actually carry? Human oversight does not fail with an alarm — it
   fails quietly, as a reflex.
2. The failure loop, in lay terms (left panel of the attached diagram): more
   alerts per operator → less time per decision → approval becomes a reflex →
   the human "oversight" is a rubber stamp, and automation bias has won
   without anyone noticing. Draw the series echo explicitly: oversight that
   exists on paper but not in practice is the HUMAN version of Paper 2's
   backup that existed but never fired. The series' one principle applies to
   people too: prove it works — don't assert that it exists.
3. The surprise: the rail sector is already writing the fix into its own
   safety process — not for AI, but for its signalling migration. German
   research (a TU Dresden dissertation line with DB InfraGO involvement)
   is developing "reasonableness" (Zumutbarkeit) criteria: QUANTIFIED bounds
   on what operating and planning staff can reasonably handle — minimum
   section lengths that depend on speed, caps on the number of notices and
   systems one person juggles, decision-rate bounds (E-2026-07-02-13).
   Include the honesty detail: an earlier, cruder fixed-kilometre proposal
   was WITHDRAWN as impractical — a research programme honest enough to
   retract its own first answer.
4. The operationalisation (E-2026-07-02-23): a five-step model — score each
   project's complexity and human-error probability with a standardised
   matrix (built on VDI 4006, the established human-reliability method,
   which had never been translated to rail signalling); classify complexity;
   have an INDEPENDENT expert panel sign off the score; apply improvement
   factors (experience, staffing, time); and anchor the whole thing in the
   formal safety process (the extended CSM risk-assessment procedure) with
   revalidation at every project phase gate. State plainly: this is ONGOING
   RESEARCH — dissertations and pilots pending, not adopted regulation.
   "The sector is writing this rule", not "has written".
5. The transfer, and the paper's core proposal: an AI oversight layer must
   INHERIT this instrument. Concretely (right panel of the diagram): an
   ALERT BUDGET — a decision-rate limit per operator; dissent monitoring
   (a human who never disagrees with the machine is not deciding); legible
   rationale on every recommendation; no auto-accept; and a hard rule —
   if the budget is exceeded, reduce alerts or add people, do NOT proceed.
   Frame it precisely: this is the engagement's proposal, mirroring the
   sector's own emerging instrument (the PR4 risk mitigation in the record).
6. The supporting design culture, two vignettes from the record: the train
   driver whose validated safe behaviour under uncertainty is to WITHHOLD
   acknowledgement — whereupon the system brings the train to a supervised
   stop (E-2026-07-02-24); and the train-integrity specification that
   MANDATES reporting "unknown" rather than coasting on a stale "confirmed"
   (E-2026-07-02-29). The principle both encode: the human's (and the
   system's) safest action must always be available, cheap, and never
   punished. Add the timing warning from the research: migration phases —
   construction states, mixed old/new operation — are precisely when
   workload peaks (E-2026-07-02-13), and the GSM-R→FRMCS bridge is a
   DECADE of exactly that.
7. Why this is assurance, not kindness: the record couples automation bias
   into the formal hazard analysis — the safety case for the AI boundary
   (Paper 3) holds only if the human is a GENUINE decision-maker, and
   load-bounding is what makes "human-in-command" true rather than nominal.
   Oversight-effectiveness must be TESTED (dissent rates, decision times,
   outcome quality) and counted at the project's gates, exactly as failover
   triggers are tested (Paper 2).
8. Close the series: four papers, one arc. The safety core proved itself by
   stopping everything. Continuity failed for want of a tested trigger.
   Watchfulness can be added without touching what worked. And the human
   who holds the key must be given a load they can actually carry. The
   closing line should land the series' single principle: in safety-critical
   systems, nothing — not backups, not AI, not human oversight — may be
   asserted. Everything must be proven, and the proving must be designed in.

VISUAL
Embed or reference the two-loop flowchart from DIAG-004 ("Why unlimited
alerts make humans rubber-stamp — and the fix") with its caption verbatim:
"Human oversight is a resource with a capacity limit. The rail sector is
writing that limit into its own safety process — an AI oversight layer
should inherit it."

BINDING CONSTRAINTS (non-negotiable — from the source files)
- The Zumutbarkeit work is ONGOING RESEARCH: dissertations in progress,
  pilots pending, NOT adopted regulation. Every mention must carry that
  status. "Proposal", "emerging", "being written" — never "rule",
  "requirement", "standard".
- The alert-budget/decision-rate proposal for the AI layer is the
  ENGAGEMENT'S mitigation (risk PR4), mirroring the sector's instrument —
  attribute it as the engagement's proposal, not as sector practice.
- Interest honesty: the source articles carry an inspection-services
  co-author interest flag in the record. Handle by attribution level — cite
  the research as "TU Dresden research with DB InfraGO involvement" without
  personal or company names in the body.
- Numbers discipline: specific figures from the research (section lengths,
  dwell times, error probabilities) may be summarised qualitatively
  ("speed-dependent minimum section lengths", "quantified error-probability
  classes") — do not reproduce detailed tables; they are interim research
  results.
- The two vignettes (E-2026-07-02-24, E-2026-07-02-29) are real, validated /
  released artefacts and may be stated as such — but keep the coupling
  honest: they are the sector's design culture, not features of the
  engagement's proposal.
- Do not moralise about operators or dispatchers; the failure mode is
  systemic (load design), never individual blame.
- Carried-over series discipline: 23 June cause = "a network distribution
  component", duration ~2 hours, not a cyberattack; oversight-not-control
  guardrail verbatim in spirit; EU AI Act classification conditional if
  mentioned at all (one clause max — Paper 3 covered it).
- Paraphrase everything; never paste text from S+D/EI/DB sources.
- Mark opinion as opinion. Include the "Sources and method" endnote:
  evidence-logged engagement, daily frozen baselines, evidence IDs available
  on request (repo: github.com/vpnetconsult/frmcs-arckit).

STRUCTURE HINT (adapt freely): hook (the one door, and the person holding
the key) → how oversight fails quietly (the loop) → the sector's own answer
(Zumutbarkeit, with the withdrawn-proposal honesty beat) → the five-step
model, plainly → the transfer to AI oversight (the budget) → the safe-default
culture (two vignettes + the migration-decade warning) → assurance, not
kindness (test the human loop like the failover) → series close on the one
principle. Short paragraphs, one diagram, no headings deeper than one level.

Before you finish: re-check every claim against the attached files; list at
the end (for the editor, not for publication) any claim you could not trace
to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] Zumutbarkeit work marked as ongoing research everywhere — never "rule/requirement/standard"
- [ ] Alert budget attributed as the ENGAGEMENT'S proposal (PR4), not sector practice
- [ ] Research attributed institutionally ("TU Dresden research with DB InfraGO involvement"); no personal/company names in body
- [ ] Research figures summarised qualitatively; no interim tables reproduced
- [ ] Vignettes stated as sector design culture, not engagement features
- [ ] No individual blame; failure mode framed as load design
- [ ] Series discipline intact: culprit wording, ~2 hours, not a cyberattack, oversight-not-control, AI Act conditional (≤1 clause)
- [ ] Series-closing principle lands: nothing asserted, everything proven, proving designed in
- [ ] No pasted source text; endnote with method + repo present
- [ ] Untraceable-claims list from cowork reviewed and resolved
