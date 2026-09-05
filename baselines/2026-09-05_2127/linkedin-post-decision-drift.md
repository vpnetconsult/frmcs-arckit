# LinkedIn post — decision drift

We audited our own engagement last week and found the exact failure we'd built the engagement to prevent. It's worth writing up, because I don't think we're unusual.

The setup: a rail architecture programme, run with a strict evidence discipline. Every time something lands — a regulation, a standard, an operator statement, a vendor claim — it gets a dated row in an evidence log, a source, and a trust rating that says plainly whether it's a primary document or somebody's marketing. Decisions get written down as decision records. The whole thing freezes to a baseline every night so you can see how the picture changed.

In six weeks it took on 255 pieces of evidence. The log is genuinely good. That is not the problem.

The problem is what we found when we finally read the two founding documents back against all that evidence.

**Almost none of those 255 rows had ever been marked as changing them.**

Not because the evidence was irrelevant. Because it flowed somewhere else. Over six weeks the programme had grown newer, more specific decision records — on safety boundaries, on change control, on cybersecurity — and the evidence was diligently wired into those. The two documents at the top of the tree referenced none of them, and nothing referenced back. They'd been quietly orphaned from the loop that was supposed to keep them true.

Here's what that cost, concretely.

The founding architecture document still said the legacy train-radio system would be switched off "around 2030." That number is load-bearing — the entire migration case rests on it. Since it was written: binding EU law published this April set the funding horizon for the legacy system at **2040**. The operator itself said publicly it expects to run the old system for roughly another decade. Suppliers have published support commitments into the mid-2030s. Every independent source now lands somewhere between 2035 and 2040.

A decade of drift, in the single most important figure in the document. Not one row of evidence flagged it as a change.

And the tell was there all along. The same document already contradicted itself — a later section had been updated to say 2035 while the opening paragraph still said 2030. Nobody caught it, because nobody had a reason to read a settled document from top to bottom.

That's the bit I'd offer to anyone running a serious documentation practice:

**Evidence discipline and decision discipline are two different disciplines.** One keeps the record honest. The other keeps the decisions honest. Doing the first one well is exactly what disguises the failure to do the second — because the log is full, current and immaculately sourced, so everything looks healthy.

It happens for an ordinary reason. New documents are where the interesting work is. Founding documents feel finished, so they get treated as furniture. And from the outside, "settled" and "stale" look identical. The only difference is whether anyone has checked recently.

The fix is cheap, which is the annoying part. Make every piece of incoming evidence answer one question before it's filed: *does this change a decision, and if so, which one?* If the honest answer is "no" for six weeks running, that isn't stability — that's a disconnected wire. And give the oldest, most load-bearing decisions a review date, not just the new ones. The documents most likely to be quietly wrong are the ones nobody has needed to open.

We caught ours by accident, because a routine check went looking for overdue reviews and found nothing overdue — and the "nothing overdue" was itself the finding.

A decision record that never changes isn't stable. It's unattended.

*Written from an evidence-logged engagement with daily frozen baselines — the drift, and this correction, are both in the audit trail. Evidence IDs on request: github.com/vpnetconsult/frmcs-arckit*

#ArchitectureDecisionRecords #TechnicalGovernance #SystemsArchitecture #EngineeringLeadership #DocumentationDebt #RailwayEngineering
