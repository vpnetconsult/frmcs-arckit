# Migration change-risk assessment — bridged GSM-R → FRMCS parallel run

**Date:** 2026-06-28 · **Status:** Draft · **Owner:** Vpnet engagement lead
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

## 5. Finding and recommendations

**Finding.** The route is sound, but its dominant, now-evidenced risk — change to live legacy/proprietary safety-critical code — is currently controlled mainly by DB's **reactive operational countermeasures** (freeze, night windows, inactive-side-only). The **design/test controls that would make it robust (ADR-004, ADR-007, the agentic detection layer) are all Proposed and unproven.** Control robustness is therefore the decisive variable for the whole migration.

**Recommendations.**
1. **Record a change-control policy** (ADR-011) — elevate DB's countermeasures from reactive to a governed decision (change classes, inactive-side rule, blast-radius limits, test gates).
2. **ADR-007** — produce the silent-fault failover-injection + canary-by-segment **test evidence** (turns R3/R4 from asserted to evidenced).
3. **ADR-004** — define the per-change safety-impact process at the SIL-4 boundary.
4. **Stand up shadow-on-legacy detection** (ADR-002/007/010) — the Risk Sentinel is the detection control for the exact silent-fault class that bit DB (PR5/R12).
5. **Reuse-vs-replace obsolescence triage** (PR14) before committing to "reuse."

## 6. Provenance & honesty notes

- The outage cause is **primary-confirmed** (DB press portal, E-2026-06-27-03).
- The specific culprit element (Nortel DMS SuperNode STP, E-2026-06-27-05) is an **engagement identification, not publicly confirmed** — DB named only "a network distribution component."
- The "reuse of installed infrastructure" framing is **vendor B-tier** (E-2026-06-28-02); superlatives discounted.

## References

ADR-001, ADR-002, ADR-004, ADR-007, ADR-009, ADR-010, ADR-011; risks PR5, PR7, PR8, PR11–PR14; requirements R1–R13; incident-annex.md; evidence E-2026-06-24-18/-21, E-2026-06-25-02, E-2026-06-27-01/-02/-03/-05, E-2026-06-28-01/-02.
