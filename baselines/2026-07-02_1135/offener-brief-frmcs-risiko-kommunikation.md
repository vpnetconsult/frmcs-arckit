# Offener Brief

**Von „regelmäßiger Wartung" zur signifikanten Änderung: Warum die bundesweite GSM-R-Störung vom 23./24. Juni 2026 ein Problem des Risikomanagements und der Kommunikation ist — und was das für FRMCS bedeutet**

Frankfurt am Main, 28. Juni 2026

**An — auf Bundesebene**

- Herrn Bundesminister für Verkehr **Patrick Schnieder**, Bundesministerium für Verkehr (BMV)
- Herrn **Tarek Al-Wazir, MdB**, Vorsitzender des Ausschusses für Verkehr des Deutschen Bundestages
- Herrn **Henning Rehbaum, MdB**, stellvertretender Vorsitzender des Verkehrsausschusses
- die **verkehrspolitischen Sprecherinnen und Sprecher der Fraktionen** im Deutschen Bundestag
- den **Vorstand der Deutschen Bahn AG** und der **DB InfraGO AG**
- die **deutsche Bahnindustrie und ihre Verbände** (Verband der Bahnindustrie e. V. [VDB], Verband Deutscher Verkehrsunternehmen [VDV], Verband der Güterbahnen [VDGB])

**An — auf europäischer Ebene**

- Herrn **Apostolos Tzitzikostas**, Mitglied der Europäischen Kommission, Kommissar für nachhaltigen Verkehr und Tourismus (GD MOVE)
- Frau **Elissavet Vozemberg-Vrionidi, MdEP**, Vorsitzende des Ausschusses für Verkehr und Tourismus (TRAN) des Europäischen Parlaments
- die **Eisenbahnagentur der Europäischen Union (ERA)** als Systembehörde für ERTMS/CCS
- das **Gemeinsame Unternehmen „Europe's Rail" (EU-Rail)** als Träger der FRMCS-Entwicklung
- die europäischen Sektor- und Industrieverbände **CER** (Community of European Railway and Infrastructure Companies), **UIC** (Internationaler Eisenbahnverband, Träger des FRMCS-Projekts) und **UNIFE** (Verband der europäischen Bahnindustrie)

*Nachrichtlich: Eisenbahn-Bundesamt (EBA)*

---

Sehr geehrter Herr Bundesminister Schnieder,
sehr geehrter Herr Vorsitzender Al-Wazir,
sehr geehrter Herr Rehbaum,
sehr geehrte Damen und Herren,

in der Nacht vom 23. auf den 24. Juni 2026 kam der Eisenbahnverkehr in Deutschland bundesweit zum Stillstand. Über rund zwei Stunden war — nach Angaben der Deutschen Bahn aufgrund einer Störung des Zugfunksystems GSM-R — kein Zugverkehr möglich. Auf den Anzeigetafeln stand schlicht: *„Bundesweite technische Störung +++ Aktuell kein Zugverkehr möglich."*

Wir schreiben Ihnen nicht, um Schuld zuzuweisen, sondern weil dieser Vorfall an einem Wort hängt, das alles entscheidet — und weil genau dieses Wort sich beim bevorstehenden Übergang zu FRMCS nicht wiederholen darf.

## 1. Warum dieser Brief — und warum jetzt

Der Wechsel von GSM-R zum Future Railway Mobile Communication System (FRMCS) ist **beschlossen, nicht hypothetisch**: bereits die im Auftrag der DB erstellte Machbarkeitsstudie „ETCS im Kernnetz der S-Bahn Stuttgart" (2019) benennt den Ersatz von GSM-R durch das 5G-basierte FRMCS als technische Voraussetzung für den dynamisch automatisierten Betrieb (ATO/TMS). Die Frage ist also nicht *ob*, sondern *wie*.

Und hier liegt die Dringlichkeit: **FRMCS zentralisiert mehr, nicht weniger** — IMS-/SIP-Kern, MCX-Server, zentrale Teilnehmerregister. 5G ist nicht von sich aus resilient. Wird der Übergang mit denselben Annahmen gestaltet, die am 23. Juni sichtbar wurden, kehrt dasselbe Fehlermuster im neuen Gewand zurück — nur auf einer Plattform, die noch mehr trägt. **Resilienz ist kein Merkmal, das man nachträglich hinzufügt; sie ist ein Fehlerverhalten, das man im Voraus auswählt.** Diese Auswahl muss jetzt getroffen werden, solange Architektur, Förderrichtlinie und Zulassung für FRMCS noch offen sind. Danach ist sie teuer oder unmöglich.

Und dies ist kein nationales Thema. FRMCS ist ein **europäisches Programm** — standardisiert über UIC, ERA und das Gemeinsame Unternehmen Europe's Rail und verbindlich verankert in der TSI Zugsteuerung, Zugsicherung und Kommunikation (CCS). Die hier benannten Anforderungen — Resilienz als Bedingung und eine disziplinierte Änderungsklassifikation — sollten daher auch auf EU-Ebene verankert werden, damit sie interoperabel und für alle Mitgliedstaaten gleichermaßen gelten. Was in Deutschland am 23. Juni sichtbar wurde, ist die Vorschau auf ein Risiko, das jedes nationale Netz auf demselben Migrationspfad teilt. Wir richten diesen Brief deshalb zugleich an die zuständigen europäischen Stellen.

## 2. Der eigentliche Fehler: „regelmäßige Wartung" statt „signifikante Änderung"

Eine bundesweite, **gleichzeitige** Störung ist kein Funk- oder Streckenereignis — solche Fehler bleiben örtlich. Gleichzeitigkeit deutet auf ein zentrales, geteiltes Systemelement und auf das Fehlen eines belastbaren lokalen Notbetriebs hin. DB-InfraGO-Vorstand Philipp Nagl hat die unmittelbare Ursache dem **planmäßigen Tausch einer technischen Komponente** zugeordnet.

Genau an dieser Einordnung entscheidet sich alles. Das europäische Eisenbahnrecht kennt für jede technische, betriebliche oder organisatorische Änderung ein Verfahren: die **Gemeinsame Sicherheitsmethode für die Risikobewertung — CSM-RA**, Durchführungsverordnung **(EU) Nr. 402/2013**. Sie verlangt, dass der Vorschlagende vorab die **Signifikanz** der Änderung anhand von sechs Kriterien bewertet:

1. **Folgen eines Ausfalls** — der glaubhafte Worst Case der Änderung;
2. **Neuartigkeit** der Änderung;
3. **Komplexität** der Änderung;
4. **Überwachbarkeit** über den Lebenszyklus;
5. **Umkehrbarkeit** (Reversibilität);
6. **Kumulative Wirkung** kürzlich erfolgter Änderungen am selben Systemteil.

Ist eine Änderung „signifikant", greift das volle Verfahren der VO 402/2013 — strukturierte Risikobewertung und **unabhängige Begutachtung durch eine Bewertungsstelle (AsBo)**. Ist sie es nicht, darf der Betreiber sie nach eigenen Verfahren als Routine umsetzen.

Legt man die GSM-R-Störung an diesen Kriterien an, ergibt sich ein klares Bild:

- **Folgen eines Ausfalls:** der eingetretene Worst Case war ein *bundesweiter* Stillstand des sicherheitskritischen Verkehrs — die höchstmögliche Folgenstufe.
- **Umkehrbarkeit:** sollte sich der Bericht bestätigen, dass die Wiederherstellung einen **Rückfall auf die Alt-Software** (im Extremfall eine Wiederherstellung aus dem vollständigen Backup) erforderte, war die Änderung gerade *nicht* leicht umkehrbar — Stunden, nicht Minuten, ohne schnelles Failover.
- **Zentrales, geteiltes Element:** eine Komponente, deren Tausch bundesweit kaskadieren kann, ist per Definition kein örtlich begrenzter Eingriff.

Eine Änderung mit dieser Folgen- und Umkehrbarkeitssignatur ist nach den Kriterien der VO 402/2013 schwerlich „regelmäßige Wartung". **Die zentrale Frage, die Parlament und Öffentlichkeit beantwortet bekommen müssen, lautet daher: Wurde dieser Eingriff als signifikante Änderung im Sinne der CSM-RA bewertet — mit Risikobewertung, unabhängiger Begutachtung, gestaffeltem Rollout und getestetem Rückfall — oder wurde er als Routine behandelt?** Wenn ein netzweit wirksamer Eingriff als „planmäßiger Komponententausch" geführt und kommuniziert wird, ist die Fehlklassifikation selbst der Fehler — und genau dieser Fehler skaliert mit FRMCS.

### Die Altlast: proprietäre Software ist keine „normale Wartung" mehr

Eine Einstufung als „regelmäßige Wartung" mag vor zwanzig Jahren vertretbar gewesen sein — als der ursprüngliche Hersteller und seine Ingenieurkompetenz noch verfügbar waren. Der GSM-R-Kern trägt jedoch eine bekannte Liefer- und Pflegehistorie: Die ursprünglich von **Nortel** entwickelte GSM-R-Technologie (Nortel war mit rund 58 % der ausgerüsteten Strecken Weltmarktführer) ging nach Nortels Insolvenz 2010 an **Kapsch CarrierCom** und von dort an **Kontron**. Proprietäre zentrale Elemente — exemplarisch der **Signal Transfer Point (STP)** im Zeichengabe-(SS7-)Netz — stehen für diese Altlast: quelloffen nicht einsehbar, technologisch alternd und mit einer über drei Unternehmenswechsel ausgedünnten Kompetenzbasis. (Wir behaupten *nicht*, dass der am 23. Juni getauschte Bestandteil der STP war — der Mechanismus ist nicht veröffentlicht; der STP dient hier als Beispiel des Strukturproblems.)

Damit verschiebt sich die Einstufung derselben Tätigkeit über die Zeit. Drei Regelwerke machen deutlich, warum ein Eingriff in solche Software heute nicht mehr „normale Wartung" ist:

- **CSM-RA (VO (EU) 402/2013):** Die Signifikanzkriterien umfassen Neuartigkeit, Komplexität und **Überwachbarkeit über den Lebenszyklus**. Ein Eingriff, der wegen proprietärer, alternder Software und fehlender Herstellerkompetenz nicht vollständig durchdrungen und überwacht werden kann, erfüllt diese Kriterien *stärker*, nicht schwächer — er tendiert zur signifikanten Änderung.
- **CENELEC EN 50128** (Software für Eisenbahn-Steuerung und -Sicherung): Änderung und Pflege sicherheitsrelevanter Software sind kein verfahrensfreier Raum. Sie verlangen eine **Auswirkungsanalyse (Impact Analysis)**, Änderungslenkung und erneute Verifikation; bereits die Einstufung einer Änderung als „geringfügig" gegenüber „wesentlich" muss begründet und unabhängig bewertet werden. Eine proprietäre Kernänderung lässt sich nicht als trivial selbst-zertifizieren.
- **VO (EU) 2018/762** (Anforderungen an das Sicherheitsmanagementsystem): Das SMS muss **Kompetenz aktiv steuern**. Eine Kernplattform, deren ursprüngliches Entwicklungswissen über drei Unternehmen gewandert ist, ist ein Kompetenzrisiko, das das SMS benennen und beherrschen muss — nicht eines, das man unter „Routine" wegannimmt.

Die Kernaussage: **Die Wartungsklassifikation ist kein statischer technischer Befund — sie muss mit dem Altern der Plattform und dem Erodieren der Kompetenzbasis neu bewertet werden.** Was 2005 geringfügig war, kann 2026 gerade *wegen* der Altlast signifikant sein. Und FRMCS hebt das nicht auf: proprietäre Kernsoftware in Verbindung mit Lieferantenkonzentration (Nokia-/Kontron-Konstellation) reproduziert dieselbe Altlast, solange Beschaffung und Änderungssteuerung sie nicht ausdrücklich adressieren.

Hinzu kommt: Der **Rückfall ist funktional unzureichend.** Die betriebliche Regelung der DB InfraGO (Ril 481.0205, in Kraft seit 14.12.2025) hält fest, dass der Rückfall über das öffentliche Mobilfunknetz **keine Notrufe und keine Gruppenrufe** tragen kann und dass bei einer Funkstörung am nächsten Bahnhof zu halten ist. Und das Risiko war **bekannt und wiederkehrend** — GSM-R hat in Deutschland wiederholt zu größeren Störungen geführt. Es war kein unvorhersehbares Ereignis.

## 3. Was wir anregen — Risikomanagement

1. **CSM-RA-Disziplin verbindlich machen — auch für FRMCS.** Jeder Eingriff an zentralen, geteilten FRMCS-Elementen ist konsequent auf Signifikanz zu prüfen; signifikante Änderungen durchlaufen Risikobewertung, **unabhängige Begutachtung (AsBo/ISA)**, gestaffelten Rollout und **getesteten Rückfall** — nie als Routinewartung.
2. **Resilienz als Förder- und Zulassungsbedingung.** Georedundanter Kern (kein gemeinsamer Ausfallraum) und ein **definierter Rückfallmodus**, der sicherheitskritischen Sprechfunk und Fahrterlaubnisse bei Kernausfall **lokal aufrechterhält**, sollten verbindliche Bedingungen der FRMCS-Förderrichtlinie und der Zulassung sein — nicht Empfehlungen.
3. **Belastbarer Mehrwege-Rückfall.** Jeder Rückfallpfad (öffentliches 5G, Satellit) muss den eisenbahnspezifischen, sicherheitskritischen Verkehr nachweislich tragen können — sonst darf er nicht als Sicherheitsrückfall angerechnet werden.

## 4. Was wir anregen — Kommunikation

1. **Transparente, vollständige Aufklärung.** Der Kaskadenmechanismus der Störung — und die Signifikanzeinordnung des Eingriffs — sollten unabhängig untersucht und gegenüber Parlament und Öffentlichkeit nachvollziehbar veröffentlicht werden. Bislang ist der genaue Mechanismus offiziell nicht veröffentlicht.
2. **Schließung der Informationslücke.** Der Befund hinter „warum niemand davon wusste" ist eine Lücke zwischen der technischen Ebene (auf der die GSM-R-Fragilität bekannt war) und der Entscheidungs-, Förder- und politischen Ebene. Wir regen einen **regelmäßigen, strukturierten Risikobericht** an die zuständigen Stellen und den Verkehrsausschuss an, damit bekannte Risiken die Entscheidungsebene erreichen, **bevor** sie zu bundesweiten Stillständen werden.
3. **Klare Fahrgast- und Krisenkommunikation.** Für den Störungsfall braucht es vorab definierte, geübte und bundesweit einheitliche Kommunikationsabläufe gegenüber Reisenden und Verkehrsunternehmen.

## 5. Angebot zur Mitwirkung

Wir stellen unsere unabhängige, architektur- und nachweisgestützte Analyse des Übergangs gern zur Verfügung und wirken an einer fachlichen, überparteilichen Erörterung mit — etwa in einem gemeinsamen Format von Ministerium, Aufsicht, DB und Industrie zur Festlegung von Resilienz- und Änderungsanforderungen für FRMCS.

Eine sichere, durchgehende Eisenbahn ist der Maßstab, an dem sich jede dieser Entscheidungen messen lassen muss. Der Vorfall vom Juni hat uns nicht gesagt, *ob* wir zu FRMCS wechseln — das war entschieden. Er hat uns gesagt, *wie*: resilient im Kern, mit belastbarem Notbetrieb am Rand, mit der Disziplin, eine signifikante Änderung auch so zu behandeln — und mit einer Kommunikation, die Risiken sichtbar macht, bevor sie zu Stillständen werden.

Mit freundlichen Grüßen

**[Vorname Nachname]**
*[Funktion]*
Vpnet Cloud Solutions Sdn. Bhd.
roland@vpnet.app
EU-Transparenzregister-Nr.: **[Registernummer eintragen]**

---

*Hinweis zu den Quellen und zur Belastbarkeit:* Bestätigt sind der bundesweite Stillstand und die Dauer, die Benennung von GSM-R durch die DB, die Zuordnung der unmittelbaren Ursache (planmäßiger Komponententausch) durch Philipp Nagl sowie die funktionalen Grenzen des Rückfalls gemäß Ril 481.0205 (Primärquelle). Die CSM-RA (VO (EU) 402/2013) und ihre Signifikanzkriterien sind geltendes Recht. **Ob der Eingriff als signifikante Änderung bewertet wurde, ist öffentlich nicht bekannt** — dieser Brief behauptet keinen erwiesenen Regelverstoß, sondern benennt die zu beantwortende Frage. Der **genaue Kaskadenmechanismus ist offiziell nicht veröffentlicht**; eine bestimmte zentrale Komponente (z. B. ein Registerelement) wird hier bewusst nicht als Ursache behauptet. Berichte über ein fehlgeschlagenes Software-Update bzw. einen Rückfall auf Alt-Software stammen aus Trade-Press-/Insiderquellen und sind unbestätigt; sie werden hier nur konditional angeführt. Die Liefer- und Pflegehistorie des GSM-R-Kerns (Nortel → Kapsch CarrierCom, 2010 → Kontron) ist durch Unternehmens- und Fachpresseangaben belegt; der Signal Transfer Point (STP) wird als Beispiel des Strukturproblems angeführt, nicht als Ursache des Vorfalls vom 23. Juni. CENELEC EN 50128 (Software für Eisenbahn-Steuerung und -Sicherung) und die VO (EU) 2018/762 (Anforderungen an das Sicherheitsmanagementsystem) sind geltende Norm bzw. geltendes Recht. Die genannten Amtsträgerinnen und Amtsträger auf EU-Ebene (Kommissar Tzitzikostas, GD MOVE; TRAN-Vorsitzende Vozemberg-Vrionidi) sind zum Stand Juni 2026 verifiziert.

*Hinweis Transparenzregister:* Für die Ansprache der EU-Institutionen ist die Eintragung im **EU-Transparenzregister** des Europäischen Parlaments und der Europäischen Kommission vorgesehen. Die Registernummer von Vpnet ist in der Signatur einzutragen; ist eine Eintragung noch nicht erfolgt, sollte sie vor Versand an die europäischen Stellen vorgenommen werden.
