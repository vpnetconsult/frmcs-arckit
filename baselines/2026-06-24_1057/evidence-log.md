# Evidence log

The running record of evidence (news, feedback, primary documents) as it arrives. Append a row each time something lands; tie it to the requirement(s) it affects, give it a trust tier, and note the action taken (revise / validate / no-change). The daily baseline freezes this file, so the evolution of the evidence base is visible across days.

**ID convention:** `E-YYYY-MM-DD-NN` (NN = sequence within the day).
**Trust tiers:** A = primary/authoritative · B = vendor-primary (true but promotional) · C = specialist trade press · D = secondary/aggregator. (See ADR-001 source-trust assessment.)
**Action:** `revise` (changed a decision/status) · `validate` (confirmed an existing one) · `watch` (noted, no change yet).

| ID | Date | Item | Type | Source | Tier | Affects | Action | Note |
|---|---|---|---|---|---|---|---|---|
| E-2026-06-24-01 | 2026-06-24 | DB GSM-R nationwide outage, ~2h standstill 23–24 Jun | News | dpa-fed outlets; heise | A/C | R3, R4 | revise | Promoted R3/R4 from "assumed" to load-bearing-open. See incident-annex.md |
| E-2026-06-24-02 | 2026-06-24 | Outage was known/recurring; political reaction reactive ("fassungslos") | News | heise; verkehrsrundschau | C | R12 | validate | Confirms the awareness gap thesis behind R12 |
| E-2026-06-24-03 | 2026-06-24 | FRMCS = UIC-designated successor; 5G SA + MCX; trials 2026, V3 ~2027; GSM-R EoL ~2030 | News/standards | UIC; ERA; Ericsson/Nokia/ANDREW | A/B | R1, R2, R5, R6 | validate | Underpins the ADR-001 target decision |
| E-2026-06-24-04 | 2026-06-24 | Vendor/RFP landscape: Nokia + Kontron lead; MORANE2 consortium; SNCF→Kontron, UK→Systra, Adif €6.78m, ProRail→Nokia; duopoly concern | Market | IRJ; RailTech; RailwayPro; EU-Rail | A/C | R7, R8 | validate | Duopoly concern (RailwayPro) is analysis, not fact. Most deals are pilots/strategy, not national rollout |
| E-2026-06-24-05 | 2026-06-24 | EU AI Act likely high-risk for rail-control AI — needs verification vs Annex I + CCS TSI | Regulatory | (to verify) | — | R10 | watch | Do not assert until verified — ADR-002 action item #1. Now tracked under ADR-003 |
| E-2026-06-24-06 | 2026-06-24 | ADR-003 (EU AI Act classification & compliance posture) opened — verify high-risk vs Annex I + CCS TSI interface | Project | current/project/ADR-003-eu-ai-act-classification.md | — | R10 | watch | Status Pending; classification remains a watch item — high-risk not asserted as fact until verified to A-tier sources |

## How to append

When something arrives during the day:
1. Add a row with the next `E-` id.
2. Set the trust tier honestly (A–D). Discount vendor superlatives; mark opinion as opinion.
3. Note which requirement(s) it touches and the action.
4. If it changes a decision or status, also edit traceability-matrix.md and the relevant ADR, then note "revise" here.
5. At end of day, run `scripts/baseline.sh` to freeze the state.

## Open threads to validate (carried forward)

- EU AI Act high-risk classification for rail-control AI (R10) — verify against Annex I and the CCS TSI interface.
- DB root-cause mechanism for the 23–24 Jun outage — currently inference only (R3).
- Whether Schnieder / any Land issues a statement later on 24 Jun (incident-annex.md political section).
- Primary verification of national tenders (SNCF, Adif figures) against operator portals, not trade press (R8).
