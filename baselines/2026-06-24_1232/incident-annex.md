# Incident annex — DB GSM-R nationwide outage, 23–24 June 2026

**Status:** Confirmed (root-cause mechanism not yet published by DB)
**Relevance:** validation evidence for R3 (central SPOF) and R4 (fail-soft) in traceability-matrix.md
**Last revised:** 2026-06-24

## What happened (confirmed)

From late evening on Tuesday 23 June 2026, the German rail network came to a standstill. DB named the cause as a failure of the GSM-R digital train-radio system. The standstill lasted roughly two hours; the first trains moved again around 00:30 on 24 June, with residual delays into the morning rush past 06:00. It was genuinely nationwide — Stuttgart S-Bahn, metronom across Lower Saxony/Bremen/Hamburg, Berlin and Munich S-Bahn, and NRW all reported complete outages. DB stated the situation was stabilised with an emergency/backup system; a driver posting referenced a backup switchover taking ~30 minutes. DB identified the cause overnight but did not publicly explain the mechanism.

## Architectural reading

A nationwide, simultaneous outage is not an RF-layer event — long-line radio faults are local. Simultaneity points to a **central component** (core / registration / a shared GSM-R platform element). This is the single-point-of-failure signature. The operational consequence — a full safety-mandated standstill rather than a degraded local mode — is the absence of a fail-soft path.

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

**Scrutiny flags:** DB has not published the precise root-cause mechanism — the "central component" reading is inference from the nationwide-simultaneous signature, not a confirmed mechanism. Restart timings are journalistic. Treat the political reaction as a snapshot that will evolve.
