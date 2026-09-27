#!/usr/bin/env python3
"""Regenerate current/project/18-standards-on-record.md from the evidence logs.

Usage:  python3 scripts/standards-inventory.py [--check]

The inventory is a GENERATED file (CLAUDE.md: "regenerate, do not hand-edit").
Source of truth is current/evidence-log.md and current/evidence-log-security.md.
One row per specification: a 3GPP text and its ETSI transposition are one
document.  The nomenclature rule (CLAUDE.md §Always, lead's decision
2026-09-26) decides the class of every 3GPP spec:

  rail-pinned  — named in the normative references of a held ETSI TC RT / UIC
                 FRMCS document or the CCS TSI index (PINNED table below), or a
                 member of the 3GPP Mission Critical family (MCX rule)
  common       — everything else

--check  prints the would-be totals and the diff of spec ids against the file
         on disk without writing.
"""
import re
import sys
import datetime
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LOGS = [ROOT / "current/evidence-log.md", ROOT / "current/evidence-log-security.md"]
OUT = ROOT / "current/project/18-standards-on-record.md"

# ---------------------------------------------------------------------------
# Pinning table: 3GPP spec -> pinning document(s) and version(s) the register
# knows.  Maintained here, not in the output.  Add a line when an evidence row
# establishes a new pin; never edit the generated file.
# ---------------------------------------------------------------------------
PINNED = {
    "TS 22.179": "TS 104 069 (V19.3.0)",
    "TS 22.261": "UIC SRS (5G service requirements referenced)",
    "TS 22.280": "TS 104 069 / 104 070 (V19.7.0)",
    "TS 22.289": "UIC SRS (FRMCS stage-1 requirements)",
    "TR 22.889": "UIC SRS (rail use-case study)",
    "TS 22.989": "UIC FRS/SRS traceability (rail use cases Comments column)",
    "TS 23.067": "EIRENE (eMLPP)",
    "TS 23.094": "EIRENE / TS 103 792 (Follow-Me)",
    "TS 23.236": "EIRENE-era core (Iu-flex)",
    "TS 23.280": "TS 104 069 / 104 070 (V19.8.1); TS 103 765 (V18.11.0)",
    "TS 23.281": "TS 103 765 (V18.9.0)",
    "TS 23.282": "TS 103 765 (V18.9.0)",
    "TS 23.283": "TS 103 792 / 103 765",
    "TS 23.379": "TS 104 069 (V18.12.0); TS 103 765 (V18.9.0)",
    "TS 24.008": "EIRENE / EN 301 515",
    "TS 24.281": "TS 104 069",
    "TS 24.282": "TS 104 069 (V19.5.0); TS 103 765",
    "TS 24.379": "TS 104 069 (V19.4.0)",
    "TS 24.380": "TS 104 069 (V18.6.0); UIC SRS v2.1",
    "TS 24.481": "TS 104 069 / MCX family (group management)",
    "TS 24.482": "TS 104 069 / MCX family (identity management)",
    "TS 24.483": "TS 104 069 / MCX family (Management Object)",
    "TS 24.484": "TS 104 069 / MCX family (configuration management)",
    "TS 24.501": "TS 104 070 (V19.5.0)",
    "TS 29.002": "EIRENE / EN 301 515 (MAP)",
    "TS 33.180": "TS 104 069 (V18.1.0); TS 103 765 (V18.2.0); UIC SRS/FIS",
    "TS 33.501": "TS 103 765 (V18.6.0); UIC SRS v1.0",
    "TS 38.101-1": "TS 104 070 (V19.3.1)",
    "TS 38.101-3": "TS 104 070 (V19.3.0)",
    "TS 43.068": "EIRENE / EN 301 515 (VGCS)",
    "TS 43.069": "EIRENE / EN 301 515 (VBS)",
    "TS 44.068": "EIRENE (VGCS stage 3)",
    "TS 44.069": "EIRENE (VBS stage 3)",
}

# 3GPP Mission Critical family — rail-pinned by the lead's ruling regardless of pin.
MCX_EXPLICIT = {"TS 22.179", "TS 22.280", "TS 22.282", "TS 22.289", "TS 23.289", "TS 23.379", "TS 33.180"}


def is_mcx(spec: str) -> bool:
    if spec in MCX_EXPLICIT:
        return True
    m = re.match(r"TS (\d{2})\.(\d{3})", spec)
    if not m:
        return False
    series, num = int(m.group(1)), int(m.group(2))
    if series == 23 and 280 <= num <= 283:
        return True
    if series == 24 and 379 <= num <= 484:
        return True
    return False


# ETSI-native grouping.  Order = output order.
ETSI_GROUPS = [
    ("ETSI TC RT — FRMCS and GSM-R rail profile",
     {"TR 103 768", "TR 103 791", "TR 104 006", "TS 103 745", "TS 103 764", "TS 103 765",
      "TS 103 765-1", "TS 103 765-2", "TS 103 765-3", "TS 103 765-4", "TS 103 765-5",
      "TS 103 792", "TS 103 793"}),
    ("ETSI TC TCCE / TC RT — test and conformance",
     {"TS 103 564", "TS 104 069-1", "TS 104 069-2", "TS 104 070"}),
    ("ETSI TC RT — GSM-R era",
     {"TR 101 748", "TR 102 281", "TR 103 134", "TR 103 459", "TS 100 590", "TS 102 281",
      "TS 102 610", "TS 103 066", "TS 103 147", "TS 103 389", "TS 103 672"}),
    ("ETSI TC INT WG AFI (ex NTECH AFI) — GANA autonomics",
     {"TS 103 194", "TS 103 195-2", "TR 103 195-1", "TR 103 195-3", "TR 103 404", "TR 103 473",
      "TR 103 495", "TR 103 626", "TR 103 627", "TR 103 747", "TR 103 821", "EG 203 341",
      "GS AFI 002"}),
    ("ETSI ISG ENI / ZSM", None),      # matched by prefix below
    ("ETSI TC CYBER", {"TR 103 844", "TS 103 845"}),
    ("ETSI TC DATA", {"TR 104 180"}),
    ("ETSI TC ITS", {"TR 102 638"}),
]

THREEGPP_GROUPS = [
    ("3GPP SA1 requirements", lambda s: s == 22),
    ("3GPP SA2/SA6 architecture", lambda s: s == 23),
    ("3GPP CT1 protocols", lambda s: s == 24),
    ("3GPP CT3/CT4", lambda s: s == 29),
    ("3GPP SA5 management", lambda s: s in (28, 32)),
    ("3GPP SA3 security", lambda s: s == 33),
    ("3GPP RAN (NR)", lambda s: s in (37, 38)),
    ("3GPP RAN (LTE)", lambda s: s == 36),
    ("3GPP GERAN (GSM-R era)", lambda s: s in (43, 44, 45, 48)),
    ("3GPP vocabulary", lambda s: s == 21),
]

REL_LETTER = {"f": 15, "g": 16, "h": 17, "i": 18, "j": 19, "k": 20, "l": 21}

# 3GPP numbers that are Technical Reports whatever the evidence row wrote ("TS 22.889" is a
# mis-cite of TR 22.889).  Normalised so one document is one row.
KNOWN_TR = {"21.905", "22.889", "22.989", "23.700-1", "23.790", "23.794", "28.909", "38.802",
            "38.852", "38.853", "38.901"}

# Numbers the evidence log names only to record that NO such deliverable exists
# (E-2026-09-27-10, -11).  Kept out of the inventory so nobody hunts for them.
NON_EXISTENT = {"EG 202 341", "TR 103 628", "TR 103 629", "TR 103 763", "TR 103 621"}
HELD_WORDS = re.compile(r"[Pp]laced|\bread\b|fetched|held|Downloads|downloaded|copied|scratchpad", re.I)

# --- patterns -------------------------------------------------------------
P_3GPP = re.compile(r"\b(TS|TR)\s(\d{2})\.(\d{3})(-\d)?(?:\sV(\d+\.\d+\.\d+))?")
P_ETSI_TRANSP = re.compile(r"\b(TS|TR)\s1(\d{2})\s(\d{3})(-\d)?(?:\sV(\d+\.\d+\.\d+))?")
P_ETSI_NATIVE = re.compile(r"\b(TS|TR|EG|ES|EN)\s(10\d|20\d)\s(\d{3})(-\d)?(?:\sV(\d+\.\d+\.\d+))?")
P_ETSI_ISG = re.compile(r"\b(GS|GR)\s(ENI|ZSM|AFI|NFV|MEC|F5G)\s(\d{3})(-\d)?(?:\sV(\d+\.\d+\.\d+))?")
P_ETSI_FILE = re.compile(r"\b(ts|tr|eg)_1(\d{2})(\d{3})(?:0(\d))?v(\d{2})(\d{2})(\d{2})p\.pdf")
P_3GPP_ZIP = re.compile(r"\b(\d{2})(\d{3})-([f-l])(\d)(\d)\.zip")


class Spec:
    def __init__(self, kind, sid):
        self.kind = kind          # "3gpp" or "etsi"
        self.sid = sid            # "TS 28.541" or "TS 103 765-2"
        self.native = set()       # 3GPP native versions
        self.transp = set()       # ETSI transposition versions (3gpp kind) / versions (etsi kind)
        self.rows = set()
        self.held_rows = set()


def add(specs, kind, sid, row, held_ctx, native=None, transp=None):
    if sid in NON_EXISTENT:
        return
    if kind == "3gpp":
        num = sid.split(" ", 1)[1]
        if num in KNOWN_TR:
            sid = "TR " + num
    sp = specs.setdefault((kind, sid), Spec(kind, sid))
    sp.rows.add(row)
    if held_ctx:
        sp.held_rows.add(row)
    if native:
        sp.native.add("V" + native)
    if transp:
        sp.transp.add("V" + transp)


def scan():
    specs = {}
    for log in LOGS:
        if not log.exists():
            continue
        for line in log.read_text(encoding="utf-8").splitlines():
            if not line.startswith("| E-"):
                continue
            cells = line.split("|")
            if len(cells) < 6:
                continue
            row = cells[1].strip()
            item, src = cells[3], cells[4] if len(cells) > 4 else ""
            text = item + " " + src
            held_words = bool(HELD_WORDS.search(item))

            def held_ctx_for(m):
                # A row whose item cell OPENS with the spec and its version is a reading of that
                # text (the July/August rows are written "ETSI TS 103 066 V1.1.2 (2012-04), "…"").
                return held_words or (m.start() < 40 and m.start() < len(item))
            for m in P_3GPP.finditer(text):
                series = int(m.group(2))
                if not 21 <= series <= 55:
                    continue
                sid = f"{m.group(1)} {m.group(2)}.{m.group(3)}{m.group(4) or ''}"
                add(specs, "3gpp", sid, row, held_ctx_for(m) and bool(m.group(5)), native=m.group(5))
            for m in P_ETSI_TRANSP.finditer(text):
                series = int(m.group(2))
                if not 21 <= series <= 55:
                    continue
                sid = f"{m.group(1)} {m.group(2)}.{m.group(3)}{m.group(4) or ''}"
                add(specs, "3gpp", sid, row, held_ctx_for(m) and bool(m.group(5)), transp=m.group(5))
            for m in P_ETSI_FILE.finditer(text):
                series = int(m.group(2))
                if not 21 <= series <= 55:
                    continue
                part = f"-{m.group(4)}" if m.group(4) else ""
                sid = f"{m.group(1).upper()} {m.group(2)}.{m.group(3)}{part}"
                ver = f"{int(m.group(5))}.{int(m.group(6))}.{int(m.group(7))}"
                add(specs, "3gpp", sid, row, True, transp=ver)
            for m in P_3GPP_ZIP.finditer(text):
                series = int(m.group(1))
                if not 21 <= series <= 55:
                    continue
                sid = f"TS {m.group(1)}.{m.group(2)}"
                ver = f"{REL_LETTER[m.group(3)]}.{m.group(4)}.{m.group(5)}"
                add(specs, "3gpp", sid, row, True, native=ver)
            for m in P_ETSI_NATIVE.finditer(text):
                sid = f"{m.group(1)} {m.group(2)} {m.group(3)}{m.group(4) or ''}"
                add(specs, "etsi", sid, row, held_ctx_for(m) and bool(m.group(5)), transp=m.group(5))
            for m in P_ETSI_ISG.finditer(text):
                sid = f"{m.group(1)} {m.group(2)} {m.group(3)}{m.group(4) or ''}"
                add(specs, "etsi", sid, row, held_ctx_for(m) and bool(m.group(5)), transp=m.group(5))
    return specs


def etsi_group(sid):
    for name, members in ETSI_GROUPS:
        if members is None:
            if sid.startswith(("GS ENI", "GR ENI", "GS ZSM", "GR ZSM")):
                return name
        elif sid in members:
            return name
    return "ETSI — other committees"


def threegpp_group(sid):
    series = int(re.match(r"\w+ (\d{2})\.", sid).group(1))
    for name, pred in THREEGPP_GROUPS:
        if pred(series):
            return name
    return "3GPP — other series"


def sort_key(sid):
    nums = [int(x) for x in re.findall(r"\d+", sid)]
    return (sid.split()[0], *nums)


def vlist(vs):
    return ", ".join(sorted(vs, key=lambda v: [int(x) for x in v[1:].split(".")])) if vs else "—"


def build(specs):
    today = datetime.date.today().isoformat()
    etsi = [s for s in specs.values() if s.kind == "etsi"]
    g3 = [s for s in specs.values() if s.kind == "3gpp"]

    out = []
    out.append("# Standards on record — ETSI and 3GPP documents cited in the evidence log\n")
    out.append(f"**Generated {today}** by `scripts/standards-inventory.py` from `current/evidence-log.md` and "
               "`current/evidence-log-security.md` by pattern match on each row's item and source cells. "
               "**One row per specification** — a 3GPP text and its ETSI transposition are one document "
               "(identical clauses; ETSI cover; ETSI issues only frozen versions). Regenerate rather than edit by hand; "
               "the evidence log is the source of truth, the pinning table lives in the script.\n")
    out.append("**Nomenclature (lead's decision 2026-09-26, `CLAUDE.md` §Always).** *Rail-pinned* = the 3GPP spec is named "
               "in the normative references of a held ETSI TC RT or UIC FRMCS document or of the CCS TSI index, **or belongs "
               "to the 3GPP Mission Critical (MCX) family (22.179/280/282/289, 23.28x/379, 24.379–24.484, 33.180), which is "
               "rail's own requirement set inside 3GPP (lead's ruling 2026-09-26)** → the register cites the **ETSI form at "
               "the pinned frozen version** and holds that edition. *Common* = every other 3GPP spec → the register cites the "
               "**3GPP form, latest text, release stated**, adding the frozen ETSI edition only when a clause becomes "
               "load-bearing for conformity or procurement. The *Pinned by* column names the pinning document(s) and "
               "version(s) where the register knows them; **an entry marked ⚠️ is rail-pinned but held without an ETSI "
               "edition — act A18.** *Held* = at least one evidence row records the text placed, read or fetched with a "
               "version; *cited* = named only.\n")

    # ETSI-native sections
    groups = defaultdict(list)
    for s in etsi:
        groups[etsi_group(s.sid)].append(s)
    order = [g for g, _ in ETSI_GROUPS] + ["ETSI — other committees"]
    n_etsi = 0
    for g in order:
        rows = sorted(groups.get(g, []), key=lambda s: sort_key(s.sid))
        if not rows:
            continue
        n_etsi += len(rows)
        out.append(f"\n## {g} — {len(rows)}\n")
        out.append("| Spec | Version(s) read | Held / cited | Evidence rows |")
        out.append("|---|---|---|---|")
        for s in rows:
            held = "held" if s.held_rows else "cited"
            out.append(f"| {s.sid} | {vlist(s.transp)} | {held} | {', '.join(sorted(s.rows))} |")

    # 3GPP sections
    groups = defaultdict(list)
    for s in g3:
        groups[threegpp_group(s.sid)].append(s)
    order = [g for g, _ in THREEGPP_GROUPS] + ["3GPP — other series"]
    n_3gpp = n_pinned = n_warn = 0
    for g in order:
        rows = sorted(groups.get(g, []), key=lambda s: sort_key(s.sid))
        if not rows:
            continue
        n_3gpp += len(rows)
        out.append(f"\n## {g} — {len(rows)}\n")
        out.append("| 3GPP spec | ETSI number | Class | Pinned by | 3GPP native version(s) read | "
                   "ETSI transposition version(s) read | Held / cited | Evidence rows |")
        out.append("|---|---|---|---|---|---|---|---|")
        for s in rows:
            kind, num = s.sid.split(" ", 1)
            etsi_num = f"{kind} 1{num.replace('.', ' ')}"
            pinned = s.sid in PINNED or is_mcx(s.sid)
            cls = "rail-pinned" if pinned else "common"
            pin_by = PINNED.get(s.sid, "MCX family (lead's ruling 2026-09-26)" if pinned else "—")
            warn = pinned and not s.transp
            if pinned:
                n_pinned += 1
            if warn:
                n_warn += 1
            held = "held" if s.held_rows else "cited"
            label = s.sid + (" ⚠️" if warn else "")
            out.append(f"| {label} | {etsi_num} | {cls} | {pin_by} | {vlist(s.native)} | {vlist(s.transp)} | "
                       f"{held} | {', '.join(sorted(s.rows))} |")

    total = n_etsi + n_3gpp
    out.append(f"\n**Total: {total} specifications** — {n_etsi} ETSI-native and {n_3gpp} 3GPP specifications, of which "
               f"**{n_pinned} rail-pinned** and {n_3gpp - n_pinned} common. Rail-pinned specs held without an ETSI edition "
               f"(⚠️): {n_warn} — listed in `14-next-acts.md` A18.\n")
    return "\n".join(out), (total, n_etsi, n_3gpp, n_pinned, n_warn)


def main():
    check = "--check" in sys.argv
    specs = scan()
    text, totals = build(specs)
    new_ids = {s.sid for s in specs.values()}
    old_ids = set()
    if OUT.exists():
        for line in OUT.read_text(encoding="utf-8").splitlines():
            m = re.match(r"\| ((?:TS|TR|EG|ES|EN|GS|GR) [^|]+?)(?: ⚠️)? \|", line)
            if m:
                old_ids.add(m.group(1).strip())
    print(f"total {totals[0]} (etsi {totals[1]}, 3gpp {totals[2]}, rail-pinned {totals[3]}, ⚠️ {totals[4]})")
    gone = sorted(old_ids - new_ids)
    added = sorted(new_ids - old_ids)
    if gone:
        print("DROPPED vs file on disk:", ", ".join(gone))
    if added:
        print("ADDED   vs file on disk:", ", ".join(added))
    if check:
        return
    OUT.write_text(text, encoding="utf-8")
    print("written", OUT.relative_to(ROOT))


if __name__ == "__main__":
    main()
