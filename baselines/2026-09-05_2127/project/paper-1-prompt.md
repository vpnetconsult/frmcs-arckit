# Paper 1 — cowork drafting prompt

**Paper:** 1 of the series · "Silence means stop — what actually worked when Germany's rail radio died" (pivot thread 0)
**Date:** 2026-07-03 (files the final chat version of 2026-07-02, incl. the 40-second-watchdog constraints from E-2026-07-02-34) · **Owner:** Vpnet engagement lead
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 0 + the caveats section)
2. `current/project/diagrams/ARC-FRMCS-DIAG-001-seq-23jun-safe-stop-v1.1.md` (the visual — v1.1, with the radio watchdog)
3. `current/incident-annex.md`
4. Evidence rows (or the full `current/evidence-log.md`): E-2026-06-27-01/-02/-03, E-2026-06-24-18, E-2026-07-02-24, E-2026-07-02-26, E-2026-07-02-29, E-2026-07-02-33, E-2026-07-02-34
5. Optional: the DB National Values letter PDF (source of E-2026-07-02-34)

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 1 of a series derived from an evidence-logged architecture
engagement on the German rail radio outage of 23 June 2026 and the GSM-R→FRMCS
transition. Work ONLY from the attached source files — do not add facts from your
own knowledge. Every factual claim must trace to an evidence ID (E-…), the incident
annex, or a named standard, exactly as the sources cite them.

DELIVERABLE
An article of 1,200–1,600 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "Silence means
stop — what actually worked when Germany's rail radio died". Register: calm,
precise, quietly authoritative; no alarmism, no vendor-bashing, no jargon left
unexplained. First person plural sparingly; no marketing tone.

THE ARGUMENT (from pivot-notes thread 0 — follow this arc)
1. Open with the under-told half of 23 June: nobody was endangered. When the
   radio died nationwide, rail's safety design did exactly what it is built to
   do — and faster than most people imagine. Introduce, in plain words: the
   Movement Authority (the digital permission slip "you may proceed as far as
   point X"), the Supervised Location (the fail-safe boundary the onboard
   computer brakes against), and the radio watchdog.
2. The strongest single fact, use it early: on German ETCS Level-2 lines a
   train does not even coast to the end of its last permission when the radio
   goes silent — after 40 seconds without a valid message from the control
   centre, the onboard computer applies the brakes by itself (DB's published
   national configuration: T_NVCONTACT = 40 s, reaction = forced service
   brake; E-2026-07-02-34, primary source). Silence means stop — within
   about forty seconds plus braking distance.
3. Name the two outcomes separately: SAFETY HELD (deny-by-default worked),
   CONTINUITY FAILED (~2 hours of nationwide standstill, first trains ≈00:30,
   manual recovery). This distinction is the article's spine.
4. Pre-empt the alarmist misreading: the incident is NOT evidence that rail
   safety is broken. The scandal is availability — one silent fault, one
   nationwide standstill — which later papers in the series address.
5. Sharpen the vocabulary: the estate is provably fail-SAFE; what it is not
   yet is fail-SOFT (a network that can only stop is safe but not resilient).
   Show the design culture that defaults to stop with two evidence vignettes:
   the driver's validated safe behaviour under poor visibility (withhold
   acknowledgement → supervised stop, E-2026-07-02-24) and the train-integrity
   spec that mandates reporting "unknown" rather than coasting on a stale
   "confirmed" (E-2026-07-02-29).
6. Close by framing the series: because stopping is always safe for the train
   but never for the network — and because the 40-second watchdog means every
   minute of radio silence is a minute of braked trains — the questions that
   follow are about continuity: why the backup never fired (Paper 2), and how
   to add awareness without touching the proven deny-by-default core (Paper 3).

VISUAL
Embed or reference the sequence diagram from DIAG-001 v1.1 ("Why no train was
in danger on 23 June") with its caption verbatim: "The system is designed so
that silence means stop. On 23 June, 'safe' held and 'continuous' failed."

BINDING CONSTRAINTS (non-negotiable — from the source files)
- Phrase the core claim as "loss of communication degraded to safe standstill
  BY DESIGN" — never "ETCS L2 saved the day". Two mechanisms, kept distinct:
  on ETCS L2 lines, the 40-second radio watchdog plus the impossibility of
  extending the last permission; on conventional lines (most of the affected
  network in 2026), the radio-failure rulebook (Ril 481.0205: stop at the next
  station; the fallback network cannot carry emergency or group calls). Do not
  imply trains froze instantly, and do not imply they coasted for half an hour.
- The 40 s / forced-service-brake figure is DB-network-specific configuration
  (published by DB Netz, table dated 27.01.2022), NOT a European constant.
  State it as "DB's published configuration" and note values are set nationally.
- Standstill duration is ~2 HOURS (first trains ≈00:30, residual delays past
  06:00) per the DB-confirmed record. Do not use "90 minutes".
- The cause is DB-confirmed and must be stated precisely: a planned component
  swap triggered a silent software fault, no alarm was raised, so the automatic
  failover to the existing functional backup never engaged; recovery was
  manual (E-2026-06-27-01/-02/-03). Cyberattack was ruled out. Do not
  speculate beyond this. Culprit wording: "a network distribution component" —
  no vendor names, no element types beyond DB's words.
- The MA/Supervised-Location vocabulary traces to the European train-control
  specifications (Subset-026); cite concepts at that level without quoting
  clause text. The national-values table (E-2026-07-02-34) is the primary
  source for the German configuration.
- Written orders (Befehl): mention only as the human fallback layer operations
  degrade onto; the net effect on 23 June was standstill.
- Paraphrase everything; never paste text from S+D/EI/UIC/DB sources (copyright).
- If you mention the AI-oversight proposal at all (Paper 3 teaser), one sentence
  maximum, keeping the guardrail: autonomous oversight, NOT control —
  safety-critical actuation stays human-in-command. Never present the EU AI Act
  classification as settled.
- Mark any opinion as opinion. Include a short "Sources and method" endnote:
  evidence-logged engagement, daily frozen baselines, evidence IDs available on
  request (repo: github.com/vpnetconsult/frmcs-arckit). Shareable primary link
  for the confirmed cause: DB press newsblog
  deutschebahn.com/de/presse/Newsblog-12829716 (24–26 Jun 2026).

STRUCTURE HINT (adapt freely): hook (the night the trains stopped — and why
that was the system working) → how permission-to-move and the 40-second
watchdog work, in two lay paragraphs → the two verdicts (safe held /
continuous failed) → the safe-default culture (two evidence vignettes) →
what this does and does not prove → series teaser. Short paragraphs, no
headings deeper than one level, one diagram.

Before you finish: re-check every number and claim against the attached files;
list at the end (for the editor, not for publication) any claim you could not
trace to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] Core claim phrased "degraded to safe standstill by design"; no "ETCS saved the day"
- [ ] Both stop mechanisms present and distinct (L2 watchdog+permission vs conventional rulebook)
- [ ] 40 s figure attributed as DB's published national configuration, not a European constant
- [ ] Duration ~2 hours everywhere (no "90 minutes"); first trains ≈00:30
- [ ] Culprit = "network distribution component"; cyberattack ruled out; no speculation
- [ ] Subset-026 cited at concept level, no clause text; national values via E-34
- [ ] Befehl mentioned only as the degradation layer; net effect standstill
- [ ] AI-oversight teaser ≤1 sentence, guardrail intact, AI Act not settled
- [ ] No pasted source text; endnote with method + DB newsblog link present
- [ ] Untraceable-claims list from cowork reviewed and resolved
