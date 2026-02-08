# Info

Der Dialog zeigt technische Informationen zur App, zum System, zur Datenbank und zum Benachrichtigungs-Status. Hilfreich fÃ¼r Support und Diagnose.

---

## 1) Aufruf & Zweck
- Aufruf Ã¼ber das **MenÃ¼** der App.  
- Schneller Ãœberblick fÃ¼r **Support** (Kopierfunktion) und **Fehleranalyse**.  

---

## 2) App
- **App**: Name und **Version** (z. B. 1.0.5.1) mit **Kanal** (*Release*, *Beta*, *Debug*).  

---

## 3) System
- **Betriebssystem**: Android-Build des GerÃ¤ts (z. B. `android AQ3A.240912.001`).  
- **Package-ID**: Eindeutige Paketkennung der App (z. B. `de.mathiashaeuser.today`).  

---

## 4) Datenbank
- **SQLite**: verwendete SQLite-Version.  
- **DB-Pfad**: Verzeichnis der App-Datenbank auf dem GerÃ¤t.  
- **DB-Datei**: vollstÃ¤ndiger Pfad zur Datenbankdatei (z. B. `.../databases/to_day.db`).  
- **DB-Name**: logischer Name (z. B. `to_day.db`).  
- **Anzahl EintrÃ¤ge**: Summe der DatensÃ¤tze (KurzÃ¼berblick).  
- **Tabellen**: Anzahl der Tabellen in der Datenbank.  

> Hinweis: Der Pfad ist aus SicherheitsgrÃ¼nden i. d. R. nicht direkt zugÃ¤nglich (ohne Root/adb). FÃ¼r Analysen genÃ¼gt der **Kopieren**-Button.

### 4.1 Aufbau (Ãœberblick)

```mermaid
erDiagram
  ACTIVITIES {
    TEXT id PK "z. B. UUID"
    TEXT title "Titel der AktivitÃ¤t"
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
- **`activities`** hÃ¤lt alle Aufgaben/Termine inkl. Erinnerungen, Wiederholungen und Metadaten.  
- **`settings`** ist eine schlanke Key/Value-Tabelle fÃ¼r App-Einstellungen (z. B. Flags und Zeitstempel).  

### 4.2 Tabellen im Detail

#### `activities` â€“ deine Aufgaben

| Feld         | Typ     | Pflicht | Beispiel           | WofÃ¼r gut |
|--------------|---------|:------:|--------------------|-----------|
| `id`         | TEXT PK | âœ…     | `3f1aâ€¦-uuid`       | Eindeutige ID der AktivitÃ¤t. |
| `title`      | TEXT    | âœ…     | â€žArztterminâ€œ       | Kurztitel / Name. |
| `description`| TEXT    | â€“      | â€žÃœberweisungâ€¦â€œ     | Details/Notizen. |
| `date`       | TEXT    | âœ…     | `20251012`         | Datum im Format **YYYYMMDD**. |
| `time`       | TEXT    | âœ…     | `0930`             | Uhrzeit im Format **HHmm**. |
| `priority`   | TEXT    | âœ…     | `low/medium/high`  | PrioritÃ¤t (Default: `medium`). |
| `completed`  | INTEGER | âœ…     | `0` / `1`          | Ob erledigt (`1`) oder offen (`0`). |
| `created_at` | TEXT    | âœ…     | `2025-10-12T08:40:21Z` | Erstellt-Zeitpunkt (ISO-8601). |
| `updated_at` | TEXT    | âœ…     | `2025-10-12T08:45:07Z` | Letzte Ã„nderung (ISO-8601). |
| `reminders`  | TEXT    | â€“      | `[0,15,60]`        | JSON-Liste von **Offset-Minuten** vor Start. |
| `rrule`      | TEXT    | â€“      | `FREQ=DAILY;COUNT=10` | **RFC RRULE** fÃ¼r Wiederholungen. |
| `exdates`    | TEXT    | â€“      | `["20251015"]`     | JSON-Liste **ausgeklammerter** Vorkommen (YYYYMMDD). |
| `done_dates` | TEXT    | â€“      | `["20251012"]`     | JSON-Liste **erledigter** Vorkommen (bei Serien). |
| `source`     | TEXT    | âœ…     | `user` / `system:cycle` / `system:time_announce` | Herkunft: manuell oder System-Features. |
| `sched_rev`  | INTEGER | âœ…     | `1`                | **Planungs-Revision** zur Neuplanung/Abgleich. |
| `batch_id`   | TEXT    | â€“      | `time:20251012`    | **Batch-Kennung** zum Gruppieren. |

**Hinweise & Formate**
- **Datum/Uhrzeit** als kompakte Strings â†’ schnelle Vergleiche & Indizes.  
- **Erinnerungen (`reminders`)**: unterstÃ¼tzte Offsets: `0, 5, 10, 15, 30, 60, 120`.  
- **Wiederholungen (`rrule`)**: Standard-RRULE (z. B. `FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8`).  
  Ausnahmen in `exdates`, erledigte Serien-Vorkommen in `done_dates`.
- **Quellen (`source`)**: `user`, `system:cycle`, `system:time_announce`.  
- **Revision (`sched_rev`)**: erhÃ¶ht sich bei Neuaufbau von Planungen.  
- **Batch (`batch_id`)**: gruppiert zusammengehÃ¶rige Items.  

#### `settings` â€“ App-Einstellungen

| Feld        | Typ     | Pflicht | Beispiel                 | WofÃ¼r gut |
|-------------|---------|:------:|--------------------------|-----------|
| `key`       | TEXT PK | âœ…     | `time_announce.enabled`  | Einstellungs-SchlÃ¼ssel |
| `value`     | TEXT    | â€“      | `true` / `{"wpm":12}`    | Wert als Text/JSON |
| `updated_at`| INTEGER | â€“      | `1734012345678`          | Unix-Millis der letzten Ã„nderung |

**Beispiele fÃ¼r Keys**  
`time_announce.enabled`, `time_announce.cadence`, `tts.voice`, `weather.alerts.enabled`, `pollen.alerts.enabled`, `locale`, `theme.mode`, â€¦

### 4.3 Indizes (fÃ¼r Tempo)

```mermaid
flowchart LR
  A[idx_activities_date] -->|"activities(date)"| DB
  B[idx_activities_priority] -->|"activities(priority)"| DB
  C[idx_activities_completed] -->|"activities(completed)"| DB
  D[idx_activities_date_source] -->|"activities(date, source)"| DB
  E[idx_activities_batch] -->|"activities(batch_id)"| DB
```
- **Schnelles Listing**: nach Datum, Status, Quelle (z. B. â€žheuteâ€œ, â€žÃ¼berfÃ¤lligâ€œ, â€žZeitansagenâ€œ).  
- **Gezieltes AufrÃ¤umen**: per `batch_id` ganze Gruppen (z. B. ein Zyklus-Set) schnell finden.  

### 4.4 Beispiel-Datensatz (`activities`)

```json
{
  "id": "8a2f2e8b-0e7b-4b31-9a7a-9f2b1b5d2c4e",
  "title": "Arzttermin",
  "description": "Ãœberweisung und Versichertenkarte",
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

### 4.5 HÃ¤ufige Fragen

- **Warum sind Datum/Uhrzeit als Text gespeichert?**  
  FÃ¼r schnelle Indizes/Sortierung und robuste Vergleiche (z. B. `WHERE date='20251203'`).

- **Kann ich die DB auÃŸerhalb der App Ã¶ffnen?**  
  Ja, mit einem SQLite-Viewer. Der Pfad ist i. d. R. nur per ADB/Root erreichbar. Der **Kopieren**-Button im Info-Dialog genÃ¼gt in der Regel fÃ¼r Support.

### 4.6 FÃ¼r Technik-Fans (wie wird geplant?)
- Benachrichtigungen werden mit einer **deterministischen ID** aus `id + date + offsetMin` geplant.  
- Jede geplante Erinnerung trÃ¤gt eine **Payload** (u. a. `activity_id`, `ymd`, `source`, `sched_rev`).  
- Beim AufrÃ¤umen kann die App so **zielsicher** alle zugehÃ¶rigen Alarme finden und **abbrechen/neu planen** â€“ auch bei Serien, Zeitansagen und Zyklus-Sets.  

### 4.7 Installation & Deinstallation (Android)

**Wie wird die Datenbank angelegt?**  
- Beim **ersten Start** (bzw. beim ersten Zugriff auf die Datenbank) Ã¶ffnet die App die SQLite-Datei Ã¼ber den `DatabaseHelper`.  
- Existiert die Datei noch nicht, wird sie **automatisch erstellt** (Ã¼blich: `.../data/data/<package>/databases/to_day.db`).  
- Im Zuge dessen werden die **Tabellen** (`activities`, `settings`) und benÃ¶tigte **Spalten**/Indizes angelegt. SpÃ¤tere App-Versionen fÃ¼hren **Migrationen** aus (fehlende Spalten werden ergÃ¤nzt), ohne bestehende Daten zu verlieren.  

**Welche Voraussetzungen braucht Android?**  
- **Keine zusÃ¤tzlichen Berechtigungen nÃ¶tig.** Die Daten liegen im **app-internen Speicher** (keine â€žDateizugriffâ€œ-Runtime-Permission erforderlich).  
- Android bringt **SQLite** systemseitig mit; Pfade liefert Flutter Ã¼ber `path_provider`.  
- Es muss **ausreichend freier Speicherplatz** vorhanden sein.  

**Was passiert bei der Deinstallation?**  
- Android lÃ¶scht den kompletten **App-Sandbox-Bereich** automatisch, inklusive der Datenbank unter `.../data/data/<package>/databases/to_day.db`.  
- Auch geplante **Benachrichtigungen/Alarme** der App werden vom System verworfen, da das Paket nicht mehr vorhanden ist.  
- Es bleiben **keine Reste** der App-Datenbank im System zurÃ¼ck â€“ das GerÃ¤t ist diesbezÃ¼glich **sauber**.  

---

### 4.8 Weitere gespeicherte App-Parameter (auÃŸerhalb der Datenbank)

> ZusÃ¤tzlich zur SQLite-Datenbank speichert ToDay einige Parameter **gerÃ¤teintern** (Sandbox). Alles liegt im App-Bereich und wird bei **Deinstallation automatisch entfernt**.

#### 4.8.1 Shared Preferences (Key/Value, Klartext)

* **Ort**: App-Sandbox (`/data/data/<package>/shared_prefs/...`) â€“ intern, ohne Root/ADB nicht direkt zugÃ¤nglich.  
* **Typ**: Kleine Einstellungen/Flags als **Key/Value** (String, Bool, Double, Int).  

**TTS (vereinheitlichtes Schema)**

| Key             | Typ    | Beispiel                 | Beschreibung                                                 |
|-----------------|--------|--------------------------|--------------------------------------------------------------|
| `tts.enabled`   | Bool   | `true`                   | TTS global an/aus.                                           |
| `tts.engine`    | String | `com.google.android.tts` | Vom System gemeldete Engine; Anzeige in der App.             |
| `tts.locale`    | String | `de-DE`                  | Sprache im Format `ll-CC` (Bindestrich, normiert).           |
| `tts.voiceName` | String | `German Germany`         | Exakter Anzeigename aus `getVoices`.                         |
| `tts.rate`      | Double | `1.0`                    | Sprechtempo `0.20â€“1.00`.                                     |
| `tts.pitch`     | Double | `1.0`                    | TonhÃ¶he `0.50â€“1.50`.                                         |
| `tts.volume`    | Double | `1.0`                    | LautstÃ¤rke `0.00â€“1.00`.                                      |

**Gamification â€“ gesprochene SÃ¤tze**

| Key                       | Typ                 | Beispiel                                            | Beschreibung                                                                 |
|---------------------------|---------------------|-----------------------------------------------------|-------------------------------------------------------------------------------|
| `tts.gamify.sentences.de` | String (JSON-Liste) | `["Du rÃ¤umst auf wie ein Boss.", "â€¦"]`              | Benutzerdefinierte **DE**-SÃ¤tze. Leere/ungÃ¼ltige Liste â†’ Fallback auf L10N.   |
| `tts.gamify.sentences.en` | String (JSON-Liste) | `["You're cleaning up like a boss.", "â€¦"]`          | Benutzerdefinierte **EN**-SÃ¤tze. Leere/ungÃ¼ltige Liste â†’ Fallback auf L10N.   |

**Hintergrund-Animation (Lottie, pro Monat)**

| Key               | Typ    | Beispiel                                                      | Beschreibung                                                                 |
|-------------------|--------|---------------------------------------------------------------|-------------------------------------------------------------------------------|
| `lottie.default`  | String | `assets/lottie/Cat playing animation.json`                    | Standard-Animation (**voller Asset-Pfad**).                                   |
| `lottie.month.01` | String | `assets/lottie/Happy snowman jumping and waving his hand.json`| Monatszuordnung Januar (**voller Asset-Pfad**).                               |
| â€¦ `lottie.month.12` | String | `assets/lottie/Thanksgiving Basket.json`                   | Monatszuordnung Dezember (**voller Asset-Pfad**). Fehlender Key â†’ erbt Standard. |
| `lottie.month.MM` | String | `"<none>"`                                                    | **Kein Bild** fÃ¼r Monat `MM` (Animation explizit deaktiviert).                |

> **UI-Hinweis:** In der Auswahl kann der sichtbare Text den Pfadteil `assets/lottie/` ausblenden. Gespeichert wird stets der **vollstÃ¤ndige** Asset-Pfad.

**Weitere Beispiele (nicht TTS/Lottie/Gamification):**

| Key                                | Typ    | Beispiel   | Beschreibung                               |
|------------------------------------|--------|------------|--------------------------------------------|
| `ui.theme`                         | String | `system`   | Erscheinungsbild: `light`/`dark`/`system`. |
| `locale.override`                  | String | `de`       | App-Sprache erzwingen (sonst System).      |
| `home.last_open_date`              | String | `20251203` | Letztverwendetes Datum im Hauptbildschirm. |
| `cleanup.only_open.default`        | Bool   | `true`     | Vorauswahl im AufrÃ¤umen-Dialog.            |
| `cleanup.cancel_schedules.default` | Bool   | `true`     | Vorauswahl fÃ¼r â€žAlarme stornierenâ€œ.        |
| `time_announce.enabled`            | Bool   | `true`     | Zeitansagen an/aus.                        |
| `weather.units.temp`               | String | `C`        | Temperatureinheit.                         |
| `typography.fontFamily`            | String | `system`   | Schriftart: `system`/`inter`/`robotoSlab`/`openDyslexic`. |
| `typography.textScaleFactor`       | Double | `1.0`      | SchriftgrÃ¶ÃŸen-Faktor (0.8â€“1.5). |

#### 4.8.2 Secure Storage (verschlÃ¼sselt)

* **Ort**: App-Sandbox, Ã¼ber Android Keystore abgesichert (Plugin `flutter_secure_storage`).  
* **Typ**: **Sensible** SchlÃ¼ssel/Werte, verschlÃ¼sselt gespeichert.  

| Key               | Typ    | Beispiel | Beschreibung                  |
|-------------------|--------|----------|-------------------------------|
| `auth.token`      | String | `â€¦`      | Zugangstoken (falls genutzt). |
| `privacy.consent` | Bool   | `true`   | Merker fÃ¼r Einwilligungen.    |

> **Hinweis:** TTS-, Gamification- und Lottie-Einstellungen werden **nicht** im Secure Storage abgelegt, sondern in **Shared Preferences** (siehe oben).

#### 4.8.3 Plugin-/Systemspeicher

* **Awesome Notifications**: persistiert geplante & aktive Benachrichtigungen (inkl. Payload) im App-Bereich; wird im **AufrÃ¤umen**/â€žNeu aufbauenâ€œ konsistent bereinigt/neu befÃ¼llt.  
* **Image-/Netz-Cache**: Zwischenspeicher im **Cache-Verzeichnis** der App.  
* **Temporary Files**: Kurzlebige Dateien (z. B. Exporte) im **Temp-/Cache-Pfad**.  

#### 4.8.4 Exporte/Backups (optional)

* Exportierte Dateien liegen im **vom Nutzer gewÃ¤hlten Ordner** (z. B. â€žDownloadsâ€œ) und damit **auÃŸerhalb** der App-Sandbox.  
* Diese Dateien bleiben auch nach Deinstallation erhalten, bis sie manuell gelÃ¶scht werden.  

#### 4.8.5 LÃ¶sch- & Backup-Verhalten

* **App-Daten lÃ¶schen** entfernt Datenbank, Shared Preferences, Secure Storage, Plugin-Daten und Cache.  
* **Deinstallation** entspricht effektiv â€žAlles lÃ¶schenâ€œ.  
* **System-Backups** (falls aktiv) kÃ¶nnen Einstellungen/Prefs wiederherstellen; sicherheitskritische Inhalte im Secure Storage werden i. d. R. **nicht** zwischen GerÃ¤ten migriert.  

#### 4.8.6 Datenschutz

* Keine Telemetrie standardmÃ¤ÃŸig.  
* Alle Daten verbleiben **lokal** auf dem GerÃ¤t, auÃŸer du exportierst/synchronisierst sie bewusst.  

---

## 5) Benachrichtigungen
Status-Chips zeigen, ob alle Voraussetzungen erfÃ¼llt sind:
- **Erlaubt** â€“ Systemberechtigung fÃ¼r Benachrichtigungen ist erteilt.  
- **Exakte Alarme** â€“ erlaubt, damit Erinnerungen **pÃ¼nktlich** auslÃ¶sen dÃ¼rfen.  
- **Akku-Optimierung ignoriert** â€“ verhindert Drosselung im Hintergrund.  

> Wenn einer der Schalter **aus** ist, kÃ¶nnen Erinnerungen **zu spÃ¤t** oder **gar nicht** kommen. Ã–ffne die entsprechenden System-Einstellungen und erlaube die Option.

---

## 6) Aktionen
- **Kopieren**: Kopiert alle angezeigten Informationen in die Zwischenablage (fÃ¼r Support/Fehlerbericht).  
- **SchlieÃŸen**: Beendet den Dialog.  

---

## 7) Tipps & Fehlerbehebung
- Nach Ã„nderungen an Rechten/Alarmen in den **Einstellungen** ggf. **â€žBenachrichtigungen neu aufbauenâ€œ** ausfÃ¼hren.  
- PrÃ¼fe zusÃ¤tzlich Ruhezeiten, â€žNicht stÃ¶renâ€œ und Internet-Verbindung (fÃ¼r DWD/Pollen).  
- Bei Support-Anfragen den kopierten **Info-Block** mit senden.  

---

## 8) Android Debug Version erstellen

### 8.1 Voraussetzungen
- Android Studio mit SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] und Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- USB Debugging am GerÃ¤t [Entwickleroptionen aktivieren: Einstellungen â†’ Ãœber das Telefon â†’ Detaillierte Infos und Spezifikationen â†’ auf OS Version oder MIUI Version 7 bis 10 mal tippen, bis die Meldung kommt, dass du Entwickler bist. USB Debugging einschalten: Einstellungen â†’ ZusÃ¤tzliche Einstellungen â†’ Entwickleroptionen â†’ USB Debugging aktivieren.]  

### 8.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 8.3 Projekt vorbereiten
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 8.4 Debug starten
```
flutter run
```

---

## 9) Android Release Version erstellen

### 9.1 Voraussetzungen
- Android Studio mit SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] und Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- USB am GerÃ¤t  

### 9.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 9.3 Projekt vorbereiten
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 9.4 Release starten
```
flutter run --release
```

---

## 10) Android AppBundle fÃ¼r Google Play Console erstellen

### 10.1 Voraussetzungen
- Android Studio mit SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] und Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- X:\apps\to-day\android\key.properties  
- X:\apps\to-day\android\app\upload-keystore.jks  

### 10.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 10.3 Projekt vorbereiten
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
.\gradlew --stop
taskkill /F /IM gradle* /T

# Projektbezogene Gradle Caches und Builds lÃ¶schen
Remove-Item -Recurse -Force ".gradle" -ErrorAction Ignore
Remove-Item -Recurse -Force "app\build" -ErrorAction Ignore

cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
flutter build appbundle --release
```

---

## 11) Windows Debug Version erstellen

### 11.1 Voraussetzungen
- Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 11.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 11.3 Projekt vorbereiten
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day

$nuDir = "$env:USERPROFILE\nuget"
New-Item -ItemType Directory -Force $nuDir | Out-Null
Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile "$nuDir\nuget.exe"
$env:NUGET_EXE = "$nuDir\nuget.exe"
Test-Path $env:NUGET_EXE
flutter clean
Remove-Item -Recurse -Force .\windows\flutter\ephemeral -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .\build\windows -ErrorAction SilentlyContinue
flutter pub get
flutter gen-l10n
```
bzw.

```
cd X:\apps\to-day

$nuDir = "$env:USERPROFILE\nuget"
$env:Path = "$nuDir;$env:Path"
Set-Location X:\apps\to-day

flutter doctor -v
flutter clean
Remove-Item -Recurse -Force .\windows\flutter\ephemeral -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .\build\windows -ErrorAction SilentlyContinue
flutter pub get
flutter gen-l10n
```

### 11.4 Debug starten
```
flutter run -d windows
```

---

## 12) Windows Release Version erstellen

### 12.1 Voraussetzungen
- Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 12.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 12.3 Projekt vorbereiten
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day

$nuDir = "$env:USERPROFILE\nuget"
New-Item -ItemType Directory -Force $nuDir | Out-Null
Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile "$nuDir\nuget.exe"
$env:NUGET_EXE = "$nuDir\nuget.exe"
Test-Path $env:NUGET_EXE
flutter clean
Remove-Item -Recurse -Force .\windows\flutter\ephemeral -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .\build\windows -ErrorAction SilentlyContinue
flutter pub get
flutter gen-l10n
```
bzw.

```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day

$nuDir = "$env:USERPROFILE\nuget"
$env:Path = "$nuDir;$env:Path"
Set-Location X:\apps\to-day

flutter doctor -v
flutter clean
Remove-Item -Recurse -Force .\windows\flutter\ephemeral -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .\build\windows -ErrorAction SilentlyContinue
flutter pub get
flutter gen-l10n
```

### 12.4 Release starten
```
flutter run -d windows --release
```

---

## 13) Android Emulator Debug Version erstellen

### 13.1 Voraussetzungen
- Android Studio mit SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] und Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 13.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 13.3 Projekt vorbereiten
```
flutter emulators
flutter emulators --launch Medium_Phone_API_36.0
flutter devices

cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 13.4 Debug starten
```
flutter run -d emulator-5554
```

---

## 14) Android Emulator Release Version erstellen

### 14.1 Voraussetzungen
- Android Studio mit SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] und Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 14.2 PrÃ¼fen
```
flutter --version
dart --version
flutter doctor -v
```

### 14.3 Projekt vorbereiten
```
flutter emulators
flutter emulators --launch Medium_Phone_API_36.0
flutter devices

cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 14.4 Release starten
```
flutter run --release -d emulator-5554
```

---

## 15) App Log aufnehmen 

### 15.1 Handlungen
- GerÃ¤t neu starten.  
- Sauberes App Log aufnehmen, damit wir echte App Fehler sehen.  

### 15.2 Befehle zum Aufzeichnen

```
adb logcat -c
adb logcat -v time -b all > log.txt
```
- Dann Problem auslÃ¶sen. Danach Datei prÃ¼fen.  
- Nur deine App filtern  

```
adb logcat -v time | Select-String -Pattern "FATAL EXCEPTION|de.mathiashaeuser.today"
```



