# FRMCS arcKit — project memory

This repo is a living architecture-decision record set for the GSM-R → FRMCS transition and an agentic AI autonomous-oversight engagement, run with the arcKit method: outcome-anchored, ADR-recorded, evidence-logged, frozen to a daily baseline.

## Layout

- `current/` — the live working set. Edit these.
  - `ADR-001-gsmr-to-frmcs.md`, `ADR-002-agentic-governance.md` — decisions.
  - `traceability-matrix.md` — requirements ↔ decisions ↔ status (the spine).
  - `evidence-log.md` — dated evidence with trust tiers.
  - `incident-annex.md` — DB GSM-R outage, 23–24 Jun 2026.
  - `project/` — the engagement workspace (charter, governance/RACI, phase-gate, risks, ADR log).
  - `diagrams/`, `project/diagrams/` — svg + png.
- `baselines/<date>/` — frozen daily snapshots. **Never edit by hand** — they are the audit trail.
- `scripts/baseline.sh` — the freeze.

## Always

- Hold the outcome first: "safe, continuous rail operations." If a change no longer traces to it, cut it.
- Keep trust tiers honest (A primary · B vendor-promotional · C trade press · D aggregator). Mark opinion as opinion.
- Paraphrase source material in the evidence log; cite, never paste copyrighted text.
- Record every material decision as an ADR (use `current/project/04-adr-log.md` template) before acting on it.
- **Give load-bearing ADRs a review date and honour it.** A decision record that never changes is not stable, it is unattended — and "settled" and "stale" look identical from outside. ADR-001 and ADR-002 carry `Next review due`; quarterly.
- **Citation nomenclature for 3GPP texts (lead's decision, 2026-09-26).** A 3GPP specification and its ETSI transposition are one document (3GPP TS 28.561 V19.3.0 = ETSI TS 128 561 V19.3.0; identical clauses, ETSI cover, ETSI issues only frozen versions). The register cites them in two classes. **Rail-pinned:** any 3GPP spec named in the normative references of a held ETSI TC RT or UIC FRMCS document (TS 103 765-x, 103 792, 103 793, 104 069-x, 104 070; FFFIS-7950, FIS-7970, SRS AT-7800, TOBA-7510) or of the CCS TSI index, **and the whole 3GPP Mission Critical (MCX) family regardless of pin (22.179/280/282/289, 23.280–23.283/289/379, 24.379–24.484, 33.180) — rail's own requirement set inside 3GPP, lead's ruling** — cite the **ETSI form at the version the pinning document names**, e.g. `ETSI TS 123 280 V19.8.1 (3GPP TS 23.280; pinned by TS 104 069-1)`, and hold that edition. **Common:** every other 3GPP spec (SA5 management, generic 5GC, generic SA3, RAN L1, vocabulary) — cite the **3GPP form, latest text, release stated**, e.g. `3GPP TS 28.567 V20.1.0 (Rel-20, working)`; when a common clause becomes load-bearing for a conformity or procurement statement, add the frozen ETSI edition beside it. The class of every spec on record is in `current/project/18-standards-on-record.md` (regenerate, do not hand-edit). A spec pinned by two rail documents at different versions carries both; cite the one the document under discussion pins.
- **Ratification is the ARB's act, not the author's.** Never flip an ADR Status to `Accepted` without a board decision to point at — a fabricated governance event in an audit trail is worse than an unratified decision. Separate **decision-shaped** action items (which block ratification) from **implementation** items (which do not); see `current/project/06-ratification-readiness.md`.

## Never

- Never assert the EU AI Act high-risk classification as fact until verified vs Annex I + CCS TSI (it is seeded `watch`).
- Never blur the guardrail: this is autonomous **oversight, not control** — safety-critical actuation stays human-in-command.
- Never edit files under `baselines/`. **Additive annotation is the exception and the only one** — a `CORRUPTED.md` marker beside a damaged freeze preserves the trail; silently repairing or re-cutting one destroys it (precedent: the 2026-09-04 markers).
- **Never rewrite a register file with a scripted whole-file write** — no `python … open(p,'w').write(s)`, no `sed -i`, no shell redirection over an existing file. **Use the Edit tool.** On 2026-09-04 scripted rewrites of `ADR-010`, `ADR-011`, `03-risk-register.md` and `06-ratification-readiness.md` were the exact files that `cp` then froze as correct-size, all-NUL: **15 zeroed files across 7 baselines, and the decision-health block reported ADRs drifting 9 → 7 → 8 of 11 when nothing had moved.** `current/` survived; the audit trail did not. A targeted edit is also reviewable in a way a regenerated file is not.
- **Never quote a decision-health number without knowing the freeze is clean.** Every counter reads the *frozen* copy, so a zeroed file scores zero silently — and `MANIFEST.tsv` hashes the corrupt bytes, so **verifying a baseline against its own manifest passes**. `scripts/baseline.sh` now verifies and aborts rather than freezing what it cannot vouch for; if it aborts, that is the control working.

## Daily loop

1. Evidence arrives → append a row to `current/evidence-log.md` (next `E-YYYY-MM-DD-NN` id, trust tier, affected `Rn`, action: revise/validate/watch).
2. **Answer the decision question explicitly — every row, no exceptions.** End the row with either `MOVES:` (name the decision, make the edit in `current/traceability-matrix.md` and/or the ADR **in the same sitting**, action = `revise`) or `NO DECISION MOVED — because …` with the reason in one clause. Legitimate reasons: corroborates an existing position, below the evidence bar, informational, plan-not-outcome. **Leaving it unanswered is not legitimate** — it is indistinguishable from never having asked.
3. End of day → freeze: `bash scripts/baseline.sh` (writes `baselines/<date>/` with MANIFEST, a status snapshot, a **decision-health block**, and a diff vs the previous baseline).
4. **Read the decision-health block.** If `revise rate` sits near 5%, or `ADRs Accepted` stays at 0, the wire between evidence and decisions is disconnected — a full log is not evidence of health.

⚠️ **`baselines/<date>/` is the day's FIRST freeze, not its last.** `scripts/baseline.sh` writes the plainly-named `<date>` directory once; every later freeze that day goes to `<date>_HHMM/`. So on any multi-freeze day, the directory whose name looks canonical holds the **morning** state, and the latest state is the highest-numbered `_HHMM` sibling. **To read a day's end state, take `ls -d baselines/<date>* | tail -1`, never `baselines/<date>/`.** This is documented rather than fixed on purpose: making `<date>/` track the latest freeze would mean writing into an existing baseline directory, which the §Never rule forbids and which is exactly the operation that produced the 2026-09-04 corruption. **Worked example of the gap: on 2026-09-06, `baselines/2026-09-06/` is the 14:45 cut — six open queue entries and an uncorrected ADR-001 — while `2026-09-06_1910` has the queue empty and the correction in. Same day, two very different registers.**

**Why (2026-08-15).** At 338 rows the register had **0 of 9 ADRs ratified**, 55 open action items, 4 closed, and a 5% revise rate. Both founding ADRs had drifted: ADR-001 carried a GSM-R switch-off date the evidence log had itself marked superseded **on day one**, and ADR-002 asserted an EU AI Act high-risk posture that ADR-003 disproved **the same day it was written**. Both were visible in the log the entire time; nothing forced anyone to look. See `current/linkedin-post-decision-drift.md` and `current/project/06-ratification-readiness.md`.

## Commands

- `bash scripts/baseline.sh` — cut today's baseline. **First cut of the day lands in `baselines/<date>/`; later cuts land in `baselines/<date>_HHMM/` and the script says so on stderr — read that line rather than assuming where it went.**
- `ls -d baselines/<date>* | tail -1` — **the day's LATEST freeze.** Use this, not `baselines/<date>/`, whenever you want end-of-day state (see §Daily loop).
- `bash scripts/baseline.sh 2026-06-25` — cut for a specific date.
- Compare two days: open the two `baselines/<date>/BASELINE.md` files, or `diff` the matrices.
