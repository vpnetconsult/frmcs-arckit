# Baseline 2026-06-24

Frozen (UTC): 2026-06-24T08:57:59Z
Files: 19

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 5 |
| Strengthened post-incident | 1 |
| Open | 1 |
| Proposed | 4 |
| Recommended | 1 |

Evidence entries logged: 6

## Changes vs 2026-06-24

- changed: evidence-log.md
- added:   project/ADR-003-eu-ai-act-classification.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -12,7 +12,8 @@
 | E-2026-06-24-02 | 2026-06-24 | Outage was known/recurring; political reaction reactive ("fassungslos") | News | heise; verkehrsrundschau | C | R12 | validate | Confirms the awareness gap thesis behind R12 |
 | E-2026-06-24-03 | 2026-06-24 | FRMCS = UIC-designated successor; 5G SA + MCX; trials 2026, V3 ~2027; GSM-R EoL ~2030 | News/standards | UIC; ERA; Ericsson/Nokia/ANDREW | A/B | R1, R2, R5, R6 | validate | Underpins the ADR-001 target decision |
 | E-2026-06-24-04 | 2026-06-24 | Vendor/RFP landscape: Nokia + Kontron lead; MORANE2 consortium; SNCF→Kontron, UK→Systra, Adif €6.78m, ProRail→Nokia; duopoly concern | Market | IRJ; RailTech; RailwayPro; EU-Rail | A/C | R7, R8 | validate | Duopoly concern (RailwayPro) is analysis, not fact. Most deals are pilots/strategy, not national rollout |
-| E-2026-06-24-05 | 2026-06-24 | EU AI Act likely high-risk for rail-control AI — needs verification vs Annex I + CCS TSI | Regulatory | (to verify) | — | R10 | watch | Do not assert until verified — ADR-002 action item #1 |
+| E-2026-06-24-05 | 2026-06-24 | EU AI Act likely high-risk for rail-control AI — needs verification vs Annex I + CCS TSI | Regulatory | (to verify) | — | R10 | watch | Do not assert until verified — ADR-002 action item #1. Now tracked under ADR-003 |
+| E-2026-06-24-06 | 2026-06-24 | ADR-003 (EU AI Act classification & compliance posture) opened — verify high-risk vs Annex I + CCS TSI interface | Project | current/project/ADR-003-eu-ai-act-classification.md | — | R10 | watch | Status Pending; classification remains a watch item — high-risk not asserted as fact until verified to A-tier sources |
 
 ## How to append
 
```
