# Info

Der Dialog zeigt technische Informationen zur App, zum System, zur Datenbank und zum Benachrichtigungs-Status. Hilfreich für Support und Diagnose.

---

## 1) Aufruf & Zweck
- Aufruf über das **Menü** der App.
- Schneller Überblick für **Support** (Kopierfunktion) und **Fehleranalyse**.

---

## 2) App
- **App**: Name und **Version** (z. B. 1.0.5.1) mit **Kanal** (*Release*, *Beta*, *Debug*).

---

## 3) System
- **Betriebssystem**: Android-Build des Geräts (z. B. `android AQ3A.240912.001`).
- **Package-ID**: Eindeutige Paketkennung der App (z. B. `de.mathiashaeuser.today`).

---

## 4) Datenbank
- **SQLite**: verwendete SQLite-Version.
- **DB-Pfad**: Verzeichnis der App-Datenbank auf dem Gerät.
- **DB-Datei**: vollständiger Pfad zur Datenbankdatei (z. B. `.../databases/to_day.db`).
- **DB-Name**: logischer Name (z. B. `to_day.db`).
- **Anzahl Einträge**: Summe der Datensätze (Kurzüberblick).
- **Tabellen**: Anzahl der Tabellen in der Datenbank.

> Hinweis: Der Pfad ist aus Sicherheitsgründen i. d. R. nicht direkt zugänglich (ohne Root/adb). Für Analysen genügt der **Kopieren**-Button.

### 4.1 Aufbau (Überblick)

```mermaid
erDiagram
  ACTIVITIES {
    TEXT id PK "z. B. UUID"
    TEXT title "Titel der Aktivität"
    TEXT description "Beschreibung (optional)"
    TEXT date "YYYYMMDD, z. B. 20251012"
    TEXT time "HHmm, z. B. 0930"
    TEXT priority "low|medium|high (Default: medium)"
    INTEGER completed "0/1 (offen/erledigt)"
    TEXT created_at "ISO-Zeitstempel"
    TEXT updated_at "ISO-Zeitstempel"
    TEXT reminders "JSON: [OffsetMinuten]"
    TEXT rrule "RFC RRULE (optional)"
    TEXT exdates "JSON: [YYYYMMDD] (optional)"
    TEXT done_dates "JSON: [YYYYMMDD] (optional)"
    TEXT source "user|system:cycle|system:time_announce"
    INTEGER sched_rev "Planungs-Revision (Default: 1)"
    TEXT batch_id "Batch-Gruppierung (optional)"
  }

  SETTINGS {
    TEXT key PK
    TEXT value
    INTEGER updated_at "Epoch ms"
  }
```

- **`activities`** hält alle Aufgaben/Termine inkl. Erinnerungen, Wiederholungen und Metadaten.
- **`settings`** ist eine schlanke Key/Value-Tabelle für App-Einstellungen (z. B. Flags und Zeitstempel).

### 4.2 Tabellen im Detail

#### `activities` – deine Aufgaben

| Feld         | Typ     | Pflicht | Beispiel           | Wofür gut |
|--------------|---------|:------:|--------------------|-----------|
| `id`         | TEXT PK | ✅     | `3f1a…-uuid`       | Eindeutige ID der Aktivität. |
| `title`      | TEXT    | ✅     | „Arzttermin“       | Kurztitel / Name. |
| `description`| TEXT    | –      | „Überweisung…“     | Details/Notizen. |
| `date`       | TEXT    | ✅     | `20251012`         | Datum im Format **YYYYMMDD**. |
| `time`       | TEXT    | ✅     | `0930`             | Uhrzeit im Format **HHmm**. |
| `priority`   | TEXT    | ✅     | `low/medium/high`  | Priorität (Default: `medium`). |
| `completed`  | INTEGER | ✅     | `0` / `1`          | Ob erledigt (`1`) oder offen (`0`). |
| `created_at` | TEXT    | ✅     | `2025-10-12T08:40:21Z` | Erstellt-Zeitpunkt (ISO-8601). |
| `updated_at` | TEXT    | ✅     | `2025-10-12T08:45:07Z` | Letzte Änderung (ISO-8601). |
| `reminders`  | TEXT    | –      | `[0,15,60]`        | JSON-Liste von **Offset-Minuten** vor Start. |
| `rrule`      | TEXT    | –      | `FREQ=DAILY;COUNT=10` | **RFC RRULE** für Wiederholungen. |
| `exdates`    | TEXT    | –      | `["20251015"]`     | JSON-Liste **ausgeklammerter** Vorkommen (YYYYMMDD). |
| `done_dates` | TEXT    | –      | `["20251012"]`     | JSON-Liste **erledigter** Vorkommen (bei Serien). |
| `source`     | TEXT    | ✅     | `user` / `system:cycle` / `system:time_announce` | Herkunft: manuell oder System-Features. |
| `sched_rev`  | INTEGER | ✅     | `1`                | **Planungs-Revision** zur Neuplanung/Abgleich. |
| `batch_id`   | TEXT    | –      | `time:20251012`    | **Batch-Kennung** zum Gruppieren. |

**Hinweise & Formate**
- **Datum/Uhrzeit** als kompakte Strings → schnelle Vergleiche & Indizes.
- **Erinnerungen (`reminders`)**: unterstützte Offsets: `0, 5, 10, 15, 30, 60, 120`.
- **Wiederholungen (`rrule`)**: Standard-RRULE (z. B. `FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8`).  
  Ausnahmen in `exdates`, erledigte Serien-Vorkommen in `done_dates`.
- **Quellen (`source`)**: `user`, `system:cycle`, `system:time_announce`.
- **Revision (`sched_rev`)**: erhöht sich bei Neuaufbau von Planungen.
- **Batch (`batch_id`)**: gruppiert zusammengehörige Items.

#### `settings` – App-Einstellungen

| Feld        | Typ     | Pflicht | Beispiel                 | Wofür gut |
|-------------|---------|:------:|--------------------------|-----------|
| `key`       | TEXT PK | ✅     | `time_announce.enabled`  | Einstellungs-Schlüssel |
| `value`     | TEXT    | –      | `true` / `{"wpm":12}`    | Wert als Text/JSON |
| `updated_at`| INTEGER | –      | `1734012345678`          | Unix-Millis der letzten Änderung |

**Beispiele für Keys**  
`time_announce.enabled`, `time_announce.cadence`, `tts.voice`, `weather.alerts.enabled`, `pollen.alerts.enabled`, `locale`, `theme.mode`, …

### 4.3 Indizes (für Tempo)

```mermaid
flowchart LR
  A[idx_activities_date] -->|"activities(date)"| DB
  B[idx_activities_priority] -->|"activities(priority)"| DB
  C[idx_activities_completed] -->|"activities(completed)"| DB
  D[idx_activities_date_source] -->|"activities(date, source)"| DB
  E[idx_activities_batch] -->|"activities(batch_id)"| DB
```

- **Schnelles Listing**: nach Datum, Status, Quelle (z. B. „heute“, „überfällig“, „Zeitansagen“).
- **Gezieltes Aufräumen**: per `batch_id` ganze Gruppen (z. B. ein Zyklus-Set) schnell finden.

### 4.4 Beispiel-Datensatz (`activities`)

```json
{
  "id": "8a2f2e8b-0e7b-4b31-9a7a-9f2b1b5d2c4e",
  "title": "Arzttermin",
  "description": "Überweisung und Versichertenkarte",
  "date": "20251203",
  "time": "0930",
  "priority": "high",
  "completed": 0,
  "created_at": "2025-11-20T08:12:51Z",
  "updated_at": "2025-11-20T08:13:22Z",
  "reminders": "[0,15,60]",
  "rrule": null,
  "exdates": null,
  "done_dates": null,
  "source": "user",
  "sched_rev": 1,
  "batch_id": null
}
```

### 4.5 Häufige Fragen

- **Warum sind Datum/Uhrzeit als Text gespeichert?**  
  Für schnelle Indizes/Sortierung und robuste Vergleiche (z. B. `WHERE date='20251203'`).

- **Kann ich die DB außerhalb der App öffnen?**  
  Ja, mit einem SQLite-Viewer. Der Pfad ist i. d. R. nur per ADB/Root erreichbar. Der **Kopieren**-Button im Info-Dialog genügt in der Regel für Support.

### 4.6 Für Technik-Fans (wie wird geplant?)
- Benachrichtigungen werden mit einer **deterministischen ID** aus `id + date + offsetMin` geplant.  
- Jede geplante Erinnerung trägt eine **Payload** (u. a. `activity_id`, `ymd`, `source`, `sched_rev`).  
- Beim Aufräumen kann die App so **zielsicher** alle zugehörigen Alarme finden und **abbrechen/neu planen** – auch bei Serien, Zeitansagen und Zyklus-Sets.

### 4.7 Installation & Deinstallation (Android)

**Wie wird die Datenbank angelegt?**  
- Beim **ersten Start** (bzw. beim ersten Zugriff auf die Datenbank) öffnet die App die SQLite-Datei über den `DatabaseHelper`.  
- Existiert die Datei noch nicht, wird sie **automatisch erstellt** (üblich: `.../data/data/<package>/databases/to_day.db`).  
- Im Zuge dessen werden die **Tabellen** (`activities`, `settings`) und benötigte **Spalten**/Indizes angelegt. Spätere App-Versionen führen **Migrationen** aus (fehlende Spalten werden ergänzt), ohne bestehende Daten zu verlieren.

**Welche Voraussetzungen braucht Android?**  
- **Keine zusätzlichen Berechtigungen nötig.** Die Daten liegen im **app-internen Speicher** (keine „Dateizugriff“-Runtime-Permission erforderlich).  
- Android bringt **SQLite** systemseitig mit; Pfade liefert Flutter über `path_provider`.  
- Es muss **ausreichend freier Speicherplatz** vorhanden sein.

**Was passiert bei der Deinstallation?**  
- Android löscht den kompletten **App-Sandbox-Bereich** automatisch, inklusive der Datenbank unter `.../data/data/<package>/databases/to_day.db`.  
- Auch geplante **Benachrichtigungen/Alarme** der App werden vom System verworfen, da das Paket nicht mehr vorhanden ist.  
- Es bleiben **keine Reste** der App-Datenbank im System zurück – das Gerät ist diesbezüglich **sauber**.

### 4.8 Weitere gespeicherte App-Parameter (außerhalb der Datenbank)

> Zusätzlich zur SQLite-Datenbank speichert ToDay einige Parameter **geräteintern** (Sandbox). Alles liegt im App-Bereich und wird bei **Deinstallation automatisch entfernt**.

#### 4.8.1 Shared Preferences (Key/Value, Klartext)
- **Ort**: App-Sandbox (`/data/data/<package>/shared_prefs/...`) – intern, ohne Root/ADB nicht direkt zugänglich.  
- **Typ**: Kleine Einstellungen/Flags als **Key/Value** (String, Bool, Int).  
- **Beispiele (können je nach Version variieren):**

| Key                                  | Typ    | Beispiel         | Beschreibung |
|--------------------------------------|--------|------------------|--------------|
| `ui.theme`                           | String | `system`         | Erscheinungsbild: `light`/`dark`/`system`. |
| `locale.override`                    | String | `de`             | App-Sprache erzwingen (sonst System). |
| `home.last_open_date`                | String | `20251203`       | Letztverwendetes Datum im Hauptbildschirm. |
| `cleanup.only_open.default`          | Bool   | `true`           | Vorauswahl im Aufräumen-Dialog. |
| `cleanup.cancel_schedules.default`   | Bool   | `true`           | Vorauswahl für „Alarme stornieren“. |
| `tts.rate`                           | Int    | `12`             | Sprechgeschwindigkeit (z. B. Wörter/Min oder %-Skala). |
| `tts.pitch`                          | Int    | `0`              | Tonhöhe-Offset. |
| `time_announce.enabled`              | Bool   | `true`           | Zeitansagen an/aus. |
| `weather.units.temp`                 | String | `C`              | Temperatureinheit (z. B. `C`). |
| `weather.units.humidity`             | String | `%`              | Anzeigeeinheit rel. Feuchte. |

> **Hinweis:** Diese Werte sind **keine sensiblen Geheimnisse**; sie dienen der schnellen Initialisierung des UI und Nutzerkomfort.

#### 4.8.2 Secure Storage (verschlüsselt)
- **Ort**: App-Sandbox, über Android Keystore abgesichert (Plugin `flutter_secure_storage`).  
- **Typ**: **Sensible** Schlüssel/Werte, verschlüsselt gespeichert.  
- **Beispiele:**

| Key                    | Typ    | Beispiel              | Beschreibung |
|------------------------|--------|-----------------------|--------------|
| `auth.token`           | String | `…`                   | Zugangstoken (falls ein externer Dienst genutzt wird). |
| `privacy.consent`      | Bool   | `true`                | Merker für Einwilligungen (z. B. TTS/Netzfunktionen). |
| `tts.voice.id`         | String | `de-DE-Standard-A`    | Gewählte Stimme, falls geschützt abgelegt. |

> **Hinweis:** Nicht jede Installation nutzt alle Schlüssel; Einträge werden **bedarfsgesteuert** angelegt.

#### 4.8.3 Plugin-/Systemspeicher
Einige Bibliotheken verwalten eigene, app-interne Daten:
- **Awesome Notifications**: persistiert geplante & aktive Benachrichtigungen (inkl. Payload) im App-Bereich.  
  - Wird im **Aufräumen**/„Neu aufbauen“ konsistent bereinigt/neu befüllt.  
- **Image-/Netz-Cache** (z. B. `extended_image` / HTTP-Cache): Zwischenspeicher im **Cache-Verzeichnis** der App.  
  - Kann vom System oder über App-Wartung geleert werden.  
- **Temporary Files**: Kurzlebige Dateien (z. B. Exporte während des Speicherns), liegen im **Temp-/Cache-Pfad**.

#### 4.8.4 Exporte/Backups (optional)
- Wenn du Daten **exportierst**, speichert ToDay die exportierten Dateien im **vom Nutzer gewählten Ordner** (z. B. „Downloads“).  
- Diese Dateien liegen **außerhalb** der App-Sandbox und bleiben auch nach Deinstallation erhalten, bis du sie selbst löschst.

#### 4.8.5 Lösch- & Backup-Verhalten
- **App-Daten löschen** (Systemeinstellung) entfernt: Datenbank, Shared Preferences, Secure Storage, Plugin-Daten, Cache.  
- **Deinstallation** entspricht effektiv „Alles löschen“.  
- **System-Backups** (falls aktiv) können Einstellungen/Prefs wiederherstellen; sicherheitskritische Inhalte im Secure Storage werden i. d. R. **nicht** zwischen Geräten migriert.

#### 4.8.6 Datenschutz
- Keine Telemetrie standardmäßig.  
- Alle Daten verbleiben **lokal** auf dem Gerät, außer du exportierst/synchronisierst sie bewusst.

---

## 5) Benachrichtigungen
Status-Chips zeigen, ob alle Voraussetzungen erfüllt sind:
- **Erlaubt** – Systemberechtigung für Benachrichtigungen ist erteilt.
- **Exakte Alarme** – erlaubt, damit Erinnerungen **pünktlich** auslösen dürfen.
- **Akku-Optimierung ignoriert** – verhindert Drosselung im Hintergrund.

> Wenn einer der Schalter **aus** ist, können Erinnerungen **zu spät** oder **gar nicht** kommen. Öffne die entsprechenden System-Einstellungen und erlaube die Option.

---

## 6) Aktionen
- **Kopieren**: Kopiert alle angezeigten Informationen in die Zwischenablage (für Support/Fehlerbericht).
- **Schließen**: Beendet den Dialog.

---

## 7) Tipps & Fehlerbehebung
- Nach Änderungen an Rechten/Alarmen in den **Einstellungen** ggf. **„Benachrichtigungen neu aufbauen“** ausführen.
- Prüfe zusätzlich Ruhezeiten, „Nicht stören“ und Internet-Verbindung (für DWD/Pollen).
- Bei Support-Anfragen den kopierten **Info-Block** mit senden.
