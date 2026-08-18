# Baseline 2026-08-18

Frozen (UTC): 2026-08-18T19:27:47Z
Files: 68

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 7 |
| Strengthened post-incident | 1 |
| Open | 3 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 339

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 3 of 9 |
| ADRs Proposed | 6 of 9 |
| ADR action items closed / open | 7 / 51 |
| Evidence rows: revise | 18 |
| Evidence rows: validate | 220 |
| Evidence rows: watch | 101 |
| **Revise rate** | **5%** |

> **Revise rate below 10%.** Incoming evidence is almost never changing a decision.
> That is either a settled question or a disconnected wire — check which.

## Changes vs 2026-08-18


### Living-doc diffs
