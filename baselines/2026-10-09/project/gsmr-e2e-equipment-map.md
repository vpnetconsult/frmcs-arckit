# GSM-R end-to-end equipment map — hardware, vendors, governing specs

> Engagement working note (evidence-backed synthesis). Every claim traces to an evidence ID; trust tiers carry through — **this map is only as strong as its weakest cited tier per row**.

## Document Control

| Field | Value |
|---|---|
| Document ID | ARC-FRMCS-NOTE-EQUIPMENT-v1.0 |
| Document Type | Working note (equipment/vendor/spec synthesis) |
| Project | FRMCS arcKit — GSM-R→FRMCS transition + agentic oversight |
| Classification | INTERNAL (contains C-tier estate mapping + restricted-doc references — see honesty constraints before any external reuse) |
| Status | DRAFT |
| Version | 1.0 |
| Created Date | 2026-07-06 |
| Owner | Vpnet engagement lead |
| Sources | Evidence log rows cited inline (E-…) |

---

## 1. The chain, end to end

```
CAB ──── Um (air) ──── BSS ──── A-i/f ──── NSS ──── E-i/f / MAP&ISUP ──── other GSM-R networks
 |                      |                   |
 cab radio, EDOR,      BTS, BSC, TCU       MSC(-pool), HLR, VLR, GCR,
 handhelds, SIM                            FNN, dispatcher systems
                        └───────── ground transport / distribution layer ─────────┘
                                   (the 23-Jun culprit layer — DB's words ONLY:
                                    "a network distribution component")
```

## 2. Onboard (cab) equipment

| Equipment | Function | Governing spec / test regime | Vendors on record | Evidence (tier) |
|---|---|---|---|---|
| **Cab Radio** | Driver voice: REC, group/broadcast calls, functional numbers, call arbitration | UIC **O-3001** Cab Radio Functional Test Specification — full functional edition v1.1.1 (328 pp., 2011), MI-only edition v1.5.0 (82 pp., 2014/15); boot with faulty device / no network, network-loss visualisation, self-test are **tested behaviours** | Spec custodians in rotation: **Kapsch** (created 2007) → **Siemens** (v1.1, 2011) → **Funkwerk AG TCC** (v1.2.0–1.5.0, 2014/15; a cab-radio manufacturer) | E-2026-07-06-06, E-2026-07-06-08 (A, restricted) |
| **EDOR** (ETCS Data Only Radio) | The **data** bearer for ETCS L2 — carries Movement Authorities; its 40-s silence trips T_NVCONTACT → forced service brake (DB national value) | Entered O-3001 at v1.4.0 (09/2014, "Update for EDOR"); EDOR test configuration §3.5 | Not vendor-attributed in the record | E-2026-07-06-08 (A); watchdog value E-2026-07-02-34 (A) |
| **EIRENE mobiles / handhelds (GPH), controller terminals, EIRENE SIM** | Subscriber/terminal population for testing and operations | DB Systel IOT spec test-equipment section (§4.7): EIRENE Mobile Stations, Controller Terminals, EIRENE SIM/subscriber profiles, **Air Interface Simulator** (test tooling) | Not vendor-attributed in the record | E-2026-07-06-04 (A) |
| **TIMS** (train integrity, adjacent onboard) | Reports train integrity — spec mandates reporting "unknown" over stale "confirmed" | Generic TIMS specification 1000-0007-0001-0001-EN v1.0 | Industry-generic spec | E-2026-07-02-29 (A) |

## 3. Dispatcher / control-room side

| Equipment | Function | Governing spec / test regime | Vendors on record | Evidence (tier) |
|---|---|---|---|---|
| **Dispatcher terminals** (incl. one referenced as **DICORA** — "Display of Trains and Mobiles at DICORA") | Dispatcher call handling, OTDI, kill sequences, train/mobile display | "FRQ" dispatcher test spec — 14 cases in the IOT 2014 campaign (**document not on file**; vendor of DICORA not identified in the record) | Not attributed in the record | E-2026-07-06-09 (A, working artefact) |
| **FDS** (Functional Dispatcher System) | National dispatcher system (Lithuanian estate) | Delivered under the LTG Infra modernisation contract | **Kontron Transportation** (LTG Infra, 2021) | E-2026-07-06-01 (B — vendor-primary for contract facts) |
| **Fixed control panels** | Dispatcher/lineside fixed radio access (281 units in the 2010 Lithuanian build) | — | Original 2010 build (vendor not stated in release) | E-2026-07-06-01 (B) |

## 4. BSS — trackside radio access (BTS, BSC, TCU)

| Item | Detail | Vendors on record | Evidence (tier) |
|---|---|---|---|
| **BTS/BSC estates** | e.g. 136 base stations in the Lithuanian 2010 build; BSS modifications in the 2021 modernisation | **Kontron** (LT modernisation); mixed-vendor BSS proven in TEN 9.2/9.3: **NSN BSS** and **Kapsch BSS** configurations | E-2026-07-06-01 (B), E-2026-07-06-03 (A) |
| **DB regional RAN split** | South RAN vs north RAN, different vendors | **Nokia (south RAN); Siemens CC + Huawei (north RAN)** — *C-tier estate mapping, verify vs primary DB/TED records before reuse* | E-2026-06-29-02 (**C**) |
| **A interface (BSS↔NSS seam)** | 3GPP TS 48.008; mixed-vendor single-network configs (NSN NSS + Kapsch BSS / Kapsch NSS + NSN BSS) proven **without simulators**, incl. handover + cell reselection, ERA in review loop | NSN ↔ Kapsch CarrierCom | E-2026-07-06-03 (A) |

## 5. NSS — core network

| Item | Detail | Vendors on record | Evidence (tier) |
|---|---|---|---|
| **MSC / HLR / VLR / GCR / FNN** | Core switching, subscriber registers, Group Call Register, Functional Number Node | TEN plans: **NSN NSS (Release 99 architecture)** and **Kapsch CarrierCom NSS (Release 4)**; NSS modernisation in LT by **Kontron** | E-2026-07-06-02/-03 (A), E-2026-07-06-01 (B) |
| **DB core attribution** | Kapsch/**Kontron** core — *C-tier, verify at primary before reuse* | (Kapsch CarrierCom → Kontron GSM-R business lineage confirmed C-tier) | E-2026-06-29-02 (**C**) |
| **Core redundancy mechanism (class)** | MSC pooling / "RANflex" — RAN node connects to multiple core nodes (3GPP TS 23.236, Rel-5→17); ETSI **TS 103 147** mandates AUTOMATIC switchover, naming maintenance among covered events | Commercial 3GPP architecture, not railway-bespoke | E-2026-07-05-08 (A), E-2026-07-01-09 (A) |
| **Signalling (MAP/SS7 + ISUP)** | The inter-vendor and inter-network seam traffic; MAP carries overload/congestion/VLR-restoration machinery; the same layer the out-of-band monitoring argument (Q.752 pattern) watches | — | E-2026-07-05-05 (A), E-2026-06-30-03, E-2026-07-06-02 (A) |
| **E interface (network↔network seam)** | MAP&ISUP between two GSM-R networks; roaming, cross-network pre-emption, forced deregistration across PLMNs — proven in TEN 9.1 + DB Systel E-IF chapters. **International transit runs through UIC-operated interconnecting hubs — located in Germany, back-up in Switzerland, 17 countries (UIC brochure Dec 2020, E-2026-09-20-01; B-weight, 2026 state unverified → B19)** | NSN ↔ Kapsch CarrierCom (TEN 9.1); hub vendor/operator not on file | E-2026-07-06-02 (A), E-2026-07-06-04 (A), E-2026-09-20-01 (A/B) |

## 6. Ground transport / distribution layer — **the 23-Jun culprit layer**

- DB's confirmed wording, and the ONLY citable identification: **"a network distribution component"** — planned swap → singular software fault → no alarm → automatic failover to the functional redundancy never engaged → manual recovery (~2 h standstill, first trains ≈00:30). Cyberattack ruled out. (E-2026-06-27-01/-02/-03, A.)
- **Quarantined, mutually incompatible, NEITHER citable:** an expert body's probabilistic IP-MPLS core-switch/leaf-spine reading (E-2026-07-03-02, C) and an engagement-internal element identification (E-2026-06-27-05). **No vendor name may ever be joined to this layer.**
- Post-incident: swaps of this component type suspended pending a manufacturer fix; maintenance confined to 00:00–04:00 on the inactive redundancy side (E-2026-06-27-01, A).

## 7. Ground estate / data centres

- Geo-redundant signalling estate doctrine: second data centre as **cold standby**, virtualised **warm standby** as the target state; engagement-flagged common-mode risk on the sync channel; the operator's own authors concede an isolated cold standby cannot be fully tested end-to-end. (E-2026-07-02-25, A.)

## 8. Test & trial equipment (documented tooling)

| Tooling | Context | Evidence (tier) |
|---|---|---|
| **Air Interface Simulator** | DB Systel lab IOT (device/lab layer; the TEN campaigns by contrast ran real equipment **without** simulators — different layers, no contradiction) | E-2026-07-06-04 (A) |
| **NSN + KCC test labs** | Joint lab campaign 10.08–25.10.2013 validating the trackside MI test cases | E-2026-07-06-07 (A, confidential-marked) |
| **IOT 2014 campaign estate** | 111 cases across E-i/f, A-i/f, dispatcher, cab radio, QoS (REC/ADIA set-up-time measurement with acoustic + AT-interface triggers) | E-2026-07-06-09 (A) |
| **5G/FRMCS trial gear** | Multipath/hybrid prototype, 2.0 s path switchover field-proven on a test track (provisional band); **n101 1900 MHz 5G SA** at the DTB commissioned 09/2025 by Nokia + DB — *press-reported, verify at primary* | E-2026-07-02-21 (A/B), E-2026-07-03-02 (**C**) |

## 9. Vendor roster (as the record knows them)

| Vendor | Role(s) on record | Evidence (tier) |
|---|---|---|
| **Kapsch CarrierCom → Kontron** | GSM-R NSS/BSS vendor (TEN plans, Rel-4 NSS); O-3001 originator (2007); GSM-R business acquired by S&T/Kontron; national prime Lithuania 2021 (€16 M, NSS+BSS+FDS, 9-yr maintenance) | E-2026-07-06-02/-03 (A), E-2026-07-06-06 (A), E-2026-06-29-02 (C), E-2026-07-06-01 (B) |
| **Nokia Siemens Networks → Nokia (NSN/NSol&N)** | GSM-R NSS/BSS vendor (TEN plans, R99 NSS); joint IG-0124 trackside spec; DB south RAN (C); n101 5G SA trial with DB (C, verify) | E-2026-07-06-02/-03/-07 (A), E-2026-06-29-02 (C), E-2026-07-03-02 (C) |
| **Siemens** | O-3001 v1.1 custodian (2011); "Siemens CC" in DB north (C) | E-2026-07-06-06 (A), E-2026-06-29-02 (C) |
| **Funkwerk AG TCC** | Cab-radio manufacturer; O-3001 custodian v1.2.0–1.5.0 (2014/15) | E-2026-07-06-08 (A) |
| **Huawei** | DB north RAN (C-tier only) | E-2026-06-29-02 (C) |
| **Nortel** | Historic GSM-R market share (≈58 %) + insolvency-year claims — **UNSOURCED in the log**; also subject of the quarantined engagement-internal culprit identification. Do not reuse either without a source | Open-threads note; E-2026-06-27-05 (quarantined) |

## 10. Honesty constraints (binding on any reuse of this map)

1. **Culprit quarantine is absolute:** the 23-Jun layer carries DB's five words only; no vendor from §9 may be placed there, and the two competing element-class inferences stay uncited.
2. **DB estate vendor split is C-tier** (E-2026-06-29-02) — verify against primary DB/TED records before any public use.
3. **Restricted/confidential sources:** O-3001 (both editions, RESTRICTED) and GSMR IG-0124 (PROPRIETARY/CONFIDENTIAL) — paraphrase only, resolve rights before citation; the O-3001 v1.5.0 copy is an unissued redline.
4. **B-tier contract facts** (Kontron/LTG) are vendor-side only — verify at buyer/TED if load-bearing.
5. **Press-reported items** (n101, DB regional split colour) remain verify-at-primary.
6. Documents **not on file** referenced by the campaign matrix: "FRQ" dispatcher spec, gsmr2875-019 QoS spec, TEN-T IOT results reports 9.1/9.2/9.3 v1.7 (05/2012) — follow-ups, not sources.

## Evidence refs (consolidated)

E-2026-06-27-01/-02/-03/-05 · E-2026-06-29-02 · E-2026-06-30-03 · E-2026-07-01-09 · E-2026-07-02-21/-25/-29/-32/-34 · E-2026-07-03-02 · E-2026-07-05-05/-08 · E-2026-07-06-01…-09
