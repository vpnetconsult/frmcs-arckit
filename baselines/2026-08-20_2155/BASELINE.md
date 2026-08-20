# Baseline 2026-08-20

Frozen (UTC): 2026-08-20T19:56:00Z
Files: 75

## Requirement status snapshot

| Status | Count |
|---|---|
| Accepted | 8 |
| Strengthened post-incident | 1 |
| Open | 2 |
| Proposed | 2 |
| Recommended | 1 |

Evidence entries logged: 392

## Decision health

The register's failure mode is decision drift: evidence accumulates while
decisions stand still. These counters make that visible in every baseline
instead of needing an audit to discover it. See evidence-log.md rule 4.

| Metric | Value |
|---|---|
| ADRs Accepted | 8 of 10 |
| ADRs Proposed | 2 of 10 |
| ADR action items closed / open | 22 / 54 |
| Evidence rows: revise | 60 |
| Evidence rows: validate | 227 |
| Evidence rows: watch | 105 |
| **Revise rate** | **15%** |


## Changes vs 2026-08-20_2151

- changed: evidence-log.md
- changed: project/08-eba-consultation-2026-08-18.md
- changed: project/ADR-012-cybersecurity-conformance.md

### Living-doc diffs

#### evidence-log.md
```diff
@@ -450,6 +450,8 @@
 
 | E-2026-08-20-31 | 2026-08-20 | **DZSF Cybersecurity-Labor (Dresden) — the safety authority research centre's own rail-cybersecurity test infrastructure**, read at source on dzsf.bund.de. Standard server hardware; **management and experiment networks separated; isolated from the regular EBA network**; SSH-operated dedicated console. Contact: Daniel Rutz, info@dzsf.bund.de | Infrastructure page of the research body itself | `dzsf.bund.de/DZSF/DE/DasDZSF/Forschungsinfrastruktur/Cybersecurity-Labor/…`, read 2026-08-20 (URL supplied by the user) | **A** (primary for what the body says about its own lab; ⚠️ the *Einsatzgebiete* are expressly **geplant** — planned, staged by *Ausbaustufe* — plan-not-outcome discipline applies) | **ADR-007 surface 6** · **ADR-012 items 5, 2** · project/08 (correspondent argument) · R12/R14 | **revise** | **Planned uses, paraphrased: (i) SECURITY TESTING** — man-in-the-middle attacks to check whether encryption/signature schemes are adequately designed *and implemented*, and re-creation of complex systems/research results for testing; **(ii) LST-SIMULATION** — modelling computer/communication networks such as digital interlockings; **(iii) a PROTOTYPE SIEM for integrated transport**; **(iv) an OPEN-SOURCE RaSTA IMPLEMENTATION** (Rail Safe Transport Application — the rail-signalling transport protocol) — development of a publicly accessible implementation; **(v) validation of LST planning by simulation; (vi) teaching.** Stated purposes include **standards contribution (testing technologies/protocols proposed for standardisation) and checking whether technologies actually keep their promised properties**. **Why this moves things. (a) ADR-007 surface 6** calls for design-stage security testing before metal exists and independent adversarial testing as a standing function — **the national safety authority's research centre runs exactly that class of facility, in-domain, on standard hardware with a two-network split**: an existence proof the surface can cite, and its published architecture (management/experiment separation, external isolation) is a sensible template for our own testbed. **(b) The open-source RaSTA implementation is a direct input to the ADR-012 adjudication rule's home layer:** the named-hazard vocabulary (deletion · corruption · delay · unavailability, E-2026-08-19-12) lives precisely at the RaSTA/safe-transmission layer — a public implementation is the thing to build and test that transformation against (feeds surface 6's build and ADR-012 item 2's verify-the-claims stance). **(c) ADR-012 item 5** (independent detection → SIEM/IDS) gains a watch: the authority's research arm is prototyping a transport SIEM — track it rather than duplicate it blind. **(d) The DZSF-correspondent argument (project/08) strengthens again:** the addressee's institution not only writes the assurance methodology, it operates the security test infrastructure — hands-on capability, not just papers, and a named contact for the lab. **(e) "Check whether technologies keep their promised properties" is our mandate-the-optional procurement rule, stated as a lab mission.** **MOVES: `revise` — ADR-007 surface 6 gains the lab as named in-domain reference + the RaSTA OSS pointer; ADR-012 item 5 gains the SIEM-prototype watch.** No status flips — planned uses of a lab are a capability signal, not test evidence. |
 
+| E-2026-08-20-32 | 2026-08-20 | **"Wie können sich die Bahnen vor Hackerangriffen schützen?" — interview with Pavel Klasek (DZSF), Fokus Bahn NRW, 15.10.2024** (linked from the DZSF Cybersecurity-Labor page). Klasek's profile per the interview: Diplom-Ingenieur Elektrotechnik, **wissenschaftlicher Referent, Schwerpunkt BAHNKOMMUNIKATIONSSYSTEME, Fachbereich Sicherheit und kritische Infrastruktur, DZSF Dresden/Bonn** | Expert interview in a sector-initiative outlet | `fokus-bahn.nrw/aktuelles/detail/wie-schuetzen-sich-die-bahnen-in-nrw-vor-hackerangriffen.html`, read 2026-08-20 (URL supplied by the user) | **B** (expert interview — a DZSF voice, but opinion/communication format; the one hard number is a relayed BSI-reporting fact) | **project/08 forum tactics** · ADR-012 item 1 · R8/PR13 · R12/R14 · E-2026-08-19-13 corroboration | **revise** | **(a) ⚠️ THE SPEAKER IDENTIFICATION IS THE LOAD-BEARING FACT: Klasek — the 2 September forum's 13:10 speaker (E-2026-08-20-30) — is a RAIL COMMUNICATION SYSTEMS researcher inside DZSF's security division.** The register had him filed only via his sensor-data talk title. **A bearer-security/link-availability question is literally his stated specialty — he becomes the fallback route for the primary question if Dr. Mühl's 14:10 slot closes without an answer, and his slot comes FIRST.** Forum plan updated accordingly. **(b) Public facts worth holding:** Deutsche Bahn alone reported **13 IT attacks to the BSI in 2023**; the BSI publishes no lists, so **no public statistics exist** (the transparency gap the register keeps meeting); threat picture: resourced groups, some state-supported, aiming at infrastructure damage; ransomware extortion; data theft rare in rail (his perception, marked as such). **(c) THE CAPACITY-AWARE ADVERSARY, his sharpest point:** an attacker who knows the network runs at its capacity limit gets **outsized damage from small attacks** — attack severity is a function of spare capacity, not only of the asset attacked. Read against 23 June (a single silent fault → nationwide standstill), this is the security restatement of R3/R4's premise, from the authority's own researcher. **(d) "NOT-SO-CRITICAL" SYSTEMS ARE THE SOFT SURFACE:** the ransomware hit on passenger information boards — tolerable for operations, but proof that systems classed non-critical get attacked first. **Carried to ADR-012 item 1: the PDE inventory must include the systems nobody would defend in a tabletop — info boards, fleet management, administration — because classification as non-critical is precisely what makes them the entry point.** **(e) STANDARDISATION AS SECURITY, against vendor lock:** one-off components (two interlockings built entirely differently) need bespoke protection; unification eases monitoring, cheapens components, protects interfaces — **"und verhindert die Abhängigkeit von nur einem Hersteller, was gerade beim Thema Cybersicherheit von großer Bedeutung ist"** — a DZSF voice making the register's R8/PR13 unbundling argument on security grounds, naming OCORA for vehicles. **(f) Maturity corroboration:** cites a 2022 sector self-assessment, 0–5 scale, adequate baseline = 3: **sector 2, infrastructure 1** — consistent with the 2025 DZSF NIST-CSF survey (E-2026-08-19-13: 1.96 / IMs 1.15); two instruments, same picture, no improvement trend visible between them. **MOVES: `revise` — project/08 forum plan gains the Klasek fallback route for the bearer question; ADR-012 item 1 gains the include-the-undefended rule.** No status flips — an interview evidences positions, not systems. |
+
 ## How to append
 
 When something arrives during the day:
```
