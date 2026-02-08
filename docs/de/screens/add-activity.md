# AktivitÃ¤t anlegen / bearbeiten

Der Dialog zum Anlegen oder Bearbeiten einer AktivitÃ¤t enthÃ¤lt alle Felder, die eine Aufgabe in **ToDay** beschreiben.

---

## 1) Titel

Das wichtigste Feld â€“ kurz, prÃ¤gnant, eindeutig.

### TD-Trigger (Sondertitel)

Bestimmte Titel lÃ¶sen beim FÃ¤lligwerden automatisierte Aktionen aus:

| Trigger | Aktion |
|---------|--------|
| `TD:brief:high` | Tagesbriefing nur hohe PrioritÃ¤t per TTS. |
| `TD:brief:mid` | Tagesbriefing nur mittlere PrioritÃ¤t per TTS. |
| `TD:brief:low` | Tagesbriefing nur niedrige PrioritÃ¤t per TTS. |
| `TD:finance:gold` | Goldpreis-Ansage (Quelle: goldprice.org). |
| `TD:finance:silver` | Silberpreis-Ansage (Quelle: goldprice.org). |
| `TD:steps:today` | Schritte heute per TTS (Android STEP_COUNTER). |

In der AktivitÃ¤tenliste werden TD-Trigger **benutzerfreundlich** angezeigt (z. B. â€žTagesbriefing Hoch" statt `TD:brief:high`).

---

## 2) Beschreibung (optional)

Freitext fÃ¼r Details, Notizen oder Kontext. Wird in der Detailansicht angezeigt.

### Schritte-Trigger im Detail (`TD:steps:today`)

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Datenquelle** | Android `TYPE_STEP_COUNTER` (kumulativer Hardware-ZÃ¤hler seit letztem Reboot). |
| **Berechnung** | `Schritte heute = aktueller ZÃ¤hlerstand âˆ’ gespeicherter Tagesstartwert`. |
| **Tagesstartwert** | Wird beim ersten Trigger des Tages gesetzt. Erst ab dem zweiten Trigger kommt eine echte Differenz. |
| **Reboot** | Nach Neustart beginnt der ZÃ¤hler bei 0 â†’ neuer Startwert wird automatisch gesetzt. |

**Korrekte Einstellung in Android:**

| Einstellung | Pfad / Aktion |
|-------------|---------------|
| **KÃ¶rperliche AktivitÃ¤t** | Einstellungen â†’ Apps â†’ ToDay â†’ Berechtigungen â†’ KÃ¶rperliche AktivitÃ¤t â†’ Zulassen. |
| **Akku-EinschrÃ¤nkungen** | Auf â€žKeine EinschrÃ¤nkungen" setzen. Bei Xiaomi zusÃ¤tzlich Autostart erlauben. |

**Hinweise zur Genauigkeit:**

- Am zuverlÃ¤ssigsten: **vordere Hosentasche** oder eng anliegende Tasche am KÃ¶rper.  
- Vermeide lockere Jackentasche, Hoodie-Tasche oder frei schwingende Handtasche.  
- Im Rucksack kann es Schritte unterschÃ¤tzen, weil die Bewegung gedÃ¤mpft wird.  
- FÃ¼r konsistente Werte immer mÃ¶glichst die gleiche Trageposition nutzen.

---

## 3) PrioritÃ¤t

| Stufe | Wirkung |
|-------|---------|
| **Niedrig** | Standard-Darstellung. |
| **Mittel** | Standard-Darstellung. |
| **Hoch** | Beeinflusst die Kennzahl â€žHohe PrioritÃ¤t" auf Home und wird visuell hervorgehoben. |

---

## 4) Datum

Kalenderauswahl fÃ¼r den Tag der AktivitÃ¤t.  
Tipp: Heute/Morgen hÃ¤ufig verfÃ¼gbar, sonst Datum wÃ¤hlen.

---

## 5) Uhrzeit

Genaue Startzeit (24 h).  
Wird fÃ¼r die Position im Tag und fÃ¼r Erinnerungen verwendet.

---

## 6) Erinnern

Ã–ffnet die Auswahl der Erinnerungs-Offsets:

| Offset | Bedeutung |
|--------|-----------|
| **Start** | Zum exakten Zeitpunkt. |
| **5 Min** | 5 Minuten vorher. |
| **10 Min** | 10 Minuten vorher. |
| **15 Min** | 15 Minuten vorher. |
| **30 Min** | 30 Minuten vorher. |
| **1 Std** | 1 Stunde vorher. |
| **2 Std** | 2 Stunden vorher. |

- **Mehrfachauswahl** mÃ¶glich (z. B. *10 Min* **und** *Start*).  
- Schnellaktionen: **Alle** / **Keine**.  
- **Ãœbernehmen** bestÃ¤tigt die Auswahl.

> **Hinweis:** Erinnerungen werden zum gewÃ¤hlten Zeitpunkt als Benachrichtigung oder Alarm geplant (Systemrechte erforderlich).

---

## 7) Wiederholung

Legt fest, ob und wie die AktivitÃ¤t automatisch wiederkommt.

### Keine

Einmalige AktivitÃ¤t.

### TÃ¤glich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | â€žAlle *n* Tage" (âˆ’ / +). |
| **Endet** | *Endlos* Â· *Bis Datum* Â· *Nach Anzahl*. |

### WÃ¶chentlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | â€žAlle *n* Wochen" (âˆ’ / +). |
| **Wochentage** | Moâ€“So wÃ¤hlen oder Shortcuts **Werktage** / **Wochenende**. |
| **Endet** | *Endlos* Â· *Bis Datum* Â· *Nach Anzahl*. |

### Monatlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | â€žAlle *n* Monate". |
| **Modus** | **Tag des Monats** (z. B. *23.*) **oder** **Wochentag im Monat** (z. B. *jeder 2. Dienstag*). |
| **Endet** | *Endlos* Â· *Bis Datum* Â· *Nach Anzahl*. |

### JÃ¤hrlich

| Option | Beschreibung |
|--------|-------------|
| **Intervall** | â€žAlle *n* Jahre". |
| **Modus** | **Am Datum** (Monat + Tag) **oder** **Wochentag in Monat**. |
| **Endet** | *Endlos* Â· *Bis Datum* Â· *Nach Anzahl*. |

> **Tipp:** FÃ¼r â€žGeburtstag", â€žMiete", â€žBerichtswoche" passende Wiederholung wÃ¤hlen und **Ende** bewusst setzen.

---

## 8) Aktionen

| Button | Wirkung |
|--------|---------|
| **Abbrechen** | SchlieÃŸt den Dialog ohne Speichern. |
| **HinzufÃ¼gen** | Legt die AktivitÃ¤t an und kehrt zur Ãœbersicht zurÃ¼ck. |

---

## 9) Beispiele

| Beispiel | Konfiguration |
|----------|--------------|
| **Arzttermin** | Datum *23.10.*, Uhrzeit *08:15*, Erinnern *10 Min + Start*. |
| **Training** | Uhrzeit *18:00*, **WÃ¶chentlich**: *Do*, Endet *Endlos*. |
| **Bericht** | **Monatlich**: *Wochentag im Monat â†’ letzter Werktag*, Erinnern *1 Std*. |

---

## 10) Hinweise

- **Berechtigungen:** Erlaube Benachrichtigungen (und ggf. **Exakte Alarme**), sonst kommen Erinnerungen verspÃ¤tet.  
- **Schritte:** FÃ¼r `TD:steps:today` muss **KÃ¶rperliche AktivitÃ¤t** erlaubt sein, sonst ist der SchrittzÃ¤hler nicht verfÃ¼gbar.  
- **Ã„nderbar:** Alles lÃ¤sst sich spÃ¤ter bearbeiten, Wiederholungen wirken nur fÃ¼r zukÃ¼nftige Termine.