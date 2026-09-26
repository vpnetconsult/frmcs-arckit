# MCX feature-parity regression suite — ADR-007 Surface 5, written

**Date:** 2026-09-19 · **Method:** arcKit · **Status:** DRAFT v1 — the suite *written*; execution needs a test ring (ADR-007 items 2/4) and, for the GSM-R side, an EIRENE-conformant reference
**Anchors:** ADR-007 §Surface 5 · ADR-001 item 5(a)/(c) · ADR-013 §Decision (stage 2a/2b) · PR15 · `14-next-acts.md` A6
**What it covers (the bar as ADR-007 defines it):** *does MCX do what GSM-R did* — Ril 481.0205 + the (MI)-marked EIRENE FRS 8.1.0 / SRS 16.1.0 requirements — for the two rail-specific features that have a Stage 1→2→3 citation chain (functional alias, multi-talker), the interworking seam, and the border. It does **not** cover conformance to the UIC V2 spec (that is MORANE-2 D1.1 / T-8900, not held) and it does **not** ask whether failover triggers (surfaces 1 and 3).

> **Every case below cites the text it is derived from, by version and clause, all held in Downloads.** Where a clause makes something *configuration* rather than *behaviour*, the case says "fix, do not assume" and names the parameter. Where the GSM-R side is *line-conditional* (RINF), the case says so and names the RINF index.

---

## 0. Sources — held, cited by version

| Side | Text | Where held |
|---|---|---|
| Rail requirement (V2 bar) | UIC SRS AT-7800 **v2.1.0** §21.2 (multi-user talker control) · §11.6 (role-based identification) · §9.5 (interworking) | `Downloads/uic_frmcs_srs_at-7800_v2.1_0.pdf` (E-2026-09-19-19) |
| 3GPP Stage 1 | TS 22.280 V20.2.0 §5.9a (functional alias) · TS 22.179 V20.0.0 §6.2.3.7 (multi-talker) | `22280-k20.docx`, `22179-k00.doc` (E-2026-09-19-07) |
| 3GPP Stage 2 | TS 23.280 V20.4.0 §8.1.5, §10.13 · TS 23.379 V20.3.0 §10.9.1.3.1a / .2.1 / .6 · TS 23.283 V20.1.0 §8.1, §10.4, §10.14, §10.15 | `23280-k40.docx`, `23379-k30.docx`, `23283-k10.docx` (E-2026-09-19-13/-14/-15) |
| 3GPP Stage 3 | TS 24.379 V20.0.0 §4.14, §9A · TS 24.380 V20.0.0 §6.3.4.4.7a · TS 24.483 V20.0.0 `FunctionalAliasList` | `24379-k00.docx`, `24380-k00.docx`, `24483-k00/` (E-2026-09-19-10) |
| Security | TS 33.180 V20.0.0 Annex L (SeGy) | `33180-k00.docx` (E-2026-09-19-11) |
| Interworking profile | ETSI TS 103 792 V1.1.1 (IWF-1…-g5, EIRENE↔alias mapping) | `ts_103792v010101p.pdf` (E-2026-07-30-11) |
| GSM-R side | EIRENE FRS 8.1.0 / SRS 16.1.0 (MI) · Ril 481.0205 (14.12.2025) · ETSI TS 103 389 / TS 102 610 (UUI) · TS 23.094 / 44.069 (VGCS/VBS) | (E-2026-07-02-30/-31, E-2026-06-24-18, E-2026-07-30-22/-25, E-2026-09-19-09) |
| Register (line-conditional facts) | ERA Ontology v3.3.4 — RINF 1.1.1.3.3.x / 1.1.1.3.8.x | `Downloads/era-ontology-v3.3.4/era-ontology-v3.3.4.ttl` (E-2026-09-19-25) |
| **Multi-vendor interop precedent** (added 2026-09-26) | ETSI TS 103 564 V1.6.1 (2024-04, Rel-17 base) §10 FRMCS scenarios and §7.13 FA cases. Descent per case: **FA-1/-2/-6** ← §7.13 (activate / take over / resolution across servers) + FRMCS/IOP/ADVFA/01; **FA-5** ← FRMCS/IOP/ADVFA/01 (`LocationCriteriaForActivation` or role-management server) + FRMCS/REC/CLIENT/01 area-triggered affiliation; **MT-1/-5** ← FRMCS/IOP/MULTI/01 (late entry; optional second administrative domain); **MT-3/-6** ← FRMCS/IOP/REC/01 (REC pre-empts a private call) + FRMCS/REC/CLIENT and /SERVER 01–02; **IW-1…IW-5** ← *none* (§11.1: IWF cases are LMR-agnostic). **Execution record 2022–2025, from the four FRMCS Plugtests reports (E-2026-09-26-05; pass/run, TS 103 564 numbering):** FA activate 7.13.1 — 44/45 · 32/38 · 92/93; take-over 7.13.4 — 7/7 · 7/8 · 24/26; location-triggered 7.13.5 — 2/3 · 8/8 · 9/9; determine 7.13.7 — 40/43 · 26/29 · 82/85; auto-deactivate 7.13.10 — 11/12 · 2/2 · 13/15 → **FA-1/-2/-5/-6: strong**. Multi-talker basic 7.3.7 — 3/5 (2022) · 5/7 (MCX 7th) · 1/1 (MCX 8th) · 4/5 (2025) → **MT-1/-5: thin, ≤ 80 %**. REC 10.1 — 0 runs; 10.2 — 0/1 (2022); 10.3 — 3/3 (2025, first passes); 10.4 — 0 runs; REC pre-emption 10.11 — 1/1 (2023) · 1/1 (2025) → **MT-3/-6: three server-driven passes and one failed client-driven run in four years**. Dynamic alias ADVFA 10.5 — 1/1 (2023) only. GSM-R interworking — Config-IWF-GSMR 0/1 (2025) → **IW-1…IW-5: one attempt, failed**. Per-vendor results are under NDA; these are ETSI's published aggregates | `Downloads/ts_103564v010601p.pdf` (E-2026-09-26-02) |

---

## 1. Functional alias ↔ functional numbering — 9 cases

Stage-1 bar: TS 22.280 §5.9a (activation, take-over, reachability while migrated, group and private use). Stage-2 model: TS 23.280 §8.1.5 (alias = URI anchored on the *home* system's controlling server; several active, one per communication; shareable; the MC service ID carries the security context; a different alias set when migrated). Wire: TS 24.379 §9A (SIP PUBLISH: activate / take over / deactivate / renew; location-triggered activation with a manual-deactivation guard), MO entry TS 24.483 `FunctionalAliasList`.

| # | Case | MCX expected (cite) | GSM-R counterpart (cite) | Fix, do not assume | Pass criterion |
|---|---|---|---|---|---|
| FA-1 | Activate an alias (train number) on registration | PUBLISH per 24.379 §9A.2; server stores status, notifies subscribers (23.280 §10.13.4) | Functional registration — EIRENE FRS (MI) functional addressing; Ril 481.0205 functional addressing | alias format in `FunctionalAliasList` (24.483) vs EIRENE functional-number scheme — the IWF mapping table of TS 103 792 | reachable by alias within the 22.289 session-establishment bar (≤1 s immediate / ≤3 s normal, E-2026-09-19-02) |
| FA-2 | Take-over of an alias already active on another client | Server checks conflict, sends **functional alias revoke notification** to the displaced holder (23.280 §10.13.6 step 3, §10.13.2.10), stores, notifies | **Forced de-registration of a functional number by another driver** — **line-conditional: RINF 1.1.1.3.3.11 `era:gsmrForcedDeregistrationFunctionalNumber`** | per line: whether the GSM-R network allows it at all (read RINF, do not assume) | displaced holder is notified and loses the alias; where RINF says "not allowed", the MCX behaviour must be *configured* to match (take-over rejected) |
| FA-3 | Shared alias — several users hold one alias | all co-holders included in a communication to the alias; on take-over all are informed (23.280 §8.1.5, §10.13.6 step 6) | no direct GSM-R equivalent (one functional number → one mobile) | whether the operator permits sharing per alias type | a call to a shared alias reaches every holder; no GSM-R-side ambiguity introduced through the IWF |
| FA-4 | Alias not portable across organisations | migrated user "uses a different set of functional aliases" (23.280 §8.1.5) | GSM-R functional number valid network-wide within a national network; cross-border by roaming agreement | the corridor's alias-set boundary (ADR-001 item 5(c)) | crossing into another IM's MC system yields the *new* alias set, and the IWF mapping declares which system resolves it |
| FA-5 | Location-triggered activation with manual-deactivation guard | 24.379 §9A (activation on entering an area; not auto-deactivated if manually activated) | location-dependent addressing — EIRENE FRS (MI) | the trigger areas and the guard flag | no silent loss of alias on area exit when the driver activated manually |
| FA-6 | Alias in a private call (driver ↔ controller) | 22.280 §5.9a private communication based on functional alias; resolution 23.379 §10.7.2.1.8; **for an alias homed in GSM-R, resolution happens in GSM-R** (23.283 §10.4 NOTE 1) | functional-number call setup — Ril 481.0205; UUI carries application data (TS 103 389 / TS 102 610) | which side resolves (home system of the alias) | both directions across the IWF resolve correctly; UUI content preserved |
| FA-7 | Alias identifies the current talker in a group | 23.379 floor procedures identify the talker by alias (SRS v2.1 §21.2.4.1 item 5, M) | talker identity display in VGCS — EIRENE FRS | display format on the cab radio HMI | the displayed identity is the alias, not the MC ID, on both sides of the IWF |
| FA-8 | Alias on the IWF is optional | TS 23.283 §10.14.1: functional alias "is not a requirement in TS 22.179 and is therefore an optional feature" | — | **procurement**: the IWF product must implement §10.14 flows | contract clause present; else FA-1…FA-7 cannot pass through the IWF |
| FA-9 | Alias survives e2e-security termination at the IWF | 33.180 Annex L: the SeGy terminates MC security; "a notification shall be provided to the MC user by the MC client" | GSM-R side has no MC security | the HMI form of the notification (ADR-001 item 5(a)) | driver sees the notification on every mixed-fleet call; alias mapping unaffected |

## 2. Multi-talker ↔ group call with controller pre-emption — 7 cases

Stage-1 bar: TS 22.179 §6.2.3.7. Rail V2 bar: SRS v2.1 §21.2.4.1 (M): floor request, granted, release, **revoke with pre-emptive priority**, talker identification by alias; §21.2.4.2 (O-V3): time-based revoke, talker location; §21.2.3.1: RTCP APP per 24.380. Stage 2: TS 23.379 §10.9.1.3.1a (multi-talker floor taken; grant/deny/queue on floor priority, participant type, transmit allowance, **maximum number of simultaneous talkers**; server "may limit the time a floor participant is allowed to talk"), §10.9.1.3.2.1 (override at the maximum: lowest-priority talker revoked), §10.9.1.3.6 (**floor revoke by the authorised user**, Rel-19). Wire: TS 24.380 §6.3.4.4.7a (allow-both under the maximum; at the maximum pre-emptive priority revokes the lowest with Reject Cause #4).

| # | Case | MCX expected (cite) | GSM-R counterpart | Fix, do not assume | Pass criterion |
|---|---|---|---|---|---|
| MT-1 | Second talker joins while first talks | *multi-talker floor taken* to the current talker — "granted to other floor participants, but the floor is not revoked" (23.379 §10.9.1.3.1a step 6b) | VGCS: one talker at a time (TS 44.069) — **no counterpart**; this is an MCX-only capability | group configured for multi-talker; audio mixing location (**network or UE — Rel-19 allows both**, 23.379 CRs V19.1.0/V19.7.0) | both talkers heard by listeners; first talker's floor intact |
| MT-2 | Maximum reached, higher-priority requester | lowest-priority talker revoked (23.379 §10.9.1.3.2.1; 24.380 §6.3.4.4.7a Reject Cause #4) | eMLPP pre-emption — EIRENE FRS (MI) | **maximum simultaneous talkers** (group config) and floor-priority values | revocation reaches the displaced talker within the floor-control timer catalogue of 24.380 |
| MT-3 | Controller revokes any talker | floor revoke by the authorised user (23.379 §10.9.1.3.6) | controller pre-emption in a REC — Ril 481.0205 Notruf priority | who is "authorised" (role — SRS v2.1 §21.3 role management) | the controller's revoke succeeds against any priority; REC semantics preserved |
| MT-4 | Per-talker time limit | server "may limit the time a floor participant is allowed to talk" (23.379 §10.9.1.3.1a step 4) — **O-V3** as time-based revoke (SRS §21.2.4.2) | none | the limit value, or its absence in V2 | if configured, revoke at the limit; if not, no silent cut-off |
| MT-5 | Cross-system multi-talker (corridor) | "multi-talker floor control involving multiple MCPTT systems" (23.379 V19.3.0) | VGCS across networks by roaming agreement | which system arbitrates the floor at the border | floor arbitration continues across the interconnection without a talker being dropped |
| MT-6 | REC with multi-talker off | REC group configured single-talker with controller priority | REC — EIRENE FRS (MI), Ril 481.0205 | REC group's multi-talker flag = off | REC behaves as GSM-R REC: one talker, controller wins |
| MT-7 | Multi-talker through the IWF | IWF-1 carries a subset of MCPTT-3 (23.283 §7.4.1); floor control interworking (23.283 §10.5) | GSM-R VGCS single talker | how the IWF collapses multi-talker to single-talker for the GSM-R participant | GSM-R participant hears mixed audio or the designated talker per the configured rule; no floor deadlock |

## 3. Interworking seam and border — 5 cases

| # | Case | Cite | Fix, do not assume | Pass criterion |
|---|---|---|---|---|
| IW-1 | IWF appears to MCX as a peer MC system | 23.283 §4 ("the IWF, along with its LMR system, will appear as a peer interconnected MC system"); §7.4 IWF1–4 | which of IWF1–4 the product implements (IWF4 location optional) | every FA-/MT- case above runs in *both* directions across the seam |
| IW-2 | Identity mapping declared | 23.283 §8.1 (IWF maps MC IDs ↔ LMR identities; an MC alias assigned to a user homed in the IWF maps to the LMR role-based scheme) · TS 103 792 EIRENE↔alias mapping | the mapping table itself — a configuration item (ADR-011) | no call handled by "both radios fitted and the driver picks" (ADR-001 item 5(a) rule) |
| IW-3 | Security termination and notification | 33.180 Annex L; 23.283 §10.9 (IWF as security gateway; must run 33.180 key management to remove MC encryption before transcoding) | HMI form of the notification | see FA-9 |
| IW-4 | Per-corridor declaration, GSM-R side from RINF | RINF 1.1.1.3.8.2 `era:switchRadioSystem` (switch-over between radio systems exists) · 1.1.1.3.8.2.1 `instructionsSwitchRadioSystems` (the instruction document) · 1.1.1.3.3.12 `radioNetworkId` · 1.1.1.3.3.9/.10 RSC types (E-2026-09-19-25) | read per section of line — do not assume uniform | the corridor's GSM-R side matches RINF; the FRMCS side is the operator's declaration (no RINF field exists — legal-chain §6 item 8) |
| IW-5 | Fallback carries classes D/E only | Ril 481.0205 §5/§9 (P-GSM: no Notruf, no group calls; radio fault → stop at next station); ADR-001 item 5(b); SRS v2.1 §12.3.8 (MPF decides, static policy in V2) | the Multipath Policy (SRS §12.3.21) | a class-A–C session is never steered to the public path without the evidenced decision; the driver-facing consequence (stop rule) is the documented one |

## 4. What this suite deliberately does not contain

- **Off-network / DMO parity** — deferred with the mode: SRS v2.1 puts off-network "out of scope for FRMCS V2"; FRS §4.5.7 defers it past V3; no functional alias exists off-network (23.280 §10.13.1). Starting point when it returns: 23.304 PQI classes (E-2026-09-19-18).
- **Liveness / AVC** — no MCX primitive at any stage (E-2026-09-19-10/-14); measured at the cab-radio application layer or by the independent monitor — surface 3, not this suite.
- **Failover** — surfaces 1 and 3.
- **V2 conformance** — MORANE-2 D1.1 / T-8900 (not held; `14-next-acts.md` A7).
- **Interop results and the GSM-R seam precedent** (2026-09-26, E-2026-09-26-02) — ETSI TS 103 564 §10 supplies the multi-vendor *descriptions* the FA/MT cases descend from (§0), not pass/fail per vendor pair (Plugtests reports, B27); and it supplies nothing for IW-1…IW-5, because its IWF cases evaluate the MC side only (§11.1). The seam stays proven here or nowhere.

## 5. Execution prerequisites (not new information — named so the build can start)

1. A test ring with an MCX server implementing 23.379 multi-talker and 23.280 §10.13, an IWF implementing 23.283 §10.14/§10.15 (contract clause FA-8), and an EIRENE-conformant GSM-R reference (the existing network's test bed or a simulator).
2. The configuration set fixed in writing before the first run: alias format and mapping table; multi-talker flag, maximum talkers, priorities, time limit, mixing location per group; RINF 1.1.1.3.3.11 value per test line; Multipath Policy.
3. Each run recorded as an ISS-shaped record (`incident-annex-iss-occurrence-scenario.md` §8 pattern) so that parity failures and failover failures share one evidence format.

*Every citation above is to a text held in Downloads at the version stated; no case rests on an unheld document.*
