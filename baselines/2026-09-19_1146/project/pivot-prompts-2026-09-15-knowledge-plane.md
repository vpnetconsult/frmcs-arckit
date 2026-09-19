# Pivot prompts — knowledge plane visuals

**Date:** 2026-09-15 · **Companion:** `pivot-notes-2026-09-15-knowledge-plane.md` (eight threads) · Setup notes as in `pivot-prompts-2026-07-02.md` (inline source pointers; generated diagrams under `current/project/diagrams/`; audience = intelligent laypeople; expand every acronym in the caption).

---

## Thread 0 — "Ten thousand alarms or one"

**Command:** `/arckit:diagram context`

```text
Two-panel diagram "What the agent sees with and without a map of the network".
Left panel (data only): a wall of identical alarm icons, one per base station, labelled
"10,000 alarms, 23:30, nationwide". Right panel (knowledge): the same alarms drawn as leaves
of a tree — base stations → controllers → core → one switch at the root, with the root
highlighted: "one fault". Between the panels a small box: "topology · state · meaning —
the knowledge plane".
Caption: "On 23 June the network told everyone everything and nobody anything. Knowing
which site hangs off which core turns ten thousand alarms into one question."
Sources: ADR-002 items 3 and 9; project/gsmr-e2e-equipment-map.md;
project/finding-dbinfrago-rel4-core-architecture.md; R3; E-2026-09-15-03.
Honesty: the map is a specification target (ADR-002 item 9 open), not a built system.
```

## Thread 1 — "Stale looks like settled"

**Command:** `/arckit:diagram context`

```text
Diagram "Two facts, indistinguishable from outside". Two identical index cards, each reading
"Core switch A backs up core switch B". Card 1 has a footer: "source: vendor drawing 2019 ·
last verified: never". Card 2: "source: site survey · last verified: 2026-09-01". An agent
icon reads both with equal confidence. Below: the rule — "no last-verified date = unverified".
Caption: "A decision nobody re-reads and a network fact nobody re-checks fail the same way:
they look current until the day they aren't. Every fact carries who said it, when, and when
it was last checked."
Sources: evidence-log.md rule 4; linkedin-post-decision-drift.md; ADR-002 items 7 and 9;
ADR-007 item 2 (2026-09-15 entry conditions); E-2026-09-15-03/-04/-06.
```

## Thread 2 — "One place to lie to the system"

**Command:** `/arckit:diagram sequence`

```text
Sequence diagram "How a poisoned map becomes a wrong action". Participants: Attacker ·
Knowledge store · Oversight agent · Human operator · Network.
Flow: attacker writes a false dependency into the store → agent reasons over it and proposes
a fallback route → human, trusting the advice, approves → network is reconfigured wrongly.
Mark the point where the proposal "enters class 4" (the moment the human acts on it).
Overlay three controls at the store: access control · cryptographic integrity check ·
anomaly detection inside the model.
Caption: "The watcher is software, so its memory is a product with digital elements —
same secure-by-design, integrity and audit duties as a cab radio."
Sources: E-2026-09-15-06 (ETSI WP 69 §5.2.2 worked case); ADR-002 item 9(iv) and §5
anti-laundering; ADR-012 Decision item 1; ADR-007 surface 6.
```

## Thread 3 — "The seam FRMCS leaves open"

**Command:** `/arckit:diagram context`

```text
Layered diagram "What FRMCS mandates and what it inherits". Bottom: 3GPP 5G core + radio.
Middle: FRMCS profile (mission-critical services, security, on-board gateway) — drawn as a
bracket labelled "mandated by rail specs". Top: management plane (intent, knowledge graph,
closed loops — 3GPP SA5 · ETSI ENI/ZSM · TM Forum) — drawn OUTSIDE the bracket, labelled
"inherited with the core; no rail specification reaches it". A second bracket on the right:
"or bought from a public mobile operator (FRMCS-T) — their autonomy, your SLA".
Caption: "Rail specifies the radio, the services and the security. How the network is
managed — and how autonomous that management becomes — arrives unmentioned."
Sources: sdo-mapping-frmcs-gsmr-5gsa.md §1b; E-2026-08-01-21 (FFFIS-7950 reference list);
E-2026-09-06-03 (public-MNO intentions); E-2026-08-01-25/-24 (FRMCS-T); R9.
Honesty: absence in the references held, not proof of absence in the full corpus.
```

## Thread 4 — "Two minds in one industry"

**Command:** `/arckit:diagram context`

```text
Ladder diagram "Where the human sits — telecom's own definitions vs the rail ladder".
Left: ETSI autonomy levels L0–L5 with L4 annotated "decision typically needs human
approval" and L5 "machine self-decision". Middle: ETSI's four modes for AI security-policy
change — recommendation-only / supervised / domain-restricted ("critical infrastructure
under direct human control") / full. Right: ADR-002 decision classes 1–4 with class 4
"human-in-command, never autonomous" and a hard stop above it. A speech bubble off to the
side, attributed: "We have to remove the human from the loop…" (operator architect, 2026).
Caption: "The industry's formal definitions keep a human on the approval step at Level 4.
The rail difference is one sentence: safety-critical actuation never reaches Level 5."
Sources: E-2026-09-15-05 (WP 64 Table 2.1); E-2026-09-15-06 (WP 69 §4.2.6, §3.2);
E-2026-09-15-03 (Telstra quote); ADR-002 Decision + §Trade-off analysis; ADR-012 items 2/3.
```

## Thread 5 — "A twin is a claim"

**Command:** `/arckit:diagram flow`

```text
Flow diagram "Using a network copy before touching the real network". Steps: proposed change
→ apply to digital twin → fault injection + regression → verdict → change gate → live
network. Draw a gate before the twin labelled "fidelity check: does the copy mirror the
real network? (ODD declared · model validity · scenario coverage · uncertainty stated)".
Draw the failure path in red: untrusted twin → confident wrong verdict → live safety element.
Caption: "Both telecom SDOs want a digital twin for exactly what a rail change gate wants.
But a twin only proves things about a network it faithfully mirrors — and both concede the
mirroring is the unsolved part."
Sources: E-2026-09-15-05 (WP 64 use case 2, §4.5); E-2026-09-15-06 (WP 69 §4.1.5);
ADR-007 (pre-change gate; fidelity flag); ADR-010 items 5 and 11; ADR-011.
```

## Thread 6 — "Context cannot be added afterwards"

**Command:** `/arckit:diagram context`

```text
Diagram "Why the old management stack cannot feed a knowledge plane". A network element on
the left emits three things: an alarm with no generation timestamp; a performance counter
averaged over 15 minutes (draw a spike being flattened); a log line in free text. An arrow
to a central system labelled "context cannot be retroactively added once the data leaves
the network". Below, the three entry conditions: timestamp at generation · resolution vs
the fault's timescale · inventory reconciled on a stated date.
Caption: "Grounding agents in knowledge presumes the knowledge can be built. In rail the
first task is instrumentation and reconciliation, not reasoning."
Sources: E-2026-09-15-04 (IG1343 §2.2.1, Appendix A); ADR-007 item 2; PR5; PR8;
E-2026-08-19-13 (Detect 1.03 / Respond 0.69).
```

## Thread 7 — "A knowledge plane in Markdown"

**Command:** `/arckit:diagram context`

```text
Diagram "The register as a knowledge plane". Boxes: evidence log (466 rows: date · tier ·
source · requirements touched · 'did it move a decision?') → traceability matrix
(requirements ↔ decisions ↔ status) → decision records with review dates → daily frozen
baseline with a health block (ADRs accepted · items open/closed · revise rate). Two agents
read it: Architecture Decision Agent, Assurance Agent. Two annotations: "caught its own
drift, 2026-08-15" and "caught its own corruption, 2026-09-04 (15 zeroed files)".
Caption: "Persistent, structured, provenance-tracked, reasoned over — and it has already
failed and recovered twice. The lesson for the network-side plane is the discipline, not the
technology."
Sources: ADR-002 items 3 and 7; evidence-log.md rule 4; CLAUDE.md §Never and §Daily loop;
E-2026-09-15-03 (knowledge-plane purpose); E-2026-09-15-06 (§5.4 rec. 6).
Honesty: hundreds of rows, human-curated; says nothing about scale, latency or federation.
```
