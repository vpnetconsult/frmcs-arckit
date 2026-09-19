# Pivot prompts — security visuals

**Date:** 2026-09-15 · **Companion:** `pivot-notes-2026-09-15-security.md` (the eight threads these serve) · **Predecessor:** `pivot-prompts-2026-07-02.md` (setup notes there apply: `projects/` scaffold or inline pointers; commit generated diagrams under `current/project/diagrams/`; audience = intelligent laypeople, no unexplained acronyms on the canvas).

---

## Thread 0 — "Two gates on the way back"

**Command:** `/arckit:diagram sequence`

```text
Sequence diagram titled "Why recovery took two hours: two gates in series".
Participants: Switched component · Redundant core (standby) · Operations staff · Security rules.
Flow: planned switch swap → silent software fault (no alarm) → automatic failover does NOT
engage [GATE 1: technical — the trigger never fired] → staff detect the outage by its effects →
under the rules for this scenario staff must first EXCLUDE A CYBERATTACK [GATE 2: procedural —
no time box, no named authority to proceed] → manual switch to the standby → service returns.
Mark elapsed time along the bottom (~2 h to manual recovery, per DB).
Caption: "It was not an attack. Ruling that out was a mandatory step before anyone could
switch over. The sector's own specification (SP-SEC-SuppEssFunc) has a form for exactly this
kind of security-versus-availability trade — with a mitigation column."
Sources: current/incident-annex.md; E-2026-09-15-01; E-2026-09-05-13; Q-17 in
current/project/06-ratification-readiness.md.
Honesty constraint: DB said "a switch"; do not label it a core switch. Q-17 is a proposal,
not a decision.
```

## Thread 1 — "The only witness"

**Command:** `/arckit:diagram context`

```text
Context diagram "Never let a component be the only witness to its own health".
Centre: a network element (radio core). Left: its own status report → "green" (dashed,
labelled "self-reported — trusted on 23 June"). Right: an independent out-of-band probe on a
separate path → the oversight layer → a human operator. Show two annotations on the
self-report arrow: "silent fault: says nothing" and "compromise: says what the attacker wants".
Show the oversight layer as ADVISORY (one-way glass): it alerts and explains; the human acts.
Caption: "A hacked component is a silent fault with an adversary choosing the silence.
Same failure shape, same fix: watch from outside, on a path it cannot influence."
Sources: E-2026-06-30-03 (ITU-T Q.752); ADR-012 item 5; PR5/PR11; E-2026-08-01-36 §2.3.
```

## Thread 2 — "Two calculi, one gate"

**Command:** `/arckit:diagram flow`

```text
Flow diagram "How a security finding reaches the safety gate".
Left lane SAFETY: hazard → failure rate per hour (10⁻⁹ / 10⁻⁷ targets) → severity class →
change gate. Right lane SECURITY: abuse case → attack graph → exposure × vulnerability →
likelihood + impact − 1 → risk → security level target (SL-T 0–4). Between lanes a
translation box: "express the attack in the safety system's own words — delete / corrupt /
delay / withhold — and judge it as THAT hazard". Below: "maps to no known hazard? → escalate
the change one class". Single gate at the bottom.
Caption: "Safety risk is a probability; attack risk is not. The German research programme
runs them as separate projects. So the gate does not average them — it makes the security
finding speak safety at the point of detection."
Sources: E-2026-08-19-06/-07/-12; ADR-012 "The gate's adjudication rule"; E-2026-09-10-01
(ERORAT scales). Do not cite DIN VDE V 0831-103/-104 content.
```

## Thread 3 — "Two clocks, one estate"

**Command:** `/arckit:diagram context`

```text
Two-column diagram "Patch in hours vs change under authorisation".
Left column: cyber authority (BSI) — "serious vulnerability: triage to rollout in minutes to a
few hours; 'a few days' is not adequate". Right column: railway authorisation — "every change
to a live safety-carrying system is classed, assessed and gated". Centre: ONE operator, ONE
estate. Resolution shown as a horizontal split of the estate: IT-side / undefended equipment
→ left clock, no rail gate; vital / safety-certified equipment → right clock, no exceptions,
"slow-patch exposure recorded as an accepted cost". Footer row: three reporting clocks
(24 h / 72 h / one month; 24 h / 72 h / 14 days after a fix exists).
Caption: "Both are law. Urgency squares neither. Split the estate by population, and ask the
update question BEFORE you buy: can it take a patch at all, how, how fast, for how long?"
Sources: PR16; ADR-012 items 1–4; E-2026-09-04-17; E-2026-09-04-14.
```

## Thread 4 — "Legacy is a capability, not an age"

**Command:** `/arckit:diagram context`

```text
Diagram "One estate, two eras, one attacker's price".
Show GSM-R (2G core, interconnect fabric) and FRMCS (5G SA core) side by side, joined by the
interworking gateway, under a single banner "parallel run: a decade". Mark the 2G
interconnect with "operational interconnect security: no rail owner" and an implant icon
labelled "pre-positioned bridgehead". Add a callout on a NEW FRMCS box: "delivered 2027, not
built to current specs → also legacy".
Caption: "The operator-side expert group defines 'legacy' by missing capability, regardless
of age. The transition period is the exposure; its length is a security parameter."
Sources: E-2026-09-05-07 (RSEG 25E157 §3.2, 24E122); sdo-mapping §4a; E-2026-07-26-13;
E-2026-07-20-01. Honesty: GSMA interconnect guidelines are member-only, not on file.
```

## Thread 5 — "Build-to, not proof"

**Command:** `/arckit:diagram flow`

```text
Timeline/ladder "From specification to attestation — where FRMCS security stands in 2026".
Rungs, bottom to top, each with its status: sector security specs v1.1 (RELEASED 03/2026 —
"certification and CE conformity not included") → EU Agency opinion on FRMCS specs (2024 —
"may not be used for conformity assessment") → list of requirements a notified body would
verify (DOES NOT EXIST — Agency asks for it) → multi-vendor interoperability demonstration
(UNDER WAY, not complete) → certification scheme (CANDIDATE, pending IEC 62443-6-2) →
successor standard IEC 63452 (~2028) → attested product (NONE).
Caption: "A buyer can demand every rung by contract. Nobody can yet attest one."
Sources: E-2026-09-05-12/-13; E-2026-09-06-07; E-2026-09-06-02; E-2026-08-01-17;
ADR-012 item 1 ceiling clause. Re-check every date before print.
```

## Thread 6 — "Raise the bar and build the ramp"

**Command:** `/arckit:diagram context`

```text
Scatter-style sketch "Security maturity rises with company size (r = .42)" — large IM at top
right, non-federal railways and small operators bottom left. Draw the procurement gate as a
horizontal bar (ISO 27001 + IEC 62443-4-1 ML 3) that cuts below the large operators and
above the small ones. Add a second element labelled "supported variant" — a ramp from the
small cluster up to the bar.
Caption: "The clause the sector wrote is a size filter. The pattern that gets small operators
through has to be supported, not merely required."
Sources: E-2026-08-19-13; ADR-013 constraint 3; ADR-012 item 1 (minuted consequence);
ADR-009 items 7 and 11. Do not use vendor install-base figures.
```

## Thread 7 — "The watcher is a product too"

**Command:** `/arckit:diagram context`

```text
Boundary diagram "One line, three arguments". Certified safety core (interlocking, ETCS,
radio bearer) inside a heavy boundary. Outside it, the AI oversight layer behind one-way
glass: sees everything, alerts and explains, never actuates. Annotate the boundary with three
labels pointing at the same line: SAFETY ("not a safety component — SIL-4 case does not
depend on it") · AI REGULATION ("outside the high-risk list only while it stays outside —
conditional, never automatic") · CYBER LAW ("a product with digital elements: secure by
design, support period, bill of materials — like any radio").
Caption: "The boundary that keeps the AI out of the safety case is the same boundary that
answers 'you've added an attack surface' and 'you've added an unregulated AI'."
Sources: ADR-002; ADR-003; ADR-004; ADR-012 Context and Decision items 1 and 3;
E-2026-08-20-22; E-2026-08-03-03 (RFC 9315 dual loop).
```
