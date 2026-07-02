# Project charter — Agentic AI autonomous oversight (FRMCS)

**Delivery party:** Vpnet Cloud Solutions Sdn. Bhd. · sales@vpnet.cloud · Co. No. 1650064-D
**Client:** Infrastructure Manager (IM) — to be named
**Status:** Draft (mobilisation)
**Date:** 2026-06-24
**Method:** arcKit — outcome-anchored, ADR-recorded, evidence-logged, daily-baselined

## Outcome (the anchor)

Safe, continuous rail operations through **governed** autonomy. Every workstream, agent and gate exists to serve this; nothing is built that does not trace to it.

## Mandate

Design, build, assure and operate the agentic decision & oversight layer specified in ADR-002 — the decision plane (governs the architecture) and runtime plane (governs the live network) — over the IM's FRMCS bearer, under human oversight bounded by decision class.

## Scope

**In scope**
- The two agent planes (Risk Sentinel, Decision, Bid/RFP, Assurance; Anomaly, Resilience, Intent).
- The human-in-the-loop gate and its decision-class routing.
- The evidence chain, eval harness, and AI management system (NIST AI RMF / ISO 42001).
- Integration to the FRMCS bearer and to the IM's telemetry/incident sources.

**Out of scope (hard boundary)**
- **Autonomous safety actuation.** The system watches and proposes; it never commands movement authorities, emergency stop, or degraded-mode entry autonomously. Those stay human-in-command.
- The certified SIL-4 safety kernel itself (the IM's / signalling supplier's certified asset).
- The FRMCS RAN/core build (vendor prime under ADR-001).

## Success criteria

- Risk Sentinel raises decision-ready alerts before a threshold is crossed (closes the awareness gap, R12).
- Incident-replay of the 23–24 Jun outage turns a ~2h standstill into a supervised, minutes-long degraded mode (R3/R4).
- Every agent decision class maps to a named human role; safety-critical actuation is provably human-in-command (R10/R11).
- EU AI Act high-risk obligations evidenced; safety case accepted by the NSA.

## Named accountabilities (summary — full in 01-governance-and-raci.md)

- **Safety case & actuation authority:** IM + National Safety Authority (NSA). Vpnet is *Consulted*, never *Accountable*, for safety.
- **Oversight architecture & integration:** Vpnet (Responsible — architect/integrator).
- **FRMCS bearer:** vendor prime (RAN/core/MCX).

## Guardrail restated

This is **autonomous oversight, not autonomous control.** The autonomy is in the watching and the proposing; command of safety-critical action remains with people. That boundary is what makes the system certifiable and is non-negotiable.
