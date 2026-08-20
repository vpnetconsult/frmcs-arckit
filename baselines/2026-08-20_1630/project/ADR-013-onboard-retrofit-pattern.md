# ADR-013: Multi-mode, two-stage on-board FRMCS retrofit pattern

**Status:** Accepted (ARB 2026-08-15, Resolution 5) — settled internally; no external validation sought or available. **Subject to confirmation with rolling-stock owners** (condition attached by the same resolution).
**Date:** decision ratified 2026-08-15; raised as its own ADR 2026-08-20 (ARB-2026-08-15/03)
**Deciders:** ERTMS Programme · Rolling-stock owners / EVUs · Vpnet engagement lead
**Depends on:** ADR-001 (GSM-R → FRMCS transition; on-board/TOBA architecture at its action item 4), ADR-009 (fleet retrofit — external funding/approval dependency track)
**Affects requirements:** R13 (fleet-scale retrofit feasible & funded), with bearing on R2 (coexistence depends on rolling-stock readiness)

> **Why this is a separate ADR.** ARB-2026-08-15 Resolution 5 split ADR-009 into two things that had been bundled: the **retrofit pattern** (an architecture decision inside the programme's gift) and the **external dependencies** (Bund *Förderrichtlinie*, approval throughput, chipset/Release-19 supply — owned by other parties). The board's rationale, recorded verbatim: *an architecture decision should not be held hostage to a funding decision taken by another party.* This ADR carries the pattern with its own status; ADR-009 remains `Proposed` and continues to track the dependencies.
>
> **The ratification pointed to here is a real governance event** — `07-arb-minute-2026-08-15.md`, Resolution 5 — taken at a working session chaired by the engagement lead with no dissenting party present. Its limits are stated in that minute's §Composition and are inherited unchanged: not usable in a safety case, a conformance submission, or any statement to a regulator.

## Context

ADR-001's parallel run needs on the order of **16,000–21,000 DE vehicles** FRMCS-capable by ~2035. The per-vehicle intervention pattern is the one lever the architecture actually controls (ADR-009 §Trade-off). The DKS pilot established the working precedent: a **multi-mode, two-stage retrofit** at a few €k per EMU within an "aus einem Guss" approach, federally funded for 333 regional EMUs, alongside FRMCS-ready new builds (130 Alstom Coradia Max + 28 Siemens Mireo) (E-2026-06-24-21).

## Decision

Adopt the **multi-mode, two-stage retrofit** as the on-board baseline:

- **Stage 1 — during any scheduled vehicle touch:** antennas, cabling, netboxes — the invasive, approval-light physical preparation, batched into maintenance the vehicle undergoes anyway.
- **Stage 2 — near FRMCS service availability:** modems/filters + software update — the radio-specific fit, deferred until chipset/Release maturity, minimising the window between spend and use.
- **Multi-mode throughout:** hardware capable of GSM-R and FRMCS operation across the coexistence window, so a vehicle is never stranded on either side of the cutover.
- **New builds FRMCS-ready by procurement clause** (ADR-009 item 3), so the retrofit population shrinks through fleet renewal.

The pattern minimises per-vehicle cost and — decisively for R13, where the approval burden is ~30% of programme cost — **the number of approval-triggering interventions per vehicle**.

## Constraints attached by later evidence

1. **Variant-spanning test coverage (E-2026-08-15-54).** NS's fleet retrofit lost three weeks of series production to a fleet-configuration variant (4-coach IP plan) not represented in testing. Stage-1/stage-2 test benches must enumerate fleet/configuration variants (car count, looms, switch/AP topology, coach-level addressing), not just the modal configuration. Carried as ADR-009 item 5 and into the ADR-007 pre-change gate.
2. **Execution-rate grounding (E-2026-08-15-54).** The NS programme (~1200 units, first fleet in 4 months, 1 train/day, 4 mechanics/day, pre-try-out + 4 try-outs, daily second-line support) is the order-of-magnitude planning basis — NL fleet, cyber appliance not radio swap; not a transferable rate. Prefer field-replaceable units with auto-detect-and-install.
3. **Capability spread (E-2026-08-19-13).** The retrofit population includes NE-Bahnen and small EVU measurably least able to secure what they fit (maturity correlates with size, r = .42). The pattern needs a supported variant for operators without an in-house security function — carried as ADR-009 item 7.
4. **RTO fitment may share the same window (E-2026-08-20-05).** RemODtrAIn builds its remote-operation prototype explicitly for retrofit as well as new vehicles; the same estate may face FRMCS and RTO fitment against the same approval bottleneck. Watch for stage-2 scope growth.
5. **The pattern corroborated in the wild, on the DKS fleet itself (E-2026-08-20-26).** The AutomatedTrain BR 430 — already ETCS-fitted under Digitaler Knoten Stuttgart — took its sensing retrofit as a second integration on that prepared base, with **ATO-OB following in a named second Ausrüstungsstufe**: stage-1/stage-2 in practice. Integration constraints to carry into stage planning: **UIC 651 driver sight-field** limits on windscreen equipment; **antenna minimum separations against existing ETCS antennas** (eight new antennas needed layout care); **reversibility as a contractual premise** (existing fixing points reused, drillings restored on removal); and reuse of type-approved sensors via signal doublers cleared by **SVoC** rather than new fitment — an approval-burden saving in exactly the currency R13 is short of.

## Consequences

- **Easier:** ADR-001 item 4 (TOBA/on-board architecture) has a settled fitment pattern to design against; retrofit economics survive the funding track's uncertainty; the decision no longer shares a status with dependencies it doesn't control.
- **Harder:** two touches per vehicle need two scheduling windows; stage-2 timing is chipset/Release-gated (ADR-009 dependency track); the multi-mode window carries dual-equipment cost for the coexistence duration.
- **To revisit:** if the *Serienzulassung*/component-authorisation reform (ADR-009 item 9 decision) changes the approval arithmetic, the stage boundaries may be redrawn; revisit on ARTE's regulatory-obstacles deliverable.

## Action items

1. [ ] `[I]` Confirm the pattern with rolling-stock owners (carried from ADR-009 item 2; links ADR-001 item 4). This is the condition Resolution 5 attached; it qualifies the acceptance, it does not suspend it.
2. [ ] `[I]` Fold the pattern into ADR-001 item 4's TOBA/on-board architecture work as the fitment baseline.
