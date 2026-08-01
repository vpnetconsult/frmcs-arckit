# Migration change-risk assessment — bridged GSM-R → FRMCS parallel run

**Date:** 2026-06-28 · **Revised:** 2026-08-01 (added §4a migration timeline triangle) · **Status:** Draft · **Owner:** Vpnet engagement lead
**Scope:** Risk and risk-control assessment of the chosen migration route — a phased dual-network parallel run ("evolution in continuity", reuse of installed infrastructure) — focused on its dominant exposure: **change activity on live, legacy, proprietary, safety-critical code**.
**Anchored on:** ADR-001 (route), PR11–PR14 (risks), ADR-004 / ADR-007 (controls), incident-annex (proof). Evidence cited inline by `E-` id.

## 1. The route, and why its risk is relocated — not removed

ADR-001 chose a **phased dual-network parallel run** over a big-bang cutover (Option D rejected). The vendor framing — Kontron's "evolution in continuity / reuse of installed infrastructure" (E-2026-06-28-02, B-tier, superlatives discounted) — is the same shape. This **trades one-time cutover risk for sustained change-on-live-legacy risk** across a decade-plus dual run (GSM-R to ≥2035; E-2026-06-27-03).

The 23 June outage is the worked example of that traded-in risk: a planned change to a live legacy component triggered a **singular software fault that raised no alarm**, so the automatic failover to the (fully functional) redundancy **never engaged** → ~90 min manual recovery. DB-confirmed at primary tier (E-2026-06-27-03, corroborated E-2026-06-27-01/-02, E-2026-06-28-01).

## 2. Where the bridge forces change to legacy code

- **Legacy GSM-R core / proprietary nodes** — interworking, dual-mode, config/software updates (the 23 Jun swap was exactly this). Culprit identified by the engagement as a 1991 Nortel STP (E-2026-06-27-05 — engagement attribution, not publicly confirmed).
- **Interworking seams** — GSM-R↔FRMCS boundary handover, numbering/addressing, MCX feature-equivalence (each seam = new code; R4 boundary handover is still the open PoC objective).
- **On-board** — TOBA gateway + hybrid cab radios; the DKS two-stage retrofit's stage 2 is a software update (E-2026-06-25-02, E-2026-06-24-21).
- **"Reused" infrastructure** — new code grafted onto aged platforms chosen for retention.

## 3. Blast radius (impact analysis)

Reverse-dependency trace of ADR-001 under the PR12 change-on-live-legacy exposure:

| Level | Artifact | Severity | Why impacted |
|---|---|---|---|
| 1 | R3 (central SPOF), R4 (fail-soft) | HIGH | Route reproduces the SPOF / risks a standstill unless designed out and proven |
| 1 | incident-annex | HIGH | The proof instance of the route's change risk |
| 1 | R2 (no break in service), ADR-009 (fleet retrofit) | MED | Coexistence depends on safe change execution; on-board stage-2 SW is PR12-class |
| 1 | PR11–PR14, PR5, PR7, PR8 | HIGH | The risk cluster the route activates |
| 2 | ADR-007 (testing & canary), ADR-004 (SIL-4 boundary) | HIGH | The design/test controls — both still *Proposed/unproven* |
| 2 | ADR-002 + ADR-010 + R9–R12 | MED | The agentic detection/oversight layer = the control for the silent-fault class (PR5/R12) |
| 3 | traceability-matrix | HIGH | The spine must reflect the coupling |
| 3 | phase-gate-plan, adr-log, charter | LOW | Gate/index/charter review |

**Headline: the code-change-on-legacy risk is central, not contained** — it couples into 4 requirements, 3 control-ADRs, the agentic detection layer, the incident proof, and 7 risks. The route's *dominant* risk is also its *most coupled*.

## 4. Risk → control → gap

| Risk | Control in place | Gap |
|---|---|---|
| PR12 change-on-live-legacy (silent fault) | DB countermeasures (swap freeze; maint 00:00–04:00 on inactive side, E-2026-06-27-02/-03); ADR-007 fault-injection/canary; ADR-004 | Detection-driven failover not yet designed or tested; controls all Proposed |
| PR13 proprietary opacity / vendor-dependent fix | ADR-007 shadow/observability; R8 standards-based target | Closed code can't be fully tested; support path for a defunct-vendor node |
| PR11 silent fault defeats failover (mode) | Geo-redundant + health-driven failover (R3/ADR-001); detection (R12) | Reappears in FRMCS core (5GC/IMS/UDM/HSS) if not designed out |
| PR14 reuse-inherits-obsolescence | — | No reuse-vs-replace obsolescence triage exists |
| Interworking-seam / fail-soft regression | Gateway decoupling (ADR-001); R4 degraded-mode | Boundary handover open (R4); public-mobile fallback can't carry Notruf/group calls (E-2026-06-24-18) |

## 4a. The migration timeline triangle — duration and obsolescence as risk variables (added 2026-08-01)

The base assessment (§1–4) treats change-on-legacy as a **static** risk. It is not: the exposure is a function of **how long the dual run lasts** and **how old the legacy estate is** while it lasts. Three EU-law / national-plan facts logged 2026-08-01 pin down that time dimension — and they are in tension.

**The three vertices.**

| Vertex | Date | Source | What it fixes |
|---|---|---|---|
| **A — DE switch-off ambition** | **2035** | R1 / R13 (DE national plan) | The intended *end* of the dual run: GSM-R off, fleet on FRMCS |
| **B — EU Class B funding horizon** | **2040** | Reg (EU) 2026/693 Art 1(2), CCS TSI (E-2026-08-01-11) | EU law *funds* GSM-R-era (Class B) on-board equipment **five years past** the DE ambition |
| **C — FRMCS on-board not tender-complete** | **standing since 2023, still true 2026** | CCS TSI Table A2 **Note 9** — in the **base act 2023/1695** (E-2026-08-01-16), persisting through the 2026/693 amendment (E-2026-08-01-11); recital 7 "full FRMCS … not yet available" | The FRMCS on-board specs are, *in binding EU law*, "not considered complete for the purpose of tendering the on-board equipment"; test-spec placeholders (idx 96/97) still Reserved. **This has stood ~3 years** — the immaturity is persistent, not a transient teething gap, which sharpens the front-of-runway squeeze |

Underneath all three sits the pressure that makes the squeeze dangerous: **2G/GSM-R obsolescence ~2030** (R1) — the estate starts going obsolete *before* the earliest endpoint.

**The tensions.**

1. **A vs C — the runway is compressed from the front.** Hitting 2035 means: tender → build → type-authorise → retrofit **16–21k DE vehicles + ~40k mobile / ~3.5k stationary GSM-R devices** (R13). But Note 9 says on-board tendering cannot yet responsibly begin — you would be tendering against Reserved placeholders. Every month the specs stay incomplete is a month off the front of an already fixed-end runway. The immaturity is concentrated **on-board** — precisely the fleet-retrofit (R13) side, and precisely the PR12-class stage-2 software work (§2).
2. **A vs B — the EU's own funding horizon disagrees with the ambition by five years.** Class B funding to end-2040 is the Commission signalling, in law, that GSM-R-era equipment is expected to remain fundable — i.e. deployed — **to 2040, not 2035**. It does not *mandate* a 2040 run (it permits funding, not requires operation), but a legislator does not fund a technology it expects gone. The honest read: **2035 is the optimistic national ambition; 2040 is the conservative planning horizon the EU has priced in.**
3. **B vs C — a longer run compounds the risk this whole document is about.** If the realistic endpoint drifts toward 2040, the **change-on-live-legacy exposure window is ~40–50% longer** than the 2035 plan assumes (a ~9-year run from a ~2026 start becomes ~14 years), and the aging GSM-R/proprietary estate (PR14) is kept alive — and kept under change — through years of deepening obsolescence past ~2030.

**Why this lands on *this* document.** The dominant risk here (PR12 change-on-live-legacy; PR14 reuse-inherits-obsolescence) scales with dual-run duration and estate age. The triangle says both variables are worse than the base draft assumed: the run is likely **longer** (toward 2040) and the estate is **obsolescing from ~2030**. So the integral of change-on-legacy exposure — every night-window swap, every interworking-seam patch, every stage-2 retrofit — is larger and runs later than a 2035-anchored plan books for.

**The velocity lever (couples ADR-011 / E-2026-08-01-15).** Duration is not purely exogenous — migration *velocity* is a control the engagement can push. And there is now a concrete reason to push it: per the SUBSET-146 safety/security-layer separation folded into ADR-011, change on the **FRMCS target** is cheaper to govern (a security-layer-only change can be defensibly *not significant*) than change on the **entangled legacy estate** (Class-A-significant by default, full CSM-RA + AsBo). So the longer the fleet stays on legacy, the longer it is stuck in the **expensive, entangled change regime**. Getting to FRMCS-target faster is simultaneously an obsolescence-exit, a change-cost reduction, and a risk-window contraction — three benefits from one lever.

## 5. Finding and recommendations

**Finding.** The route is sound, but its dominant, now-evidenced risk — change to live legacy/proprietary safety-critical code — is currently controlled mainly by DB's **reactive operational countermeasures** (freeze, night windows, inactive-side-only). The **design/test controls that would make it robust (ADR-004, ADR-007, the agentic detection layer) are all Proposed and unproven.** Control robustness is therefore the decisive variable for the whole migration.

**Finding (time dimension, added 2026-08-01).** That risk is not static — it scales with dual-run **duration** and estate **age**, and the migration timeline triangle (§4a) shows both are worse than the base draft assumed. The DE 2035 switch-off ambition is squeezed from the front by the EU-law fact that FRMCS on-board specs are **not yet tender-complete** (CCS TSI Note 9), while the EU's own **Class B funding horizon of 2040** signals a realistic endpoint five years beyond the ambition — over an estate obsolescing from **~2030**. Planning to 2035 while the law prices in 2040 under-books the change-on-legacy exposure by roughly half a decade of night-window swaps and retrofit software. **Recommend planning to the 2040 conservative horizon, not the 2035 ambition**, and treating migration velocity as a first-class risk-reduction lever (faster to FRMCS-target = obsolescence exit + cheaper change regime + shorter risk window; §4a).

**Recommendations.**
1. **Record a change-control policy** (ADR-011) — elevate DB's countermeasures from reactive to a governed decision (change classes, inactive-side rule, blast-radius limits, test gates).
2. **ADR-007** — produce the silent-fault failover-injection + canary-by-segment **test evidence** (turns R3/R4 from asserted to evidenced).
3. **ADR-004** — define the per-change safety-impact process at the SIL-4 boundary.
4. **Stand up shadow-on-legacy detection** (ADR-002/007/010) — the Risk Sentinel is the detection control for the exact silent-fault class that bit DB (PR5/R12).
5. **Reuse-vs-replace obsolescence triage** (PR14) before committing to "reuse." **Front-load it (§4a):** with ~2030 obsolescence against a realistic ~2040 endpoint, "reused" platforms may need to survive a decade of change past their obsolescence date — the triage must price that horizon, not the 2035 one.
6. **Plan the dual run to the 2040 Class B funding horizon, not the 2035 ambition** (§4a). Book the change-on-legacy control effort (night-window capacity, AsBo throughput, detection coverage) for a ~14-year run; treat 2035 as the stretch target, 2040 as the base case.
7. **Gate FRMCS on-board procurement on spec tender-completeness** (§4a / Note 9). Do not tender on-board against Reserved placeholders (Table A2 idx 96/97); track when the FRMCS profile FFFIS + test specs fill, as the true start of the retrofit runway — and flag the front-of-runway compression to the R13 funding/coordination body.
8. **Use migration velocity as a control** (§4a / ADR-011 asymmetric significance): the faster the fleet reaches the FRMCS target, the sooner it exits the expensive Class-A-by-default legacy change regime for the cheaper security-layer-separated one (E-2026-08-01-15).

## 6. Provenance & honesty notes

- The outage cause is **primary-confirmed** (DB press portal, E-2026-06-27-03).
- The specific culprit element (Nortel DMS SuperNode STP, E-2026-06-27-05) is an **engagement identification, not publicly confirmed** — DB named only "a network distribution component."
- The "reuse of installed infrastructure" framing is **vendor B-tier** (E-2026-06-28-02); superlatives discounted.
- **Migration-triangle honesty (§4a):** the 2035 date is a **national ambition/plan** (R1/R13), not a hard legal deadline; the 2040 Class B figure is a **funding-eligibility horizon** (Reg 2026/693 Art 1(2)) that *permits* but does not *mandate* GSM-R operation to 2040 — read as an EU planning signal, not a run-to date. Note 9's "not tender-complete" is about **on-board** equipment specifically; trackside FRMCS maturity is not asserted here. The "~40–50% longer / ~14-year" run figures are **illustrative arithmetic** off a ~2026 start, not a schedule. No slippage is asserted as fact — the finding is that the base draft's 2035 anchor **under-books** a risk whose realistic horizon the EU has itself priced at 2040.

## References

ADR-001, ADR-002, ADR-004, ADR-007, ADR-009, ADR-010, ADR-011; risks PR5, PR7, PR8, PR11–PR14; requirements R1–R13; incident-annex.md; evidence E-2026-06-24-18/-21, E-2026-06-25-02, E-2026-06-27-01/-02/-03/-05, E-2026-06-28-01/-02. **§4a additions:** E-2026-08-01-11 (Reg (EU) 2026/693 — CCS TSI Note 9 tender-incompleteness + Class B funding to 2040), E-2026-08-01-15 (SUBSET-146 — the ADR-011 asymmetric-significance velocity lever); R1 (~2030 obsolescence, 2035 DE switch-off), R13 (fleet numbers).
