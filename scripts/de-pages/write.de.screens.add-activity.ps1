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

### TD Briefing Trigger v1.0

| Trigger Token im Titel | Anzeige Deutsch | Anzeige Englisch | Spricht Aufgaben mit Priorität |
| --- | --- | --- | --- |
| `TD:brief:high` | Tagesbriefing Hoch | Daily Briefing High | nur Hoch |
| `TD:brief:mid` | Tagesbriefing Mittel | Daily Briefing Mid | nur Mittel |
| `TD:brief:low` | Tagesbriefing Niedrig | Daily Briefing Low | nur Niedrig |

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
