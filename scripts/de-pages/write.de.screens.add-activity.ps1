function Write-De-Screen-AddActivity {
  $p = Join-Path $Screens 'add-activity.md'
  $c = @'
# Aktivit&auml;t hinzuf&uuml;gen

Dieser Dialog legt eine neue Aktivit&auml;t an. Du bestimmst Titel, Zeitpunkt, Erinnerungen und (optional) eine Wiederholung.

---

## 1) &Ouml;ffnen  
- Auf **Home** den **+**-Button tippen.  
- Felder ausf&uuml;llen und mit **Hinzuf&uuml;gen** speichern.  

---

## 2) Titel & Beschreibung  
- **Titel**: Pflichtfeld. Kurz und pr&auml;gnant (z. B. „Arzttermin“, „Bericht senden“).  
- **Beschreibung** *(optional)*: Details/Notizen.  

---

## 2a) TD Trigger im Titel (Power Feature)

Du kannst bestimmte System Aktionen &uuml;ber den Aktivit&auml;tstitel ausl&ouml;sen. Daf&uuml;r beginnt der Titel mit `TD:`.

Wichtig  
- Empfehlung: Der Titel sollte direkt mit `TD:` beginnen. F&uuml;hrende Leerzeichen werden zwar toleriert, sind aber nicht empfohlen.  
- Format: `TD:<gruppe>:<stufe>`  
- Case insensitive: `td:BRIEF:HIGH` ist g&uuml;ltig.  
- Alles nach dem dritten Segment wird ignoriert und ist nur ein optionales Label.  
  Beispiele: `TD:brief:high:morning` oder `TD:brief:high Mein Label`  

Anzeige Regeln  
- Der gespeicherte Titel bleibt unver&auml;ndert.  
- In der Aktivit&auml;tsliste wird statt des Tokens eine freundliche Anzeige gezeigt.  
- Bei Ger&auml;tesprache Englisch wird die englische Anzeige gezeigt.  

### TD Briefing Trigger

Trigger Token im Titel: `TD:brief:<stufe>`  
- `TD:brief:high`
  Anzeige Deutsch: Tagesbriefing Hoch
  Anzeige Englisch: Daily Briefing High  
- `TD:brief:mid`
  Anzeige Deutsch: Tagesbriefing Mittel
  Anzeige Englisch: Daily Briefing Mid
  Auch akzeptiert als `TD:brief:middle` und `TD:brief:medium`  
- `TD:brief:low`
  Anzeige Deutsch: Tagesbriefing Niedrig
  Anzeige Englisch: Daily Briefing Low  

### Eingabe Beispiele

- Ohne Label
  Titel: `TD:brief:high`  

- Mit Label
  Titel: `TD:brief:mid:team`
  Das Label ist nur Text. Verhalten bleibt `TD:brief:mid`.  

### Was passiert, wenn ein Briefing f&auml;llig wird

Wenn eine Briefing Trigger Aktivit&auml;t f&auml;llig wird, wird nicht der Titel vorgelesen. Stattdessen wird ein Tagesbriefing gesprochen.

Briefing Scope  
- Gilt f&uuml;r den Tag der Trigger Aktivit&auml;t.  

Filter Regeln  
- Die Trigger Aktivit&auml;t selbst wird nie vorgelesen.  
- Aktivit&auml;ten deren Titel mit `TD:` beginnt werden nie vorgelesen.  
- Es werden nur normale Aufgaben vorgelesen, passend zur Stufe high mid low.  

Sortierung  
- Zuerst Aufgaben mit Uhrzeit, aufsteigend nach Uhrzeit.  
- Danach Aufgaben ohne Uhrzeit.  

Mengenbegrenzung  
- Maximal 5 Aufgaben mit Uhrzeit.  
- Maximal 3 Aufgaben ohne Uhrzeit.  
- Wenn es mehr gibt, kommt am Ende kurz: „und weitere Aufgaben“.  

Sprache  
- Es werden zwei Texte vorbereitet: Deutsch und Englisch.  
- Beim Anzeigen wird anhand der Ger&auml;te Locale gew&auml;hlt.  
- Wenn kein passender Text vorhanden ist, nutzt die App den bisherigen Fallback.  

Hinweis zu Erinnerungen  
- F&uuml;r Briefing Trigger soll es keine doppelte Benachrichtigung zum Startzeitpunkt geben. Deshalb wird eine Erinnerung „Start“ f&uuml;r TD Briefing Trigger intern unterdr&uuml;ckt.  

---

### TD Finance Trigger

Finance Trigger sind System Trigger f&uuml;r Preis Ansagen. Wenn so eine Aktivit&auml;t f&auml;llig wird, liest die App nicht den Titel vor, sondern eine generierte Preis Ansage.

Trigger Token im Titel: `TD:finance:<metall>`  
- `TD:finance:gold`
  Anzeige Deutsch: Goldpreis Ansage
  Anzeige Englisch: Gold price announcement  
- `TD:finance:silver`
  Anzeige Deutsch: Silberpreis Ansage
  Anzeige Englisch: Silver price announcement  

Eingabe Beispiele  
- Ohne Label
  Titel: `TD:finance:gold`  

- Mit Label
  Titel: `TD:finance:silver:spot`
  Das Label ist nur Text. Verhalten bleibt `TD:finance:silver`.  

Wichtig  
- Empfehlung: Der Titel sollte direkt mit `TD:` beginnen. F&uuml;hrende Leerzeichen werden zwar toleriert, sind aber nicht empfohlen.  
- Case insensitive: `TD:FINANCE:GOLD` ist g&uuml;ltig.  
- Alles nach dem dritten Segment wird ignoriert und ist nur ein optionales Label.  

Was passiert, wenn ein Finance Trigger f&auml;llig wird  
- Es wird nicht der Titel vorgelesen.  
- Stattdessen wird beim Planen der Benachrichtigung eine Preis Ansage vorbereitet.  
- Es gibt keine Netzwerk Abfragen im Benachrichtigungs Callback. Der Callback nutzt nur payload.  

Datenquelle und Preis Mapping  
- Basis Endpoint: `https://data-asg.goldprice.org/dbXRates/USD`  
- Gold nimmt `xauClose` als Preis in USD.  
- Silber nimmt `xagClose` als Preis in USD.  

Cache Verhalten  
- Die App cached die Preise pro Metall f&uuml;r ca. 10 bis 15 Minuten oder bis App Neustart.  
- Dadurch werden beim Rescheduling nicht dauernd neue Preise geholt.  

Offline und Fehlerfall  
- Wenn kein Netz verf&uuml;gbar ist oder ein Fehler passiert, wird trotzdem gescheduled.  
- Die App spricht dann eine klare Fallback Meldung, zum Beispiel „Goldpreis derzeit nicht verf&uuml;gbar“.  

Sprache  
- Es werden zwei Texte vorbereitet: Deutsch und Englisch.  
- Beim Abspielen wird anhand der Ger&auml;te Locale gew&auml;hlt.  
- payload keys: `speak_de` und `speak_en`  

---

### TD Schritte Heute Trigger (Android STEP_COUNTER)

Dieser Trigger liest den Android Sensor **STEP_COUNTER** aus und sagt die **heutigen Schritte** an.

Trigger Token im Titel: `TD:steps:today`  
- Anzeige Deutsch: Schritte Heute  
- Anzeige Englisch: Steps today  

Wichtig zum Sensor  
- STEP_COUNTER ist ein Gesamtz&auml;hler seit dem letzten Ger&auml;te Neustart.  
- „Heute“ wird als Differenz berechnet: aktueller Z&auml;hler minus Tages Startwert.  

Baseline Logik  
- Beim ersten Trigger am Tag merkt sich die App den aktuellen STEP_COUNTER als Startwert f&uuml;r das heutige Datum.  
- Beim zweiten und jedem weiteren Trigger am selben Tag wird „heute“ als Differenz angesagt.  
- Dadurch werden keine falschen Mitternacht Werte erfunden, wenn die App nachts nicht aktiv war.  

Reset und Sonderf&auml;lle  
- Ger&auml;te Neustart oder Sensor Reset:
  Wenn der aktuelle STEP_COUNTER kleiner ist als der gespeicherte Startwert, setzt die App den Startwert neu.
  Die Ansage startet dann wieder bei 0 f&uuml;r „ab jetzt“.  
- Erster Trigger des Tages:
  Es wird ein Startwert gesetzt und „0 ab jetzt“ angesagt.
  Erst ab dem n&auml;chsten Trigger am selben Tag kommt eine echte Differenz.  

Korrekte Einstellung in Android  
- App Berechtigung:
  Erlaube **K&ouml;rperliche Aktivit&auml;t** (ACTIVITY_RECOGNITION), sonst kann der Schrittz&auml;hler nicht gelesen werden.
  Pfad ist je nach Ger&auml;t z. B. Einstellungen &rarr; Apps &rarr; ToDay &rarr; Berechtigungen &rarr; K&ouml;rperliche Aktivit&auml;t &rarr; Zulassen.
- Akku Einschr&auml;nkungen:
  Setze Akku auf „Keine Einschr&auml;nkungen“, damit Sensor Events zuverl&auml;ssig kommen.
  Bei Xiaomi zus&auml;tzlich Autostart erlauben, falls vorhanden.  

Hinweise zur Genauigkeit beim Tragen des Handys  
- Der Android Wert ist kein roher Sensor wie Temperatur, sondern ein vom Hersteller berechneter Zähler. Intern entstehen die Schritte fast immer
  aus Beschleunigungsdaten. Das kommt vom Accelerometer, oft zusammen mit Gyro und einer Sensor Fusion. Viele Geräte rechnen das nicht in der
  App CPU, sondern in einem Low Power Sensor Hub DSP. Dort laufen Filter und ein Mustererkennungs Algorithmus, der typische Schritt Muster
  erkennt und Fehltrigger wegfiltert. Das Ergebnis ist dann ein Schritt Event oder ein Zählerstand. Eine Watch Uhr sitzt fest am Körper und
  hat eine sehr konstante Position. Das Signal ist sauberer. Ein Handy ist dagegen oft in wechselnden Situationen. In der Hand, in der
  Hosentasche locker, in der Jacke, im Rucksack, auf dem Tisch, im Auto. Der Algorithmus muss aggressiver filtern, sonst würde er bei jeder
  Bewegung Schritte zählen. Aggressives Filtern führt aber zu Unterzählung, besonders bei kurzen Wegen, langsamen Schritten oder gedämpfter
  Bewegung im Rucksack.  
- Am zuverl&auml;ssigsten ist vordere Hosentasche oder eng anliegende Tasche am K&ouml;rper.  
- Vermeide lockere Jackentasche, Hoodie Tasche oder eine frei schwingende Handtasche.  
- Im Rucksack kann es Schritte untersch&auml;tzen, weil die Bewegung ged&auml;mpft wird.  
- F&uuml;r konsistente Werte immer m&ouml;glichst die gleiche Trageposition nutzen.  

---

## 3) Priorit&auml;t
- **Niedrig / Mittel / Hoch**
  Beeinflusst die Kennzahl **„Hohe Priorit&auml;t“** auf Home und hilft dir beim Fokussieren.  

---

## 4) Datum
- Kalenderauswahl f&uuml;r den Tag der Aktivit&auml;t.
  Tipp: Heute/Morgen h&auml;ufig verf&uuml;gbar, sonst Datum w&auml;hlen.  

---

## 5) Uhrzeit
- Genaue Startzeit (24 h).
  Wird f&uuml;r die Position im Tag und f&uuml;r Erinnerungen verwendet.  

---

## 6) Erinnern
- &Ouml;ffnet die Auswahl **Start &middot; 5 Min &middot; 10 Min &middot; 15 Min &middot; 30 Min &middot; 1 Std &middot; 2 Std**.  
- Mehrfachauswahl m&ouml;glich (z. B. *10 Min* **und** *Start*).  
- Schnellaktionen: **Alle** / **Keine**.  
- **&Uuml;bernehmen** best&auml;tigt die Auswahl.  

> Hinweis: Erinnerungen werden zum gew&auml;hlten Zeitpunkt als Benachrichtigung oder Alarm geplant (Systemrechte erforderlich).

---

## 7) Wiederholung
Legt fest, ob und wie die Aktivit&auml;t automatisch wiederkommt.

- **Keine**: einmalig.  
- **T&auml;glich**  
  - Intervall: „Alle *n* Tage“ (− / +).  
  - **Endet**: *Endlos* &middot; *Bis Datum* &middot; *Nach Anzahl*.  
- **W&ouml;chentlich**  
  - Intervall: „Alle *n* Wochen“ (− / +).  
  - Wochentage w&auml;hlen (Mo&hellip;So) oder Shortcuts **Werktage** / **Wochenende**.  
  - **Endet**: *Endlos* &middot; *Bis Datum* &middot; *Nach Anzahl*.  
- **Monatlich**  
  - Intervall: „Alle *n* Monate“.  
  - Modus: **Tag des Monats** (z. B. *23.*) **oder** **Wochentag im Monat** (z. B. *jeder 2. Dienstag*).  
  - **Endet**: *Endlos* &middot; *Bis Datum* &middot; *Nach Anzahl*.  
- **J&auml;hrlich**  
  - Intervall: „Alle *n* Jahre“.  
  - Modus: **Am Datum** (Monat + Tag) **oder** **Wochentag in Monat**.  
  - **Endet**: *Endlos* &middot; *Bis Datum* &middot; *Nach Anzahl*.  

> Tipp: F&uuml;r „Geburtstag“, „Miete“, „Berichtswoche“ passende Wiederholung w&auml;hlen und **Ende** bewusst setzen.

---

## 8) Aktionen
- **Abbrechen**: Schlie&szlig;t den Dialog ohne Speichern.  
- **Hinzuf&uuml;gen**: Legt die Aktivit&auml;t an und kehrt zur &Uuml;bersicht zur&uuml;ck.  

---

## 9) Beispiele
- „**Arzttermin**“, Datum *23.10.*, Uhrzeit *08:15*, Erinnern *10 Min + Start*.  
- „**Training**“, Uhrzeit *18:00*, **W&ouml;chentlich**: *Do*, Endet *Endlos*.  
- „**Bericht**“, **Monatlich**: *Wochentag im Monat &rarr; letzter Werktag*, Erinnern *1 Std*.  

---

## 10) Hinweise
- **Berechtigungen**: Erlaube Benachrichtigungen (und ggf. **Exakte Alarme**), sonst kommen Erinnerungen versp&auml;tet.  
- **Schritte**: F&uuml;r `TD:steps:today` muss **K&ouml;rperliche Aktivit&auml;t** erlaubt sein, sonst ist der Schrittz&auml;hler nicht verf&uuml;gbar.  
- **&Auml;nderbar**: Alles l&auml;sst sich sp&auml;ter bearbeiten, Wiederholungen wirken nur f&uuml;r zuk&uuml;nftige Termine.  
'@
  Write-File $p $c
}
