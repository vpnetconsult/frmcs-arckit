# Pivot notes — when does FRMCS ask for a network slice: at path booking, or on board as a backup?

**Date:** 2026-09-30 (later sitting) · **Pivot state:** `current/` at 609 rows (`E-2026-09-30-16` last); last frozen baseline `2026-09-27_2035` — today's rows are not yet frozen. · **Siblings:** `pivot-notes-2026-09-30-frmcs-tmforum-ontology-bridge.md` (where FRMCS objects land in the TM Forum model), `pivot-notes-2026-09-20-ibn-core-rail-e2e.md` §2b (the slice chain, bottom-up), `pivot-notes-2026-09-20-path-booking-ontology.md` (the parties and messages of a path).
**Purpose:** answer the lead's question from held text, and say what the answer means for the ontology: which object a slice is, who creates it, when, and what — if anything — ties it to a train journey.

**Outcome anchor:** *safe, continuous rail operations.* If the bearer were requested per journey, a failed request would be a failed train. It matters to know that it is not.

**Guardrail:** oversight, not control. Nothing here requests or selects a slice; it records who does and when.

**Method note.** No new source was read for this note. Every statement cites a row already in the log. The FRMCS clauses are V2.1 texts, and the slicing clauses in them are marked as V3 obligations (§5).

---

## 1. The short answer

**Neither.** In the held FRMCS text a slice is not requested when a path is booked, and the on-board unit does not request one as a backup.

- **There is one slice, and it is provisioned, not requested.** FRMCS reduces slicing to a single default slice per transport domain. It sits in the subscriber record of each on-board radio module, and the network selects it when the module registers (UIC SRS AT-7800 v2.1.0 §13.3.1.4, §13.3.1.6; TS 23.501 §5.15 — E-2026-09-20-04, E-2026-09-19-05).
- **Path booking knows nothing about the bearer.** No path message carries a radio or slice field, and no telecom operator is a party to any of them (path-booking note §3, Relation A; E-2026-09-19-24).
- **The backup is a path decision, not a slice request.** The FRMCS multipath function chooses among data paths under a policy the operator wrote in advance. If one of those paths is a public operator's network, the slice there is that operator's own, again fixed by subscription (SRS §12.3.8, §12.3.21, §13.3.1.10 — E-2026-09-19-19, E-2026-09-20-04).

Service differentiation — emergency call ahead of ETCS data ahead of video — happens by quality-of-service and priority **inside** the one slice, not by one slice per service.

## 2. The three moments, against the held text

| Moment | What one might expect | What the held text says | Source |
|---|---|---|---|
| **Path booking** (months to days before) | The railway undertaking's path request reserves radio capacity — a slice — along the route | The path lifecycle is a set of messages between undertakings and infrastructure managers. None has a telecom operator as sender or receiver; the transport assumption is "any TCP/IP network"; there is no bearer, coverage or slice field. The path itself is not even a persistent object in the vocabulary — only its messages are | path-booking note §1 row 12, §3 Relation A, §4 item 2; E-2026-09-19-23/-24/-44 |
| **Train start-up / registration** (at departure) | The on-board unit requests a slice for this journey, or one per application | The FRMCS radio module is a 3GPP user equipment. Its slice identifier is subscription data; the network's selection functions pick the serving slice at registration. FRMCS uses **one default slice, service type 4, no slice differentiator**; additional slices are out of scope for V2. **The on-board never chooses a slice per application** — application-driven domain selection is excluded by the decoupling principle | SRS §13.3.1.3/.4/.6/.9 and editor's notes; TOBA-7510 v1.0.0 §7.4; TS 23.501 §5.15 — E-2026-09-20-04, E-2026-09-19-05 |
| **Failure / fallback** (during the journey) | The on-board unit requests a backup slice from a public operator when the railway network fails | Fallback, best-path selection and packet replication across FRMCS and non-FRMCS domains (public operator, satellite, Wi-Fi) are multipath use cases. **Decisions on the use of data paths are taken by the multipath function only**, under a multipath policy the FRMCS operator configures. In V2 that policy is static: allowed paths per application, no quality-driven switching (quality evaluation, dynamic rules and real-time operator information are later versions). On the public path the default slice "shall be different" — it is the public operator's slice in its own network. The on-board only **reports** a transport domain as connected or disconnected, with a reason | SRS §12.3.8, §12.3.17–.21, §13.3.1.10; TOBA-7510 v2.1.0 §7.9.3.6.6 — E-2026-09-19-19, E-2026-09-20-04; ADR-001 item 5(b)(vi) |

## 3. So when is a slice created, and by whom

Long before any train, on the management plane, and it has two forms.

| When | Who | Act | Object | Source |
|---|---|---|---|---|
| Network build and configuration — years to months ahead | The FRMCS operator (the infrastructure manager, or whoever runs its network) | Provisions the one FRMCS slice and its service profile (availability, latency, survival time); writes the default slice into every on-board subscription | 3GPP `NetworkSlice`, `NetworkSliceSubnet`, `ServiceProfile` (TS 28.541) | E-2026-09-19-30; ibn-core note §2b |
| Contract with a public operator — if the fallback or hybrid option is taken | The infrastructure manager as customer; the public operator as provider | Orders a slice service with stated characteristics; the public operator allocates it in its own network | A **customer-facing service** on the TM Forum side (E-2026-09-30-10), realised by the public operator's own 3GPP slice; an agreement between two party roles | bridge note rows 4 and 17; path-booking note Relation C |
| Operator configuration — before service | The FRMCS operator | Writes the multipath policy: which data paths each application may use | A policy rule (event, condition, action) | SRS §12.3.21; bridge note row 16 |
| Registration — each power-up | The network, not the train | Selects the default slice for the registering radio module | — (no new object) | TS 23.501 §5.15 |
| In service | The multipath function, under the policy | Uses, duplicates or abandons a data path | — (a decision under the policy, not a request) | SRS §12.3.8 |

The ONAP modelling discussion read today points the same way: slice allocation is an orchestration operation that creates or reuses a slice instance when a *communication service* is ordered, and the slice identifier is generated at that point (E-2026-09-30-10, page (c) — an unresolved 2019 design discussion, cited for the shape only).

## 4. What this means for the ontology

1. **A slice is a standing service, not a journey attribute.** On the TM Forum side it is one customer-facing service instance per transport domain (and a second one, from a second provider, if a public operator is contracted). Its lifetime is the network's, not the train's. Nothing should model "slice of train 4711".
2. **No chain of identifiers leads from a path to a slice.** The journey's identity on the bearer is the train's functional identity (functional alias — TS 23.280 §8.1.5, ADR-001 item 5(a)); the slice hangs on the radio module's subscription. The two meet only in the on-board gateway. The path, for its part, has no object to hang anything on.
3. **What can be joined is geography, not booking.** Sections of line on a path ↔ cells covering them ↔ the slice subnet those cells belong to. That is join 1 of the bridge note (place ↔ RINF identifier) plus the operator-side cell-to-section term. It answers "does this path run where the FRMCS service is available, and where does it fall back to a public operator" — an assurance question, not a reservation.
4. **The backup has its own objects, and they are contractual.** Public operator as party role; agreement; its slice as a customer-facing service with the mission-critical functions as mandatory characteristics (R4's condition); the multipath policy as the rule that says when that path may be used. The ERA side has no term for any of it (path-booking note, entities 17 and 18).
5. **The one place a journey could meet the bearer in law is a path-message parameter that does not exist yet.** The network-specific-parameters route (E-2026-09-28-04) would let an infrastructure manager propose a radio-bearer field on the path-details message. That would declare the bearer along a path; it still would not request a slice.

## 5. Bounds

- **The slicing clauses are V3 obligations.** SRS §13 is marked mandatory-for-V3 throughout; V2 is silent on whether operators implement slicing at all, and an editor's note leaves open whether FRMCS needs the slicing signalling. The service-type-4 choice carries its own editor's note (a railway-specific type is "under investigation").
- **Later FRMCS versions may change this.** Additional slices and dynamic multipath rules are explicitly deferred, not excluded. FRMCS v2.2 and the V3 series are not held (A7, B1).
- **On-board gateway redundancy is out of scope for V2** (SRS §17.3.1.3). "The on-board as backup" has no specified form yet beyond the multipath function.
- **"Railway traffic in a dedicated low-latency slice, selected at train registration"** is the common description and appears in no held primary text; the ibn-core note §2b records the correction.

## 6. What this says for the register

1. **No decision moves.** ADR-001 item 5(b)(vi) already treats the fallback as a static, operator-written policy; act A14 item (f) already targets one slice and its service profile. This note confirms both against the question as asked.
2. **A per-journey bearer check is possible as oversight, and only as oversight.** Opinion, marked as such: the useful thing at booking time is not a slice request but a check — do the sections of this path lie under the FRMCS service profile, and which sections depend on the public path? It needs the place join and the cell-to-section term (bridge note §3; proposed act A20), and it advises; it reserves nothing.
3. **The multipath policy is the artefact to review.** It is where "backup" is actually decided, it is written by a person in advance, and it is the object ADR-001 item 5 asks to be explicit and evidenced. In ontology terms it is a policy rule with an owner — the form the bridge note's row 16 gives it.

---

## Source-discipline note

Held and cited, not re-read today: UIC SRS AT-7800 v2.1.0 §12.3, §13, §17.3 (E-2026-09-19-19, E-2026-09-20-04); TOBA-7510 v1.0.0 and v2.1.0 (E-2026-09-04-20, E-2026-09-19-19, E-2026-09-20-03); TS 23.501 §5.15 (E-2026-09-19-05); TS 28.541 slice objects (E-2026-09-19-30); the ERA telematics classes and TD100 (E-2026-09-19-23/-24/-44). Read today: the ONAP modelling pages (E-2026-09-30-10) and the SID v26.0 data model (E-2026-09-30-06, -09). **Not held:** FRMCS v2.2 and the V3 series; TS 28.531 (slice provisioning operations — the `allocateNsi` operation is known here only through ONAP's mention of it); GSMA NG.116. The "when and who" table in §3 is the register's reading of those texts together; no single held document states it as a sequence.
