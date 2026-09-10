# FRMCS partner / supplier responsibility — 5GRail D3.3 lab tests

**Date:** 2026-06-29 · **Status:** Draft · **Owner:** Vpnet engagement lead
**Source:** 5GRail (EU H2020, GA 951725) Deliverable **D3.3 "First Lab Test Report" Rev 2**, 18/12/2023 (PUBLIC; leader Nokia, reviewed by all partners) — logged as **E-2026-06-29-01** (tier A). Paraphrased from the report; it is a public EU deliverable.
**Scope note:** These are the partners **named as contributors in this test document** (Nokia Budapest lab, WP3) — **not** the full 5GRail consortium membership.

## Who was responsible for what

| Partner | Responsible for (the part) | Evidence in D3.3 | FRMCS layer / maps to |
|---|---|---|---|
| **Nokia** (deliverable leader) | **5G network (radio + core)**; **GSM-R network (radio + core)**; **MCX server**; **dispatcher console**; handsets; lab host | "5G network (radio and core): provided by Nokia"; "GSM-R network (radio and core): provided by Nokia"; "MCX: provided by Nokia"; "Dispatcher Console … provided by Nokia"; gNB CU/DU = Nokia AirScale ASIK/ABIL; BBU AirScale 5G gNB; RRU N78; GSM-R MSS = Nokia MSS; N14 inter-AMF in Nokia core; lab at "Budapest Nokia's premises" | Transport + service core (R5/R6/R7); **R8 concentration signal** |
| **Kontron** | **On-board gateway (OB GW)** + **trackside gateway** | "Onboard gateway: provided by Kontron"; "Trackside gateway (Kontron) installation and configuration"; "integration to 5G SA core using N6 interface"; GRE tunnel between Thales modem and Kontron OB GW | Gateway decoupling — TOBA / trackside (R6) |
| **Thales** | **On-board 5G modems** (the UE radio) | "Thales modem" attach/detach, FTP up/down, cell selection, QoS/DSCP, IPERF throughput, intra/inter-frequency Xn + Ng handover; tested on N8 (900) & N78 (3.7 GHz); RF-cabled to the radio | On-board radio / bearer (R2/R5; bearer-flexibility/multipath) |
| **Siemens** | **CAB Radio** (on-board operational-voice application) | "Onboard voice application: CAB Radio, provided by Siemens"; voice E2E set up with Nokia MCX + dispatcher "together with Siemens CAB Radio" | Voice service / the MCX-bridged GSM-R voice (R2; **PR15** MCX feature-parity) |
| **CAF** | **On-board + trackside equipment** (on-site integration) | "CAF onboard and trackside equipment integration"; "CAF was on site to set up and configure their equipment"; "CAF, Teleste and Kontron did successful IPCON" | Rolling-stock / application integration (R5) |
| **Teleste** | **On-board + trackside equipment — video/CCTV** | "Teleste onboard and trackside equipment integration"; "Teleste configured their equipment remotely till successful IP level connectivity" | Video/CCTV application (R5 digital-rail capability) |
| **DB (Deutsche Bahn)** | **WP5 field-trial partner** — remote-connected to the lab | Lab "remotely connected to the WP5 field trial to be run with partner DB"; VPN established between Nokia's and DB's locations | Field validation / coexistence (R2/R4) |

## Concentration observation (R8)

The lab stack is **Nokia-centric**: Nokia supplies the **5G core + radio**, the **GSM-R core + radio**, the **MCX service layer**, *and* the **dispatcher** — i.e. both bearers plus the service core in one vendor. Kontron supplies the gateways, Thales the modems, Siemens the cab radio, and CAF/Teleste the rolling-stock/video equipment. This is a **stronger supplier-concentration signal than the headline "Nokia–Kontron duopoly"** (E-2026-06-24-04) and is recorded against **R8** in E-2026-06-29-01.

Caveat: this reflects *one validation lab's* integration choices (2023, prototype phase), not procurement outcomes — it evidences the FRMCS supply *ecosystem and concentration*, not a committed national supply chain.

## References

- E-2026-06-29-01 (5GRail D3.3 First Lab Test Report Rev 2, 2023) — primary source.
- E-2026-06-24-04 (Nokia–Kontron duopoly / vendor landscape) — concentration context.
- R5 (digital-rail capability), R6 (gateway decoupling), R7 (interoperability/standards), R8 (vendor lock-in/concentration), R2 (coexistence), R4 (handover/fail-soft); PR15 (MCX feature-equivalence).
