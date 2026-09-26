# Runner for the ADR-013 stage-2 authorisation graphs against ERA va-m2m shapes/2018-545 (pyshacl 0.40.1).
# SH_DIR = a folder holding the va-m2m files fetched flat as "<path with / replaced by __>" (see README.md). Usage: python3 validate.py [stage-2a ...]
import os; SH_DIR=os.environ.get("VAM2M_DIR","./va-m2m-flat/")
import glob, rdflib, pyshacl, re, collections, pickle, sys
pre=re.sub(r'^#.*$','',open(SH_DIR+"shapes__prefixes.ttl").read(),flags=re.M)
sh=rdflib.Graph()
files=[f for f in glob.glob(SH_DIR+"shapes__2018-545__validation__Annex *.shape.ttl") if "fixme" not in f and "_test" not in f]+[SH_DIR+"shapes__2018-545__input.shapes.ttl"]
for f in files:
    t=open(f).read()
    if "I-10_2_3" in f: t=t.replace("eralex-sh:AnnexI-10-3 ","eralex-sh:AnnexI-10-3-versions ").replace("eralex-sh:AnnexI-10-3\n","eralex-sh:AnnexI-10-3-versions\n").replace("sh:sparql eralex-sh:AnnexI-10-3 ;","sh:sparql eralex-sh:AnnexI-10-3-versions ;")
    sh.parse(data=pre+"\n"+t, format="turtle")
print("shape files", len(files), "triples", len(sh))
SH=rdflib.Namespace("http://www.w3.org/ns/shacl#")
res={}
names=sys.argv[1:] or ["stage-2a","stage-2b","stage-2ab-one-case","stage-2ab-two-cases"]
for name in names:
    d=rdflib.Graph(); d.parse(f"{name}.ttl", format="turtle")
    for f in [SH_DIR+"shapes__base-graph.ttl",SH_DIR+"shapes__2018-545__bodies.ttl"]: d.parse(data=pre+"\n"+open(f).read(), format="turtle")
    c, rg, txt = pyshacl.validate(d, shacl_graph=sh, inference="rdfs", advanced=True, allow_warnings=True)
    rows=[]
    for r in rg.subjects(rdflib.RDF.type, SH.ValidationResult):
        src=rg.value(r,SH.sourceShape); con=rg.value(r,SH.sourceConstraint)
        sev=str((sh.value(con,SH.severity) if con is not None else None) or rg.value(r,SH.resultSeverity)).split('#')[-1]
        nm=(sh.value(con,SH.name) if con is not None else None) or (sh.value(src, SH.name) if src else None)
        msg=str(rg.value(r,SH.resultMessage) or "")[:130]
        focus=str(rg.value(r,SH.focusNode) or "").split('/')[-1]
        rows.append((sev, str(nm or src).split('/')[-1][:80], focus, msg))
    cnt=collections.Counter(r[0] for r in rows)
    print(f"\n===== {name}: conforms={c} | {dict(cnt)}")
    for r in sorted(set(rows)):
        if r[0] in ("Violation","Warning"): print("  ", r[0], "|", r[1], "|", r[2], "|", r[3])
    res[name]=rows
    open(f"{name}.pyshacl-report.txt","w").write(txt)
pickle.dump(res, open("results.pkl","wb"))
