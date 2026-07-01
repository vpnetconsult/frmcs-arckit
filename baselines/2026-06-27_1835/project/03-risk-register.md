# Project risk register — Agentic AI autonomous oversight

**Date:** 2026-06-27 · Severity = likelihood × impact. Review weekly; tie mitigations to gates.

| ID | Risk | Sev | Mitigation | Owner | Gate |
|---|---|---|---|---|---|
| PR1 | Scope creep into autonomous safety actuation | High | Hard charter boundary; safety-critical class = human-in-command only; NSA in gate reviews | Vpnet + NSA | G0/G5 |
| PR2 | EU AI Act classification wrong / unverified | High | Verify vs Annex I + CCS TSI before architecture (ADR-002 #1); do not assert until verified | Vpnet + AI-gov | G0 |
| PR3 | SIL-4 certifiability breaks if agent touches the kernel | High | Deterministic kernel outside the learning agents; agent advises only; CENELEC boundary | IM + Vpnet | G0/G4 |
| PR4 | Automation bias — humans rubber-stamp proposals | High | Dissent-rate metric; legible rationale; oversight-effectiveness tests count toward G4 | Vpnet | G4 |
| PR5 | Telemetry insufficient to detect central-SPOF signature | Med | As-is telemetry inventory at G1; instrument gaps before build. VALIDATED by the 23 Jun confirmed cause — the fault was silent/undetected (E-2026-06-27-01) | IM + Vpnet | G1 |
| PR6 | Model drift degrades agent reliability in operation | Med | Drift monitoring on daily baselines; auto-demote to advisory on threshold breach | Vpnet | G5 |
| PR7 | Vendor/bearer dependency (Nokia–Kontron concentration) | Med | Decouple oversight layer from bearer specifics; standard interfaces; Bid/RFP agent flags lock-in | Vpnet | G2 |
| PR8 | Incident-replay not representative (DB root cause unpublished) | Med | Treat replay as inference-based; broaden test set; update when DB publishes mechanism | Vpnet | G3 |
| PR9 | Accountability ambiguity at handover to human-in-command | Med | RACI per decision class; named roles; run-book for each gate transition | IM + Vpnet | G4/G5 |
| PR10 | Evidence/audit trail gaps undermine the safety case | Low | Assurance agent emits the evidence chain; daily baseline is the audit trail | Vpnet | G4 |
| PR11 | Redundancy defeated by an undetected/silent fault — auto-failover not triggered (the DB-confirmed 23 Jun mode, E-2026-06-27-01); reproduced in FRMCS if 5GC/IMS/UDM/HSS failover isn't health-driven | High | Geo-redundant 5GC + IMS AND health-/detection-driven automatic failover, not N+1 alone (R3 / ADR-001); continuous fault detection (R12). NB: earlier HLR/VLR-specific framing superseded — confirmed element was a network distribution component (see incident-annex.md) | IM + Vpnet | G1/G2 |

## Top three to watch

PR1, PR2, PR3 are the existential ones — they decide whether the system is *certifiable and lawful at all*. They are all G0 gates: none can be deferred past mobilisation.
