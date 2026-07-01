# LinkedIn post — the DB outage lesson

On the night of 23 June, Germany's entire rail network stopped.

Not a region. The whole country. Stuttgart, Berlin, Munich, NRW, the north — all dark for roughly two hours, because the GSM-R train-radio system failed.

The boards said it plainly: *"Bundesweite technische Störung +++ Aktuell kein Zugverkehr möglich."* Nationwide technical fault. No train traffic possible.

DB has attributed the proximate cause to a scheduled swap of a technical component. The exact cascade — how one maintenance action took down a nation — hasn't been published yet.

But the architecture already tells you the shape of it.

A nationwide, *simultaneous* outage isn't a radio problem. Radio faults are local. Simultaneity points to a shared central element — and a safety system that, when that element went, had no fail-soft path. So it did the only safe thing it could: full standstill.

Where would I look first? The central subscriber register — the **HLR/VLR** (the GSM-R core's Home/Visitor Location Register). One logical HLR holds every device's identity and authentication data. Corrupt it — or push a bad software update to it — and registration is denied *everywhere at once*. That matches the nationwide-simultaneous signature far better than any RF fault.

(To be clear: this is architectural inference. No source — primary or insider — has named the HLR/VLR, and DB hasn't published the mechanism. Trade-press insiders point to a failed software update, recovered by rolling back to the legacy GSM-R software.)

And that's the worst case worth sitting with: **when a central register is the failure, recovery can mean a restore from full backup — a rollback of the whole core.** Hours, not minutes. There is no quick failover from a corrupted single source of truth. You rebuild it.

Two uncomfortable lessons as rail moves from GSM-R to 5G/FRMCS:

→ 5G is not resilient by default. FRMCS centralises *more* (IMS core, MCX servers) — and the same single-register failure mode reappears as the 5G core's UDM/UDR + IMS HSS. The single point of failure has to be designed out, not assumed away.

→ The binding requirement isn't "more uptime." It's a defined degraded mode — keep safety-critical voice and movement authorities alive *locally* when the core is unreachable.

And the move is already mandated, not hypothetical. DB's own 2019 feasibility study for ETCS on the Stuttgart S-Bahn spelled it out: dynamic automated operation (ATO/TMS) requires replacing GSM-R with 5G-based FRMCS. The migration was decided years before this outage. The outage just told us how to do it — resilient at the core, fail-soft at the edge.

Resilience isn't a feature you add. It's a failure mode you choose in advance.

#FRMCS #GSMR #RailwayEngineering #ResilientByDesign #SystemsArchitecture
