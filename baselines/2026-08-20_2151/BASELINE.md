# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T19:51:21Z
Files: 75

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 391

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 8 of 10 |
| ADRs Proposed | 2 of 10 |
| ADR action items closed / open | 22 / 54 |
| Evidence rows: revise | 59 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **15%** |


## Changes vs 2026-08-20_1710

- changed: evidence-log.md
- changed: project/ADR-007-testing-canary-strategy.md
- changed: project/ADR-012-cybersecurity-conformance.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -448,6 +448,8 @@
 
 | E-2026-08-20-30 | 2026-08-20 | **2. DZSF-Forum "Wissenschaft und Praxis" — event page READ AT SOURCE on dzsf.bund.de** (page dated 29.07.2026): *"Automatisiertes Fahren im Schienenverkehr: Rahmenbedingungen und Handlungsfelder"*, **02.09.2026, 13:00–15:00, online, kostenfrei, KEINE REGISTRIERUNG ERFORDERLICH**; Webex dial-in link and calendar entry published on the page | Event page of the research body itself | `dzsf.bund.de/SharedDocs/Termine/DZSF/2026/2026_2_DZSF_Forum.html`, read 2026-08-20 (prompted by the user relaying the page content) | **A** | **project/08 pre-forum checklist** · ADR-002 item 8 · E-2026-08-20-01 caveat | **revise** | **Discharges the E-2026-08-20-01 "RELAYED, NOT READ" caveat — every logistics fact now stands at source. (a) Confirmed:** date, time, the three talks, open Q&A format (*"drei Fachvorträge mit einer sich jeweils anschließenden Diskussion und der Möglichkeit für Rückfragen"* — discussion after EACH talk, not one block at the end: **the primary question to Dr. Mühl goes in HER slot's discussion, not at the close**). **(b) Schedule with times:** 13:10 Klasek (annotated sensor data) · 13:40 Klotz (KI perception test/Nachweis — the finding-1 question) · **14:10 Mühl (Berufsbild Tele-Tf — the primary bearer-availability question)**. **(c) NO REGISTRATION EXISTS — the "register" to-do dissolves**; attendance = opening the published Webex link (`eba-event.webex.com/eba-event/j.php?MTID=m50a386eeb6719a85efc78bc832354a67`) on the day. **(d) NEW WATCH — the series continues 25 November 2026 on "soziale und psychologische Aspekte der Sicherheit im Bahnkontext"** — squarely the ADR-002 item-3 safety-culture/human-factors territory (E-2026-08-18-08, E-2026-08-19-01); mark for attendance when its page appears. **MOVES: `revise` — project/08's "Before the forum" instruction is satisfied and updated (confirmed at source, no registration, dial-in link recorded, per-talk discussion format noted); the 25-Nov follow-up enters the watch list.** |
 
+| E-2026-08-20-31 | 2026-08-20 | **DZSF Cybersecurity-Labor (Dresden) — the safety authority research centre's own rail-cybersecurity test infrastructure**, read at source on dzsf.bund.de. Standard server hardware; **management and experiment networks separated; isolated from the regular EBA network**; SSH-operated dedicated console. Contact: Daniel Rutz, info@dzsf.bund.de | Infrastructure page of the research body itself | `dzsf.bund.de/DZSF/DE/DasDZSF/Forschungsinfrastruktur/Cybersecurity-Labor/…`, read 2026-08-20 (URL supplied by the user) | **A** (primary for what the body says about its own lab; ⚠️ the *Einsatzgebiete* are expressly **geplant** — planned, staged by *Ausbaustufe* — plan-not-outcome discipline applies) | **ADR-007 surface 6** · **ADR-012 items 5, 2** · project/08 (correspondent argument) · R12/R14 | **revise** | **Planned uses, paraphrased: (i) SECURITY TESTING** — man-in-the-middle attacks to check whether encryption/signature schemes are adequately designed *and implemented*, and re-creation of complex systems/research results for testing; **(ii) LST-SIMULATION** — modelling computer/communication networks such as digital interlockings; **(iii) a PROTOTYPE SIEM for integrated transport**; **(iv) an OPEN-SOURCE RaSTA IMPLEMENTATION** (Rail Safe Transport Application — the rail-signalling transport protocol) — development of a publicly accessible implementation; **(v) validation of LST planning by simulation; (vi) teaching.** Stated purposes include **standards contribution (testing technologies/protocols proposed for standardisation) and checking whether technologies actually keep their promised properties**. **Why this moves things. (a) ADR-007 surface 6** calls for design-stage security testing before metal exists and independent adversarial testing as a standing function — **the national safety authority's research centre runs exactly that class of facility, in-domain, on standard hardware with a two-network split**: an existence proof the surface can cite, and its published architecture (management/experiment separation, external isolation) is a sensible template for our own testbed. **(b) The open-source RaSTA implementation is a direct input to the ADR-012 adjudication rule's home layer:** the named-hazard vocabulary (deletion · corruption · delay · unavailability, E-2026-08-19-12) lives precisely at the RaSTA/safe-transmission layer — a public implementation is the thing to build and test that transformation against (feeds surface 6's build and ADR-012 item 2's verify-the-claims stance). **(c) ADR-012 item 5** (independent detection → SIEM/IDS) gains a watch: the authority's research arm is prototyping a transport SIEM — track it rather than duplicate it blind. **(d) The DZSF-correspondent argument (project/08) strengthens again:** the addressee's institution not only writes the assurance methodology, it operates the security test infrastructure — hands-on capability, not just papers, and a named contact for the lab. **(e) "Check whether technologies keep their promised properties" is our mandate-the-optional procurement rule, stated as a lab mission.** **MOVES: `revise` — ADR-007 surface 6 gains the lab as named in-domain reference + the RaSTA OSS pointer; ADR-012 item 5 gains the SIEM-prototype watch.** No status flips — planned uses of a lab are a capability signal, not test evidence. |
+
 ## How to append
 
 When something arrives during the day:
```
