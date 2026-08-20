# LinkedIn post — the DB outage lesson

On the night of 23 June, Germany's entire rail network stopped. Not a region — the whole country. Stuttgart, Berlin, Munich, NRW, the north, all dark for roughly two hours, because the GSM-R train-radio system failed. The departure boards across the country said the same thing: a nationwide technical fault, no train service possible.

Deutsche Bahn has now published the cause, and it's worth reading carefully.

During planned maintenance, a network-distribution component was swapped. The swap triggered a single software fault — and the fault raised no alarm. Because nothing flagged it, the automatic failover to the redundant GSM-R system never engaged. The backup was there. It was fully functional. It was simply never told to take over. Engineers worked the problem manually for about 90 minutes before switching to it by hand. DB calls the event "historisch einmalig" — historically unique. (It was not a cyberattack.)

Sit with the shape of that, because the lesson isn't the obvious one.

**The redundancy worked. The failover path didn't — because the failure was silent.**

This wasn't a missing backup. It was a backup whose trigger had never been exercised against a fault that doesn't announce itself. That makes it a testing-and-detection failure, not a redundancy gap. The hard part of high availability was never the second system — it's proving the switch-over actually fires on the failures that stay quiet. A redundancy you haven't tested against silent faults is one you're only hoping about.

And when the failover doesn't fire, a safety system does the only safe thing it can: it stops. Full standstill. Which points at the second lesson —

→ **The requirement isn't "more uptime." It's a defined degraded mode** — keep safety-critical voice and movement authorities alive *locally* when the core is unreachable, so a silent core fault slows the railway instead of stopping it.

→ **5G won't fix this by default.** As rail moves to FRMCS, the core centralises *more*, not less — IMS, MCX servers, the 5G UDM/UDR and IMS HSS. The same silent-failover failure mode moves straight into those elements unless it's designed out: geo-redundant, yes, but with failover continuously tested against faults that raise no alarm. DB says it's already renewing GSM-R and deploying FRMCS in parallel — and the design choices made now decide whether June repeats on 5G.

None of this is hypothetical. DB's own 2019 feasibility study for ETCS on the Stuttgart S-Bahn already concluded that automated operation (ATO/TMS) requires replacing GSM-R with 5G-based FRMCS. The migration was decided years before this outage. The outage just told us how to do it: resilient at the core, fail-soft at the edge, and a failover you test before it's tested for you.

Resilience isn't a feature you add. It's a failure mode you choose in advance.

#FRMCS #GSMR #RailwayEngineering #ResilientByDesign #SystemsArchitecture
