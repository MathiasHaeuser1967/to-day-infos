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

> Hinweis: Erinnerungen werden zum gewählten Zeitpunkt als Benachrichtigung/Alarm geplant (Systemrechte erforderlich).

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

> Tipp: Für „Geburtstag“, „Miete“, „Berichtswoche“ o. ä. passende Wiederholung wählen und **Ende** bewusst setzen.

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
- **Änderbar**: Alles lässt sich später bearbeiten; Wiederholungen wirken nur für zukünftige Termine.
'@
  Write-File $p $c
}
