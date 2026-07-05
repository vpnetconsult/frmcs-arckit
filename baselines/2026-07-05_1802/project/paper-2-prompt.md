# Paper 2 — cowork drafting prompt

**Paper:** 2 of the series · "The backup that was never asked — anatomy of a silent fault" (pivot thread 1)
**Date:** 2026-07-03, updated 2026-07-05 / v1.3 (standards-lineage timeline E-2026-07-05-03…-08; CSM safety-gated/continuity-gap point E-2026-06-28-06 + E-2026-07-05-09; current-edition check resolved E-2026-07-05-10) · **Owner:** Vpnet engagement lead · **Baseline:** frozen with `baselines/2026-07-03`; 05-Jul rows frozen with `baselines/2026-07-05*`
**Use:** attach this file to the Claude cowork session TOGETHER with the source files below; the fenced block is the drafting instruction.

## Attach alongside this file

1. `current/project/pivot-notes-2026-07-02.md` (thread 1 + the caveats section)
2. `current/project/diagrams/ARC-FRMCS-DIAG-002-seq-silent-fault-fix-v1.0.md` (the two-panel visual)
3. `current/project/diagrams/ARC-FRMCS-DIAG-006-deploy-geo-redundancy-v1.0.md` (optional sidebar visual)
4. `current/incident-annex.md`
5. Evidence rows (or the full `current/evidence-log.md`): E-2026-06-27-01/-02/-03, E-2026-06-25-02, E-2026-06-30-03, E-2026-07-01-09, E-2026-07-02-25, E-2026-07-03-02, the standards-lineage set E-2026-07-05-03/-04/-06/-07/-08, and the CSM pair E-2026-06-28-06 + E-2026-07-05-09 (optional: E-2026-07-05-05 for the "actual signalling traffic" definition behind the independent-listener point)
6. Optional: `current/project/ADR-007-testing-canary-strategy.md`, `current/project/03-risk-register.md` (PR5/PR8/PR11 rows)

## Drafting prompt (paste or reference as the task instruction)

```text
You are drafting Paper 2 of a series derived from an evidence-logged architecture
engagement on the German rail radio outage of 23 June 2026 and the GSM-R→FRMCS
transition. Paper 1 ("Silence means stop") established that safety held and
continuity failed. Paper 2 explains WHY continuity failed — and what fixes it.
Work ONLY from the attached source files — do not add facts from your own
knowledge. Every factual claim must trace to an evidence ID (E-…), the incident
annex, or a named standard, exactly as the sources cite them.

DELIVERABLE
An article of 1,400–1,800 words, English, for an intelligent lay audience
(policy makers, journalists, transport managers). Working title: "The backup
that was never asked — anatomy of a silent fault". Register: calm, forensic,
constructive; no alarmism, no vendor-bashing, no blame theatre — the point is
a design lesson, not a culprit hunt. No jargon left unexplained.

THE ARGUMENT (from pivot-notes thread 1 — follow this arc)
1. Open with the paradox: DB's redundancy was real, funded, and fully
   functional on the night of 23 June. It was never used. A planned component
   swap during routine maintenance triggered a software fault that raised NO
   alarm — so the monitoring stayed green, the automatic failover was never
   told to act, and recovery took manual work while the nation's trains stood
   for ~2 hours (DB-confirmed: E-2026-06-27-01/-02/-03; cyberattack ruled out).
   Independent corroboration exists: Germany's electrotechnical expert body
   VDE, in its own analysis, put it plainly — the systems were redundant and
   would have switched, "but the switchover signal never came"
   (E-2026-07-03-02).
2. Name the failure class precisely: this is not "no backup" and not "backup
   failed". It is a DETECTION failure — the component lied about its own
   health, and the trigger that should have fired had never been exercised
   against a fault that stays silent. One sentence linking back to Paper 1:
   because the radio watchdog brakes trains within ~40 seconds of silence,
   every minute the failover does not fire is a minute of braked trains —
   trigger speed IS service continuity.
3. Demolish the paper defence: calculated availability is not evidence. The
   same estate had very high CALCULATED availability in the operator's own
   2019 study (E-2026-06-25-02) and still stood still for two hours. The
   lesson, stated as the series' core principle: prove that redundancy
   TRIGGERS under a hidden fault — not that it EXISTS.
4. The fix, in lay terms (Panel 2 of the attached diagram): an independent
   listener. A component that lies about its health cannot be its own alarm —
   detection must come from OUTSIDE the component, watching the actual
   signalling traffic rather than trusting self-reports (out-of-band probes,
   ITU-T Q.752 pattern, E-2026-06-30-03). With independent detection, the
   same silent fault ends in seconds of disruption, not hours.
5. The uncomfortable footnote that hardens the argument: this was already
   required. The European standard for exactly this subsystem (ETSI TS 103 147)
   mandates AUTOMATIC switchover without manual intervention, and explicitly
   names maintenance activities among the events redundancy must cover
   (E-2026-07-01-09). 23 June was a non-conformance to an existing standard,
   not an unforeseeable event.
6. The quieter rulebook problem — marked throughout as the ENGAGEMENT'S
   analysis: next to the standard that mandates automatic failover sits the
   European risk-assessment rulebook, the Common Safety Method (Reg (EU)
   402/2013): every change to the railway system — a component swap
   included — receives the proposer's judgement on whether it is
   "significant", tested against six criteria including failure consequence
   and MONITORABILITY (E-2026-06-28-06; ERA's official application guide,
   E-2026-07-05-09). The structural catch: the significance test is
   SAFETY-gated — and on a railway designed so that failure means safe
   standstill (Paper 1), the credible worst case of a swap gone wrong is
   trains stopping, which is safe. The better the fail-safe design, the
   more easily every change passes the safety-gated test — while no
   equivalent gate asks the continuity question ("what if this swap fails
   silently and stops the nation?"). Risk assessment, as legally
   constituted, assesses the risk the system is already designed to
   survive. Two record-backed footnotes: monitorability — one of the six
   criteria — is exactly what a silently-lying component defeats, so the
   independent listener (point 4) is also what makes changes honestly
   assessable; and DB's own post-incident countermeasures (swaps suspended,
   maintenance confined to 00:00–04:00 on the inactive redundancy side)
   show the operator now treating this change class as more than routine.
   State plainly what may NOT be said: DB's actual classification of the
   23 June swap is not public, and no breach of the CSM is asserted.
7. The lineage sidebar that reframes "old" (standards set logged 5 July):
   GSM-R is not a railway island — its specification history runs in three
   steps, each with a checkable date. (i) 2001/2004: the European umbrella
   standard EN 301 515 defines railway GSM by PINNING roughly 36 commercial
   GSM specifications at fixed late-1990s versions, with the explicit rule
   that subsequent revisions do not apply (E-2026-07-05-03) — a deliberately
   frozen baseline. (ii) Through the mid-2010s: railways kept fixing what
   the freeze could not — some fifteen years of railway-driven change
   requests flowed INTO the official 3GPP process (group-call race
   conditions, pre-emption edge cases, dispatcher functions), catalogued in
   ETSI TS 102 281 (E-2026-07-05-04). Frozen base, living delta. (iii)
   2020–2024: the railway features now live as ordinary, currently
   maintained 3GPP specifications on the same conveyor as the commercial
   mobile stack — the group-call spec reissued at Release 16 (2020), the
   broadcast spec at Release 18 (May 2024) (E-2026-07-05-06/-07). And the
   redundancy mechanism at the heart of this paper is itself COMMERCIAL
   3GPP architecture: core-node pooling, defined for mainstream networks
   since the early 2000s and maintained through Release 17 (2022)
   (E-2026-07-05-08), which the railway-specific standard TS 103 147 then
   obliges railways to run with AUTOMATIC switchover (E-2026-07-01-09).
   Two payoffs: the redundancy that stood idle on 23 June was standard
   telecoms architecture, not exotic railway kit — making the failure a
   proving-discipline problem, not a technology problem; and "obsolete"
   needs precision — a baseline frozen by design in 2004, yet a feature
   set still being maintained inside 3GPP in 2024, two years before the
   outage.
8. Nuance that pre-empts the expert rebuttal (from E-2026-07-02-25 — the
   operator's own geo-redundancy doctrine): distinguish two failure classes.
   ELEMENT-class faults (one component fails silently) demand automatic,
   independently-detected failover — the 23 June lesson. DISASTER-class events
   (losing a whole site to fire or flood) are deliberately kept as a MANUAL,
   human-decided, regularly practised switchover — and DB is right to do so.
   Neither rule may be used to justify the other's opposite.
9. The forward-looking warning, now with a concrete example: FRMCS marketing
   already promises "integrated failover functions" and "self-healing
   mechanisms" (as reported in the VDE coverage, E-2026-07-03-02) — but
   GSM-R also HAD integrated failover on 23 June. Asserted failover is not
   proven failover; the promise class is exactly what the testing strategy
   distrusts. And the fix is not complete even in the target designs: keeping
   a standby current means copying every change to it — so one bad software
   update can reach BOTH sides at once (the common-mode channel), and the
   operator's own engineers concede an isolated cold standby cannot be fully
   tested end-to-end. Redundancy that exists but is unproven is exactly the
   23 June pattern. The answer: version/config diversity, staged rollouts,
   and above all a testing discipline that injects silent faults and proves
   the trigger fires.
10. Close with the series bridge: detection is also an awareness problem —
   "why nobody knew" — which is where Paper 3 (adding watchful intelligence
   around the safety core, without touching it) picks up.

VISUALS
Embed both panels of DIAG-002 ("Anatomy of a silent fault — and the fix") with
its caption verbatim: "Prove the trigger fires — not that the backup exists."
Optional sidebar: DIAG-006 (the geo-redundant target estate with the sync
channel flagged red) for point 9. Optional second sidebar for point 7: a
simple three-step timeline strip (2001/2004 frozen pins → CRs into 3GPP
through mid-2010s → Rel-16/17/18 maintained editions 2020–2024) — dates and
release numbers only, no clause content.

BINDING CONSTRAINTS (non-negotiable — from the source files)
- CULPRIT WORDING — strict: use ONLY DB's confirmed wording, "a network
  distribution component" (a network switch component). Two competing,
  UNCONFIRMED inferences about the specific element class exist in the record
  (an expert body's probabilistic IP-backbone-switch reading, and an internal
  engagement identification) — they are mutually incompatible and NEITHER may
  appear in the article. No vendor names, no element types beyond DB's words.
- Panel 2 (the fix) is a DESIGN ARGUMENT, not a reconstruction: DB has not
  published full telemetry, and the incident-replay work is inference-based
  until it does (risk PR8). Say "would have", not "did".
- State the confirmed cause exactly and no further: planned swap of a network
  distribution component → singular software fault → no alarm → automatic
  failover to the functional redundancy never engaged → manual recovery,
  ~2 hours, first trains ≈00:30. Do not use "90 minutes".
- DB's countermeasures deserve fair mention (component swaps suspended pending
  a manufacturer fix; maintenance restricted to 00:00–04:00 on the inactive
  redundancy side only) — the operator responded; the paper's point is that
  the class of fault needs a structural fix, not just procedures.
- The VDE material (E-2026-07-03-02) is an expert body's ATTRIBUTED position
  reported by trade press: quote the switchover-signal point as VDE's
  analysis, and note VDE is an electrotechnical association advocating
  acceleration of an electrotechnical programme (aligned advocacy, marked
  as such).
- The common-mode critique of the cold-standby design (point 9) is the
  ENGAGEMENT'S analysis applied to the operator's published doctrine — the
  source article does not itself discuss it. Attribute accordingly ("our
  reading", "the record flags").
- The monoculture analogy (one bad update defeating identical systems, as in
  the 2024 CrowdStrike incident) may be used as a FRAMING ANALOGY only —
  it is explicitly not logged evidence. Mark it as an analogy.
- ETSI TS 103 147 non-conformance: state it as the record does — the standard
  requires automatic switchover and names maintenance among covered events;
  the 23 June mode (manual recovery during planned maintenance) did not meet
  that requirement. Do not editorialise about negligence or liability.
- CSM discipline (point 6) — strict: DB's significance classification of the
  23 June swap is NOT public. Never assert or imply a breach of Reg (EU)
  402/2013 or of any risk-assessment duty. The safety-gated/continuity-gap
  argument is the ENGAGEMENT'S structural analysis of the rulebook itself,
  not a finding about DB's conduct — attribute it as such, and keep the
  explicit "not public / no breach asserted" sentence in the article.
- CSM sources: cite the six significance criteria from Reg (EU) 402/2013
  (verified at EUR-Lex, E-2026-06-28-06). The ERA application guide on file
  (E-2026-07-05-09) is NON-BINDING by its own §0.1 and was drafted in 2009
  against the predecessor regulation — but the current-edition check
  (E-2026-07-05-10) confirmed ERA never reissued it: the 2009 text is still
  ERA's current published application guide. It may therefore be named as
  current ERA guidance (non-binding flag intact); cite the six criteria
  from Reg (EU) 402/2013 itself. Optional sharpener, marked as engagement
  observation: the significance-judgement guidance has not been revised
  since 2009 — older than the regulation it now serves.
- Standards-lineage honesty (point 7): use the timeline at DATE and RELEASE-
  NUMBER level only — the record's copies carry flags that forbid clause-level
  citation (EN 301 515 on file is a FINAL DRAFT of the later-published EN;
  TS 102 281 was read from a watermarked reseller preview; the Rel-16/17/18
  editions were logged from cover/identification pages only). Dates, release
  numbers, and document roles are solid; clause content is not verified.
- Do not overclaim the pooling mechanism (E-2026-07-05-08): core-node pooling
  protects against CORE-NODE loss, and DB located the 23 June fault in "a
  network distribution component" — never present the pooled-core mechanism
  as the specific redundancy that failed. The lineage point is about the
  mechanism CLASS (standard commercial architecture) and its mandated
  automatic trigger, not about the failed element.
- Do not conflate GSM-R with FRMCS: the same trigger problem carries into the
  FRMCS target (active-active cores reduce cold-failover risk but do not
  solve silent-fault DETECTION) — one paragraph maximum, citing the record's
  framing.
- Accident vs attack: 23 June was NOT a cyberattack (DB ruled it out). If rail
  cyber-security is mentioned at all, one clause maximum, clearly separated
  from the accident narrative.
- Paraphrase everything; never paste text from S+D/EI/UIC/ETSI/DB/press sources.
- If the AI-oversight layer is mentioned (Paper 3 teaser), one sentence
  maximum, guardrail intact: autonomous oversight, NOT control —
  safety-critical actuation stays human-in-command.
- Mark opinion as opinion. Include the "Sources and method" endnote:
  evidence-logged engagement, daily frozen baselines, evidence IDs available
  on request (repo: github.com/vpnetconsult/frmcs-arckit). Shareable primary
  link for the confirmed cause: DB press newsblog
  deutschebahn.com/de/presse/Newsblog-12829716 (24–26 Jun 2026).

STRUCTURE HINT (adapt freely): hook (the backup that spent the whole outage
switched on and waiting) → what happened, precisely (panel 1) → why "we had
redundancy" is not a defence (calculated availability vs the trigger) → the
independent listener (panel 2) → it was already the rule (TS 103 147) → the
quieter rulebook (safety-gated risk assessment, the continuity gap —
engagement analysis, no breach asserted) → the lineage sidebar (railway
custom → commercial 3GPP stack: frozen base, living delta, standard
architecture) → the two failure classes (element vs disaster — DB gets this
right) → the promise
problem (asserted FRMCS failover) and the risk that remains (sync channel,
untestable standby) → what "prove it" looks like → bridge to Paper 3. Short
paragraphs, one or two diagrams, no headings deeper than one level.

Before you finish: re-check every number and claim against the attached files;
list at the end (for the editor, not for publication) any claim you could not
trace to a source.
```

## Editor's checklist (apply to the returned draft, before publication)

- [ ] Culprit named only as "network distribution component" — no vendor, no element class
- [ ] Duration ~2 hours everywhere (no "90 minutes")
- [ ] Panel-2 fix phrased as design argument ("would have"), not reconstruction
- [ ] VDE quoted as attributed expert analysis, advocacy interest noted
- [ ] Common-mode critique attributed to the engagement, not to the operator's article
- [ ] CrowdStrike used only as a marked analogy (if at all)
- [ ] TS 103 147 stated factually, no negligence/liability editorialising
- [ ] CSM point framed as engagement analysis of the rulebook; DB classification stated as not public; no breach asserted or implied
- [ ] Six criteria cited from Reg (EU) 402/2013; ERA guide named as non-binding current guidance (never revised since 2009 — sharpener, if used, marked as engagement observation)
- [ ] Lineage timeline at date/release level only; final-draft (EN 301 515), reseller-preview (TS 102 281) and cover-only (Rel-16/17/18) flags respected; no clause quotes
- [ ] Pooling mechanism presented as mechanism class, never as the failed component; culprit stays "a network distribution component"
- [ ] Accident/attack strictly separated
- [ ] No pasted source text; endnote with method + DB newsblog link present
- [ ] Untraceable-claims list from cowork reviewed and resolved
