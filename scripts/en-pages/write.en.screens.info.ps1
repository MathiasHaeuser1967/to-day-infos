function Write-En-Screen-Info {
  $p = Join-Path $Screens 'info.md'
  $c = @'
# Info

The dialog shows technical information about the app, the system, the database, and the notification status. Helpful for support and diagnostics.

---

## 1) Invocation & Purpose
- Open via the app **menu**.  
- Quick overview for **support** (copy function) and **troubleshooting**.  

---

## 2) App
- **App**: name and **version** (e.g., 1.0.5.1) with **channel** (*Release*, *Beta*, *Debug*).  

---

## 3) System
- **Operating system**: Android build of the device (e.g., `android AQ3A.240912.001`).  
- **Package ID**: unique package identifier of the app (e.g., `de.mathiashaeuser.today`).  

---

## 4) Database
- **SQLite**: SQLite version in use.  
- **DB path**: directory of the app database on the device.  
- **DB file**: full path to the database file (e.g., `.../databases/to_day.db`).  
- **DB name**: logical name (e.g., `to_day.db`).  
- **Number of entries**: total number of records (short overview).  
- **Tables**: number of tables in the database.  

> Note: For security reasons, the path is usually not directly accessible (without root/adb). For analysis the **Copy** button is sufficient.

### 4.1 Structure (Overview)

```mermaid
erDiagram
  ACTIVITIES {
    TEXT id PK "e.g., UUID"
    TEXT title "Title of the activity"
    TEXT description "Description (optional)"
    TEXT date "YYYYMMDD, e.g., 20251012"
    TEXT time "HHmm, e.g., 0930"
    TEXT priority "low|medium|high (Default: medium)"
    INTEGER completed "0/1 (open/done)"
    TEXT created_at "ISO timestamp"
    TEXT updated_at "ISO timestamp"
    TEXT reminders "JSON: [OffsetMinutes]"
    TEXT rrule "RFC RRULE (optional)"
    TEXT exdates "JSON: [YYYYMMDD] (optional)"
    TEXT done_dates "JSON: [YYYYMMDD] (optional)"
    TEXT source "user|system:cycle|system:time_announce"
    INTEGER sched_rev "Scheduling revision (Default: 1)"
    TEXT batch_id "Batch grouping (optional)"
  }

  SETTINGS {
    TEXT key PK
    TEXT value
    INTEGER updated_at "Epoch ms"
  }
```
- **`activities`** holds all tasks/appointments including reminders, repeats, and metadata.  
- **`settings`** is a slim key/value table for app settings (e.g., flags and timestamps).  

### 4.2 Tables in Detail

#### `activities` – your tasks

| Field         | Type    | Required | Example            | Purpose |
|---------------|---------|:--------:|--------------------|---------|
| `id`          | TEXT PK | ✅       | `3f1a…-uuid`       | Unique ID of the activity. |
| `title`       | TEXT    | ✅       | "Doctor appointment" | Short title / name. |
| `description` | TEXT    | –        | "Referral..."      | Details/notes. |
| `date`        | TEXT    | ✅       | `20251012`         | Date in **YYYYMMDD** format. |
| `time`        | TEXT    | ✅       | `0930`             | Time in **HHmm** format. |
| `priority`    | TEXT    | ✅       | `low/medium/high`  | Priority (Default: `medium`). |
| `completed`   | INTEGER | ✅       | `0` / `1`          | Whether done (`1`) or open (`0`). |
| `created_at`  | TEXT    | ✅       | `2025-10-12T08:40:21Z` | Created timestamp (ISO-8601). |
| `updated_at`  | TEXT    | ✅       | `2025-10-12T08:45:07Z` | Last change (ISO-8601). |
| `reminders`   | TEXT    | –        | `[0,15,60]`        | JSON list of **offset minutes** before start. |
| `rrule`       | TEXT    | –        | `FREQ=DAILY;COUNT=10` | **RFC RRULE** for repeats. |
| `exdates`     | TEXT    | –        | `["20251015"]`     | JSON list of **excluded** occurrences (YYYYMMDD). |
| `done_dates`  | TEXT    | –        | `["20251012"]`     | JSON list of **completed** occurrences (for series). |
| `source`      | TEXT    | ✅       | `user` / `system:cycle` / `system:time_announce` | Origin: manual or system features. |
| `sched_rev`   | INTEGER | ✅       | `1`                | **Scheduling revision** for reschedule/sync. |
| `batch_id`    | TEXT    | –        | `time:20251012`    | **Batch ID** for grouping. |

**Notes & Formats**
- **Date/time** as compact strings → fast comparisons & indexes.  
- **Reminders (`reminders`)**: supported offsets: `0, 5, 10, 15, 30, 60, 120`.  
- **Repeats (`rrule`)**: standard RRULE (e.g., `FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8`).  
  Exceptions in `exdates`, completed series occurrences in `done_dates`.
- **Sources (`source`)**: `user`, `system:cycle`, `system:time_announce`.  
- **Revision (`sched_rev`)**: increases when schedules are rebuilt.  
- **Batch (`batch_id`)**: groups related items.  

#### `settings` – App Settings

| Field        | Type    | Required | Example                 | Purpose |
|--------------|---------|:--------:|-------------------------|---------|
| `key`        | TEXT PK | ✅       | `time_announce.enabled` | Settings key |
| `value`      | TEXT    | –        | `true` / `{"wpm":12}`   | Value as text/JSON |
| `updated_at` | INTEGER | –        | `1734012345678`         | Unix millis of last change |

**Example Keys**  
`time_announce.enabled`, `time_announce.cadence`, `tts.voice`, `weather.alerts.enabled`, `pollen.alerts.enabled`, `locale`, `theme.mode`, …

### 4.3 Indexes (for Speed)

```mermaid
flowchart LR
  A[idx_activities_date] -->|"activities(date)"| DB
  B[idx_activities_priority] -->|"activities(priority)"| DB
  C[idx_activities_completed] -->|"activities(completed)"| DB
  D[idx_activities_date_source] -->|"activities(date, source)"| DB
  E[idx_activities_batch] -->|"activities(batch_id)"| DB
```
- **Fast listing**: by date, status, source (e.g., "today", "overdue", "time announcements").  
- **Targeted cleanup**: quickly find whole groups via `batch_id` (e.g., a cycle set).  

### 4.4 Example Record (`activities`)

```json
{
  "id": "8a2f2e8b-0e7b-4b31-9a7a-9f2b1b5d2c4e",
  "title": "Doctor appointment",
  "description": "Referral and insurance card",
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

### 4.5 Frequently Asked Questions

- **Why are date/time stored as text?**  
  For fast indexes/sorting and robust comparisons (e.g., `WHERE date='20251203'`).

- **Can I open the DB outside the app?**  
  Yes, with a SQLite viewer. The path is usually only reachable via ADB/root. The **Copy** button in the info dialog is generally sufficient for support.

### 4.6 For Tech Fans (How is Scheduling Done?)
- Notifications are scheduled with a **deterministic ID** from `id + date + offsetMin`.  
- Each scheduled reminder carries a **payload** (including `activity_id`, `ymd`, `source`, `sched_rev`).  
- During cleanup the app can **reliably** find all related alarms and **cancel/reschedule** them – including series, time announcements, and cycle sets.  

### 4.7 Installation & Uninstallation (Android)

**How is the database created?**  
- On **first launch** (or first DB access) the app opens the SQLite file via the `DatabaseHelper`.  
- If the file does not yet exist, it is created **automatically** (typically `.../data/data/<package>/databases/to_day.db`).  
- In the process, the **tables** (`activities`, `settings`) and required **columns**/indexes are created. Later app versions run **migrations** (missing columns are added) without losing existing data.  

**What does Android require?**  
- **No additional permissions needed.** Data is stored in **app-internal storage** (no runtime "file access" permission required).  
- Android ships with **SQLite**; Flutter provides paths via `path_provider`.  
- There must be **enough free storage** available.  

**What happens on uninstall?**  
- Android automatically deletes the entire **app sandbox**, including the database under `.../data/data/<package>/databases/to_day.db`.  
- Scheduled **notifications/alarms** of the app are also discarded by the system, since the package no longer exists.  
- **No remnants** of the app database remain in the system – the device is **clean** in this respect.  

---

### 4.8 Further Stored App Parameters (Outside the Database)

> In addition to the SQLite database, ToDay stores some parameters **on-device** (sandbox). Everything lives in the app area and is **automatically removed on uninstall**.

#### 4.8.1 Shared Preferences (Key/Value, Plain Text)

* **Location**: app sandbox (`/data/data/<package>/shared_prefs/...`) – internal, not directly accessible without root/ADB.  
* **Type**: small settings/flags as **key/value** (string, bool, double, int).  

**TTS (Unified Schema)**

| Key             | Type    | Example                 | Description                                                 |
|-----------------|---------|-------------------------|-------------------------------------------------------------|
| `tts.enabled`   | Bool    | `true`                  | TTS global on/off.                                          |
| `tts.engine`    | String  | `com.google.android.tts`| Engine reported by the system; shown in the app.            |
| `tts.locale`    | String  | `de-DE`                 | Language in `ll-CC` format (hyphen, normalized).            |
| `tts.voiceName` | String  | `German Germany`        | Exact display name from `getVoices`.                        |
| `tts.rate`      | Double  | `1.0`                   | Speech rate `0.20–1.00`.                                    |
| `tts.pitch`     | Double  | `1.0`                   | Pitch `0.50–1.50`.                                          |
| `tts.volume`    | Double  | `1.0`                   | Volume `0.00–1.00`.                                         |

**Gamification – Spoken Sentences**

| Key                       | Type                 | Example                                            | Description                                                                 |
|---------------------------|----------------------|----------------------------------------------------|-----------------------------------------------------------------------------|
| `tts.gamify.sentences.de` | String (JSON list)   | `["You're cleaning up like a boss.", "..."]`       | Custom **DE** sentences. Empty/invalid list → fallback to L10N. (German version only) |
| `tts.gamify.sentences.en` | String (JSON list)   | `["You're cleaning up like a boss.", "..."]`       | Custom **EN** sentences. Empty/invalid list → fallback to L10N.             |

**Background Animation (Lottie, per Month)**

| Key               | Type    | Example                                                      | Description                                                                 |
|-------------------|---------|--------------------------------------------------------------|-----------------------------------------------------------------------------|
| `lottie.default`  | String  | `assets/lottie/Cat playing animation.json`                   | Default animation (**full asset path**).                                   |
| `lottie.month.01` | String  | `assets/lottie/Happy snowman jumping and waving his hand.json`| Month mapping January (**full asset path**).                               |
| … `lottie.month.12` | String  | `assets/lottie/Thanksgiving Basket.json`                    | Month mapping December (**full asset path**). Missing key → inherits default. |
| `lottie.month.MM` | String  | `"<none>"`                                                   | **No image** for month `MM` (animation explicitly disabled).                |

> **UI note:** In the picker the visible text can hide the `assets/lottie/` path prefix. The **full** asset path is always stored.

**Further Examples (not TTS/Lottie/Gamification):**

| Key                                | Type    | Example   | Description                               |
|------------------------------------|---------|-----------|-------------------------------------------|
| `ui.theme`                         | String  | `system`  | Appearance: `light`/`dark`/`system`.      |
| `locale.override`                  | String  | `de`      | Force app language (otherwise system).    |
| `home.last_open_date`              | String  | `20251203`| Last used date on the main screen.        |
| `cleanup.only_open.default`        | Bool    | `true`    | Default selection in the cleanup dialog.  |
| `cleanup.cancel_schedules.default` | Bool    | `true`    | Default for "Cancel alarms".               |
| `time_announce.enabled`            | Bool    | `true`    | Time announcements on/off.                 |
| `weather.units.temp`               | String  | `C`       | Temperature unit.                          |
| `typography.fontFamily`            | String  | `system`  | Font family: `system`/`inter`/`robotoSlab`/`openDyslexic`. |
| `typography.textScaleFactor`       | Double  | `1.0`     | Text size scale factor (0.8–1.5).         |

#### 4.8.2 Secure Storage (Encrypted)

* **Location**: app sandbox, secured via Android Keystore (plugin `flutter_secure_storage`).  
* **Type**: **sensitive** keys/values, stored encrypted.  

| Key               | Type    | Example | Description                  |
|-------------------|---------|---------|------------------------------|
| `auth.token`      | String  | `…`     | Access token (if used).       |
| `privacy.consent` | Bool    | `true`  | Flag for consents.            |

> **Note:** TTS, gamification and Lottie settings are **not** stored in Secure Storage, but in **Shared Preferences** (see above).

#### 4.8.3 Plugin/System Storage

* **Awesome Notifications**: persists scheduled & active notifications (incl. payload) in the app area; is cleaned/rebuilt consistently via **Cleanup**/"Rebuild".  
* **Image/network cache**: temporary files in the app **cache directory**.  
* **Temporary files**: short-lived files (e.g., exports) in the **temp/cache path**.  

#### 4.8.4 Exports/Backups (Optional)

* Exported files live in the **folder chosen by the user** (e.g., "Downloads") and thus **outside** the app sandbox.  
* These files remain after uninstall until they are deleted manually.  

#### 4.8.5 Deletion & Backup Behavior

* **Clear app data** removes database, Shared Preferences, Secure Storage, plugin data and cache.  
* **Uninstall** effectively equals "delete everything".  
* **System backups** (if active) can restore settings/prefs; security-critical items in Secure Storage are typically **not** migrated between devices.  

#### 4.8.6 Privacy

* No telemetry by default.  
* All data remains **local** on the device unless you deliberately export/sync it.  

---

## 5) Notifications
Status chips show whether all prerequisites are met:
- **Allowed** – system permission for notifications is granted.  
- **Exact alarms** – allowed, so reminders may trigger **on time**.  
- **Battery optimization ignored** – prevents throttling in the background.  

> If one of the switches is **off**, reminders may arrive **too late** or **not at all**. Open the corresponding system settings and allow the option.

---

## 6) Actions
- **Copy**: copies all shown information to the clipboard (for support/bug report).  
- **Close**: closes the dialog.  

---

## 7) Tips & Troubleshooting
- After changes to permissions/alarms in **Settings**, consider running **"Rebuild notifications"**.  
- Also check quiet times, "Do Not Disturb" and internet connection (for DWD/pollen – German version only).  
- For support requests include the copied **info block**.  

---

## 8) Creating Android Debug Version

### 8.1 Requirements
- Android Studio with SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] and Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- USB Debugging on device [Enable developer options: Settings → About phone → Detailed info and specs → tap OS Version or MIUI Version 7 to 10 times until message appears that you are a developer. Enable USB Debugging: Settings → Additional settings → Developer options → Enable USB Debugging.]  

### 8.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 8.3 Prepare Project
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 8.4 Start Debug
```
flutter run
```

---

## 9) Creating Android Release Version

### 9.1 Requirements
- Android Studio with SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] and Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- USB connected to device  

### 9.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 9.3 Prepare Project
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
flutter clean
flutter pub get
flutter gen-l10n
```

### 9.4 Start Release
```
flutter run --release
```

---

## 10) Creating Android AppBundle for Google Play Console

### 10.1 Requirements
- Android Studio with SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] and Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  
- X:\apps\to-day\android\key.properties  
- X:\apps\to-day\android\app\upload-keystore.jks  

### 10.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 10.3 Prepare Project
```
cd X:\apps\to-day\android
.\gradlew --stop
cd ..
cd X:\apps\to-day
.\gradlew --stop
taskkill /F /IM gradle* /T

# Delete project-related Gradle caches and builds
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

## 11) Creating Windows Debug Version

### 11.1 Requirements
- Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 11.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 11.3 Prepare Project
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
or

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

### 11.4 Start Debug
```
flutter run -d windows
```

---

## 12) Creating Windows Release Version

### 12.1 Requirements
- Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 12.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 12.3 Prepare Project
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
or

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

### 12.4 Start Release
```
flutter run -d windows --release
```

---

## 13) Creating Android Emulator Debug Version

### 13.1 Requirements
- Android Studio with SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] and Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 13.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 13.3 Prepare Project
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

### 13.4 Start Debug
```
flutter run -d emulator-5554
```

---

## 14) Creating Android Emulator Release Version

### 14.1 Requirements
- Android Studio with SDK [SDK Platform: Android 16.0 "Baklava", SDK Tool: 36.0.0] and Platform Tools [Flutter 3.32.8, Dart SDK version: 3.8.1]  

### 14.2 Check
```
flutter --version
dart --version
flutter doctor -v
```

### 14.3 Prepare Project
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

### 14.4 Start Release
```
flutter run --release -d emulator-5554
```

---

## 15) Recording App Log

### 15.1 Actions
- Restart device.  
- Record a clean app log so we can see real app errors.  

### 15.2 Commands to Record

```
adb logcat -c
adb logcat -v time -b all > log.txt
```
- Then trigger the problem. Afterwards check the file.  
- Filter only your app  

```
adb logcat -v time | Select-String -Pattern "FATAL EXCEPTION|de.mathiashaeuser.today"
```

'@
  Write-File $p $c
}
