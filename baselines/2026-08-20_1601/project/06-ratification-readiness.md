# Ratification readiness — all ADRs

**Assessed:** 2026-08-20 (re-run against the evidence log at **384 rows**, baseline `2026-08-20_1538`; prior assessment of 2026-08-15 retained in full below as the trail)
**Assessor:** engagement working session
**Purpose:** put the ratification decision in front of the ARB. This document does **not** ratify anything.

> **Nothing here changes an ADR's Status.** Ratification is an act of the Architecture Review Board. Recording an `Accepted` status that no board voted for would put a fabricated governance event into an audit trail whose entire value is that it is honest. Statuses flip when the ARB says so, and the minute reference goes in the ADR. Under `00-charter.md` §Standing there is no NSA/BSI relationship: any ratification is `settled internally; no external validation sought or available`, and is not usable in a safety case, a conformance submission, or any statement to a regulator.

---

## Assessment 2026-08-20

**What changed since 2026-08-15.** The 15 August session ratified three ADRs and adopted the `[D]`/`[I]` convention. Since then — almost all of it today — the register closed **ten action items, eight of them decision-shaped**: the ADR-011 classification scheme was written, ADR-013 was raised and carries the Resolution-5 ratification, ADR-012 resolved its adjudication rule (architectural half decided, quantitative half re-based on free primary instruments after the owner decision not to purchase DIN VDE V 0831-103/-104), the RED scope and the CRA recall/NIS2UmsG residuals closed at source (E-2026-08-20-23/-24), ADR-010 adopted its metric spine and coverage route and answered the Art 5(1)(f) bar (E-2026-08-20-22), and ADR-009 discharged its split and decided its authorisation route.

### Ratified — 4 of 10

**ADR-001 · ADR-002 · ADR-003** (ARB-2026-08-15 R3/R4/R2) and **ADR-013** (R5, raised 2026-08-20). All `settled internally`.

⚠️ **Two post-ratification flags, neither a reopening yet:**

1. **ADR-002 has acquired a new open `[D]` item since its ratification** — item 8, remote human-in-command / bearer dependency, deliberately gated on the DZSF forum of 2 September (E-2026-08-20-01/-21a). The facts already on file (teleoperation is the sector's designed ATO fallback; eleven programmes publish no link-failure behaviour) point to amending the ratified HITL ladder with per-class bearer-availability preconditions. **When that amendment is written it must be minuted by the ARB as an amendment to a ratified decision — not folded in silently.**
2. **ADR-001's Option-C fallback layer now carries a regulatory scope consequence** (E-2026-08-20-23f): a public-5G/satellite fallback path can make on-board equipment "internet-connected" under Del Reg (EU) 2022/30 Art 1(1). This does not disturb the ratified decision; it prices it. Carried at the ADR-012 procurement gate.

### Ready for ratification now — 2

| ADR | Why it is ready | Residual (carries forward, does not block) |
|---|---|---|
| **ADR-009** — fleet retrofit as managed external dependency | **Both decision-shaped items are resolved:** item 2 discharged into ADR-013 (Accepted); item 9 decided 2026-08-20 (component-authorisation route (a) as working assumption, Automationsinsel complementary, review trigger on ARTE deliverables). What the 15 August assessment recommended — the split — has happened. The remaining items (1, 3–8) are `[I]` tracking and authoring work, and the external dependencies gate the *outcome*, not the *decision*: the decision **is** that they are external and tracked. | Funding flow, approval throughput, chipset supply — tracked per item 4 quarterly; STREAMLINE currency correction already applied (E-2026-08-20-21d). |
| **ADR-012** — cybersecurity conformance | **Every decision-shaped item is resolved:** the gate adjudication rule is decided in full (item 9 architectural half + item 9b quantitative half, re-based on CSM-RA targets and engagement-defined attacker scales with the DIN VDE residual accepted and labelled); the RED question is closed at source (item 7 — classes, dates, restricted EN 18031 citation, no CRA displacement date); the verification residuals are closed (item 6 — CRA Art 3(49)/13(21)/54; NIS2UmsG in force 6.12.2025). The ADR's decision — one governed dimension reusing ADR-004/007/011 machinery, one gate, named-hazard adjudication — is complete and internally consistent. Remaining items (0b, 0c, 1, 2, 2b, 3, 4, 5) are `[I]` build/inventory work; item 8 (ERJU chase) is verification of an interface, not a decision. | The accepted DIN VDE residual (permanent, labelled); the ERJU four-spec publication status (item 8); the watch on the future Commission act repealing/amending 2022/30 — the RED→CRA displacement milestone. The sector's measured Respond 1.58/5 remains the named delivery risk, not a ratification bar. |

### One blocker from ready — 2

| ADR | The single remaining `[D]` blocker | How to clear it |
|---|---|---|
| **ADR-011** — migration change-control | Item 6 — the German national authorisation trigger ("major upgrading or renewal", current interoperability order + ESiV) is unestablished; the 2007 texts on file are superseded. Item 1's scheme — written today — names this as its open interface. | Obtain the current texts from BGBl/recht.bund.de (needs an egress allow-rule or the PDFs in the download folder — same pattern as the NIS2UmsG today), run the FRMCS-retrofit determination, fold into the scheme. Then this ADR — "a decision not actually taken" five days ago — is ready. |
| **ADR-010** — eval strategy | Item 11 — prove-the-simulation: the adopted ODD-relative coverage route leans on simulated/replayed evidence whose fidelity proof this ADR owes and has not named. All other `[D]` items closed today (6, 9, 10). | Obtain the free *VV Methods Safety Assurance Position Paper* (VVMethoden), decide the fidelity-proof requirement. The data-source dependency on ADR-007 remains for *execution*, but no longer blocks the *strategy* decision once item 11 is decided. |

### Genuinely blocked — 2

| ADR | Blocker | Nature |
|---|---|---|
| **ADR-004** — SIL-4 boundary | FFI / independence analysis (EN 50129 → EN 50716), hazard log incl. automation-bias modes, ISA + NoBo engagement | **Unchanged from 2026-08-15, and correctly so.** This is safety-case *evidence*; ratifying without it is the one place a premature `Accepted` does real harm. It gates R11, holds ADR-003's classification constraint, and holds ADR-002 item 4. Still the highest priority of the blocked set. Note: the system-definition template falls back to the free ERA-REC-116 structure after today's no-purchase decision. |
| **ADR-007** — testing & canary | The five test surfaces and G3 entry/exit criteria are still not written into the ADR | **Blocked, but the nature of the block changed: it is now authoring, not discovery.** Since 15 August the register acquired the security-surface method (attack graphs + three named in-domain attack classes + adversarial-dataset generation), the surface-definition route (ODD → scenarios → generated test cases), the variant-coverage requirement, and the respond-hardest and availability-cost rules. Every surface has a published starting point. Write them; then set G3 criteria; then this ADR is ready. |

### Not yet opened — 3

ADR-005, ADR-006, ADR-008 remain phase-gated placeholders (`Pending`). No change.

### Recommended ARB agenda (next session)

> **Carried in part, same day:** items 1 and 2 were resolved at **ARB-2026-08-20** (`07-arb-minute-2026-08-20.md`) — ADR-009 and ADR-012 ratified, register at **6 of 10**. Items 3–5 were tabled, not decided, and remain open.

1. **Ratify ADR-009** — decision-shaped content fully resolved; minute the route-(a) working assumption and its ARTE review trigger.
2. **Ratify ADR-012** — minute the accepted DIN VDE residual explicitly (the board should own the no-purchase decision's consequence: engagement-defined scales, no conformity claim), and the 2022/30-repeal watch as the RED→CRA milestone.
3. **Note ADR-002 item 8 as a pending amendment to a ratified decision**, gated on 2 September — and commit now that any post-forum ladder change returns to the board.
4. **Direct the ADR-007 surface authoring** (owner + date) — the block is desk work with published inputs; leaving it "blocked" would misdescribe it.
5. **Adopt an `[E]` external-actor tag** alongside `[D]`/`[I]` for items only a real operator/programme can close (≈33 across the register), so decision health separates "open-and-ours" from "open-by-standing."

If the ARB ratifies items 1–2, the register stands at **6 of 10 ratified** with the two genuinely-blocked ADRs correctly held open — and every remaining blocker in the register is either one named document away (ADR-011, ADR-010) or one authoring session away (ADR-007), except ADR-004, which is evidence-bound by design.

### Health metrics at this assessment

| Metric | 2026-08-15 | 2026-08-20 | Reading |
|---|---|---|---|
| ADRs `Accepted` | 0 of 9 | **4 of 10** | The headline defect is repaired; the wire works when pulled |
| Action items closed / open | 4 / 55 | **17 / 59** (+3 lettered items the counter cannot see: 9b closed; 0b, 0c, 2b open) | Closures now span five ADRs, not one |
| Evidence rows | 338 | **384** | Intake steady |
| Rows actioned `revise` | 17 (5%) | **52 (13%)** | The leading indicator has more than doubled; today's 24 rows produced 22 `MOVES` |

**The residual risk is no longer drift — it is the tail:** ~33 `[E]`-shaped items that cannot close without an external actor, and two ADRs whose blockers are legitimate evidence. Watch that the open count falls for the right reason (closures), not by reclassification.

---

## Assessment 2026-08-15 — retained in full for the trail

**Assessed:** 2026-08-15
**Assessor:** engagement working session (read-back against the evidence log at 338 rows)

> Superseded by the 2026-08-20 assessment above. Statements below describe the register as it stood on 2026-08-15; several were acted on at ARB-2026-08-15 (see `07-arb-minute-2026-08-15.md`) and in the closures of 2026-08-20.

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
