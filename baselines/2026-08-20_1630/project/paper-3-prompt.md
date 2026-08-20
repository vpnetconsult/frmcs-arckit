# Paper 3 — cowork drafting prompt

**Paper:** 3 of the series · "Two rooms, one door — how to add AI to the railway without touching what keeps it safe" (pivot thread 2)
**Date:** 2026-07-03 · **Owner:** Vpnet engagement lead
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 2 + the caveats section)
2. `current/project/diagrams/ARC-FRMCS-DIAG-003-context-two-rooms-v1.0.md` (the signature visual)
3. `current/project/ADR-004-sil4-boundary.md` (the boundary design + its scope-and-honesty note)
4. `current/project/ADR-003-eu-ai-act-classification.md` (the conditional classification)
5. Evidence rows (or the full `current/evidence-log.md`): E-2026-07-02-14, E-2026-07-02-19, E-2026-07-02-09, E-2026-07-02-27, E-2026-06-24-07, E-2026-07-02-24, E-2026-07-02-29
6. Optional: `current/ADR-002-agentic-governance.md`, `current/project/oversight-sil4-boundary-context.md`, `current/project/ADR-007-testing-canary-strategy.md` (shadow-mode surface b)

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 3 of a series derived from an evidence-logged architecture
engagement on the German rail radio outage of 23 June 2026 and the GSM-R→FRMCS
transition. Paper 1 established that safety held and continuity failed; Paper 2
established that the failure was a silent fault nobody detected. Paper 3 answers
the question both papers raise: how do you add watchful intelligence to the
railway WITHOUT touching the safety core that just proved itself? Work ONLY from
the attached source files — do not add facts from your own knowledge. Every
factual claim must trace to an evidence ID (E-…) or a named document, exactly
as the sources cite them.

DELIVERABLE
An article of 1,400–1,800 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "Two rooms,
one door — how to add AI to the railway without touching what keeps it safe".
Register: calm, precise, constructive; neither AI evangelism nor AI panic.
The article must read as conservative engineering, not as a technology pitch.
No jargon left unexplained.

THE ARGUMENT (from pivot-notes thread 2 — follow this arc)
1. Open with the tension both prior papers created: the fault was silent —
   nobody knew (Paper 2). The obvious modern answer is "add AI monitoring".
   The obvious worry is "AI near trains". This paper shows the two can be
   reconciled — and that the reconciliation is architecture, not trust.
2. The design, in lay terms (the attached diagram): TWO ROOMS. The vital room
   holds the certified safety core — interlocking, train control, the
   permission-to-move machinery that Paper 1 showed working. It is
   deterministic, certified to the highest safety level (SIL 4), and is
   UNCHANGED by the AI's presence. The advisory room holds the learning
   agents: a Risk Sentinel that watches continuously, an Assurance agent that
   collects the evidence chain, decision support that explains and recommends.
   Between them: ONE-WAY GLASS — the agents read telemetry but cannot write
   into the vital room. And ONE DOOR, whose only key is held by a HUMAN:
   every safety-relevant action passes through a human decision. The agent
   can never close the loop. Three properties, enforced by construction, not
   by procedure: one-way information flow, human-in-command, and freedom
   from interference (physically separate hardware preferred). The agent is
   strictly ADDITIVE: remove it, and the safety case is untouched.
3. Would it have helped on 23 June? Frame carefully as a DESIGN ARGUMENT:
   the Risk Sentinel's defining job is exactly the silent-fault class —
   independent observation of actual system behaviour rather than trust in
   a component's self-report. This generalises Paper 2's "independent
   listener" from one probe into a continuous, learning watchfulness. But
   DB has not published full telemetry, so "would have caught it" cannot be
   proven — which is why the proposal starts in SHADOW MODE (see point 7).
4. The pattern is not our invention — it is the rail sector's own revealed
   preference, three times over, in the operator's own words:
   (a) CTMS, DB's flagship AI traffic-management system, is per DB's own
   engineers "not being designed as a safety-critical system" — safety
   responsibility stays with the interlocking layer (E-2026-07-02-14);
   (b) the AutomatedTrain project took a DELIBERATE decision to use NO
   AI-based algorithms in safety-critical paths, preferring deterministic
   methods for the functions that must be certified (E-2026-07-02-19);
   (c) the iLBS dispatcher system, in operation for about a year, runs a
   non-safety operating layer over a safety-enforcing vital interlocking —
   the certified layer catches every command (E-2026-07-02-09).
   Even the sector's own platform research (Cloud4Rail) explicitly does NOT
   cover hosting learning components inside the vital domain — common-cause
   failures there remain open research (E-2026-07-02-27). Everyone who has
   looked at this has drawn the same line.
5. The boundary is also the legal argument: under the EU AI Act, the
   classification turns on whether the system is a "safety component". As
   designed — advisory only, non-actuating, human-in-command — the oversight
   layer sits OUTSIDE the high-risk perimeter (verified against the primary
   legal text, E-2026-06-24-07). State this precisely and conditionally: the
   finding holds ONLY while the boundary holds; if the agents ever gained an
   actuation path, the layer would become a safety component, high-risk, and
   would have to be certified like the safety core itself — infeasible for a
   learning system. The safety case and the compliance case are the same
   boundary. NEVER present the classification as settled fact.
6. The honest residual risk is the human, not the machine: an advisory system
   can still contribute to harm if an overloaded human rubber-stamps its
   advice (automation bias). Note the design culture the record shows —
   validated safe defaults where non-action degrades to a supervised stop
   (E-2026-07-02-24) and systems that must report "unknown" rather than
   coast on stale confirmation (E-2026-07-02-29) — and close the point with
   one sentence: bounding the human's decision load is a discipline of its
   own, and it is the subject of Paper 4.
7. How the agents earn trust: not by promises but by the same rule Paper 2
   set for redundancy — evidence before authority. The lowest rung is SHADOW
   MODE, available on today's GSM-R network: agents run read-only, their
   outputs are compared against reality and never acted on. Only demonstrated
   accuracy moves them up a rung, and no rung ever crosses the door. Status
   honesty: this architecture is a PROPOSAL — the boundary is designed and
   industry-corroborated, and the formal safety-case evidence (independence
   analysis, independent assessment) is still to be produced. Say "designed",
   not "proven".
8. Close with the series arc: the safety core proved itself by stopping
   everything (Paper 1); continuity failed for want of detection (Paper 2);
   watchful intelligence can be added around the core without touching it
   (this paper); and the last load-bearing component — the human holding the
   key — needs its own protection: a bounded decision load (Paper 4).

VISUAL
Embed or reference the C4 context diagram from DIAG-003 ("Two rooms, one
door — where the AI is allowed to live") with its caption verbatim:
"Oversight, not control. The boundary is also the legal argument: the EU AI
Act 'not high-risk' classification holds only while the AI cannot act."

BINDING CONSTRAINTS (non-negotiable — from the source files)
- The guardrail, kept verbatim in spirit everywhere: autonomous OVERSIGHT,
  NOT CONTROL — safety-critical actuation stays human-in-command. Never blur
  it, never soften it, never imply the agents could "take over in an
  emergency".
- Never present the EU AI Act classification as settled or automatic: it is
  verified-conditional (E-2026-06-24-07) and rides entirely on the
  non-actuation boundary. Use "as designed", "holds only while".
- Status honesty: the boundary architecture is PROPOSED (ADR-004) — designed
  and industry-corroborated, NOT evidenced. The independence/freedom-from-
  interference analysis, hazard log, and independent assessments are open
  action items. Do not claim certification, approval, or operational status.
- "Would it have helped on 23 June" is a DESIGN ARGUMENT (DB telemetry
  unpublished; replay inference-based). Use conditional phrasing; never
  claim the agents would provably have prevented the outage.
- The three in-domain adoptions are the operator's own designations reported
  in the record: attribute them (DB's CTMS team, the AutomatedTrain project,
  the iLBS account). The CTMS "not being designed as a safety-critical
  system" designation may be quoted as the single flagged sentence the
  record carries; everything else paraphrased.
- The in-domain adoptions VALIDATE the pattern (advisory layer over a vital
  kernel); they are NOT deployments of this engagement's oversight layer.
  Do not imply DB has adopted this proposal.
- Do not name vendors or AI contractors in the body (the record flags
  vendor colouring on the source articles; the argument does not need names
  beyond DB's own systems).
- Culprit wording discipline carries over from Paper 2: the 23 June cause is
  "a network distribution component" — no vendor, no element class.
  Duration ~2 hours, not "90 minutes". Not a cyberattack.
- The human-oversight residual (automation bias) must appear — omitting it
  would make the piece a pitch. One honest paragraph plus the Paper 4 bridge.
- Paraphrase everything; never paste text from S+D/EI/DB/legal sources
  (single exception: the flagged CTMS designation sentence, as carried in
  the record).
- Mark opinion as opinion. Include the "Sources and method" endnote:
  evidence-logged engagement, daily frozen baselines, evidence IDs available
  on request (repo: github.com/vpnetconsult/frmcs-arckit).

STRUCTURE HINT (adapt freely): hook (the question Papers 1–2 left open — and
the reflex answers, both wrong) → the two rooms, plainly → would it have
helped (honest conditional) → everyone draws the same line (three adoptions)
→ the law and the architecture agree (conditional AI Act finding) → the
honest residual (the human) → earning trust in shadow mode → series close
and Paper 4 bridge. Short paragraphs, one diagram, no headings deeper than
one level.

Before you finish: re-check every claim against the attached files; list at
the end (for the editor, not for publication) any claim you could not trace
to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] "Oversight, not control" guardrail intact everywhere; no emergency-takeover implication
- [ ] EU AI Act finding phrased conditionally ("as designed", "holds only while") — never settled fact
- [ ] Architecture described as PROPOSED/designed, never proven/certified/operational
- [ ] "Would have helped" in conditional design-argument phrasing only
- [ ] Three adoptions attributed to the operator's own accounts; no implication DB adopted this proposal
- [ ] Only the single flagged CTMS sentence quoted; everything else paraphrased
- [ ] No vendor/contractor names in the body
- [ ] Culprit = "network distribution component"; ~2 hours; not a cyberattack
- [ ] Automation-bias paragraph present with Paper 4 bridge
- [ ] Endnote with method + repo present; untraceable-claims list reviewed and resolved
