function Write-De-Screen-AddActivity {
  $p = Join-Path $Screens 'add-activity.md'
  $c = @'
# Aktivität hinzufügen

Dieser Dialog legt eine neue Aktivität an. Du bestimmst Titel, Zeitpunkt, Erinnerungen und (optional) eine Wiederholung.

---

## 1) Öffnen
- Auf **Home** den **+**-Button tippen.
- Felder ausfüllen und mit **Hinzufügen** speichern.

---

## 2) Titel & Beschreibung
- **Titel**: Pflichtfeld. Kurz und prägnant (z. B. „Arzttermin“, „Bericht senden“).
- **Beschreibung** *(optional)*: Details/Notizen.

---

## 2a) TD Trigger im Titel (Power Feature)

Du kannst bestimmte System Aktionen über den Aktivitätstitel auslösen. Dafür beginnt der Titel exakt mit `TD:`.

Wichtig
- Trigger wird nur erkannt, wenn der Titel direkt mit `TD:` startet. Kein Leerzeichen davor.
- Format: `TD:<gruppe>:<stufe>`
- Case insensitive: `td:BRIEF:HIGH` ist gültig.
- Alles nach dem dritten Segment wird ignoriert und ist nur ein optionales Label.
  Beispiele: `TD:brief:high:morning` oder `TD:brief:high Mein Label`

Anzeige Regeln
- Der gespeicherte Titel bleibt unverändert.
- In der Aktivitätsliste wird statt des Tokens eine freundliche Anzeige gezeigt.
- Bei Gerätesprache Englisch wird die englische Anzeige gezeigt.

### TD Briefing Trigger

Trigger Token im Titel: `TD:brief:<stufe>`
- `TD:brief:high`
  Anzeige Deutsch: Tagesbriefing Hoch
  Anzeige Englisch: Daily Briefing High
- `TD:brief:mid`
  Anzeige Deutsch: Tagesbriefing Mittel
  Anzeige Englisch: Daily Briefing Mid
- `TD:brief:low`
  Anzeige Deutsch: Tagesbriefing Niedrig
  Anzeige Englisch: Daily Briefing Low

### Eingabe Beispiele

- Ohne Label
  Titel: `TD:brief:high`

- Mit Label
  Titel: `TD:brief:mid:team`
  Das Label ist nur Text. Verhalten bleibt `TD:brief:mid`.

### Was passiert, wenn ein Briefing fällig wird

Wenn eine Briefing Trigger Aktivität fällig wird, wird nicht der Titel vorgelesen. Stattdessen wird ein Tagesbriefing gesprochen.

Briefing Scope
- Gilt für den Tag der Trigger Aktivität.

Filter Regeln
- Die Trigger Aktivität selbst wird nie vorgelesen.
- Aktivitäten deren Titel mit `TD:` beginnt werden nie vorgelesen.
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
- Beim Anzeigen wird anhand der Geräte Locale gewählt.
- Wenn kein passender Text vorhanden ist, nutzt die App den bisherigen Fallback.

Hinweis zu Erinnerungen
- Für Briefing Trigger soll es keine doppelte Benachrichtigung zum Startzeitpunkt geben. Deshalb wird eine Erinnerung „Start“ für TD Briefing Trigger intern unterdrückt.

---

### TD Finance Trigger

Finance Trigger sind System Trigger für Preis Ansagen. Wenn so eine Aktivität fällig wird, liest die App nicht den Titel vor, sondern eine generierte Preis Ansage.

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
- Trigger wird nur erkannt, wenn der Titel direkt mit `TD:` startet. Kein Leerzeichen davor.
- Case insensitive: `TD:FINANCE:GOLD` ist gültig.
- Alles nach dem dritten Segment wird ignoriert und ist nur ein optionales Label.

Was passiert, wenn ein Finance Trigger fällig wird
- Es wird nicht der Titel vorgelesen.
- Stattdessen wird beim Planen der Benachrichtigung eine Preis Ansage vorbereitet.
- Es gibt keine Netzwerk Abfragen im Benachrichtigungs Callback. Der Callback nutzt nur payload.

Datenquelle und Preis Mapping
- Basis Endpoint: `https://data-asg.goldprice.org/dbXRates/USD`
- Gold nimmt `xauClose` als Preis in USD.
- Silber nimmt `xagClose` als Preis in USD.

Cache Verhalten
- Die App cached die Preise pro Metall für ca. 10 bis 15 Minuten oder bis App Neustart.
- Dadurch werden beim Rescheduling nicht dauernd neue Preise geholt.

Offline und Fehlerfall
- Wenn kein Netz verfügbar ist oder ein Fehler passiert, wird trotzdem gescheduled.
- Die App spricht dann eine klare Fallback Meldung, zum Beispiel „Goldpreis derzeit nicht verfügbar“.

Sprache
- Es werden zwei Texte vorbereitet: Deutsch und Englisch.
- Beim Abspielen wird anhand der Geräte Locale gewählt.
- payload keys: `speak_de` und `speak_en`

---

### TD Wave Trigger

Wave Trigger spielen einen Sound über einen eigenen Android Channel Sound. Der Titel wird dabei nicht vorgelesen.

Trigger Token im Titel
- `TD:wave:<key>`
Optional auch gültig
- `TD:wav:<key>`

Beispiele
- `TD:wave:ddr`
  Anzeige Deutsch: Sound Ansage ddr
  Anzeige Englisch: Sound announcement ddr
- `TD:wave:udssr`
  Anzeige Deutsch: Sound Ansage udssr
  Anzeige Englisch: Sound announcement udssr
- `TD:wave:russland`
  Anzeige Deutsch: Sound Ansage russland
  Anzeige Englisch: Sound announcement russland

Wave Datei Regeln
- Android raw resource unter `android/app/src/main/res/raw`
- Dateiname `<key>.wav`
- Name klein, nur buchstaben zahlen underscore

Fehlerfall
- Wenn key unbekannt ist oder Ressource fehlt, kein Crash.
- Scheduling läuft weiter.
- Es wird eine klare Fallback Ansage gesprochen, Deutsch und Englisch.

---

## 3) Priorität
- **Niedrig / Mittel / Hoch**
  Beeinflusst die Kennzahl **„Hohe Priorität“** auf Home und hilft dir beim Fokussieren.

---

## 4) Datum
- Kalenderauswahl für den Tag der Aktivität.
  Tipp: Heute/Morgen häufig verfügbar, sonst Datum wählen.

---

## 5) Uhrzeit
- Genaue Startzeit (24-h).
  Wird für die Position im Tag und für Erinnerungen verwendet.

---

## 6) Erinnern
- Öffnet die Auswahl **Start · 5 Min · 10 Min · 15 Min · 30 Min · 1 Std · 2 Std**.
- Mehrfachauswahl möglich (z. B. *10 Min* **und** *Start*).
- Schnellaktionen: **Alle** / **Keine**.
- **Übernehmen** bestätigt die Auswahl.

> Hinweis: Erinnerungen werden zum gewählten Zeitpunkt als Benachrichtigung oder Alarm geplant (Systemrechte erforderlich).

---

## 7) Wiederholung
Legt fest, ob und wie die Aktivität automatisch wiederkommt.

- **Keine**: einmalig.
- **Täglich**
  - Intervall: „Alle *n* Tage“ (− / +).
  - **Endet**: *Endlos* · *Bis Datum* · *Nach Anzahl*.
- **Wöchentlich**
  - Intervall: „Alle *n* Wochen“ (− / +).
  - Wochentage wählen (Mo…So) oder Shortcuts **Werktage** / **Wochenende**.
  - **Endet**: *Endlos* · *Bis Datum* · *Nach Anzahl*.
- **Monatlich**
  - Intervall: „Alle *n* Monate“.
  - Modus: **Tag des Monats** (z. B. *23.*) **oder** **Wochentag im Monat** (z. B. *jeder 2. Dienstag*).
  - **Endet**: *Endlos* · *Bis Datum* · *Nach Anzahl*.
- **Jährlich**
  - Intervall: „Alle *n* Jahre“.
  - Modus: **Am Datum** (Monat + Tag) **oder** **Wochentag in Monat**.
  - **Endet**: *Endlos* · *Bis Datum* · *Nach Anzahl*.

> Tipp: Für „Geburtstag“, „Miete“, „Berichtswoche“ passende Wiederholung wählen und **Ende** bewusst setzen.

---

## 8) Aktionen
- **Abbrechen**: Schließt den Dialog ohne Speichern.
- **Hinzufügen**: Legt die Aktivität an und kehrt zur Übersicht zurück.

---

## 9) Beispiele
- „**Arzttermin**“, Datum *23.10.*, Uhrzeit *08:15*, Erinnern *10 Min + Start*.
- „**Training**“, Uhrzeit *18:00*, **Wöchentlich**: *Do*, Endet *Endlos*.
- „**Bericht**“, **Monatlich**: *Wochentag im Monat → letzter Werktag*, Erinnern *1 Std*.

---

## 10) Hinweise
- **Berechtigungen**: Erlaube Benachrichtigungen (und ggf. **Exakte Alarme**), sonst kommen Erinnerungen verspätet.
- **Änderbar**: Alles lässt sich später bearbeiten, Wiederholungen wirken nur für zukünftige Termine.
'@
  Write-File $p $c
}
