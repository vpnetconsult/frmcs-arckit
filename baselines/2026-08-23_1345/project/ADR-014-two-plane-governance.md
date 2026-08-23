# ADR-014: Two-plane governance — the register is the decision plane, terminating in NIS-2 (Track A) and NACSA (Track B)

**Status:** Accepted (ARB 2026-08-23) — settled internally; no external validation sought or available. See `07-arb-minute-2026-08-23.md` Resolution 2 (working session, engagement lead sole participant; not usable in a safety case, a conformance submission, or any statement to a regulator).
**Date:** 2026-08-23 (proposed twice in prior working sessions, outside this register; first put to the board today at the engagement lead's direction)
**Deciders:** Architecture Review Board · Vpnet engagement lead
**Depends on:** ADR-002 (two-plane architecture), ADR-012 (NIS-2 conformance), `00-charter.md` §Standing + §Track B (role-equivalence bridge)
**Affects requirements:** R9/R10 (governance of the layer), R14 (the NIS-2 termination), Track B charter deliverables

## Context

ADR-002 splits the agentic layer into a **decision plane** (governs the architecture) and a **runtime plane** (governs the live network). The runtime plane does not exist yet — its evidence path is ADR-007's, unbuilt. But the decision plane is not a future artifact: **this register — ADRs, evidence log with trust tiers and the MOVES rule, traceability matrix, daily sha256 baselines, ARB minutes — has been operating as the decision plane since 24 June.** What has never been decided is whether that is an analogy or the architecture: whether the register merely *documents* the decision plane or *is* it, and where the decision plane's own regulatory obligations terminate.

The termination question became answerable this week at primary-law level on Track A: the German NIS-2 transposition is in force (NIS2UmsG, BGBl. 2025 I Nr. 301, E-2026-08-20-24), with § 32 BSIG n.F. reporting into the joint BSI+BBK Meldestelle and § 31 Abs. 2 imposing the continuous-detection duty — and Anlage 2.2.1 expressly names central traffic-dispositive facilities. On Track B, the charter's role-equivalence bridge maps the same function set onto Malaysian counterparts; the cyber-governance counterpart by function is **NACSA (National Cyber Security Agency, Malaysia)**.

This decision was **proposed twice in working sessions and never put to the board**. Its consequential edits — **Bild 7 and §6 of both artifacts, and the manuscript** — live in workspaces outside this register (the upstream-ArcKit project and the manuscript workspace) and are carried below as named actions, not performed here.

## Decision

1. **The register IS the decision plane.** The arcKit discipline operating in this repository — evidence rows with trust tiers, the per-row decision question (MOVES / NO DECISION MOVED), ADR ratification by minuted board act, daily baselines with decision-health metrics — is designated the ADR-002 decision plane's operating procedure, not documentation about a future one. Agent participation in that plane (this assistant, the workflow tooling) operates under the same discipline and the same guardrail: **oversight, not control — the board (the engagement lead) ratifies; nothing else does.**
2. **Track A termination: NIS-2.** The decision plane's cyber-governance obligations and reporting logic terminate in the NIS-2 chain as transposed — Dir (EU) 2022/2555 → NIS2UmsG → **§§ 30–32 BSIG n.F.** (risk measures, detection duty, 24 h/72 h/one-month-after-notification reporting to the joint BSI+BBK Meldestelle). Already carried operationally in ADR-012 item 4; this ADR fixes it as the *governance terminal*, not merely a compliance feature.
3. **Track B termination: NACSA, by role-equivalence — and flagged as UNEVIDENCED.** By the charter's function-set bridge, the Malaysian terminal for the same governance function is NACSA under the Cyber Security Act 2024. ⚠️ **The register holds ZERO Track B evidence rows** (charter §Track B, unchanged since 2026-08-19). The designation is made on role-equivalence only; **the NACSA mandate, the Act's NCII sector definitions, and the reporting chain must be read at source and logged as tier-A rows before any Track B artifact relies on them.** Seeded `watch`, same discipline as the AI Act classification was.
4. **What does not change:** the runtime plane stays out of operation until ADR-007 evidence exists; the two-plane split's safety boundary (ADR-004) and the EU-legal-spine non-transfer rule (charter: method, reasoning and precedent cross to Track B; EU law does not) are unaffected.

## Consequences

- **Easier:** Track B's governance story has a defined terminal and inherits a running decision plane instead of a paper design; the register's own discipline becomes citable as the architecture's first operating instance.
- **Harder / carried actions:**
  1. [ ] `[I]` **Update Bild 7 and §6 of both artifacts, and the manuscript** to show the register-as-decision-plane and the NIS-2/NACSA terminations. **Owner: engagement lead — these artifacts live outside this register** (upstream-ArcKit project; manuscript workspace); cite this ADR and the minute by commit hash.
  2. [ ] `[D]` **Evidence the NACSA terminal at source** — first Track B evidence rows: NACSA's mandate and the Cyber Security Act 2024 (sector scope, reporting duties), read at source, tier A, before any external Track B use. Until then the Track B half of this decision is a designation, not a verified position.
  3. [ ] `[I]` Reflect the terminal designation in the Track B stakeholder map (charter first deliverable) when that map is built.
- **To revisit:** if the runtime plane reaches shadow operation (ADR-007 surface 2), the decision plane/runtime plane interface needs its own recorded decision; and if NACSA's actual mandate does not match the role-equivalence assumption, this ADR is reopened, not bent.
