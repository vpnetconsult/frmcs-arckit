# Pivot notes — "Race to 2030" and FRMCS: the same year, two different kinds of date

**Date:** 2026-09-24 · **Pivot state:** `current/` at 535 rows (`E-2026-09-24-01` last); last frozen baseline `2026-09-19_2321` — **the 2026-09-20 sitting (rows -01…-04, ADR-013 constraint 7 / item 4, PR17e, B19–B21) is neither frozen nor committed.** · **Siblings:** `pivot-notes-2026-09-20-ibn-core-rail-e2e.md` (the intent stack and §2b the slice chain), `pivot-notes-2026-09-15-knowledge-plane.md` (Threads 3–4: the management plane FRMCS inherits; "remove the human" vs "needs human approval"), `16-ig1252-self-score.md`.
**Purpose:** a two-page anonymous summary (E-2026-09-24-01, tier D) put six ideas next to each other — 2030 as a shared milestone, the two initiatives, three "intersections" (autonomy, architecture, network sharing), a slicing requirement, Europe vs Asia, and references. The ideas are worth keeping; the content was not. This note keeps the six headings and refills each one only with what the register holds, citing the row and the clause. Where the register holds nothing, it says so rather than filling the gap.

**Outcome anchor:** *safe, continuous rail operations.* Every section ends by asking what it changes for that outcome. Most change nothing; that is recorded, not hidden.

**Guardrail:** oversight, not control. Where the telecom industry's 2030 aim is autonomy in the network, this register's aim is autonomy in the *watching* of the network, with safety-critical actuation staying human-in-command (ADR-002, ADR-004). The two aims are compatible only if that boundary is stated first, so it is.

**Tiering rule for this note:** every claim carries its row id; A = primary text read; B = the organisation's own statement in promotional register; C = trade press; D = aggregator or generated. Nothing from the tier-D summary survives on its own authority.

---

## 1. Executive overview — 2030 is two dates, not one

**The idea kept:** 2030 matters to both TM Forum and rail.

**What the register holds.**

- **TM Forum's 2030 is a strategy date.** "Race to 2030" was launched at DTW Ignite 2026 in Copenhagen (>4,000 attendees) as the move from "fragmented AI pilots" to an "autonomous enterprise … composable, run autonomously, trusted by design", with an AN Level Assessment Validation ceremony (40 certifications, 17 organisations) and AI-native extensions to the Open Digital Architecture — TM Forum's own newsroom, verified at source 2026-09-24 (E-2026-09-24-01; press text not yet held, B21). Tier **B**.
- **Rail's 2030 is a vendor date, and it is not a switch-off.** ADR-001 §Context records the register's own founding error: it once carried "a hard ~2030 date"; the 2026-08-15 repair carried "a hard 2040 legal bound"; both were "the same mistake twice: manufacturing legal certainty" where none exists. What exists: vendor end-of-life signalling from around 2030; the German sector plan of 2035 (Sektorinitiative Positionspapier 11/2023, E-2026-06-24-13: FRMCS V3 → TSI 2027 → five-year window → earliest partial switch-off 2032, 2035 expected obsolescence); ERA's obsolescence window 2035–2040 — "none of them a legal bound".
- **The only legal clock is conditional, and it has not started.** Consolidated CCS TSI §7.3.1.2 (E-2026-09-19-29, read in the text): GSM-R may be taken out of operation only after a minimum five-year notification in RINF and the Network Statement, and that notification may be given only once the FRMCS on-board interoperability-constituent specifications are "completed and published with an amendment of this CCS TSI which allows the tendering of the complete FRMCS on-board equipment". Table A2 Note 9 says today's on-board specifications are "not considered complete for the purpose of tendering". The amendment is expected best June 2028, worst June 2029 (C3). No IM can lawfully start the clock today.

**What it changes for the outcome:** nothing in the register's positions — but the summary's phrase "race against time … before obsolescence by 2030–2035" is the framing ADR-001 explicitly withdrew. A programme planned to a vendor date is planned to the wrong clock; the register plans to the amendment-gated one and carries vendor EOL as a supply risk (PR14, PR17c).

---

## 2. The two initiatives, as their own texts define them

**The idea kept:** name both initiatives before comparing them.

| | What the register holds | Tier / row |
|---|---|---|
| **TM Forum Autonomous Networks programme** | Levels L0–L5 defined per task group (Execution, Awareness, Analysis, Decision, Intent) in IG1230 v1.1.1 Table 4; the per-task evaluation method in IG1252 v1.2.0 §5.1.2–5.1.3 (1.0–5.0 per task contextualisation, mean per flow); effectiveness indicators IG1256 v3.2.0; the AN reference architecture IG1251 v1.0.1 (the *AN Consumer* role at §4.4.1 — E-2026-09-19-47); intent management IG1253 v1.3.0 (§5.8: conditions for asking human approval can be "subject to intent"); the Intent Ontology TR292 family (TR292 v3.6.0 overview, TR292B state machines v3.0.0, TR292C functions v3.6.0; TR292I security as reported in arXiv 2605.27743); TMF921 v5.0.0 Intent Management API (Beta) with `ProbeIntent` and the TMF921A Judge/Preference exchange; TMF639 resource inventory with `intent` and `externalIdentifier`; GB922 SID v24.5 (`Intent`, `ClosedLoop.whyInvoke`, `Anomaly.prescribedAction`, `AIModel`). | **A** as published member/public guides — E-2026-09-15-03/-04, E-2026-09-19-33…-42, -46, -47 |
| **FRMCS** | UIC's successor to GSM-R: 5G SA + 3GPP MCX (R1, Accepted; ADR-001). Specification set bound in EU law at CCS TSI Annex A Table A2 indexes 92–95 and 99 as "FRMCS Baseline 0" = v1.0.0 (E-2026-08-01-16; `13-legal-binding-chain.md` §2). Held and read: SRS AT-7800, FRS FU-7120, FIS-7970, FFFIS-7950, TOBA-7510 at v1.0.0 and **v2.1.0** (25–30 April 2025; E-2026-09-19-19), TOBA-7540 v1.0.0 migration scenarios (E-2026-09-19-21), URS FU-7100 v5.0. V2 = "the minimum set of requirements for validation" (SRS §4.4.2); V3 = the TSI version, due September 2027 (C2); MORANE-2 tests to v2.2 (not held, B1). Standardised via 3GPP: the FRMCS work items across Rel-15 → 19 (`sdo-mapping-frmcs-gsmr-5gsa.md`), TS 22.289 Rel-19 (E-2026-09-19-02), MCX Stage 1/2/3 (`15-mcx-parity-suite.md` §0). | **A** — primary texts read |

**On "engineered on 4G LTE and 5G standalone":** the FRMCS reference is 5G SA; 4G appears as a QoS mapping *from* the 5G system (SRS §14.2, E-2026-08-01-33) and in the title of TS 22.289 ("LTE; 5G; Mobile communication system for railways"). It is not a second design basis.

**What it changes for the outcome:** nothing. Both initiatives are on file at primary; the summary's descriptions were paraphrases of them.

---

## 3. The three intersections, re-read against the register

### 3.1 Network autonomy — "AI self-healing" vs "life-safety human override"

**The idea kept:** the two programmes meet on how autonomous a network watching a safety bearer may be.

**What the register holds.**

- **The telecom side has not decided, and its own level table puts the human where this register puts them.** ETSI White Paper 64 Table 2.1: Level 4 = "decision typically needs human approval"; only Level 5 is machine self-decision (E-2026-09-15-05). ETSI WP 69 §3.2 calls human-machine collaboration "an ongoing challenge" and §4.2.6 lists a four-mode spectrum ending with "critical infrastructure under direct human control" (E-2026-09-15-06). A tier-1 operator's architect in the same month: "we have to remove the human from the loop" (E-2026-09-15-03, sponsored report, attributed opinion). Knowledge-plane note Thread 4.
- **The register's ladder, and where it sits on the TM Forum scale by design.** ADR-002: class 1–2 actions proceed on evidence thresholds (on-the-loop); class 3 = detect + diagnose with the act decision human-gated; class 4 = detect and diagnose only — "the act function is never inside this layer". Expressed in the bearer's own management vocabulary: the class-3 hold sits in 3GPP TS 28.312's pre-evaluation phase (the one phase guaranteed to change nothing in the network; §4.6.3 "advising on preferred outcome") and, on the TM Forum side, in TMF921's `ProbeIntent` and TMF921A's Judge/Preference exchange, with IG1253 §5.8's "ask approval when …" written into the intent; **a class-4 action is never expressed as an intent at all**, because 28.312 has no primitive that keeps a human in command *during* fulfilment (E-2026-09-19-06/-34/-36/-37). TS 28.535's own escalation — loop "cannot automatically adjust" → human "needs to be informed" → human "may decide" — is informed-after-the-fact, the 23-June shape (E-2026-09-19-11).
- **Scored on TM Forum's own method, the guardrail has a price and it is stated.** `16-ig1252-self-score.md` (E-2026-09-19-46): specified design **2.58**, as-built **1.31** (mean of four flows). Maintenance (fault management) 2.83 specified; Optimization (fallback proposals) **1.50** — "L1 met; L2 needs Execution S, which the guardrail forbids". IG1230 raises Execution to S at L2 and Decision to S at L4, so a layer that leaves decision and actuation with a human cannot score above L3 on a class-3 task and above ~1.5 on a class-4 task "whatever its detection quality". The one-number "L3" claim was withdrawn; the per-row claim stands. **ANLAV (E-2026-09-24-01) is now the audited form of this score — re-score trigger, B21.**
- **ATO and the remote human.** The summary pairs autonomy with "ATO GoA3/GoA4". The register's position is narrower and harder: ADR-002's class-4 preconditions were amended (ARB-2026-09-04/4 R2/R3) because the sector has funded the *remote* human — teleoperation as the designed ATO fallback level, a €40 m remote-train-operation programme on an ICE 4 (E-2026-08-20-01/-02/-05/-20). On 23 June the trains stopped safely "because a human was ON BOARD to receive a written *Befehl*"; move that human to a control room and the founding incident becomes qualitatively worse, not better (ADR-002 item 9 text). Finland's Digirail — the one Member State on file building on a commercial 5G bearer — targets ETCS hybrid level 2–3 with **ATO GoA2**, not GoA3/4 (E-2026-08-15-12, the Finnish authority itself, A).
- **The SIL-4 boundary is structural, not procedural.** ADR-004: a vital domain (SIL-4, certified, the sole actuation capability) and an advisory domain (the agents) separated by unidirectional information flow at the boundary; the vital gateway "structurally rejects agent-originated commands". PR1, PR3.

**What it changes for the outcome:** the "friction point" the summary names is not open; it is decided, scored, and priced. What is *open* is item 5's eval harness and ADR-007 item 1's replay corpus — the as-built 1.31 is a statement that no bearer-facing agent exists yet.

### 3.2 Architectural agility — three strata vs ODA

**The idea kept:** rail's three-strata architecture and telecom's composable architecture should line up.

**What the register holds.**

- **Three strata is a mandatory FRMCS design paradigm, on the on-board as well as the network.** TOBA-7510 §5.1 (M): logical separation of the application stratum from the service and transport strata, following the FFFIS; bearer flexibility incl. simultaneous bearers (M); resource sharing across applications of any category (M). §7.1 (M): applications reach the system only through OBAPP, "shall be unaware" of how communication and transport are provided — the register's R6 ("don't re-qualify ETCS on every transport change") confirmed at primary (E-2026-09-04-20). Modularity below the gateway is *optional* and deferred: OBRAD radio-module diversity, add/replace modules without touching OBAPP, gateway and modules from different vendors — all (O), "FFS for FRMCS v2" (TOBA-7510 §7.9).
- **Vendor interoperability in FRMCS is proven at the MCX layer, by independent testing, not by ODA.** ETSI 8th MCX Plugtests (Oct 2023, Malaga): 1,508 test cases, 170+ sessions, **95.0 % success**, 15 MCX-server and 12 MCX-client vendors; stream C = FRMCS over 5G (E-2026-08-02-10). MORANE-2: inter-vendor interoperability across three labs hosted by Ericsson, Nokia and Kontron, exercising voice, Railway Emergency Call, ETCS, ATO and TCMS; ADIF, DB InfraGO, ProRail and Trafikverket preparing operational testing from 2027; 11 railways, 13 suppliers, two MNOs (KPN, Telia) (E-2026-09-06-06, B; ADR-001 item 6).
- **Where ODA actually touches this register: the management plane, and only there.** FRMCS mandates the radio, MCX and security and says nothing about how the network is managed — FFFIS-7950's reference list has "nothing from SA5" (E-2026-08-01-21); the intent-driven, knowledge-graph-backed management plane arrives with the 5G core as an operator capability (knowledge-plane note Thread 3). ODA's own risk model is on file (IG1187 v2.0 "ODA Enterprise Risk Assessment": STRIDE, MITRE CAPEC, OWASP API Top 10, ODA trust boundaries — E-2026-09-19-47) and lands on ADR-012 item 1 (the oversight layer is itself a product with digital elements). The "alignment" the summary asks for is the rule-(xi) rail extension model of ADR-002 item 9 — the ERA Ontology for what the railway *is*, the TM Forum Intent Ontology for what the operator *wants*, the ISS ontology for what *went wrong* — and its host is the intent stack described in `pivot-notes-2026-09-20-ibn-core-rail-e2e.md` (act A14).
- **Lock-in is a procurement position, not an architecture one.** R8 (Recommended, policy-level open): unbundled tenders — RAN, core, MCX, dispatcher separable; PR7 (Nokia–Kontron concentration, Med); the first EU-law instrument aimed at the concern exists as a proposal (matrix R8 status line).

**What it changes for the outcome:** nothing in positions. It relocates the summary's claim: interoperability is a *3GPP/ETSI/MORANE-2* achievement; ODA is where the *oversight layer's* vocabulary must plug in.

### 3.3 Network sharing — "can commercial telco slices be trusted for safety data?"

**The idea kept:** the hybrid-vs-private question is real.

**What the register holds — and why the question is mis-stated.**

- **The sector intends to use public networks, on file at primary.** EU-Rail FRMCS Deployment Questionnaire 2025 (66 responses, 20 countries, 19 IMs): "a vast majority of IMs intend to use both RMR and PMNO; PMNO as redundancy, as added capacity, *or even as the only network*" (E-2026-09-06-03, A). DB InfraGO's CEO, 26.06.2026: the public-mobile fallback "is being rebuilt, not debated" (E-2026-09-15-01; ADR-001 item 8). Finland's Digirail: commercial 5G + ETCS hybrid L2–3 + ATO GoA2 (E-2026-08-15-12, A). UIC's own 2020 position: mobile operators' model "nowhere near" main-line QoS; secondary lines already on public networks in France; the "halfway house" is a PPP with shared risk (E-2026-09-20-01, A/B).
- **What is measured.** 5G-RACOM field tests (S+D 5/2026, A/C): average full-path switchover FRMCS ↔ public MNO **2.0 s** (1.5–4.7 s); path recovery 0.8–3.9 s; MP-QUIC throughput dip 45–60 % recovering in 1.2–1.5 s; RSRP ≈ −115 dBm as the consistent transition trigger; first cross-vendor MP-QUIC (Funkwerk ↔ Kontron); the public path was Vodafone via a research network on a dedicated slice with N6-only interconnection (E-2026-07-02-21). Measured — for a hybrid *test* network, not a service.
- **"Slice" is the wrong object.** SRS AT-7800 v2.1.0 §13 (E-2026-09-20-04, A, M-V3): FRMCS reduces slicing to **one Default S-NSSAI** (SST 4, no SD); additional S-NSSAIs are out of scope for V2; **"The Default S-NSSAI for MNO connectivity shall be different"** (§13.3.1.10). The public path is another administrative domain on another slice by requirement — so "can the slice be trusted" is really "can the *administrative domain* be trusted", and the register's answer is R4's condition: the public path is a safety-critical substitute only if it re-provides the mission-critical functions — functional alias, group and emergency call, pre-emption — which no public network offers unless built to (ADR-001 5(b); path-booking note Relation C; `15-mcx-parity-suite.md`). What TM Forum contributes here is the *form* of that condition — a TMF620 product offering whose mandatory characteristics are the parity cases, checked by SHACL (pivot 2026-09-20 §2, §2b) — not the isolation.
- **Fallback is a scope decision with a legal price.** ADR-001 5(b)(i): a fallback path can make on-board equipment "internet-connected" under Del. Reg. (EU) 2022/30 Art 1(1), pulling it into RED cyber scope — paid at ADR-012's procurement gate. 5(b)(vii): the SLA cannot cite a standard end-to-end availability KPI because none exists in 3GPP (TS 28.554: only RAN cell in-service time — E-2026-09-19-32). 3GPP's own disaster roaming (23.501 §5.40) covers a RAN disaster with the core assumed up, "subject to operator policy and national/regional regulations" — it would not have helped on 23 June (E-2026-09-19-05).
- **The summary's numbers.** "< 10 ms, near-zero jitter, 99.999 %, hard isolation" for a "Critical Slice" appear in no held FRMCS text (E-2026-09-24-01 (1)). TS 22.289 sets session-establishment bars (≤ 1 s immediate / ≤ 3 s normal, E-2026-09-19-02); SRS §14 sets QoS per application; nobody has published an FRMCS end-to-end availability figure because the KPI to state it in does not exist.

**What it changes for the outcome:** nothing in R4's status (Open — primary PoC objective) — but it reframes the sharing debate into the two things the register can actually test: the parity suite (A6′, build) and the failover surfaces of ADR-007 on the operator's ring (A8).

---

## 4. Slicing "requirements" — what FRMCS actually requires

**The idea kept:** say what FRMCS requires of slicing.

**What the register holds (A, M-V3 unless marked):** SRS AT-7800 v2.1.0 §13.3.1: S-NSSAI in TS 23.003 §28.4.2 format; a railway-defined default SST; **no Slice Differentiator**; "reduced … to a single Default S-NSSAI"; the default S-NSSAI, one default DNN, the default flag and the NSSAA indication in the 5GS subscription at the UDM; in a VPLMN the home UDM provides the default S-NSSAI only; value = a 3GPP-standardised SST, **"4" (V2X)** (editor's note: a railway-specific SST "under investigation"); MNO connectivity on a different Default S-NSSAI. Editor's notes: additional S-NSSAIs out of scope for V2; whether the slicing NAS protocols are needed at all "is to be confirmed, even if network slicing is not implemented by FRMCS Operators". TS 23.501 §5.15.2.2 Table 5.15.2.2-1: SST 1 eMBB · 2 URLLC · 3 MIoT · 4 V2X · 5 HMTC · 6 HDLLC · 7 GBRSS; "the support of all standardised SST values is not required in a PLMN" (E-2026-09-19-05). On board, TOBA-7510: applications never select a slice — application-driven domain selection is excluded by decoupling (v1.0.0 §7.4, deleted in V2; E-2026-09-20-03); the S-NSSAI is subscription data.

**So the three-slice picture inverts:** the three *service* categories (critical / performance / business — FRMCS URS application categories, TOBA-7510 §4.1) are real and are differentiated by **QoS profile and priority inside one slice** (SRS §14; 23.501 §5.22 ARP/5QI; TOBA Application Profiles §7.5). "URLLC slice for FRMCS" and "SST 2" appear in no held primary text (E-2026-09-20-04 (2)). MORANE-2's published material contains no slicing content at all (pivot 2026-09-20 §2b, validated 2026-09-20). TM Forum's DTW demo of "dynamic 5G network slicing" (E-2026-09-24-01 (8)) is a CSP capability the MNO side of Relation C may sell; it is not an FRMCS requirement.

**What it changes for the outcome:** it fixes what the oversight layer's corridor intent targets — one `NetworkSlice` DN's `ServiceProfile`, per-application QoS profiles inside it, the cells over the sections of line (act A14.1(f)).

---

## 5. Regional dynamics — Europe on file, Asia not

**The idea kept:** Europe and Asia are on different curves.

**Europe — what the register holds.**

- **Legacy and the clock:** Germany: 16,000–21,000 vehicles to retrofit, ~40,000 mobile and ~3,500 stationary GSM-R devices, €1.2–2.4 bn with ~30 % approval cost, no fit-obligation, sector plan 2035 (E-2026-06-24-11/-13); the amendment-gated five-year clock (§1 above). ADR-009 (fleet retrofit as a managed external dependency) and ADR-013 (two-stage on-board pattern; **and, since 2026-09-20, the three-route problem for the Baseline 3 fleet** — BL4 SV 3.0 upgrade / Baseline Light / Adapter, E-2026-09-20-02, constraint 7, item 4, PR17e).
- **Interoperability and testing:** ERTMS/CCS TSI as the legal frame; MORANE-2 (34 months, UIC-led with UNIFE; three vendor labs; operational testing from 2027 incl. cross-border) — the summary's "centralised under EU-Rail JU" is right as to funding (GA 101196125, E-2026-09-17-05) and wrong as to who runs the labs (the vendors) and who tests in the field (the four IMs).
- **Spectrum:** ECC(20)02 of 17 Nov 2020 — 900 MHz 5.6 MHz paired + 1900 MHz 10 MHz unpaired; Decision (EU) 2021/1730 (B9, not held); RAN4 n100/n101 (E-2026-09-19-16); the German plan uses 1900–1910 MHz unpaired + 874.4–880.0/919.4–925.0 MHz (E-2026-06-24-13); 3GPP power class 1 (31 dBm) allowed only for FRMCS cab radios (TS 38.101-1, ADR-013 constraint 5).
- **Cross-border, specifically:** international GSM-R traffic passes through UIC-operated interconnecting hubs in Germany with a back-up in Switzerland, linking 17 countries, which UIC's 2020 plan says "must be upgraded to FRMCS" — 2026 state unverified (E-2026-09-20-01, B19). The on-board FRS that the TSI binds does not carry cross-border behaviour (TOBA-7510 §7.4, E-2026-09-20-03). The corridor declaration has RINF terms for its GSM-R side and none for FRMCS (ADR-001 5(c)).

**Asia — what the register holds: nothing.** No row on China's 5G-R, on Singapore or Tokyo GoA4 metros, or on any Asian hybrid deployment. The summary's paragraph is unsupported here and is not carried. If it matters to a position — it currently does not — the acquisition would be UIC's Asia-Pacific FRMCS material and the 5G-R specifications, with the same tiering discipline.

**What it changes for the outcome:** nothing; Europe is already the register's scope, and the Asian comparison touches no requirement.

---

## 6. References — the three the summary named, replaced by the ones the register holds

| Summary's reference | What it was | What the register cites instead |
|---|---|---|
| "TM Forum launches 'Race to 2030' at DTW-Ignite 2026" | A real press release; text not held | E-2026-09-24-01 (verified at source, B); **B21** to fetch it, the AI-native ODA roadmap, and the ANLAV method; IG1230 / IG1252 / IG1253 / IG1256 / IG1251 / TR292 family / TMF921 / TMF639 / GB922 (all held, A) |
| "UIC FRMCS Standardization Roadmap" | Not a document; a description | UIC SRS AT-7800 v2.1.0 §4.4 (V2 = minimum set for validation) and the CCS TSI §7.3.1.2 clock (E-2026-09-19-19/-29); UIC brochure Dec 2020 for the 2018 three-pillar plan, superseded (E-2026-09-20-01); SP-STG v2.4 timeline (C2, V3 Sep 2027); 5th UIC Global FRMCS Conference 24–25 Nov 2026 (C1) |
| "3GPP Technical Specifications for MCX over 5G — foundation for URLLC and slicing allocations in rail" | A description, and wrong on slicing | TS 22.280 / 22.179 / 23.280 / 23.379 / 23.283 / 24.379 / 24.380 / 24.483 / 33.180 (`15-mcx-parity-suite.md` §0); TS 23.501 §5.15 / §5.16 / §5.22 / §5.33.2 / §5.40 (E-2026-09-19-05); TS 22.289 Rel-19 (E-2026-09-19-02); 3GPP has no rail slice and no e2e availability KPI (E-2026-09-19-32) |

---

## 7. What this note says for the register

1. **No decision moves.** Six ideas, every one already answered at tier A or explicitly withdrawn by the register's own earlier correction. The evidence row is `watch` (E-2026-09-24-01).
2. **Two acts follow.** B21 (Race to 2030 press text; ANLAV method and certified organisations; whether an MNO the register names — KPN, Telia, Vodafone — holds one) and a re-score trigger on `16-ig1252-self-score.md` (an audited method now exists; state whether the §2 convention matches it).
3. **The recurring error has a shape.** Twice in four days (E-2026-09-20-04, E-2026-09-24-01) a generated summary asserted per-service URLLC rail slices. The held text says one slice, SST 4, services by QoS. The register's method — read the clause, tier the source, answer the decision question — caught it both times; the ontology note's void (L5–L3, no machine-checkable FRMCS term) is why a generator fills the gap with the consumer-5G story.
4. **Housekeeping, load-bearing:** the 2026-09-20 sitting is unfrozen and uncommitted. Cut the baseline before quoting any decision-health number for this week.

---

## Source-discipline note

All rows cited are in `current/evidence-log.md`; clause references are to texts held in the Download folder or in the session scratchpad as recorded at each row. The TM Forum press release is cited from a search result and is not yet on file (B21). UIC texts are paraphrased under UIC's copyright notice. Nothing in this note rests on the tier-D summary it replaces; the summary is retained in the Download folder as the trigger, not as a source.
