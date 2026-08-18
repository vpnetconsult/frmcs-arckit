# Ratification readiness — all ADRs

**Assessed:** 2026-08-15
**Assessor:** engagement working session (read-back against the evidence log at 338 rows)
**Purpose:** put the ratification decision in front of the ARB. This document does **not** ratify anything.

> **Nothing here changes an ADR's Status.** Ratification is an act of the Architecture Review Board — with the NSA, and for ADR-012 the BSI. Recording an `Accepted` status that no board voted for would put a fabricated governance event into an audit trail whose entire value is that it is honest. Statuses flip when the ARB says so, and the minute reference goes in the ADR.

---

## The finding: why nothing has ever been ratified

**0 of 9 ADRs are `Accepted`.** 55 action items open, 4 closed — all four in ADR-003, the only ADR that has ever closed one. This is not because the decisions are unsound. It is structural:

**Every ADR bundles the decision with its implementation, and puts "ARB ratify" last.**

ADR-001's action list is a case in point: item 1 is *"Ratify Option B as target"* — the decision — and items 2–8 are network planning, service catalogues, on-board architecture, field trials and a programme plan. Those are **consequences of the decision**, not preconditions for it. But because they sit in the same list above a trailing ratification step, the ADR reads as un-ratifiable until the entire migration programme is designed. The same shape repeats in seven of the nine.

An ADR records that **a decision was made** and why. It is not a completion certificate. Conflating the two produces exactly the observed outcome: a growing, well-evidenced, permanently provisional record.

**Recommended convention (for ARB adoption):** an ADR is ratifiable when its **decision-shaped** items are resolved and its evidence base is sound. Implementation items carry forward *after* ratification and are tracked to the gates. Mark each action item `[D]` decision-shaped or `[I]` implementation, and let only `[D]` items block the Status flip.

---

## Assessment

### Ready for ratification now — 3

| ADR | Decision | Why it is ready | Residual (carries forward) |
|---|---|---|---|
| **ADR-003** — EU AI Act classification | Not high-risk as designed; conditional on the Art 3(14) safety-component test | **Strongest case of the nine.** 4 of 6 items closed. Verified against **primary law** (Reg (EU) 2024/1689): Art 6(1) two-part test, Annex I §B item 17 via Rail Dir (EU) 2016/797, Annex III(2) covers road traffic not rail. Evidence **E-2026-06-24-07 (tier A)**. Nothing is outstanding except the sign-off itself. | Item 5 — carry the safety-component boundary as a **binding design constraint**; re-run Art 6(1)(a) on any move toward actuation. This is a standing constraint, not a precondition. |
| **ADR-001** — GSM-R → FRMCS transition | Option B (dedicated 5G SA + MCX, parallel run) as spine; Option C as sanctioned fallback | The decision is the most heavily evidenced thing in the register. Items 2–8 are **all implementation**. The one substantive objection — a stale ~2030 switch-off premise — was **repaired 2026-08-15**, and the correction *strengthens* rather than undermines the decision. | The corrected timeline makes coexistence (**R2**) more load-bearing: a longer dual run means more years of two estates. Ratify the decision; carry the longer-horizon consequence into the programme plan (item 8). |
| **ADR-002** — Agentic decision & oversight layer | Oversight-not-control; HITL gate by decision class; agents advise around a certified kernel | Its **only decision-shaped blocker just cleared**: the ADR wrongly asserted an EU AI Act high-risk posture, corrected 2026-08-15 against ADR-003. Remaining items (NIST AI RMF adoption, eval harness, evidence chain) are build work. | Item 3 ("define the SIL-4 boundary") is decision-shaped **but is held by ADR-004**, which is not ready. **Ratify ADR-002's governance decision; make the boundary definition explicitly dependent on ADR-004** rather than blocking on it. |

### Genuinely blocked — 6

| ADR | Blocker | Nature |
|---|---|---|
| **ADR-004** — SIL-4 boundary | FFI / independence analysis (EN 50129), hazard log incl. automation-bias modes, ISA + CCS-TSI NoBo engagement | **Legitimate.** This is safety-case *evidence*, not paperwork. R11 is load-bearing; ratifying without the FFI analysis would be the one place where a premature `Accepted` does real harm. **Do not ratify.** |
| **ADR-007** — Testing & canary | G3 entry/exit criteria unset; five test surfaces undefined; **new item 7 (security test surface) added 2026-08-15 and undefined** | **Blocked, and more blocked than yesterday** — today's work added a genuine gap (no pentest/red-team/security regression, while ADR-012 routes its change gate here). Honest to record that this assessment moved it *further* from ratification. |
| **ADR-010** — Eval strategy | All metrics undefined; sources eval data from ADR-007 surfaces | **Blocked on ADR-007.** Cannot precede its own data source. |
| **ADR-011** — Migration change-control | Item 1 — the A/B/C change-classification scheme — **is the core decision content and is not yet written** | **Blocked on itself.** The ADR proposes a change-control regime whose central artefact does not exist. This is the one that most resembles a decision not actually taken. |
| **ADR-009** — Fleet retrofit | Bund *Förderrichtlinie*, sector coordinating body, EBA *Serienzulassung* reform, chipset/Release-19 supply | **Blocked externally** — outside the programme's control. **But separable:** item 2 (multi-mode two-stage retrofit pattern as on-board baseline) *is* decision-shaped and could be ratified independently of the funding/approval tracking. Recommend splitting. |
| **ADR-012** — Cybersecurity conformance | 9 items open, 2 added 2026-08-15; CRA PDE inventory absent; **RED question unopened** (4 independent pointers, 0 evidence rows) | **Blocked.** Also needs BSI in the ratifying set. The RED gap is the most conspicuous: an FRMCS programme is *radio equipment* and the register holds nothing on the Radio Equipment Directive. |

---

## Recommended ARB agenda

1. **Adopt the `[D]`/`[I]` convention** above, so ratification stops meaning "everything finished."
2. **Ratify ADR-003** — clean, primary-law-evidenced, and it unblocks ADR-002.
3. **Ratify ADR-001** — with the corrected 2035/2040 timeline premise minuted, and the longer-coexistence consequence assigned into the programme plan.
4. **Ratify ADR-002** — with the SIL-4 boundary definition recorded as dependent on ADR-004, not as a precondition.
5. **Split ADR-009** — ratify the retrofit *pattern*; keep the external funding/approval dependency tracked separately.
6. **Note ADR-004, -007, -010, -011, -012 as blocked**, with the named blocker and an owner against each. **ADR-011 and ADR-004 deserve explicit attention:** one has no core artefact, the other gates R11.

If the ARB ratifies items 2–5, the register moves from **0 of 9** to **3 of 9 (4 of 10 counting the ADR-009 split)** — and, more importantly, stops being a body of permanently provisional decisions.

---

## Health metrics to watch (now emitted in every baseline)

| Metric | Value at 2026-08-15 | Reading |
|---|---|---|
| ADRs `Accepted` | **0 of 9** | The headline defect |
| Action items closed / open | **4 / 55** | All 4 in ADR-003 |
| Evidence rows | **338** | Intake is not the problem |
| Rows actioned `revise` | **17 (5%)** | vs 219 `validate`, 98 `watch`. A register where incoming evidence almost never forces a revision is either studying a settled question or grading its own homework. |

**The revise rate is the leading indicator.** If it stays near 5% while intake continues, the wire between evidence and decisions is disconnected regardless of how good the log looks.
