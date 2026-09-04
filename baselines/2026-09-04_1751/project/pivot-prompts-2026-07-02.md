# Pivot prompts — arcKit commands for the article/letter visuals

**Date:** 2026-07-02 · **Companion:** `pivot-notes-2026-07-02.md` (the six threads these visuals serve)
**Purpose:** ready-to-paste arcKit commands, one visual (or set) per thread, in layman terms. Each block below is a complete prompt — copy the fenced text into the command as its argument.

**Setup notes (read once):**
- arcKit expects a `projects/` scaffold this repo doesn't have. EITHER run `/arckit:init` (or `/arckit:create frmcs-pivot`) once, OR rely on the prompts below carrying their source-file pointers inline (they do).
- Existing artefacts to refresh rather than recreate: `project/silent-fault-failover-cascade-sequence.md`, `project/oversight-sil4-boundary-context.md`, `project/wardley-gsmr-frmcs-transition.md`, `diagrams/asis-tobe-how-light.svg`, `diagrams/agentic-governance-*.svg`, `project/diagrams/phase-gate-light.svg`.
- Output convention: commit generated diagram markdown under `current/project/diagrams/` so the daily baseline freezes them with everything else.
- Audience for ALL visuals: intelligent laypeople (policy makers, journalists, managers). No unexplained acronyms on the canvas; expand on first use in captions.

---

## Thread 0 — "Silence means stop" (MA protocol worked)

**Command:** `/arckit:diagram sequence`

```text
Create a layman-titled sequence diagram "Why no train was in danger on 23 June".
Participants: Train (onboard computer) · Radio network (GSM-R) · Control centre (RBC/dispatcher).
Flow: radio network dies (silent fault) → no new Movement Authority ("permission slip to
proceed") reaches the train → the onboard computer enforces its last Supervised Location
(the fail-safe boundary it must never pass) → the train brakes to a controlled stop →
operations degrade to written orders dictated by dispatchers (the Befehl procedure) →
~90 minutes of manual recovery, then normal service.
Annotate two outcome lanes at the bottom: SAFETY = HELD (deny-by-default worked) ·
CONTINUITY = FAILED (nationwide standstill).
Caption: "The system is designed so that silence means stop. On 23 June, 'safe' held and
'continuous' failed."
Sources: current/incident-annex.md; evidence E-2026-06-27-01, E-2026-07-02-26, E-2026-07-02-33.
Honesty constraint: phrase as "loss of communication degraded to safe standstill by design",
NOT "ETCS L2 saved the day".
```

**Simpler letter variant:** `/arckit:diagram context` — three boxes (Train · Radio · Control centre), one red X on the radio link, train shown stopped with a green "SAFE" badge and a red "STOPPED" badge.

---

## Thread 1 — "Anatomy of a silent fault"

**Command:** `/arckit:diagram sequence`

```text
Create a two-panel sequence diagram "Anatomy of a silent fault — and the fix".
PANEL 1 (what happened): planned component swap during maintenance → software fault that
raises NO alarm → health monitoring still shows green → automatic failover to the fully
functional backup NEVER triggers → nationwide outage → ~90 minutes of manual recovery.
PANEL 2 (the fix, same start): component swap → silent fault → an INDEPENDENT out-of-band
monitor (a listening probe that does not trust the component's own self-report; ITU-T Q.752
style) detects the traffic anomaly → failover triggers automatically → seconds of disruption.
Caption: "A component that lies about its health cannot be its own alarm. Prove the trigger
fires — not that the backup exists."
Sources: current/incident-annex.md; ADR-007; risk register PR5/PR11;
evidence E-2026-06-27-01/-02/-03, E-2026-06-30-03, E-2026-07-01-09.
Note for panel 2 caption: ETSI TS 103 147 already MANDATES automatic switchover — 23 June
was a non-conformance to an existing standard, not an unforeseeable event.
```

**Companion table:** `/arckit:impact PR11` — blast-radius table of everything hanging off the silent-fault lesson (sidebar material).

**Refresh path:** update `project/silent-fault-failover-cascade-sequence.md` instead of starting fresh.

---

## Thread 2 — "Two rooms, one door, human holds the key" (AI boundary)

**Command:** `/arckit:diagram context` (PlantUML output recommended — richer boundary styling)

```text
Create a layman C4 context diagram "Two rooms, one door — where the AI is allowed to live".
LEFT (vital room, thick certified border): the safety core — interlocking, train control
(ETCS), movement-authority enforcement. Deterministic, certified to the highest safety level
(SIL 4), unchanged by the AI's presence.
RIGHT (advisory room): the learning agents — Risk Sentinel (watches), Assurance (collects
evidence), decision support (explains). They see everything through ONE-WAY GLASS (read-only
telemetry) and can never write into the vital room.
BETWEEN: one door, and a HUMAN holds the only key — every safety-relevant action passes
through a human decision; the agent cannot close the loop.
Annotate three real-world adoptions of this exact pattern, in the operator's own words:
(1) DB's CTMS traffic AI — "not being designed as a safety-critical system" (E-2026-07-02-14);
(2) AutomatedTrain GoA-4 — deliberate NO-AI-in-safety-critical-paths decision (E-2026-07-02-19);
(3) iLBS — non-safety operating layer over a safety-enforcing interlocking, in operation
(E-2026-07-02-09).
Caption: "Oversight, not control. The boundary is also the legal argument: the EU AI Act
'not high-risk' classification holds only while the AI cannot act."
Sources: ADR-004, ADR-003, project/oversight-sil4-boundary-context.md.
```

**Refresh path:** `diagrams/agentic-governance-*.svg` carry the house style; keep it consistent.

---

## Thread 3 — "Bound the human's load" (automation bias)

**Command:** `/arckit:diagram` (flowchart)

```text
Create a two-part layman flowchart "Why unlimited alerts make humans rubber-stamp — and the fix".
PART 1 (the failure loop): more alerts per operator → less time per decision → approval
becomes a reflex → the human 'oversight' is a rubber stamp → automation bias wins silently.
PART 2 (the governed loop, from the rail sector's own proposal): set an ALERT BUDGET /
decision-rate limit per operator → score each project's complexity and human-error
probability with a standardised matrix (five-step 'reasonableness' model) → an INDEPENDENT
expert panel signs off the score → revalidate at every project phase gate → if the budget
is exceeded, reduce alerts or add people — do not proceed.
Caption: "Human oversight is a resource with a capacity limit. The rail sector is writing
that limit into its own safety process (CSM-RA reasonableness factor) — an AI oversight
layer should inherit it."
Sources: risk register PR4; evidence E-2026-07-02-13, E-2026-07-02-23;
supporting colour E-2026-07-02-24 (validated safe default: under uncertainty, do nothing →
the system stops safely) and E-2026-07-02-29 (report 'unknown', never coast on stale 'confirmed').
Honesty constraint: mark the five-step model as ongoing research (dissertations, pilots
pending), not adopted regulation.
```

---

## Thread 4 — "The bar FRMCS must clear" (MCX equivalence)

**Command:** `/arckit:diagram` (layered flowchart + timeline strip)

```text
Create a layman layer diagram "Equivalence to what, exactly? The bar FRMCS must clear".
Three stacked layers, bottom-up:
(1) EIRENE FRS 8.1.0 — WHAT railways functionally need (emergency calls, group calls,
priority pre-emption, functional addressing). Mandatory under EU law (CCS TSI Annex A).
(2) EIRENE SRS 16.1.0 — HOW a compliant network must behave (system requirements;
refined over 25 years of controlled change requests).
(3) UIC Doc 3114 test catalogue — HOW an independent notified body PROVES it (658 pages
of test cases).
Call out the hard numbers as badges: railway emergency call set-up < 2 s · group call < 5 s ·
achieved in 95 % of cases · coverage 95 % probability at defined signal strengths.
Mark three OPEN PADLOCKS on the FRMCS/MCX side (gaps still open in 3GPP): rail group
affiliation · functional-alias termination · end-to-end security (optional, to be defined).
TIMELINE STRIP underneath: 2021 promise "FRMCS products to market 2025" (5GRAIL brochure)
→ reality "first market-ready spec Q3 2027" (MORANE-2) = a documented 2-year slip from the
sector's own papers.
Caption: "'As good as GSM-R' is measurable — and the clock that measures it has already
slipped two years."
Sources: E-2026-07-02-30/-31/-32, E-2026-07-01-10, E-2026-06-24-18, E-2026-07-02-28 vs
E-2026-07-02-15; risk register PR15; ADR-007 surface (e).
Honesty constraints: only (MI)-marked EIRENE requirements are certification-binding;
UIC 3114 is a 2013 draft on superseded baselines (methodology stands, cases need currency-check).
```

---

## Thread 5 — "More weight on the wire, thinner net beneath it"

**Command:** `/arckit:wardley` (update pass on the existing map)

```text
Update the existing Wardley map (project/wardley-gsmr-frmcs-transition.md) into a layman
evolution map of the rail communication stack, anchor "safe, continuous rail operations".
Components (visibility top→bottom, evolution left→right):
- Written orders / Befehl procedure (human fallback; commodity practice — but SHRINKING:
  of 9 harmonised orders only 4 survive in the target system, all conditioned on a working
  radio link; E-2026-07-02-26)
- GSM-R (commodity, obsolescing ~2030; the 23-Jun single point of failure)
- FRMCS / MCX (product-emerging; spec-ready Q3 2027; equivalence bar per thread 4)
- Hybrid multipath / public-5G fallback (custom→product; FIELD-PROVEN 2.0 s switchover,
  but the trigger-less replication mode is LAB-ONLY; E-2026-07-02-21)
- Geo-redundant ground estate (cold standby now → virtualised warm standby Zielbild;
  E-2026-07-02-25)
Movement arrows: safety functions migrating ONTO the bearer (written orders → technical
solutions over radio) while the human-procedural net beneath thins.
Annotation: "A network that can only stop is safe but not resilient. The target system
raises the price of every outage — and the trigger problem (thread 1) is not yet closed
for the target either."
Sources: E-2026-07-02-26, E-2026-07-02-21, E-2026-07-02-10, E-2026-07-02-25;
matrix rows R3/R4 (both open).
```

**Companion:** `/arckit:diagram deployment`

```text
Create a layman deployment diagram "The target ground estate — and its one designed-in risk".
Two data centres (primary DTZ active · fallback DTZ cold standby), track field connected to
exactly ONE at a time; a sync arrow labelled "every change promptly copied to the fallback"
flagged RED as the common-mode channel (one bad update reaches both sides); an annotation
that the isolated cold fallback cannot be fully end-to-end tested (operator's own admission);
disaster switchover marked as MANUAL BY DESIGN (human decision, regularly practised) vs
element failover AUTOMATIC (independent detection).
Caption: "Geo-redundancy against destruction — but identical software on both sides is the
sameness the 23-Jun lesson warns about."
Sources: E-2026-07-02-25; risk register PR11; ADR-007.
```

---

## Cross-cutting — run once before drafting

| Command | Purpose |
|---|---|
| `/arckit:health` | Sanity scan (stale drafts, orphaned refs, overdue reviews) — catches embarrassments before publication |
| `/arckit:traceability` (if present) | Regenerate the claim→evidence table = per-article citation appendix |
| `/arckit:impact PR11` | Blast-radius table for thread 1 sidebar |

## Workflow into Claude cowork

1. Run the commands above; each yields a markdown artefact with an embedded Mermaid/PlantUML block.
2. Commit generated artefacts under `current/project/diagrams/` → next baseline freezes them.
3. Hand cowork, per article: `pivot-notes-2026-07-02.md` (the thread) + the relevant diagram file(s) + the thread's evidence rows from `current/evidence-log.md`.
4. Drafting constraints for cowork (paste into its instructions): paraphrase and cite, never paste copyrighted S+D/EI/UIC text; keep the oversight-not-control guardrail verbatim; do not assert the EU AI Act classification as settled; mark opinion as opinion; carry each thread's "Limits" paragraph into the draft as caveats.
