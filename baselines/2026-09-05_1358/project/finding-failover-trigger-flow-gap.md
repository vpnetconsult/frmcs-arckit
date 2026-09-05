# Finding: the failover-trigger flow is characterised, not documented — and the failed layer is the undocumented one

> Standalone finding. Records what the evidence base does and does not hold about the "trigger
> that did not fire" on 23 June. Companion to `diagrams/ARC-FRMCS-DIAG-009-failover-trigger-flow-v1.0.md`.

## Document control

| Field | Value |
|---|---|
| Document ID | ARC-FRMCS-FIND-TRIGGER-GAP-v1.0 |
| Type | Finding (evidence-coverage assessment) |
| Project | FRMCS arcKit — GSM-R→FRMCS transition + agentic oversight |
| Classification | INTERNAL (inference-based; culprit layer quarantined) |
| Status | DRAFT · Version 1.0 · 2026-07-26 · Owner: Vpnet engagement lead |
| Companion | DIAG-009 (the traced flow); DIAG-001/002; ADR-007; `gsmr-e2e-equipment-map.md` |

---

## 1. Finding

The record **characterises** the automatic-failover trigger and **mandates** it, but it does **not
document a happy-path trigger flow of the actual estate** — and, more sharply, **the standards on
file describe the core-node trigger, whereas the 23-June fault was in the transmission/distribution
layer, whose trigger is unpublished and quarantined.** So "the trigger that did not fire" is a
named, characterised thing — not a traced flow of the layer that actually failed.

## 2. What the record HAS

| Element | Source | Tier |
|---|---|---|
| **The mandate** — switchover must be automatic, "no manual" | TS 103 147 §4.2 (E-2026-07-01-09) | A |
| **The mechanism class** — a *health-driven / self-report* trigger, "fails when the component lies about its health" | PR11 (engagement analysis) | — |
| **Core-node failover mechanism** — MSC-pool / RANflex re-selection | TS 123 236 (E-2026-07-05-08) | A |
| **A-interface failure *recovery*** — BSSMAP RESET + SCCP connection management (recovery *after* failure, not the trigger) | TS 100 590 / GSM 08.08 (E-2026-07-26-09) | A |
| **A simplified design sequence** — component → built-in health monitoring → (no trigger) → backup | DIAG-002 (engagement, layman) | — |
| **The confirmed break** — silent fault → no alarm → auto-failover never engaged → manual recovery | DB (E-2026-06-27-01/-03) | A |
| **The fix** — independent out-of-band detection triggers on actual traffic | Q.752 (E-2026-06-30-03) | A |

## 3. What the record LACKS (two gaps)

1. **No sourced, technical happy-path trigger flow of DB's estate.** DB has not published the
   telemetry or the specific trigger mechanism — incident-replay is inference-based (**PR8**).
   DIAG-009 reconstructs the *intended* flow from the standards; it is not DB's actual one.
2. **The standards cover the wrong layer.** TS 103 147 / TS 123 236 / TS 100 590 document the
   **core-node** (MSC / A-interface) trigger and recovery. But DB located the 23-June fault in
   *"a network distribution component"* — the **transmission / distribution layer**. **No standard
   and no DB source on file describes that layer's failover trigger**; it sits inside the culprit
   quarantine. Even the full standards set the engagement has assembled does not reach the trigger
   that actually failed.

## 4. Why it matters

- **It sharpens, not softens, the thesis.** The mandate exists (TS 103 147), the redundancy existed
  (2 geo-redundant Call Servers — DB-Rel-4 finding), yet the trigger was defeated at the *detection*
  step. "Prove the trigger fires" (ADR-007 / PR11) is the lesson precisely because the trigger flow
  is under-documented and the failed layer is opaque.
- **It explains why the fix is out-of-band, not in-band.** Because the failing layer's own trigger is
  unpublished/quarantined and a self-report trigger is defeated by a silent fault, the only
  layer-agnostic answer is **independent detection on the actual traffic** (Q.752) — it works
  whatever lied, at whatever layer.
- **It names a concrete verify-at-primary ask.** To close gap (1)/(2): obtain DB's failover-trigger
  and detection design for the distribution layer (and confirm the SCP/redundancy questions of the
  DB-Rel-4 finding). Until then, DIAG-009 stands as an *intended-flow* reconstruction.

## 5. Requirements traceability

| Requirement | Bearing |
|---|---|
| PR11 (silent-fault / health-driven trigger) | The break is at detection — the core of this finding |
| PR8 (replay inference-based until DB publishes) | Both gaps rest on the unpublished trigger flow |
| PR5 (SPOF-signature telemetry) | The out-of-band-detection answer to the gap |
| R3 / R4 | The failover the trigger should protect (SPOF / fail-soft) |
| ADR-007 (prove the trigger fires) | The finding is the evidence-coverage case for ADR-007 |

## 6. Evidence refs

E-2026-07-01-09 (TS 103 147 mandate) · E-2026-07-05-08 (TS 123 236 pool) · E-2026-07-26-09 (TS 100 590 A-interface recovery) · E-2026-06-27-01/-03 (silent-fault cause) · E-2026-06-30-03 (Q.752) · PR8 · PR11 · ADR-007 · DIAG-001/002/009 · `finding-dbinfrago-rel4-core-architecture.md`.

*Honesty constraints from `gsmr-e2e-equipment-map.md §10` apply: culprit quarantine absolute; the distribution-layer trigger is named by layer, never by element or vendor.*
