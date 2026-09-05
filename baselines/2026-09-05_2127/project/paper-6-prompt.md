# Paper 6 — cowork drafting prompt

**Paper:** 6 (final) of the series · "More weight on the wire — the quiet redesign of how railways stay safe" (pivot thread 5)
**Date:** 2026-07-03 · **Owner:** Vpnet engagement lead
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 5 + the caveats section)
2. `current/project/wardley-gsmr-frmcs-transition.md` (v2 — the evolution map; its "What changed in v2" section is the thread-5 story)
3. `current/project/diagrams/ARC-FRMCS-DIAG-006-deploy-geo-redundancy-v1.0.md` (the ground-estate visual)
4. Evidence rows (or the full `current/evidence-log.md`): E-2026-07-02-26, E-2026-07-02-21, E-2026-07-02-10, E-2026-07-02-25, E-2026-07-02-34, E-2026-06-24-18, E-2026-07-02-15
5. Optional: `current/traceability-matrix.md` (rows R3/R4 — the honesty column), `current/project/diagrams/ARC-FRMCS-DIAG-001-seq-23jun-safe-stop-v1.1.md` (Paper-1 callback)

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 6, the final paper of a series derived from an
evidence-logged architecture engagement on the German rail radio outage of
23 June 2026 and the GSM-R→FRMCS transition. Papers 1–5 covered the incident,
the silent-fault lesson, the AI boundary, the human load, and the equivalence
bar. Paper 6 steps back and names the structural trend underneath all of
them: the railway is quietly moving ever more of its safety machinery onto
one radio bearer, while the human-procedural net beneath it thins. Work ONLY
from the attached source files — do not add facts from your own knowledge.
Every factual claim must trace to an evidence ID (E-…) or a named document,
exactly as the sources cite them.

DELIVERABLE
An article of 1,400–1,800 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "More
weight on the wire — the quiet redesign of how railways stay safe".
Register: reflective, structural, forward-looking; the series' widest-angle
piece. This paper contains more engagement ANALYSIS than the others — mark
judgement as judgement throughout. No jargon left unexplained.

THE ARGUMENT (from pivot-notes thread 5 and the v2 evolution map — follow
this arc)
1. Open with the invisible trend: for a century, when rail technology
   failed, paper and people took over — dispatchers dictating written
   orders (the Befehl). That net still exists. But the target system being
   built now deliberately shrinks it: of nine harmonised written-order
   types, only FOUR are expected to survive — and every one of the
   simplifications is conditioned on one phrase that recurs through the
   expert discussion: "provided a reliable radio connection exists"
   (E-2026-07-02-26).
2. Anchor with Paper 1's hardest number: on ETCS Level-2 lines, radio
   silence does not merely pause the digital conveniences — after 40
   seconds it BRAKES the trains (DB's published configuration,
   E-2026-07-02-34). Bearer availability is not an IT metric on this
   railway; it is movement itself. Every function that migrates onto the
   bearer raises the price of every bearer outage.
3. Be fair to the design logic: the migration is not carelessness. Written
   orders are slow and error-prone (dictation, read-back, interpretation);
   technical transmission is faster and more precise; the sector's design
   principle — technical solutions take precedence for safety-relevant
   measures — is defensible (E-2026-07-02-26). The issue is not the
   direction; it is the SEQUENCING.
4. The bearer's own safety net, honestly assessed: the hybrid fallback
   (private rail 5G plus public networks, joined by multipath protocols)
   is real and field-proven — a completed Franco-German project measured
   about 2 seconds for a full path switchover on a live test track
   (E-2026-07-02-21). But the one mode that needs NO trigger at all —
   running the same data on both paths simultaneously (replication) — was
   tested only in the lab. And Paper 2 taught what triggers are worth
   until proven. Add the standing functional caveat: a public mobile
   network cannot carry railway emergency calls or group calls unless the
   mission-critical services are re-provided on top (E-2026-06-24-18).
5. The ground half of the story (the attached deployment diagram): the
   operator's own doctrine protects the centralised signalling estate with
   a second data centre — cold standby now, virtualised warm standby as
   the target (E-2026-07-02-25). Sound — with the record's two flags:
   keeping the standby current means copying every change to it (one bad
   update can reach both sides — the engagement's reading, not the
   operator's), and the operator's own authors concede an isolated cold
   standby cannot be fully tested end-to-end. Existence is not readiness —
   the series' refrain.
6. The synthesis, stated as the engagement's judgement: a network that can
   only stop is safe but not resilient (Paper 1); the target system raises
   the price of every outage (this paper); and the trigger problem is not
   yet closed for the target either (Paper 2). Therefore the SEQUENCING
   RULE: do not let the human-procedural net thin faster than the
   technical net is proven. Concretely: the reduction to four written
   orders should be held hostage to the fallback's maturity — trigger-less
   replication field-proven, mission-critical services working over the
   public path, failover triggers demonstrated under silent faults.
7. What to watch (give the reader verifiable markers): the European
   validation programme carrying multipath into cross-border trials
   (E-2026-07-02-15); whether replication moves from lab to field; whether
   the written-order reduction is coupled to any fallback criteria at all
   in the coming specification rounds (E-2026-07-02-26 notes the safety
   considerations are explicitly incomplete — that is where the coupling
   belongs).
8. Close the series wide: six papers, one railway, one principle. The
   safety core stops trains reliably (1); continuity needs proven
   triggers, not asserted backups (2); intelligence can watch without
   touching (3); the human needs a bounded load (4); equivalence is
   measurable (5); and the system's shape — ever more weight on one
   wire — must be matched, step for step, by proof that the wire and its
   nets can carry it (6). End on the constructive note: none of this is an
   argument against the transition; all of it is an argument for
   sequencing proof before dependence.

VISUALS
Primary: the deployment diagram DIAG-006 ("The target ground estate — and
its one designed-in risk") with its caption verbatim. Optional for print:
the evolution map (Wardley v2) rendered from its OWM block — if used, add
one lay sentence explaining how to read it (top = what the public needs,
bottom = invisible infrastructure, left = novel, right = standardised).

BINDING CONSTRAINTS (non-negotiable — from the source files)
- The written-order analysis (9 → 4) is EXPERT-DISCUSSION STATE from the
  System Pillar, with safety considerations explicitly incomplete — present
  it as the direction under discussion, not as a decided rulebook change
  (E-2026-07-02-26).
- The 2.0 s switchover is field-proven on a TEST TRACK by a completed
  project; replication is LAB-ONLY; the prototype lacked full policy/QoS
  integration; the field spectrum was a provisional band. Keep all four
  qualifiers when the fallback is praised (E-2026-07-02-21).
- The common-mode critique of the standby sync is the ENGAGEMENT'S analysis
  applied to the operator's published doctrine — attribute it as such.
- The 40 s watchdog figure: DB's published national configuration, not a
  European constant (E-2026-07-02-34).
- The sequencing rule (point 6) and the "hold the reduction hostage to
  fallback maturity" recommendation are the ENGAGEMENT'S judgement — mark
  them clearly as the series' position, not as sector consensus.
- Matrix honesty if statuses are mentioned: the resilience requirements
  (no central single point of failure; fail-soft) are OPEN in the record —
  direction set, proof outstanding.
- Carried-over series discipline: 23 June cause = "a network distribution
  component", ~2 hours, not a cyberattack; oversight-not-control if the AI
  layer is mentioned (≤1 sentence); EU AI Act conditional if mentioned;
  no vendor names in the body.
- Paraphrase everything; never paste text from S+D/EI/UIC/DB sources.
- Include the "Sources and method" endnote: evidence-logged engagement,
  daily frozen baselines, evidence IDs available on request
  (repo: github.com/vpnetconsult/frmcs-arckit).

STRUCTURE HINT (adapt freely): hook (the paper net that caught a century of
failures — and is being folded up) → the 40-second anchor (why the wire IS
movement) → fair to the logic (faster, more precise — direction right) →
the fallback, honestly (2 s proven / replication lab-only / no emergency
calls on public networks yet) → the ground estate and its designed-in risk
→ the sequencing rule (the series' position) → what to watch → series
close. Short paragraphs, one or two visuals, no headings deeper than one
level.

Before you finish: re-check every number and claim against the attached
files; list at the end (for the editor, not for publication) any claim you
could not trace to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] 9→4 written-order analysis presented as expert-discussion state, safety considerations incomplete
- [ ] Fallback praise carries all four qualifiers (test track, replication lab-only, prototype limits, provisional band)
- [ ] Public-network functional caveat present (no emergency/group calls without MCX re-provision)
- [ ] Common-mode sync critique attributed to the engagement
- [ ] 40 s figure attributed as DB national configuration
- [ ] Sequencing rule marked as the series'/engagement's judgement, not sector consensus
- [ ] R3/R4 statuses (if mentioned) honest: open, proof outstanding
- [ ] Series discipline intact (culprit wording, ~2 hours, not cyberattack, guardrails, no vendor names)
- [ ] Constructive close: pro-transition, pro-sequencing — not anti-modernisation
- [ ] No pasted source text; endnote present; untraceable-claims list resolved
