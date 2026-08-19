# Baseline 2026-08-19

Frozen (UTC): 2026-08-19T21:31:01Z
Files: 70

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 7 |
| Strengthened post-incident | 1 |
| Open | 3 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 359

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 3 of 9 |
| ADRs Proposed | 6 of 9 |
| ADR action items closed / open | 7 / 57 |
| Evidence rows: revise | 29 |
| Evidence rows: validate | 226 |
| Evidence rows: watch | 104 |
| **Revise rate** | **8%** |

> **Revise rate below 10%.** Incoming evidence is almost never changing a decision.
> That is either a settled question or a disconnected wire — check which.

## Changes vs 2026-08-19_2328

- changed: project/08-eba-consultation-2026-08-18.md

### Living-doc diffs
