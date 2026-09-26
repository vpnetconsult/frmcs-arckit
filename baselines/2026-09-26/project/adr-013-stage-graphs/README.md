# ADR-013 item 3.2 — the stage-2 interventions as ERA `va-m2m` authorisation graphs

**Date:** 2026-09-19 · **Act:** `14-next-acts.md` A2 · **Evidence:** E-2026-09-19-45 · **Status:** built and validated; illustrative identifiers, not a submission.

## What is here

| File | What it is |
|---|---|
| `stage-2a.ttl` | One application, one `era:VehicleTypeAuthorisationCase` of type `era-va-authcase:NEW` carrying the **cab-radio Variant 4a/4b** change (UIC TOBA-7540 v1.0.0 §8.3): I-13 change description, I-15 `era:CABAddition` "FRMCS voice function of the cab radio", NoBo CLD scoped to CCS TSI 2023/1695 §4.2.4 + §4.2.5.1 + §4.2.13.2 (`era-tsi:ccs-2023-section-*`), DeBo NNTR certificate, AsBo CSM report, EC DoV for the CCS on-board subsystem. |
| `stage-2b.ttl` | Same skeleton, **ETCS Variant 3** (Euroradio → OBAPP, EDOR bypass retained): CLD scoped to §4.2.6.2 + §4.2.5.1. |
| `stage-2ab-one-case.ttl` | **One** NEW case carrying **both** changes (two I-13 descriptions, two CLDs, two I-15 additions). |
| `stage-2ab-two-cases.ttl` | One application, **two** NEW cases (2a and 2b as separate authorisation objects) — the form ARB-2026-09-19 R1 asserted. |
| `*.pyshacl-report.txt` | Full validation reports (pyshacl 0.40.1, `inference="rdfs"`, `advanced=True`). |
| `validate.py` | The runner. Shapes = `shapes/2018-545/validation/*.shape.ttl` (33 files, `_test` and `.fixme` excluded) + `input.shapes.ttl`; data = graph + `shapes/base-graph.ttl` + `shapes/2018-545/bodies.ttl`; `shapes/prefixes.ttl` bundled into every file, as the repo's own `scripts/testbed_shacl.js` does. Severity is read from each `sh:SPARQLConstraint` node (see finding 5). |

Common context (bodies, roles, contact agents) is the repo's own `client/limited/` template; the vehicle type `eratv:11-000-0001-0-001` and the two EVNs are placeholders in the ERATV/EVN form; a predecessor authorisation `era-vta:V-2019-0001` is modelled so Annex I-12 (reference to the existing authorisation) can be evaluated.

Source repository: `https://gitlab.com/era-europa-eu/public/interoperable-data-programme/era-ontology/efficient-vehicle-authorisation/va-m2m` (id 80133347, `main` at 2026-09-19). The EC Interoperability Test Bed validator the repo's runner posts to (`https://www.itb.ec.europa.eu/shacl/any/api/validate`) is not reachable from the sandbox (403) — **run the four graphs through it on the host for the Jena-side second opinion**: `node shapes/scripts/testbed_shacl.js --localData <graph> --localShape <bundle of validation/*.shape.ttl> --prefix shapes/prefixes.ttl --baseGraph shapes/base-graph.ttl`.

## Result

| Graph | On the stage case(s), all severities | Of which upstream defects (not the graph's) | Left after that | On the predecessor record only (finding 3) |
|---|---|---|---|---|
| `stage-2a` | 2 Violations · 6 Warnings · 15 Info | I-7 unconditioned holder shapes: 1 V + 6 W (finding 1); sample body without `gr:taxID`: 1 V (finding 4) | **0 V · 0 W · 15 Info** | 4 V · 8 W · 5 Info |
| `stage-2b` | 2 V · 6 W · 15 Info | same | **0 V · 0 W · 15 Info** | same |
| `stage-2ab-one-case` | 2 V · 6 W · 16 Info | same | **0 V · 0 W · 16 Info** | same |
| `stage-2ab-two-cases` | 3 V · 12 W · 28 Info | same, I-7 ×2 | **0 V · 0 W · 28 Info** | same |

**Reading.** After the content corrections listed below, every Violation and Warning left on the stage cases is a defect of the shapes or of the repo's sample data, not of the graphs (findings 1 and 4). The decisive Annex I checks all pass and report their Info lines: I-2 (exactly one recognised case type), I-10 (type identifier composition, category/sub-category, date of record present for a non-FIRST case), I-11 (both vehicles pre-reserved), I-12 (predecessor authorisation resolved), I-13 (change description linked), I-15 (CCS additional function reachable on the CLD), I-16.1/16.3 (TSI requirement IRI consistent across checks), I-16.4 (NNTR + CSM evidence present).

**The item's question, answered as far as these shapes can answer it.** The one-case form (`stage-2ab-one-case`) validates exactly as well as the two-case form (`stage-2ab-two-cases`). **Reg (EU) 2018/545 Annex I, as ERA has encoded it, imposes no constraint that forces the cab-radio and the ETCS changes into separate authorisation cases** — a single NEW case may carry two I-13 change descriptions and two I-15 CCS additions and is complete. What the two forms differ in is cost, not validity: each case must carry its own I-16.4 national-rules and CSM evidence and its own EC declaration, so the two-object form doubles the evidence set unless documents are shared. So ARB-2026-09-19 R1's split into two authorisation objects is **the board's choice on Article 15/16 grounds (which the shapes do not cover — E-2026-09-19-43), not a requirement of the application-content rules**; the shapes corroborate only that both forms are legal application shapes. Item 3.2 closes on that finding; the choice itself stays as R1 decided it.

## Content corrections the shapes forced (what a real application must carry)

1. `era:typeRegistrationMethod` on every non-C2T case (Annex I-1-1).
2. `era:vehicleTypeNumber` is the **base** number (`11-000-0001-0`); the identifier is base + `-` + `era:includedVersionsVariant` (`001`) (Annex I-10.1/10.2). `era:vehicleTypeCategory` / `SubCategory` from the `vehicle-types/eratv` scheme (I-10.7/10.8). `dcterms:issued` on the type for any non-FIRST case (I-10.4).
3. Every concerned vehicle must be **pre-reserved**: an `era:VehicleRegistrationCase` with `vpa:permissionType era-vr-regcase:PRERESERVE` concerning the vehicle or its set (I-11.1b — Info either way, but the "not pre-reserved" line is what an authorising entity will read).
4. I-16.4: a DeBo **NNTR certificate** (`dcterms:type era-evidence-types:NNTRCertificate`) and an AsBo **CSM report** (identified by creator role `era-organisation-roles:ASBO`, no `dcterms:type`) directly supporting the case; each assessment body with a non-empty `era:organisationCode`, `foaf:name`, a site and an address (I-8).
5. I-8: the CAB evidence **bags** must be `dcterms:requires`'d from an `era:ECDeclaration` of the case (the EC DoV of the CCS on-board subsystem) — the query is `dcterms:requires/rdfs:member? ?cabEvidence`, so the bag IRI itself, or a collection that has it as member, must be the object.
6. NEW case: **no** `era:vehicleTypeAuthorisationHolder` (I-7-1) — but see finding 1.

## Findings on ERA's artefacts (for the issue tracker — `14-next-acts.md` A12)

1. **`Annex I-7.shape.ttl`: property shapes `AnnexI-7-3 … 7-8c` (holder present, code, identity, site topology, site address) are unconditioned `sh:minCount 1` on every `VehicleTypeAuthorisationCase`, while `AnnexI-7-1` forbids a holder for NEW and PRE4RP.** A NEW case therefore always fails 7-8c (Violation) and 7-3…7-8b (Warnings). The property shapes need the same `permissionType` condition as 7-2, or a SPARQL form.
2. **`eralex-sh:AnnexI-10-3` is defined in two files** (`Annex I-10_1_5_6.shape.ttl` and `Annex I-10_2_3.shape.ttl`) with different `sh:select`; bundled together the constraint has two selects and a conformant validator refuses it (pyshacl: `ConstraintLoadError … at most one sh:select`). The runner renames the second to `AnnexI-10-3-versions`.
3. **`input.shapes.ttl` forbids `dcterms:issued` on every `era:VehicleTypeAuthorisation`** (`era-sh:VehicleTypeAuthorisationShape`, `sh:maxCount 0`), while `Annex II-11.shape.ttl` asks the *predecessor* authorisation for "validity metadata". A graph that carries both the requested and the predecessor authorisation cannot satisfy both; likewise I-10.4 evaluates `dcterms:issued` on the *type*, so a predecessor FA case and a successor NEW case on the same type in one graph contradict each other. History cannot be represented in one graph as the shapes stand.
4. **`shapes/2018-545/bodies.ttl` (the server-side complement) defines `rorg:Example` ("DG MOVE") without `gr:taxID`**, so `input.shapes.ttl`'s `FormalOrganizationShape` reports a Violation on ERA's own sample whenever the complement is loaded. (Its `rorg:` namespace also differs from `prefixes.ttl` — `organisations/` vs `body/organisation/`.)
5. **Severities sit on `sh:SPARQLConstraint` nodes.** SHACL puts `sh:severity` on shapes; a validator that follows the specification reports every SPARQL result at the node shape's default (Violation), which is what pyshacl does — the Info "[intermediary] report" constraints then appear as Violations. Jena/ITB may honour the constraint-level value; either way, consumers must read `sh:sourceConstraint` → `sh:severity` themselves, and the repo should say so or move the Info constraints to separate shapes.
6. `prefixes.ttl` binds `eralex-pava:` to `…/949/requirement/pava/` while every shape and `bodies.ttl` use `…/949/requirements/pava/` — the `dcterms:source` links from shapes to the Annex I concepts resolve to a different namespace than the concepts are published in.
7. `base-graph.ttl` has no prefix declarations of its own and cannot be parsed alone; it depends on being bundled after `prefixes.ttl` (documented in `scripts/README.md`, undocumented in `shapes/2018-545/README.md`).
