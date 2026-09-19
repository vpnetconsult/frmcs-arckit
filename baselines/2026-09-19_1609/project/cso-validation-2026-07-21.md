# CSO validation — cybersecurity posture of the FRMCS engagement record

**Date:** 2026-07-21 · **Role:** Chief Security Officer review of the arcKit working set (`current/`) against the cyber threat landscape
**Method:** two passes — (1) direct artifact review of ADR-012, the risk register (PR1–PR16), the traceability matrix (R14) and evidence rows E-2026-07-12-04 … E-2026-07-20-01; (2) the same scope re-assessed through four packaged cybersecurity-skills methodologies (sector threat landscape · NIST SP 800-30 · IEC 62443-3-2 zones/conduits · PQC migration). Tooling steps of those skills are inapplicable to a documentation repo; their analytic methods and output formats were applied.
**Status of this document:** internal analysis / opinion — not evidence. Nothing here is an evidence-log row; A-tier grounding is cited by E-id where it exists.

## Verdict

The security posture is architecturally sound and unusually well-evidenced for a pre-build engagement, but it is entirely paper — ADR-012 is Proposed with all seven action items open while the CRA Art 14 reporting obligation bites 11.09.2026 (<14 months). Sharpened by the skills pass: the record is **pre-adversarial** — structural and accidental threat sources (the 23-June class) are modelled rigorously, but the register carries **no adversarial threat event**, the zone/conduit model exists only implicitly inside ADR-004, and the crypto posture fails Mosca's inequality on the record's own asset-lifetime evidence.

## What holds up

- **One-gate principle (ADR-012).** Security updates to live safety-carrying code governed as ADR-011/ADR-004 changes — closes the 23-June mode with a security trigger; expedited-but-gated path correctly sized to the CRA 14-day corrective-measure clock (E-2026-07-10-02).
- **Detection philosophy coherent across safety and security.** "A fault a component does not self-report includes a compromise it does not self-report" — Q.752 out-of-band monitoring (PR5/PR11) doubles as the SIEM/IDS feed; the Vitale conformance-checking row (E-2026-07-12-04) supplies a candidate technique class, with intrusion attempts explicitly the latent-fault class.
- **A-tier threat baseline on file.** ENISA Transport Threat Landscape (E-2026-07-20-01): rail 2021–22 reality = IT/service disruption + hacktivist DDoS, **no reliably reported safety-function compromise in period**; DSB 10/2022 supply-chain vector confirmed A-tier; ERA 2019 (E-2026-07-19-01) closes the security-by-design provenance chain and predates the 23-Jun monitoring gap by seven years.
- **Evidence-integrity controls demonstrably work.** The 82-reference forensic audit that caught a partly fabricated bibliography (E-2026-07-14-01) is exactly the discipline a NIS-2/CRA evidence chain requires.
- **Repo hygiene clean.** GitHub remote private (verified via `gh`, 2026-07-21); no credentials/key material in the working set; baselines give a tamper-evident audit trail.
- **Guardrail intact.** Oversight advises, never actuates — consistent across ADR-012, the register, and evidence commentary. No blur found.

## 1 · Sector threat landscape (method: sector threat-landscape assessment)

Profile built from the record's A-tier evidence plus known rail-relevant actors. Note the skill's own sector-actor dictionary has no rail entry — a small confirmation of ENISA's "fragmented and isolated" community-learning finding.

| Actor class | Exemplars | Observed vs rail | Relevance here |
|---|---|---|---|
| Cybercriminal / ransomware (54% of attacks, ENISA) | Wizard Spider/Conti lineage, Vice Society | Rail 45% ransomware share; OmniTRAX double-extortion; Belarusian Railways 01/22 | IT-side today; ENISA forecasts OT targeting — IT/OT convergence driver *is* the FRMCS transition |
| Pro-Russian hacktivists | Killnet / NoName057(16)-class | 2022 DDoS wave: CFR Calatori, LT/LV/EE railways | Availability attacks vs FRMCS SBA/public-facing surfaces; DDoS rising |
| State-sponsored | Sandworm-class (energy/transport crossover) | Espionage + destructive capability vs EU CNI | The SL-4-capable adversary the SIL-4 kernel zone must assume |
| Low-capability opportunists | Poland 2023 radio-stop perpetrators | Unauthenticated VHF broadcast stop commands halted trains network-wide | **Defining rail vector: no APT needed — the legacy protocol is the vulnerability** |

Dominant TTPs: T1195 supply-chain compromise (DSB), T1498 network DoS, T1486 ransomware, T1566 phishing; ATT&CK-for-ICS **T0855 Unauthorized Command Message** = the radio-stop class, mapping directly onto the decade-long GSM-R coexistence surface. Emerging: 5G SBA API exploitation, slice mis-isolation (SRS §15.3 FFS), GNSS jamming (ENISA concern ↔ SRS §16 empty), harvest-now-decrypt-later on long-lived signalling traffic.

**Calibration to keep:** the no-safety-impact-yet finding is period-bounded (ends 10/2022); Poland radio-stop (08/2023) postdates it — sequence, don't conflate (E-2026-07-20-01 hook 2).

## 2 · Risk-register validation (method: NIST SP 800-30)

- **Threat-source coverage (App. D) — the material finding.** PR1–PR16 model structural (PR11), accidental (PR12) and regulatory (PR16) sources rigorously; the **adversarial column is empty**. PR16 is a compliance risk, not a threat event. PR13 covers vendor *opacity*, not vendor *compromise* — DSB proves those differ. Three evidence-grounded adversarial threat events are missing:
  - **PR17 (candidate)** — legacy air-interface command injection/jamming during the dual-run (T0855). Likelihood: demonstrated in-sector 2023. Impact: network-wide safe-stop — and per E-2026-07-02-34, bearer silence actively brakes trains (T_NVCONTACT 40 s).
  - **PR18 (candidate)** — compromise of an ICT service provider/supplier with reach into safety-critical IT (T1195; DSB 10/2022 precedent, A-tier).
  - **PR19 (candidate)** — availability attack on FRMCS public-facing/SBA surfaces (T1498; 2022 hacktivist wave, rising).
- **Risk model (Step 1):** "Sev = likelihood × impact" declared but scales never locked — High/Med/Low not reproducible. Lock bands before adding PR17–19.
- **Likelihood grounding (App. G):** exemplary on the structural side — the 23-Jun incident used exactly as 800-30 intends.
- **Maintenance (Step 4):** declared weekly review; register last touched 2026-07-02 (19 days at assessment). Cadence not met.

## 3 · Zone-and-conduit validation (method: IEC 62443-3-2 / TS 50701)

No zone-partitioning artifact exists; the ADRs contain an implicit model. Candidate partition for the TS 50701 deliverable:

| Zone | Contents | SL-T (candidate) | Note |
|---|---|---|---|
| Z1 SIL-4 kernel | Deterministic safety core | SL 3–4 | ADR-004's untouchable core (air-gapped-SIS analogue) |
| Z2 FRMCS core | 5GC, IMS/MCX, UDM | SL 3 | Geo-redundant pair = one zone, two sites; PR11 config-diversity = intra-zone control |
| Z3 GSM-R legacy | BSC/MSC, cab radios, EoL nodes | ≤ SL 1 | **Cannot reach SL 2 — unauthenticated air interface; risk must be handled at the conduits** |
| Z4 Oversight layer | Agentic monitoring, Q.752 probes, SIEM | SL 2 | Observes all zones; must not become a cross-zone bridge |
| Z5 Dispatcher / control centre | Terminals | SL 2 | |
| Z6 Enterprise / IT | Ticketing, passenger services | SL 1 | ENISA: today's actual blast radius |

Findings:
1. **The GSM-R↔FRMCS interworking bridge is the highest-risk conduit** — weakest zone connected to strongest for a decade. PR12 treats it as a change-risk surface; the 62443 lens adds it is also the *attack path* by which Z3's SL-1 ceiling reaches Z2. Conduit controls (protocol-aware filtering, allowlisted flows, monitoring) belong in procurement requirements, not only change governance.
2. **ADR-004's unidirectional boundary is the data-diode pattern** — the method independently validates the design instinct; the oversight layer's taps into every zone must be enforced read-only (diode-class) or Z4 becomes the shared attack domain across all zones. Kin: Vitale's separate-comms-path detector.
3. **Segmentation cutover pitfall maps cleanly:** no enforcement without a complete traffic baseline; cutover rides ADR-011 change-control + ADR-007 test surfaces — i.e. the one-gate principle already established. Coherent.

## 4 · Crypto / PQC readiness (method: PQC migration, NIST SP 1800-38)

Mosca's inequality — migrate when data-lifetime + migration-time > years-to-CRQC — **fails decisively on the record's own numbers**: rail assets live 20–30+ years (the 1991 node outlived its vendor), migration time is certification-bound (the bearer transition itself is a decade), CRQC estimates cluster in the 2030s. A now-decision, not a watch item. The ancestry chain is on file (3-DES 2019, E-2026-07-19-01 → AES-128 lifespan flag, SRS Table 6 Note 3 → FIPS 203/204/205 lead, E-2026-07-14-01) but has no action attached. Concretely:

- **CBOM alongside SBOM** in the ADR-012 procurement clause (CycloneDX CBOM: algorithms, key sizes, key custody, cert lifetimes per PDE) — marginal cost ≈ 0, the SBOM lever already exists.
- **Crypto-agility as bid condition:** algorithm selection in configuration not code; hybrid key establishment (X25519+ML-KEM-768-class) on management/signalling planes; AES-256 for new symmetric deployments (answers SRS Note 3); SLH-DSA-class hash-based signing for firmware roots-of-trust on long-life onboard units.
- **HNDL prioritisation** (key material + long-lived signalling/KMC traffic highest) gives the CRA PDE inventory a second sorting dimension for free.

## Consolidated recommendations (priority order)

1. **Ratify ADR-012 + start the CRA PDE inventory** — the Art 14 clock (11.09.2026) dominates; the oversight layer is itself a PDE.
2. **Add adversarial threat events PR17/PR18/PR19 and lock the register's scoring scales** (the 800-30 structural gap).
3. **Commission the TS 50701 zone-and-conduit artifact** (partition above); name the interworking conduit and Z4's read-only taps as the two high-risk items.
4. **Extend ADR-012 procurement: SBOM→CBOM + crypto-agility + AES-256 + hybrid PQC** (Mosca fails on own evidence).
5. **Log Poland 2023 radio-stop from CERT.PL/PKP/regulator primaries as an A-tier row** — the likelihood evidence for PR17 currently lives only in a D-tier paper's leads index (E-2026-07-14-01 lead 1).
6. **Honor declared cadences** — weekly register review and daily baseline were both stale at assessment; for a repo whose product is the audit trail, these are compliance findings (PR10 kin), not housekeeping.

Additional gaps carried from pass 1: MCX security functions optional in the spec being procured (E-2026-07-01-10 — make mandatory in procurement); SRS §17.2 monitoring empty (monitoring surface must be self-built or contract-mandated, never assumed); telecom-dependency blind spot (ENISA self-declared unanalysed ↔ live Telstra→V/Line instance — an explicit line in the future threat model).

## Skills used

1. `cybersecurity-skills:performing-threat-landscape-assessment-for-sector` — §1
2. `cybersecurity-skills:conducting-cyber-risk-assessment-with-nist-800-30` — §2
3. `cybersecurity-skills:implementing-iec-62443-security-zones` — §3
4. `cybersecurity-skills:migrating-to-post-quantum-cryptography` — §4

Plus direct artifact review (pass 1) and repo-hygiene checks (secret scan, remote-visibility verification).
