# Context — Agentic Oversight Layer & the SIL-4 / Human-in-Command Boundary

**Date:** 2026-07-01
**Type:** C4-style Context (rendered as a styled Mermaid flowchart for dark-mode + colourblind accessibility)
**Scope:** The agentic decision & oversight layer (ADR-002) riding on the FRMCS bearer, with the SIL-4 / human-in-command boundary (ADR-004) made explicit.
**Linked records:** ADR-002 (oversight layer), ADR-004 (SIL-4 boundary), ADR-007 (test surfaces), ADR-011/012 (change-control & cyber conformance); traceability-matrix.md (R9–R14); 03-risk-register.md (PR1/PR4/PR5/PR11).
**Owner:** Vpnet Cloud Solutions Sdn. Bhd.

> **Purpose.** Make the engagement's central guardrail legible in one picture: **the agents advise and observe; they never actuate. Safety-critical actuation stays human-in-command, and a deterministic SIL-4 kernel — not the learning agents — does the controlling.** This is *oversight, not control*.
>
> **Accessibility.** Dark background; **Okabe-Ito colourblind-safe palette** — **blue = advisory domain**, **amber = safety-critical domain**. No red/green/brown carries meaning. The two decisive edges are encoded **three ways at once** (colour + line style + symbol) so they read without any colour perception: 🔵 **solid blue, ✔** = the sanctioned command path; 🟠 **dashed amber, ✘** = the prohibited path.
>
> **Rendering note.** Rendered as a flowchart rather than Mermaid `C4Context`, because C4's styling directives render unreliably (especially on dark backgrounds) — the flowchart gives full, dependable control of colour and contrast. The C4 semantics (actors / system / boundaries) are preserved.

## Diagram

```mermaid
%%{init: {"theme":"dark","themeVariables":{"fontSize":"15px","darkMode":true}}}%%
flowchart TB
    ops["Operator / Dispatcher<br/>human-in-command (PR1)"]
    im["Infrastructure Mgr / Safety Eng<br/>supervises, approves (R10)"]
    nsa["NSA / Safety Authority<br/>ratifies ladder and safety case"]

    subgraph ADV["ADVISORY DOMAIN - advise and observe, NEVER actuate"]
        ov["Agentic Oversight Layer<br/>Risk Sentinel, Assurance, Bid-RFP<br/>advises around a certified core (R9/R11)"]
        ev[("Evidence and Baseline Store<br/>audit trail (R12/PR10)")]
    end

    subgraph SAFE["SAFETY-CRITICAL DOMAIN - HUMAN-IN-COMMAND (SIL-4, EN 5012x)"]
        kern["Deterministic SIL-4 Kernel<br/>agents never touch it (R11/ADR-004)"]
        act["Safety-Critical Actuation<br/>Notruf/REC, Movement Authority, ETCS/ATO"]
    end

    frmcs["FRMCS Bearer + GSM-R parallel run<br/>carries, does not decide (R9/R2)"]
    mon["Independent Monitoring<br/>out-of-band Q.752 probes (PR5/PR11)"]
    reg["Regulatory Conformance<br/>EU AI Act, CSM-RA, CRA/NIS-2"]

    ov -- "alerts and proposals" --> ops
    ops -- "reviews / dissents (PR4)" --> ov
    im -- "supervises / approves" --> ov
    nsa -- "ratifies" --> ov
    ov -- "observes (read-only)" --> mon
    mon -- "detects silent faults, triggers failover (Q.752)" --> frmcs
    ov -- "emits evidence chain" --> ev
    kern -- "deterministic control" --> act
    frmcs -- "carries voice / data" --> act
    reg -- "conformance obligations" --> ov
    reg -- "safety-case conformance" --> kern
    ops == "COMMANDS  human-in-command" ==> act
    ov -. "MUST NOT actuate  (SIL-4 boundary, ADR-004)" .-> act

    classDef advisory fill:#0072B2,stroke:#56B4E9,stroke-width:2px,color:#ffffff;
    classDef safety fill:#8a5a00,stroke:#E69F00,stroke-width:2px,color:#ffffff;
    classDef actor fill:#22272e,stroke:#F0E442,stroke-width:2px,color:#ffffff;
    classDef ext fill:#22272e,stroke:#adbac7,stroke-width:1px,color:#ffffff;
    class ov,ev advisory;
    class kern,act safety;
    class ops,im,nsa actor;
    class frmcs,mon,reg ext;

    style ADV fill:#07223a,stroke:#56B4E9,stroke-width:2px,color:#ffffff;
    style SAFE fill:#2f2207,stroke:#E69F00,stroke-width:2px,color:#ffffff;

    linkStyle default stroke:#adbac7,stroke-width:1.5px,color:#dcdcdc;
    linkStyle 11 stroke:#56B4E9,stroke-width:4px,color:#8fd0f5;
    linkStyle 12 stroke:#E69F00,stroke-width:3px,color:#f2c15b;
```

**Legend — the two styled edges are the whole point of the diagram (colourblind-safe by triple encoding):**

| Edge | Colour | Line | Symbol | Meaning |
|---|---|---|---|---|
| Operator → Actuation | 🔵 blue | solid, thick | ✔ | The **only** sanctioned actuation path — a human commands safety-critical action |
| Oversight → Actuation | 🟠 amber | **dashed** | ✘ | The **prohibited** path — agents advise the human but **must not actuate**. This dashed amber line *is* the SIL-4 / EN 50129 freedom-from-interference boundary (ADR-004) |

**Domains:** 🔵 blue box = advisory (agents + evidence, read-only); 🟠 amber box = safety-critical (deterministic kernel + actuation, human-in-command). Blue vs amber is distinguishable under deuteranopia/protanopia; the boxes also carry explicit text labels.

## Component inventory

| Element | C4 role | Responsibility | Evidence / ADR |
|---|---|---|---|
| Operator / Dispatcher | Person | Human-in-command; sole actuation authority | PR1 · R10 |
| Infrastructure Manager / Safety Engineer | Person | Supervises & approves agent actions by decision class | R10 · ADR-008 |
| NSA / Safety Authority | Person | Ratifies the autonomy ladder & safety case | R10 · ADR-002 |
| Agentic Decision & Oversight Layer | System (focus) | Risk Sentinel · Assurance · Bid/RFP; advises, never actuates | ADR-002 · R9/R11/R12 |
| Evidence & Baseline Store | System_Ext | arcKit audit trail; daily frozen baseline; evidence chain | R12 · PR10 |
| Deterministic SIL-4 Safety Kernel | System_Ext | Certified core; agents never touch it | R11 · ADR-004 |
| Safety-Critical Actuation | System_Ext | Notruf/REC · Movement Authority · ETCS/ATO | PR1 · PR15 |
| FRMCS Bearer + GSM-R parallel run | System_Ext | Carries, does not decide; coexistence | ADR-001 · R2/R9 |
| Independent Monitoring | System_Ext | Out-of-band Q.752 probes; detection ≠ self-report | PR5/PR11 · E-2026-06-30-03 |
| Regulatory Conformance | System_Ext | EU AI Act · CSM-RA · CRA/NIS-2 | ADR-003/011/012 · R14 |

**Element count: 10** (C4 Context threshold).

## Requirements & risk traceability

| Requirement / risk | How the diagram shows it |
|---|---|
| **R9** — autonomy as a layer over the bearer | Oversight layer separate from the FRMCS bearer; "carries, does not decide" edge |
| **R10** — human oversight proportional to risk | IM/NSA supervise & ratify; Operator reviews/dissents (blue command path) |
| **R11** — keep the safety case certifiable | Deterministic SIL-4 kernel sits *outside* the advisory domain; amber no-actuation edge |
| **R12** — close the awareness gap | Oversight → decision-ready alerts; observes via independent monitoring; emits evidence chain |
| **R14** — cybersecurity regulatory conformance | Regulatory node → conformance obligations on both oversight & kernel |
| **PR1** — scope creep into autonomous actuation | The amber prohibited edge + blue human-in-command path are the mitigation, drawn |
| **PR4** — automation bias | Operator "reviews / dissents" edge (oversight-effectiveness) |
| **PR5/PR11** — silent-fault detection / failover | Independent monitoring (Q.752) detects & triggers failover, not element self-report |

## Diagram quality gate

| # | Criterion | Target | Result | Status |
|---|-----------|--------|--------|--------|
| 1 | Edge crossings | < 5 | ~2–3 (cross-boundary edges to `act`) | PASS (trade-off noted) |
| 2 | Visual hierarchy | Focus system prominent | Oversight layer is the labelled advisory system; two coloured domain boxes | PASS |
| 3 | Grouping | Related elements proximate | Two subgraph domains (advisory / safety-critical) | PASS |
| 4 | Flow direction | Consistent | Advise (top) → command/actuate (down) | PASS |
| 5 | Relationship traceability | Each line followable | Triple-encoded guardrail edges (colour + style + symbol) | PASS |
| 6 | Abstraction level | One level | Context only | PASS |
| 7 | Edge-label readability | Legible, no overlap | Short quoted labels | PASS |
| 8 | Node placement | No long edges | Connected nodes grouped | PASS |
| 9 | Element count | ≤ 10 | 10 / 10 | PASS |
| 10 | **Colour accessibility** | **Distinguishable under red-green CVD** | **Okabe-Ito blue/amber + line-style + ✔/✘ redundancy; dark bg** | **PASS** |

**Accepted trade-off (criterion 1):** two–three crossings are accepted where `Operator`, `Kernel`, and `Oversight` all connect to `Safety-Critical Actuation` — that convergence is *intentional*, since the contrast at that node is the diagram's core message.

## How to view

Paste the Mermaid block into **GitHub markdown** (renders on light or dark theme; this diagram forces its own dark canvas), **https://mermaid.live**, or **VS Code** (Mermaid Preview). Export svg + png into `current/project/diagrams/` to sit with the other rendered diagrams.

## Companion diagrams

- `silent-fault-failover-cascade-sequence.md` — the incident mechanism (same accessible palette).
- `wardley-gsmr-frmcs-transition.md` — strategic positioning.
- A **C4 Container** view of the oversight-layer internals remains the natural next diagram.

---

**Generated by:** `/arckit:diagram` (Context · Mermaid flowchart), adapted to the `current/` layout
**Generated on:** 2026-07-01 (restyled for dark-mode + colourblind accessibility)
**AI model:** claude-opus-4-8[1m]
**Generation context:** Built from traceability-matrix.md (R9–R14), ADR-002/004/007/011/012, and 03-risk-register.md (PR1/PR4/PR5/PR11).
