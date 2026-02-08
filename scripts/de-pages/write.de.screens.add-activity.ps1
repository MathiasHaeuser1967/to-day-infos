function Write-De-Screen-AddActivity {
  $p = Join-Path $Screens 'add-activity.md'
  $c = @'
# Aktivität anlegen / bearbeiten

Der Dialog zum Anlegen oder Bearbeiten einer Aktivität enthält alle Felder, die eine Aufgabe in **ToDay** beschreiben.

---

## 1) Titel

Das wichtigste Feld – kurz, prägnant, eindeutig.

### TD-Trigger (Sondertitel)

Bestimmte Titel lösen beim Fälligwerden automatisierte Aktionen aus:

| Trigger | Aktion |
|---------|--------|
| `TD:brief:high` | Tagesbriefing nur hohe Priorität per TTS. |
| `TD:brief:mid` | Tagesbriefing nur mittlere Priorität per TTS. |
| `TD:brief:low` | Tagesbriefing nur niedrige Priorität per TTS. |
| `TD:finance:gold` | Goldpreis-Ansage (Quelle: goldprice.org). |
| `TD:finance:silver` | Silberpreis-Ansage (Quelle: goldprice.org). |
| `TD:steps:today` | Schritte heute per TTS (Android STEP_COUNTER). |

In der Aktivitätenliste werden TD-Trigger **benutzerfreundlich** angezeigt (z. B. „Tagesbriefing Hoch" statt `TD:brief:high`).

---

## 2) Beschreibung (optional)

Freitext für Details, Notizen oder Kontext. Wird in der Detailansicht angezeigt.

### Schritte-Trigger im Detail (`TD:steps:today`)

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Datenquelle** | Android `TYPE_STEP_COUNTER` (kumulativer Hardware-Zähler seit letztem Reboot). |
| **Berechnung** | `Schritte heute = aktueller Zählerstand − gespeicherter Tagesstartwert`. |
| **Tagesstartwert** | Wird beim ersten Trigger des Tages gesetzt. Erst ab dem zweiten Trigger kommt eine echte Differenz. |
| **Reboot** | Nach Neustart beginnt der Zähler bei 0 → neuer Startwert wird automatisch gesetzt. |

**Korrekte Einstellung in Android:**

| Einstellung | Pfad / Aktion |
|-------------|---------------|
| **Körperliche Aktivität** | Einstellungen → Apps → ToDay → Berechtigungen → Körperliche Aktivität → Zulassen. |
| **Akku-Einschränkungen** | Auf „Keine Einschränkungen" setzen. Bei Xiaomi zusätzlich Autostart erlauben. |

**Hinweise zur Genauigkeit:**

- Am zuverlässigsten: **vordere Hosentasche** oder eng anliegende Tasche am Körper.  
- Vermeide lockere Jackentasche, Hoodie-Tasche oder frei schwingende Handtasche.  
- Im Rucksack kann es Schritte unterschätzen, weil die Bewegung gedämpft wird.  
- Für konsistente Werte immer möglichst die gleiche Trageposition nutzen.

---

## 3) Priorität

| Stufe | Wirkung |
|-------|---------|
| **Niedrig** | Standard-Darstellung. |
| **Mittel** | Standard-Darstellung. |
| **Hoch** | Beeinflusst die Kennzahl „Hohe Priorität" auf Home und wird visuell hervorgehoben. |

---

## 4) Datum

Kalenderauswahl für den Tag der Aktivität.  
Tipp: Heute/Morgen häufig verfügbar, sonst Datum wählen.

---

## 5) Uhrzeit

Genaue Startzeit (24 h).  
Wird für die Position im Tag und für Erinnerungen verwendet.

---

## 6) Erinnern

Öffnet die Auswahl der Erinnerungs-Offsets:

| Offset | Bedeutung |
|--------|-----------|
| **Start** | Zum exakten Zeitpunkt. |
| **5 Min** | 5 Minuten vorher. |
| **10 Min** | 10 Minuten vorher. |
| **15 Min** | 15 Minuten vorher. |
| **30 Min** | 30 Minuten vorher. |
| **1 Std** | 1 Stunde vorher. |
| **2 Std** | 2 Stunden vorher. |

- **Mehrfachauswahl** möglich (z. B. *10 Min* **und** *Start*).  
- Schnellaktionen: **Alle** / **Keine**.  
- **Übernehmen** bestätigt die Auswahl.

> **Hinweis:** Erinnerungen werden zum gewählten Zeitpunkt als Benachrichtigung oder Alarm geplant (Systemrechte erforderlich).

---

## 7) Wiederholung

Legt fest, ob und wie die Aktivität automatisch wiederkommt.

### Keine

Einmalige Aktivität.

### Täglich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | „Alle *n* Tage" (− / +). |
| **Endet** | *Endlos* · *Bis Datum* · *Nach Anzahl*. |

### Wöchentlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | „Alle *n* Wochen" (− / +). |
| **Wochentage** | Mo–So wählen oder Shortcuts **Werktage** / **Wochenende**. |
| **Endet** | *Endlos* · *Bis Datum* · *Nach Anzahl*. |

### Monatlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | „Alle *n* Monate". |
| **Modus** | **Tag des Monats** (z. B. *23.*) **oder** **Wochentag im Monat** (z. B. *jeder 2. Dienstag*). |
| **Endet** | *Endlos* · *Bis Datum* · *Nach Anzahl*. |

### Jährlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | „Alle *n* Jahre". |
| **Modus** | **Am Datum** (Monat + Tag) **oder** **Wochentag in Monat**. |
| **Endet** | *Endlos* · *Bis Datum* · *Nach Anzahl*. |

> **Tipp:** Für „Geburtstag", „Miete", „Berichtswoche" passende Wiederholung wählen und **Ende** bewusst setzen.

---

## 8) Aktionen

| Button | Wirkung |
|--------|---------|
| **Abbrechen** | Schließt den Dialog ohne Speichern. |
| **Hinzufügen** | Legt die Aktivität an und kehrt zur Übersicht zurück. |

---

## 9) Beispiele

| Beispiel | Konfiguration |
|----------|--------------|
| **Arzttermin** | Datum *23.10.*, Uhrzeit *08:15*, Erinnern *10 Min + Start*. |
| **Training** | Uhrzeit *18:00*, **Wöchentlich**: *Do*, Endet *Endlos*. |
| **Bericht** | **Monatlich**: *Wochentag im Monat → letzter Werktag*, Erinnern *1 Std*. |

---

## 10) Hinweise

- **Berechtigungen:** Erlaube Benachrichtigungen (und ggf. **Exakte Alarme**), sonst kommen Erinnerungen verspätet.  
- **Schritte:** Für `TD:steps:today` muss **Körperliche Aktivität** erlaubt sein, sonst ist der Schrittzähler nicht verfügbar.  
- **Änderbar:** Alles lässt sich später bearbeiten, Wiederholungen wirken nur für zukünftige Termine.
'@
  Write-File $p $c
}
