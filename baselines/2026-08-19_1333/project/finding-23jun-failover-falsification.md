# Finding: The 23-June failover — a falsification test of the "it was just a glitch" hypothesis

> A Popperian exercise. We state the comfortable hypothesis — *a by-design-sound
> redundant system that failed only because of a one-off software glitch* — and try
> to **kill it** with the logged references. It does not survive. What survives is the
> engagement's centre of gravity: the failover **trigger**, not the redundancy, is the
> latent single point of failure, and it is a **design** flaw, not a glitch.

## Document control

| Field | Value |
|---|---|
| Document ID | ARC-FRMCS-FIND-FAILOVER-FALSIFY-v1.0 |
| Type | Finding (scientific / falsification analysis) |
| Status | DRAFT · 2026-07-30 · Owner: Vpnet engagement lead |
| Companion | `finding-failover-trigger-flow-gap.md`; `silent-fault-failover-cascade-sequence.md`; `finding-dbinfrago-rel4-core-architecture.md`; ADR-007 |
| Method | State hypothesis → derive a testable prediction → seek refuting evidence in the references → verdict |

---

## 0. Precondition test — did the NSS↔FTS connection fail? (trust-level check)

The instruction was conditional: *if* trust is high that the **NSS↔FTS** (dispatcher/control-centre) connection failed, identify the by-design trigger. So test that locus **first**.

**Sub-hypothesis H0:** "The 23-June standstill was a failure of the GSM-R NSS↔FTS interface (TS 103 389, E-2026-07-30-22)."

**Refuting evidence:**
- DB, primary (E-2026-06-27-03) + press-relayed DB statements (E-2026-06-27-01/-02): the culprit was **"a network distribution component" (Netzwerkverteilkomponente)** replaced during planned maintenance — a component in the **transport/distribution layer**, not the NSS↔FTS signalling interface.
- VDE ITG, independent expert (E-2026-07-29-09): same — "the swap of a **switch, a network-distribution component**".
- `finding-dbinfrago-rel4-core-architecture.md` §6 states it outright: *"the SCP was **not** the 23-June culprit (DB placed that in a network distribution component)."*

**Verdict: H0 FALSIFIED.** Trust that the NSS↔FTS connection *specifically* failed is **low → refuted**. The NSS↔FTS interface (and every dispatcher on it) was a **downstream victim** of a nationwide loss, not its locus. The locus was upstream, in the network-distribution/failover layer. *(This is why we do not build the argument on TS 103 389; it is context, not cause.)*

So we abandon the NSS-FTS locus and test the hypothesis that actually matters.

---

## 1. The hypothesis to kill (H1) — "it was just a glitch"

Stated in its strongest, most comfortable form (this is essentially DB's own *"singulärer Softwarefehler"* framing, E-2026-06-27-02):

> **H1:** The GSM-R core is **sound by design**. It has the mandated redundancy — geo-redundant Rel-4 Call Servers (`finding-dbinfrago…`, E-2026-06-24-20) and the TS 103 147 auto-switchover mandate (E-2026-07-01-09). The automatic failover **should work by design**. On 23 June a **singular, one-off software glitch** happened to prevent it. Therefore: **fix the glitch, and the design is fine.**

### 1a. The "to-be trigger" H1 relies on

H1's load-bearing claim is that a by-design trigger exists and normally works. It does exist:

- **TS 103 147** (E-2026-07-01-09, **A**) — *normatively mandates* GSM-R core-network redundancy to cope with MSC single outages, **explicitly including planned "maintenance activities"**. The 23-June event is precisely the case the standard says redundancy must survive.
- **DB's Rel-4 BICN topology** — 2 geo-redundant Call Servers + MSC-pool/RANflex (TS 123 236, E-2026-07-05-08) = the standard 3GPP redundancy the auto-failover should have engaged.
- **The redundancy is feature-specific, not monolithic** (full read of TS 103 147, DTS/RT-0026, E-2026-07-01-09): TS 103 147 is a *reference-collection* spec — it does not define the mechanism itself, it collects the underlying features that provide it. **Point-to-point** redundancy = MSC-pool/RANflex (TS 123 236); but **group calls (VGCS/VBS) — the bearer of the Railway Emergency Call — are explicitly NOT covered by RANflex** and require a *separate* GCSMSC + GCR backup-routing mechanism (route signalling to a backup Group Call Serving MSC when the original is out). So "the redundancy" is a **set of feature-specific failover mechanisms, each with its own detection/trigger** — a fact that makes the trigger-path failure (§3) *worse*, not better: one silent fault leaves **every** feature-specific trigger un-armed at once, including the safety-critical group-call/REC path.

So the trigger is real, normative, and DB has the redundant hardware for it. H1 looks strong. Now the test.

## 2. The testable prediction

If H1 is true, it predicts:

> **P1:** The failure lay in the *redundancy* (it was unavailable/broken), and/or it was a *one-off* whose recurrence is prevented by fixing the specific software bug.

Falsify H1 by refuting P1 with the references.

## 3. The refutation

**Refuting fact R-α — the redundancy was NOT broken; it was never asked to act.**
DB, primary (E-2026-06-27-01): the fault *"raised **NO automatic alarm**, so the system did **NOT** automatically fail over to its"* redundant path. E-2026-06-27-02: *"the **fully functional** redundant GSM-R system's automatic [switchover did not occur]."* VDE (E-2026-07-29-09): *"the systems **are redundant** and would have switched to the parallel system, **BUT the switchover signal failed to occur** … it had to be **manually** … switched."*

→ The redundancy was **present and functional**. P1's "redundancy was broken" limb is **false**. The failure was in the **detection/trigger path**: the fault did not raise the condition that arms the failover.

**Refuting fact R-β — the trigger structurally depends on the faulting component self-reporting.**
An automatic failover fires on a **detected** fault. The 23-June fault produced **no alarm** — so, by construction, the failover could not be armed. This is not incidental to *this* bug: **any** fault that fails to self-report (a silent fault, or a component that misreports its own health) defeats the same trigger the same way. The dependency — *the trigger trusts the sick component to announce its own sickness* — is the invariant. And per §1a, there is not one trigger but several (P2P via RANflex, group-call/REC via GCSMSC/GCR) — so a single silent fault disarms **all** of them at once. (`finding-failover-trigger-flow-gap.md`; `silent-fault-failover-cascade-sequence.md`; ADR-012 decision-point-5: *"a fault a component does not self-report includes a compromise it does not self-report."*)

**Refuting fact R-γ — severity is decoupled from the glitch's rarity.**
H1 leans on *"singular"* (rare) to imply *"therefore low-risk."* But the outcome — a **nationwide ~2 h standstill** (incident-annex; E-2026-06-24-01) — did not scale with the glitch's rarity; it scaled with the **trigger's blindness**. A once-in-years silent fault and a common silent fault produce the *same* nationwide failure, because the failover is equally blind to both. Rarity of the trigger ≠ safety of the design.

## 4. Verdict

**H1 is FALSIFIED.** P1 fails on both limbs:
1. The redundancy was **functional, not broken** (R-α) — so "fix the redundancy" is not the lesson.
2. The vulnerability is **structural, not one-off** (R-β): the failover trigger depends on the faulting component self-reporting, so the *class* of silent faults recurs regardless of which specific glitch fires. "Fix the glitch" therefore does **not** fix the design — H1's central prediction is refuted (R-γ shows the severity is a property of the design, not the glitch).

The comfortable story dies: **it was not a glitch in a sound design. It was a latent single point of failure in the failover *trigger*, exposed by a glitch.** The redundancy worked; the thing that decides *when to use it* did not — and cannot, against a fault that stays silent.

## 5. What survives (H2) and the corrected to-be trigger

**H2 (the surviving hypothesis):** The 23-June standstill was caused by a **silent-fault blindness in the failover-trigger path** — automatic switchover is armed only by a *self-reported* fault, so a fault that raises no alarm (or a component that lies about its health) leaves fully-functional redundancy un-engaged. This is a **design** property (PR11), independent of the specific software bug.

**The corrected "to-be" trigger — what should replace the self-report dependency:**
1. **Independent, out-of-band health detection.** The failover must be armed by an **external listener watching the actual traffic/state**, not by the component's own health report — so a component that fails silently or lies is still caught (ADR-012 dp5; the LinkedIn-security-post convergence). *This is the single control that answers both the accidental silent fault and a hostile one.*
2. **Failover that does not depend on a switchover *signal* firing at all.** FRMCS 5G-SA's **stateless** design (VDE E-2026-07-29-09): session state lives in HA databases, so if a control instance dies another takes over the session **seamlessly, without a switchover signal** — removing the very trigger that failed on 23 June. (Grounded now by the published Transport/Service Stratum specs, E-2026-07-30-15/-14, and the On-Board Multipath Function, E-2026-07-30-13.)
3. **Prove it by test, not by assertion.** R4/R3 stay *Open — prove by test* precisely because a modern redundant core (DB's Rel-4) is **not** a proven trigger (PR11); ADR-007 makes the failover-under-silent-fault a primary PoC objective.

**One-line result:** the redundancy was never the question; the **trigger** was — and a trigger that trusts the sick component to raise its own alarm is not a glitch to patch but a design to replace with out-of-band detection + trigger-less (stateless) failover.

---

## 6. Evidence refs
E-2026-06-27-01/-02/-03 (DB-confirmed cause: network-distribution-component swap, no alarm, no auto-failover) · E-2026-07-29-09 (VDE — "Umschaltsignal blieb aus") · E-2026-07-01-09 (TS 103 147 — the mandated auto-switchover incl. maintenance) · E-2026-06-24-20 + finding-dbinfrago-rel4 (2 geo-redundant Call Servers; the redundancy that existed) · E-2026-07-05-08 (TS 123 236 MSC-pool) · E-2026-07-30-22 (TS 103 389 NSS-FTS — the interface wrongly hypothesised as locus) · E-2026-07-30-13/-14/-15 (FRMCS onboard multipath + Service/Transport Stratum — the stateless to-be) · incident-annex.md · finding-failover-trigger-flow-gap.md · silent-fault-failover-cascade-sequence.md · ADR-007 · ADR-012 dp5 · R3/R4/PR11.
