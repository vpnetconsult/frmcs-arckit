# LinkedIn post — who is speaking, who may decide, and which words the machine understands

**Status:** DRAFT 2026-09-19 (late) · **Register basis:** rows E-2026-09-19-25/-26/-38/-44/-45/-47/-48/-50 and ADR-001 5(a)/5(b), ADR-002 item 9 rules (ix)–(xi), ADR-012 item 5; see the source note at the end. Every claim below traces to a held document; the draft-law and unreleased-branch caveats are in the note, not in the post.

---

On 23 June, when Germany's train radio went dark for two hours, drivers did what the rulebook says: stop at the next station. The rulebook also says something else — if the railway's own phones fail, staff may use *any* telephone, including the public mobile network, to pass orders. That is not a loophole. It is a rule written by the infrastructure manager, in force, on paper.

So why couldn't the trains just switch to the public network and keep going?

Because "switch to the public network" is three different questions, and the law answers only the first.

**1. May we?** Yes — for a person talking to a person. The rules allow public telephony for orders and messages when the railway's lines are down, and a driver may reach a signaller on a public phone. What they do not provide is the *radio functions*: the emergency call that reaches every cab in a section at once, the group call, the priority that pre-empts everything else. Those are not "a phone call". They are a service with a definition, and no public network offers them unless it is built to.

**2. Who is speaking?** On the railway, a driver is not "Anna" or "+49 …". A driver is *the driver of train 4711 on track 3*. That identity — a functional address — is what the emergency call, the group call and the signaller's screen are built on. On GSM-R it is welded into the network. On the coming system, FRMCS (5G-based), it becomes a *functional alias* managed by a mission-critical service on top of the bearer. Move to a public network without moving that identity layer and you have a phone that works and a railway that does not know who is on it. Identity is the part of "trust" you can lose while every bar of signal is still lit.

**3. Which words does the machine understand?** This is the part nobody puts on a slide. Europe's rail regulator (ERA) publishes a formal vocabulary — an *ontology* — for the registers of infrastructure and vehicles. It knows every GSM-R parameter of every line: version, network ID, whether a line lets a signaller force-deregister a wrongly registered cab. It is the only railway vocabulary with a legal handle. And it contains **zero** FRMCS terms. The draft safety-reporting vocabulary that will one day classify an outage like 23 June names FRMCS only *on board*; trackside, its codes are still "base station, switching centre" — 2G words. So today, an FRMCS failure would be filed as "other".

Now the top-down view, because this is where it links — or doesn't.

**Law sits at the top.** The EU's control-command specification binds the FRMCS documents by index and version — "this document, this edition". It binds them as *paper*. Nothing in that chain is a term a machine can check. Below the law: the FRMCS specifications themselves (no vocabulary), the ETSI interworking standard (none), the 3GPP mission-critical specs (schemas, not vocabularies), the 5G management specs (object models, not vocabularies). Three layers of specification with law above them and not one machine-checkable word of their own.

**The telecom industry sits at the bottom with the opposite problem.** TM Forum — the operators' standards body — has the richest governed vocabulary on the stack: an *intent ontology* through which an operator tells an autonomous network what outcome it wants, and the network reports whether it is meeting it. It is open by design: any standards body or operator may add an extension. It binds no one. And it does not know what a railway is.

**So: does FRMCS become an "autonomous-network consumer"?**

In TM Forum's own architecture, yes — that is exactly the role. The infrastructure manager is the *consumer* of the bearer's autonomous domain: it states an intent ("emergency voice on corridor X: available, with these limits, or tell me"), the network's closed loops try to keep it, and report. Two things follow that the slideware skips:

- The intent has to be written in *both* vocabularies at once. The **what** — the corridor, the line, the vehicle type, the radio parameters — must use ERA's terms, because those are the ones with a legal handle. The **how well** — availability, time to recover, who may approve a change — uses TM Forum's intent terms, because those are the ones the network's machinery reads. The bridge between them is a *rail extension model* of the intent ontology, anchored to ERA's IRIs. Nobody has written it. Under ERA's own rules, it would live as an extension branch of ERA's vocabulary, reviewed by ERA's board — which is the only way it gains the legal handle the telecom side lacks.
- Trust has an ontology form too. The telecom side already has a *security expectation* with a cost attribute: "this control burdens this essential function by this much". The gate that lengthened 23 June — exclude a cyber attack before switching to the standby core, for a time nobody had bounded — is exactly such an entry. The draft safety-reporting rules would ask the same thing in their words: every risk-control measure declared with its expected effectiveness and its indicator. Same fact, two vocabularies, no link yet.

**What "not linked" costs.** A corridor declaration that says "FRMCS-capable" has nowhere to say it in code. A vehicle authorisation for an FRMCS cab radio can be validated by ERA's new machine-readable authorisation prototype — I tried it this week; it works — but the FRMCS parameters (power class, antenna gain) have no vehicle-register term to land in. And a post-incident record of the first FRMCS core outage will be coded as "other failure of the infrastructure", with the failed element named in free text.

**What top-down would look like.** Not a new standard. Three small acts, in the order the law already suggests: an FRMCS term set proposed into ERA's vocabulary (it has a public tracker and a documented extension process); a rail extension of the intent ontology anchored on those terms, so the operator's intent to the bearer and the regulator's record of the bearer share IRIs; and the identity layer — the functional alias — declared in both, so that "who is speaking" survives whichever network is carrying the voice.

Public network or not is a decision about a bearer. Identity and vocabulary are decisions about whether anyone — driver, signaller, regulator, or the machine watching the network — can still tell what is true when the bearer changes.

#FRMCS #GSMR #Ontology #AutonomousNetworks #TMForum #RailwaySafety #DigitalIdentity #ERA

---

## Source note (not for posting)

- "Stop at the next station"; public phone to reach a fixed subscriber: DB InfraGO Ril 481.0205 §9(4)/(5) (E-2026-06-24-18; change log E-2026-09-19-50). "Any telephone, including public networks, for orders and messages": Ril 481.0101 §1(2) (E-2026-09-19-50). Radio functions not carried by public networks: register position R4 / ADR-001 item 5(b), on the same rules.
- Functional alias and its home-system anchoring: TS 23.280 / 23.283 (E-2026-09-19-13/-15); ADR-001 5(a).
- ERA Ontology v3.3.4: RINF radio terms, zero FRMCS terms (E-2026-09-19-25); ISS `railwaySystemFunctions` FRMCS on board only, trackside GSM-R-shaped (E-2026-09-19-44); "other failures of the infrastructure" at draft-law level (E-2026-09-19-48, CSM ASLP final draft 2020 — a **draft**, not law).
- Law binds by index and version: CCS TSI Annex A Table A2 (`13-legal-binding-chain.md` §2). The three-layer vocabulary void: `pivot-notes-2026-09-19-ontology.md` §1.
- TM Forum Intent Ontology as an open federation; AN Consumer role: TR292 v3.6.0 §2.1 (E-2026-09-19-38); IG1251 v1.0.1 §4.4.1 (E-2026-09-19-47). The TIO graphs themselves are not held (B7) — the post describes the ontology from its published overview documents.
- Security expectation with impact attribute: TR292I as reported in the Ericsson preprints, arXiv 2605.27743 (E-2026-09-19-40) — a specification *as reported*, not the TM Forum text.
- Effectiveness ratio and indicator per risk-control measure: CSM ASLP draft Annex III Part B (E-2026-09-19-48).
- "I tried it this week; it works": the four authorisation graphs validated against ERA's va-m2m shapes (E-2026-09-19-45, `adr-013-stage-graphs/`) — validated with one engine (pyshacl); ERA's own validator not yet run.
- ERA extension process: `governance/Framework-extensions-management.md` (E-2026-09-19-44). The gate's contribution to the ≈2 h of 23 June is not quantified in DB's account (E-2026-09-15-01); the post says "lengthened … for a time nobody had bounded", which is the register's position (ADR-012 item 4, ARB-2026-09-17 R1).
- The register asserts nothing about EU AI Act classification here (ADR-003 seeded `watch`); the post does not mention it.
