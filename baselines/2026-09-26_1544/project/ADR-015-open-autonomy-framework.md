# ADR-015: Adopt an open-reference autonomy framework as the engagement's reference frame (TM Forum AN mapped as comparator)

**Status:** Proposed
**Date:** 2026-09-26
**Deciders:** Architecture Review Board (engagement lead) · Vpnet engagement lead (method) · Infrastructure Manager interface (for the use cases that touch the operator's estate)
**Depends on:** ADR-002 (ladder and decision classes — the ceiling column rests on them), ADR-004 (SIL-4 boundary — the vital gateway), ADR-010 (eval strategy — the instrument's human-factors rules), ADR-014 (the register as decision plane — the framework's operating discipline); relates to ADR-007 (surfaces 1/3/5 are UC1/UC3's test evidence), ADR-011 (UC2), ADR-012 (UC6)
**Affects requirements:** R9 (autonomy governable — the scale now carries the bound), R10 (human oversight proportional to risk — the ceiling column), R12 (awareness/detection — the out-of-band monitor as an architectural element), R7 (interoperability — UC3/UC4 on open test references); no status change to any Rn is proposed by this ADR

## Context

The engagement has scored the oversight layer's autonomy on TM Forum's IG1252 (`16-ig1252-self-score.md`), inventoried what the three standards bodies say about levels (`pivot-notes-2026-09-24-an-levels-sdo-inventory.md`) and found: the only audit product (ANLAV) runs on member-gated questionnaires (B21); two of the three level definitions are on file second-hand (TS 28.100 now held, E-2026-09-24-05; ETSI ENI still via WP 64, B23); no body defines *on which objects* a level applies; no rail-domain criterion set exists; and the one element the 23 June outage demands — detection independent of the element — is drawn by no reference architecture (E-2026-09-19-05/-30/-32). Meanwhile the register itself has operated for three months as a working decision plane (ADR-014) on open tooling, and a private intent stack exists on open components (`pivot-notes-2026-09-20-ibn-core-rail-e2e.md`).

The lead has directed a pivot toward ETSI, 3GPP and TM Forum references for practical use cases, and asked for a framework in the shape of TM Forum's AN built on open references and open source. `17-open-autonomy-framework.md` v0.1 is that framework. This ADR records the decision whether to adopt it.

## Decision

Adopt `17-open-autonomy-framework.md` as the engagement's **reference frame for specifying, scoring, testing and auditing the oversight layer's autonomy**, with these terms:

1. **Open anchors only.** Each component depends on free-to-read normative texts (3GPP, ETSI, IETF, W3C, EU law, ERA) and open-source code; TM Forum material is the mapped comparator, used directly only where its licence permits (Open APIs and conformance kits) and otherwise by citation and paraphrase.
2. **The decision-class ceiling is part of the scale.** A task's reported level is capped by the ADR-002 class of the object it acts on; a score above ceiling fails the evaluation.
3. **The instrument is published with every score** — task set, criteria, ceilings, weights, both IG1252 methods, sub-scenarios, three columns (specified · as-built · ceiling).
4. **Three architectural elements are mandatory** in any realisation: the out-of-band function monitor, the vital gateway, the class-3 hold. A fourth — the independent data-quality layer with the minimum-variability rule — applies to every ingested stream.
5. **Comparability is kept**: the ANLAV scenario catalogue (GB1523B/GB1524B) remains the target the instrument is mapped to, so that a TM Forum-audited number and this framework's number can be read side by side when both exist.
6. **Nothing here changes the guardrail.** Oversight, not control; class 4 never inside the layer.

## Options considered

### Option A — Stay with TM Forum AN as the sole frame
| Dimension | Assessment |
|---|---|
| Complexity | Low — one vocabulary, one method |
| Cost | Membership and ANLAV fees for an audited number; gated texts for the criteria |
| Safety/assurance | The scale carries no object class; L4 core-FM keeps review manual by convention, not by rule |
| Reversibility | High |
Pros: the only frame with an audit product; industry-recognised. Cons: the criteria the register would be scored against are not readable by the register; no rail scenario exists; detection independence is not drawn.

### Option B — Open-reference framework, TM Forum mapped as comparator (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | Medium — three vocabularies mapped once; a licence check per artefact |
| Cost | Authoring and maintenance; no fees; a private build already exists |
| Safety/assurance | The ceiling column makes the bound part of the score; the out-of-band monitor and vital gateway are mandatory elements |
| Reversibility | High — the mapping keeps the TM Forum number computable |
Pros: readable, reproducible, extensible to rail; the register's operating discipline becomes the framework's. Cons: no certification; the ETSI side is second-hand until B23; thinner than IG1252's task catalogue until GB1523B is held.

### Option C — 3GPP-only (TS 28.100 levels, 28.312/28.535 machinery, TR 28.909 KEIs)
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | None |
| Safety/assurance | Normative levels, but L4 undefined and no evaluation method — 28.909 says the score is the evaluator's |
| Reversibility | High |
Pros: fully normative and free. Cons: no scoring method, no intent ontology beyond 28.312, no audit comparator, no architecture above the management plane.

## Trade-off analysis

The governing trade is **auditability by a third party (A) against readability and the safety bound on the scale (B)**. A gives a certificate the register cannot check; B gives a sheet anyone can check and nobody certifies. For a layer whose distinctive property is a bound the industry's own L4 already respects for a core (E-2026-09-26-01), the readable bound is worth more than the unreadable certificate — and B keeps A's number computable for the day both exist. C is B without the intent and evaluation halves, so it is subsumed.

## Consequences

- Easier: stating the layer's autonomy to a procurer or regulator on references they can open; extending the scale to rail scenarios no body has; reusing the register's operating discipline as the framework's; testing "class 4 is never an intent" as a unit test.
- Harder: maintaining three vocabularies in one mapping; a licence check per artefact; explaining why there is no certificate.
- To revisit: on sight of the ETSI ENI/ZSM texts (B23) — architecture vocabulary and level table; on sight of GB1523B (B21) — instrument comparability; after FRMCS#6 (Q4 2026) — who owns the Plugtests catalogue (C6); at the ADR-001/002 quarterly review (2026-11-15).

## Action items

1. [ ] `[D]` **ARB to decide adoption** of `17-open-autonomy-framework.md` v0.1 as the reference frame (this ADR's Status follows the minute, not the author) — act A16.
2. [ ] `[I]` Publish instrument v0.1 as a standalone sheet: rows, criteria, ceilings, weights, both methods, three columns — derived from `16-ig1252-self-score.md` §7; add the network-change row set for UC2.
3. [ ] `[I]` **Licence and IPR verification** of every artefact in framework §2 and §11 — record licence, version and date per item; confirm the TMF921 v5 OpenAPI/CTK terms and the ERA repository terms; classify each as O-N / O-S / O-A / P — act A17.
4. [x] `[I]` ✅ **DONE 2026-09-26 (E-2026-09-26-06/-07/-08): the six ETSI texts and TS 28.533 V20.1.0 read; framework v0.2 §3, §4, §6, §8, §12 re-issued at source; the WP 64 paraphrase corrected in Thread 4 and the inventory; 3GPP's own mapping onto ZSM (28.533 §5.3, A.10) and the Release-20 reference-model functions (A.11) written into §4.** Residuals carried elsewhere, not here: TS 28.567 / 28.561 reading → **B28**; ENI 005 §6.3 functional blocks in full → v0.3 trigger (framework §13). *Original item:* Acquire and read the ETSI primary texts (GR ENI 007/010, GS ENI 005, GS ZSM 001/002/009-1) and re-issue §3–§4 at source — B23; and TS 28.533 for the SBMA vocabulary.
5. [ ] `[D]` Name the framework and fix the publication licence of its text and code (recommendation on file: CC BY 4.0 text, Apache-2.0 code) — lead's decision.
6. [ ] `[I]` Write UC1 as an executable scenario on the private stack: intent with approval expectation, ONAP-style loop with CON-16/17 constraints, stuck-at rule on the self-report stream, ISS record out — the first evidence that the framework runs; depends on A14 and ADR-007 items 2/4.
7. [ ] `[I]` Decide with the lead whether the ceiling column and the rail rows are offered outside the engagement as a candidate rail-domain criterion set (influence act, tier of A3′/A13).
