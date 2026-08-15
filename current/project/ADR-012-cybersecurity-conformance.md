# ADR-012: Cybersecurity regulatory conformance (CRA + NIS-2) — FRMCS products with digital elements and the agentic-oversight layer

**Status:** Proposed
**Date:** 2026-07-01
**Deciders:** Architecture Review Board · Infrastructure Manager (DB InfraGO interface) · NSA / safety authority liaison · CISO / security authority (BSI interface) · Vpnet engagement lead
**Depends on:** ADR-001 (FRMCS transition), ADR-002 (agentic oversight layer), ADR-004 (SIL-4 boundary / freedom-from-interference), ADR-011 (migration change-control); governs R14 and risk PR16
**Affects requirements:** R14 (cybersecurity regulatory conformance), with bearing on R7 (regulatory conformance), R8 / PR13 (vendor concentration & proprietary opacity), R10/R11 (the oversight layer is itself a PDE), R3/R4 (a security fault is an availability threat)
**Legal basis:** EU Cyber Resilience Act — Reg (EU) 2024/2847 (cybersecurity of "products with digital elements"; **fully applies 11.12.2027**, Art 14 reporting from **11.09.2026**, Art 64 fines up to **€15M / 2.5%** worldwide turnover); NIS-2 Directive — Dir (EU) 2022/2555 (operator cyber risk-management **Art 21** + incident reporting **Art 23**; **Annex I Transport/rail**). Verified vs primary law — **E-2026-07-01-06**; re-validated verbatim vs EUR-Lex (Ansvar gateway) — **E-2026-07-10-02**. Sector interfaces: TS 50701 (railway cybersecurity), IEC 62443 (SL / ZCR), BSI TR-03183, ERJU System Pillar — **populated 2026-08-15 from E-2026-08-15-53** (ERJU System Pillar Cyber Security Domain, 4th ERA-ENISA Conf, 03.10.2024): the System Pillar consolidated **42 input documents** (incl. UNISIG **SUBSET-146/147**, TSI CCS 2023, Baseline 4 R2 detailed security requirements, **ESCG Security Measures**) into **four specifications dated 01/2025** — **Shared Cybersecurity Services Spec · Secure Component Spec · Secure Communication Spec · Security Program Requirements (Application Guidelines)** — defining **eight shared services** (STS, PKI, IAM, NAC, LOG, UAS, BKP, DNS). The intended binding mechanism is **TSI → SUBSET-146/147/148 → spec**, split into **technical interoperability requirements** (Shared Cybersecurity Services, Secure Communication) and **process requirements** (Security Program Requirements). ERJU states its own spec is the **"reference system" for IEC TC9 PT 63452**, which is consistent with the 63452 CDV ToC carrying "shared cybersecurity services" at §4 SO-04 (E-2026-08-01-17) — so this interface is also the upstream of the planned TS 50701 → IEC 63452 basis migration. **Unverified as of 2026-08-15:** whether the four specs published on schedule, and whether the ERA-requested **all-TSI cyber gap analysis + CRs** (CCS, TELEM, OPE, LOC&PAS, WAG, INF, ENE, RINF, ERATV/EVR) began Q1 2025 as planned.

**⚠️ SCOPE GAP — Radio Equipment Directive (RED).** ERJU's own compliance slide (E-2026-08-15-53) sets the target legislation as **NIS 2 · CSA · CRA · RED**. This ADR's legal basis covers CRA + NIS-2 only. RED has now been named by **four independent sources** — tmc (E-2026-08-15-29), EPSF (E-2026-08-15-35), Secura (E-2026-08-15-52) and now the spec-writing body itself — and **this register still holds no evidentiary row on the RED or its cybersecurity delegated act**. For an **FRMCS** programme, i.e. radio equipment, that is the most conspicuous remaining scope gap in this ADR. See action item 7.

## Context

The engagement's security dimension was thin — a threat note in ADR-001 §1.8 and the SS7/probe thread (P1/Latro). The VDB CRA-Leitfaden (E-2026-07-01-05, tier B) surfaced the cybersecurity-**regulatory** dimension; primary-law verification (E-2026-07-01-06, tier A) confirmed it as **binding, datable law**, not a proposal.

Two regimes bite:

- **CRA — product side.** Every FRMCS "product with digital element" — 5GC, MCX/IMS core, cab radios, dispatcher terminals — is in scope, **and so is the agentic-oversight layer, which is itself software**. CRA requires secure-by-design, vulnerability handling over a **declared support period**, SBOM, coordinated vulnerability disclosure, and conformity assessment.
- **NIS-2 — operator side.** DB InfraGO is an essential entity in the **Transport** sector (Annex I): Art 21 risk-management measures + Art 23 incident reporting (24 h / 72 h / 1-month).

The load-bearing tension: **CRA mandates security updates over a support period; railway authorisation (Zulassung) demands stability.** Every security update to a live, authorised, safety-critical product is a *change* — it must preserve **Rückwirkungsfreiheit** (freedom-from-interference) against the safety case and pass change-control. This is the **security analogue of the 23-June change-on-live-legacy lesson**: an ungoverned change to a live element caused the outage; an ungoverned security update is the same hazard with a security trigger.

Security ≠ Safety (the CRA-Leitfaden is explicit), but they **couple**: an unpatched vulnerability can become an availability/safety event, and — per the incident's cause-agnostic detection lesson — a fault a component does not self-report includes a **compromise** it does not self-report.

## Decision

Adopt CRA + NIS-2 conformance as a **first-class, governed dimension** of the transition and the oversight layer, reusing the existing ADR-004 / ADR-007 / ADR-011 machinery rather than a parallel security process:

1. **CRA scope + procurement gate.** Treat every FRMCS PDE **and the agentic-oversight layer** as in-scope: secure-by-design, vulnerability handling over a **declared support-period end date**, SBOM, CVD. Procurement (R8) requires manufacturer **CRA evidence** (SBOM, security-update + support-period commitment, CVD contact) as a bid condition — which also discharges **PR13** (proprietary opacity / vendor-fix dependency).

2. **Security updates are changes — govern them under ADR-011.** A CRA security update to a live safety-carrying element is a **Class A/B change**: CSM-RA Art 4(2) significance test, inactive-redundancy-only, maintenance window, pre-change test gate (ADR-007 failover injection + canary-by-segment), per-change safety-impact analysis at the SIL-4 boundary (ADR-004). **No security update bypasses change-control on urgency** — instead define an **expedited-but-still-gated** path for actively-exploited vulnerabilities (CRA Art 14).

3. **Preserve Rückwirkungsfreiheit (ADR-004).** Security functions and updates must not interfere with the SIL-4 safety kernel; the EN 50129 freedom-from-interference / composition analysis is the **shared boundary** for both safety changes and security updates.

4. **NIS-2 into the operator SMS.** Art 21 risk-management measures + Art 23 reporting (24 h / 72 h / 1-month) embedded in the operator's Safety/Security Management System; align the reporting chain with **CRA Art 14** (manufacturer) so a vulnerability/incident is reported once, correctly, to the right authority (BSI / CSIRT).

5. **Independent detection covers security too (ties PR5/PR11).** The out-of-band monitoring that detects silent faults (ITU-T Q.752 probes, E-2026-06-30-03) feeds security event detection (SIEM / IDS) — the same "don't rely on a component to self-report" principle applies to a compromise as to a silent fault.

**Boundary preserved:** the guardrail holds — security controls **advise and protect; they never autonomously actuate** safety-critical functions (oversight, not control).

**Core principle: one gate for change. A security update to live safety-critical code is a safety-relevant change — class it, isolate it, prove failover triggers, preserve freedom-from-interference — never run a second, uncoordinated change regime on the same estate.**

## Options considered

### Option A — Security as a vendor/product matter, outside architecture governance (status quo)
| Dimension | Assessment |
|---|---|
| Complexity | Low |
| Cost | Low |
| Safety/assurance | Weak — ungoverned security changes |
| Reversibility | n/a |
Pros: no process overlay. Cons: CRA/NIS-2 bind the operator + integrator, not just vendors; security updates become **ungoverned changes** — the 23-June failure mode with a security trigger; non-conformance risk (Art 64 fines). **Rejected.**

### Option B — CRA/NIS-2 conformance as a governed dimension reusing ADR-004/007/011 (recommended)
| Dimension | Assessment |
|---|---|
| Complexity | Medium (process overlay) |
| Cost | Medium — reuses change-control + boundary + test surfaces |
| Safety/assurance | Strong — one gate for safety + security change |
| Reversibility | High — per-change segment rollback (ADR-011) |
Pros: reuses existing machinery, so marginal cost is the CRA/NIS-2 overlay, not new process; mitigates PR13; single coordinated change gate. Cons: CRA conformity-assessment + SBOM discipline across many PDEs; expedited-vuln path must still be gated. **Recommended.**

### Option C — Separate parallel security-change process, independent of safety change-control
| Dimension | Assessment |
|---|---|
| Complexity | High |
| Cost | High (duplicate process) |
| Safety/assurance | Weak — two uncoordinated regimes on one estate |
| Reversibility | — |
Cons: two independent change regimes on the same live safety-critical estate **multiply** the silent-change risk; security and safety changes must share one gate. **Rejected.**

## Trade-off analysis

The governing trade is **conformance rigour + reuse vs process overhead**. Option A is cheapest and reproduces the 23-June mode (ungoverned change) with a security trigger, plus Art 64 exposure. Option C duplicates process and creates the two-regime hazard. Option B adds a CRA/NIS-2 overlay but **reuses ADR-011 (change-control), ADR-007 (test surfaces) and ADR-004 (boundary)** that must exist anyway — so the marginal cost is the classification + conformity overlay, and it keeps safety and security changes under **one gate**.

## Consequences

- **Easier:** R14 governed; PR16 treated; **PR13 mitigated** (CRA SBOM + security-update evidence); safety and security changes share one gate; NIS-2 reporting embedded in the SMS; the Q.752 detection layer does double duty for security.
- **Harder:** CRA conformity assessment + SBOM discipline across many PDEs and legacy elements; the **expedited actively-exploited-vuln path must still be gated** (tension between CRA Art 14 speed and SIL-4 rollback intolerance); support-period commitments for long-life rail assets — an end-of-life element (cf. the 1991 node) may lack CRA-conformant vendor support, re-raising **PR13/PR14**.
- **To revisit:** CRA delegated/implementing acts + harmonised standards as they land; **the Radio Equipment Directive + its cybersecurity delegated act vs FRMCS radio equipment (E-2026-08-15-53 — named by ERJU System Pillar alongside NIS 2/CSA/CRA; still unevidenced here)**; TS 50701 / IEC 62443 mapping **(and its successor: the ERJU SP spec is the stated reference system for IEC 63452)**; whether the oversight layer needs its own conformity-assessment tier; the residual verification gaps (E-2026-07-01-06).

## Action items
1. [ ] **CRA PDE inventory** — list every FRMCS product-with-digital-element + the oversight-layer software; class by CRA product category; map declared support periods.
2. [ ] **Procurement clause** — manufacturer CRA evidence (SBOM, security-update + support-period commitment, CVD contact) as a bid requirement (R8 / PR13). **5G-core secure-by-design controls (E-2026-07-24-01 — CCS '25, empirical 5GC attack surface across six cores):** for any FRMCS 5GC / UPF / AMF / SMF bid, require as bid conditions and as ADR-007-style acceptance-test surfaces (Tunneler-class protocol-tunneling / boundary-bridging conformance probing) — (a) **IPsec MANDATORY on N2/N4** (the paper finds it "often disabled" in performance-optimised/trusted deployments — the network-boundary-bridging enabler); (b) **UPF egress + routing enforcement**, with N3→N4/internal re-entry deny-listed (stop user-plane traffic reaching control-plane NFs); (c) **GTP-U nested encapsulation rejected beyond one layer** (inspect first 64 bytes — defeats GTP-U-in-GTP-U protocol tunneling); (d) **full identifier entropy** — full 32-bit TEID / 64-bit SEID, no low-bit or predictable-sequential allocation (the paper enumerated 12-bit Open5GS SEIDs in <9 s); (e) **PFCP source-binding** (bind SEID to source as TEID-IP already is) + defined handling of empty/malformed PFCP messages (a DoS/crash vector — SD-Core crashed on malformed PFCP); (f) **rate-limiting on control-plane messages + per-IP PFCP session quotas** (no evaluated core rate-limited error responses). These extend the R8/PR13 vendor-security-evidence requirement with named, testable 5G-core controls and feed the ADR-007 failover/canary test gate. **Normative basis (E-2026-07-26-14):** these 5G-core controls are specified in 3GPP/ETSI **TS 33.501** (5G System security architecture — 5G-AKA authentication, SUPI/SUCI privacy, NAS/AS ciphering+integrity, SBA NF-authentication via TLS/OAuth2, SEPP inter-PLMN protection). The load-bearing point: TS 33.501 leaves several protections (N2/N4 security, SBA authorization) **optional / deployment-dependent**, which is exactly what the CCS '25 attacks exploited (E-2026-07-24-01, "N2/N4 IPsec often disabled" → control/user-plane bridging) — procurement must **mandate** them, not accept the spec's optionality.
3. [ ] **Extend ADR-011** change classes to cover security updates explicitly; define the **expedited-but-gated** actively-exploited-vulnerability path (CRA Art 14). **Clock precision (E-2026-07-10-02):** the vulnerability track runs 24 h / 72 h / final report **14 days** after a corrective measure is available (Art 14(2)(c)); the 24 h / 72 h / **1-month** cadence is the severe-*incident* track (Art 14(4)) — the expedited path must be sized to the 14-day clock.
4. [ ] **NIS-2 Art 21/23 into the operator SMS**; align the reporting chain with CRA Art 14 (single report to the right authority; BSI / CSIRT).
5. [ ] **Extend independent detection** (Q.752, E-2026-06-30-03) to security event detection (SIEM / IDS feed).
6. [ ] **Close residual verification** — exact CRA recall paragraph; German NIS2UmsG in-force date (E-2026-07-01-06 gaps).
7. [ ] **Open the RED question (NEW 2026-08-15, E-2026-08-15-53).** Establish whether the **Radio Equipment Directive** and its cybersecurity delegated act reach **FRMCS radio equipment** (cab radios, on-board 5G modems, trackside radio), and how RED conformity interacts with CRA scope for the same product. Four independent sources now name RED as in-scope rail-cyber legislation; **this register has zero primary evidence on it**. Deliverable: one tier-A row from the RED text + delegated act, then fold the outcome into the §"Legal basis" above and the procurement gate (action 2).
8. [ ] **Chase the ERJU System Pillar deliverables (NEW 2026-08-15, E-2026-08-15-53).** Confirm (a) whether the four SP specs published **01/2025**; (b) whether the **all-TSI cyber gap analysis + CRs** started **Q1 2025**; (c) the outcome of the SP **review of FRMCS v3 specs** — the first evidence that FRMCS specifications are themselves in cyber-review scope, and directly load-bearing for R1/R5 × R14. Source contact on the deck: cybersecurity.review@ertms.be.
9. [ ] ARB + NSA + **BSI** ratify; link from R14 + PR16; flip to Accepted.
