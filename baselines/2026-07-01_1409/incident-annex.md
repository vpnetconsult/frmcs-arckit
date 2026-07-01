# Incident annex — DB GSM-R nationwide outage, 23–24 June 2026

**Status:** Confirmed; cause AND cascade mechanism DB-confirmed at PRIMARY tier (DB official press statement, deutschebahn.com 24–26 Jun 2026, E-2026-06-27-03; corroborated by ZDF E-2026-06-27-01 and lok-report E-2026-06-27-02): a planned network-switch-component swap → singular software fault (no alarm) → automatic failover to the existing (functional) redundancy did not trigger → nationwide loss until manual recovery
**Relevance:** validation evidence for R3 (central SPOF) and R4 (fail-soft) in traceability-matrix.md
**Last revised:** 2026-06-27

## What happened (confirmed)

From late evening on Tuesday 23 June 2026, the German rail network came to a standstill. DB named the cause as a failure of the GSM-R digital train-radio system. The standstill lasted roughly two hours; the first trains moved again around 00:30 on 24 June, with residual delays into the morning rush past 06:00. It was genuinely nationwide — Stuttgart S-Bahn, metronom across Lower Saxony/Bremen/Hamburg, Berlin and Munich S-Bahn, and NRW all reported complete outages. DB stated the situation was stabilised with an emergency/backup system; a driver posting referenced a backup switchover taking ~30 minutes. DB identified the cause overnight; on 24 June, DB InfraGO head **Philipp Nagl** stated the proximate cause "appeared to have been the scheduled swap of a technical component" and that DB is "analysing with the highest priority how exactly this led to the fault" (AP / Reuters). The cascade mechanism — how a scheduled component swap propagated network-wide — was not explained.

## Architectural reading

A nationwide, simultaneous outage is not an RF-layer event — long-line radio faults are local. Simultaneity points to a **central component** (core / registration / a shared GSM-R platform element). This is the single-point-of-failure signature. The operational consequence — a full safety-mandated standstill rather than a degraded local mode — is the absence of a fail-soft path. The proximate cause now named by DB (a *scheduled* component swap cascading network-wide) is consistent with this reading: a routine maintenance action propagating to a nationwide failure points to a shared/central failure domain, so it reinforces rather than revises the SPOF signature.

A 24 Jun Berliner Zeitung reconstruction (C-tier, insider-sourced — not officially confirmed; E-2026-06-24-16) adds that the **backup system (PGSM-R) also failed** and that public-network fallback lacks railway-specific functions (group calls, emergency stops). If borne out, this sharpens both readings: the redundancy did not isolate the fault (R3), and the fallback could not carry safety-critical traffic (R4) — a direct caveat to any public-5G/satellite fallback design. It is in tension with early reports that DB "stabilised with an emergency/backup system."

Update: the *structural* fallback gap is now confirmed at primary tier — DB InfraGO's own operating regulation Ril 481.0205 (in force 14.12.2025; E-2026-06-24-18) states that the public-network fallback (P-GSM D) cannot carry emergency (Notruf) or group calls, and that a radio fault preventing connection requires the driver to stop at the next station. The functional inadequacy of the fallback for safety-critical traffic is therefore documented operator policy, not just insider reporting. (The specific claim that the backup *also failed* on 23 Jun remains E-16/C-tier, unconfirmed.)

Update (2026-06-25): a trade-press report (eisenbahn.de / GeraMond-VGB; E-2026-06-25-01, C-tier, insider-sourced "informierte Kreise") attributes the cascade to a **failed software update**, with recovery requiring a **rollback to the legacy GSM-R software**. This refines the named "technical component" toward software and is consistent with the central-component/SPOF reading (a central software update failing network-wide), but it is **unconfirmed by DB** and cites no primary document — so the cascade mechanism remains officially unpublished. Verify vs primary DB before treating as established.

Update (2026-06-27) — DB-CONFIRMED cause (E-2026-06-27-01, via ZDFheute quoting DB + Nagl): the cascade mechanism is now official. A **planned swap of a network distribution component** (Netzwerkverteilkomponente) in the GSM-R system triggered a **software error**; the fault raised **no automatic alarm**, so the system did **not automatically fail over** to its redundant backup — the redundancy existed but the auto-switchover never engaged — and the network stayed down until **manual** recovery (~00:30, ~2 h). Cyberattack was ruled out. DB interim measures: further component swaps **suspended** pending a manufacturer fix; maintenance windows restricted to **00:00–04:00**. This confirms the swap (E-15) and the software-fault lead (E-2026-06-25-01) and **refines E-16**: the backup did not "fail" — the automatic failover was never triggered because the fault was silent. The decisive failure mode is therefore a **detection/failover gap, not absent redundancy** (R3), and a silent central fault is exactly the awareness gap R12 targets.

Provenance + countermeasures (E-2026-06-27-02, DB InfraGO press statement reproduced via lok-report): DB terms it a *singulärer Softwarefehler* and states its countermeasures — component swaps suspended pending a manufacturer fix; maintenance only in 00:00–04:00 windows and only on the *inactive* redundancy side; a comprehensive GSM-R renewal/resilience programme; and the fallback layer *transitioning to the public mobile network*. **Caveat (R4):** per Ril 481.0205 (E-18) the public network cannot carry Notruf/group calls, so a public-mobile fallback must re-provide mission-critical (MCPTT) functions to be a safety-critical substitute. This DB statement largely closes the primary-source residual (a formal EBA report, if any, still outstanding). Fully closed (E-2026-06-27-03): cause and countermeasures are confirmed on DB's own press portal (deutschebahn.com, 24–26 Jun 2026), which adds that DB terms the event *historisch einmalig*, that FRMCS procurement is not yet possible until EU standards finalise (GSM-R remains interim ≥10 yrs; Hamburg–Berlin already fibre/mast-prepared for the FRMCS pilot), and that modernisation is underpinned by Sondervermögen funding.

Hypothesis — central register (UNEVIDENCED): the most architecturally consistent candidate for the failed central element is the GSM-R core's subscriber/registration layer — the **HLR (Home Location Register)** and **VLR**. A single logical HLR holds every device's subscriber and authentication data; its corruption, or a failed software update to it (requiring the observed rollback to legacy GSM-R software), would deny registration/authentication network-wide *simultaneously* — matching the nationwide-simultaneous signature far better than any RF-layer fault. The central NSS topology (HLR/VLR/AuC/GCR/EIR/IN behind a single MSC) is documented in E-2026-06-24-26. **NB: this is inference only — NO source (primary or insider) names the HLR/VLR or any specific NSS element, and DB has not published the cascade mechanism. Do not treat HLR/VLR as the cause; verify vs a primary DB analysis.** Architectural consequence: the same single-register failure mode reappears in FRMCS as the 5G core **UDM/UDR + IMS HSS**, so R3's geo-redundant-core requirement must design it out (carried as risk PR11). **Superseded by the DB-confirmed cause (2026-06-27, E-2026-06-27-01): the failed element was a network distribution component, not the HLR/VLR, and the decisive factor was a silent fault that prevented automatic failover, not register corruption. Retained for the record only — not the cause; PR11 reframed accordingly.**

Two consequences for the architecture:
- **R3 (eliminate central SPOF):** migrating to FRMCS reproduces this exact risk unless the ADR mandates it away — FRMCS centralises *more* (IMS/SIP core + MCX servers). 5G is not resilient by default.
- **R4 (fail-soft):** the binding requirement is a defined degraded mode that keeps safety-critical voice and movement authorities alive locally when the core is unreachable, plus multi-bearer fallback as a designed path.

Note: this was not unprecedented. Industry reporting records that GSM-R has repeatedly caused major disruptions in Germany before — i.e. the risk was known and recurring, which is the substance of the "information gap" between the technical and decision/funding layers.

## Political reaction (as of ~09:00, 24 June)

The reaction was thin and reactive at this hour; it typically grows over the day.
- **Oliver Krischer (Grüne), NRW transport minister** — sharp criticism ("fassungslos"); framed it as a new low point in already weak operating quality; demanded a transparent and complete investigation; criticised DB's emergency management; called for emergency mechanisms to prevent a recurrence.
- **Verband der Güterbahnen** (rail-freight association) — demanded gapless clarification.
- **Deutsche Bahn** (operator) — CEO Evelyn Palla: situation stabilised with an emergency system; cause identified overnight, mechanism not explained.
- **Federal transport minister Patrick Schnieder (CDU)** — no statement found on the incident at this hour.
- **No Minister-President of any Land** had commented at this hour.

(Do not attribute the circulating Al-Wazir "decades of neglect" quote to this incident — it is from 12 June, about general infrastructure.)

## Sources & trust tiers

| Source | Type | Trust | Used for |
|---|---|---|---|
| bahnblogstelle.com / dpa-fed German outlets | News (dpa-sourced) | Med–High | Timeline, cause (GSM-R), restart times |
| t-online / web.de / ruhrnachrichten / ZDF | News (dpa-sourced) | Med–High | Nationwide scope, Krischer, Palla |
| heise.de | Specialist tech news | High | Recurrence ("GSM-R has repeatedly caused major disruptions") |
| verkehrsrundschau.de | Trade press | Medium | Krischer quote, Güterbahnen reaction |
| AP (Moulson) / Reuters (Rinke, Steitz), quoting Philipp Nagl (DB InfraGO) | News (wire) + operator statement | High | Proximate cause attribution (scheduled component swap); mechanism still open |
| berliner-zeitung.de (Neumann) | News (original journalism) | Medium (C) | Backup (PGSM-R) also failed; fallback functional gaps — insider-sourced, unconfirmed |

**Scrutiny flags:** As of 24 Jun, DB InfraGO head Philipp Nagl has attributed the **proximate** cause to a scheduled technical-component swap (AP + Reuters), but DB has **not** published the precise **cascade mechanism** — how a scheduled swap propagated network-wide remains under analysis, and no formal DB press release was located (the attribution is a brief press statement). The "central/shared component" reading is consistent with the named cause but is still inference, not a confirmed mechanism. Restart timings are journalistic. Treat the political reaction as a snapshot that will evolve.
