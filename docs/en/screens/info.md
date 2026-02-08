# Info

The dialog shows technical information about the app, the system, the database, and the notification status. Helpful for support and diagnostics.

---

## 1) Invocation & purpose
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

### 4.1 Structure (overview)

```json
erDiagram
  ACTIVITIES {
    TEXT id PK "e.g., UUID"
    TEXT title "Title of the activity"
    TEXT description "Description (optional)"
    TEXT date "YYYYMMDD, e.g., 20251012"
    TEXT time "HHmm, e.g., 0930"
    TEXT priority "low|medium|high (default: medium)"
    INTEGER completed "0/1 (open/done)"
    TEXT created_at "ISO timestamp"
    TEXT updated_at "ISO timestamp"
    TEXT reminders "JSON: [offsetMinutes]"
    TEXT rrule "RFC RRULE (optional)"
    TEXT exdates "JSON: [YYYYMMDD] (optional)"
    TEXT done_dates "JSON: [YYYYMMDD] (optional)"
    TEXT source "user|system:cycle|system:time_announce"
    INTEGER sched_rev "Scheduling revision (default: 1)"
    TEXT batch_id "Batch grouping (optional)"
  }

  SETTINGS {
    TEXT key PK
    TEXT value
    INTEGER updated_at "Epoch ms"
  }
```
- **`activities`** holds all tasks/appointments incl. reminders, repeats and metadata.
- **`settings`** is a slim key/value table for app settings (e.g., flags and timestamps).

### 4.2 Tables in detail

#### `activities` &ndash; your tasks

| Field        | Type    | Required | Example            | Purpose |
|--------------|---------|:--------:|--------------------|---------|
| `id`         | TEXT PK | yes      | `3f1a…-uuid`       | Unique ID of the activity. |
| `title`      | TEXT    | yes      | "Doctor appointment" | Short title / name. |
| `description`| TEXT    | &ndash;  | "Referral..."      | Details/notes. |
| `date`       | TEXT    | yes      | `20251012`         | Date in **YYYYMMDD** format. |
| `time`       | TEXT    | yes      | `0930`             | Time in **HHmm** format. |
| `priority`   | TEXT    | yes      | `low/medium/high`  | Priority (default: `medium`). |
| `completed`  | INTEGER | yes      | `0` / `1`          | Whether done (`1`) or open (`0`). |
| `created_at` | TEXT    | yes      | `2025-10-12T08:40:21Z` | Created timestamp (ISO-8601). |
| `updated_at` | TEXT    | yes      | `2025-10-12T08:45:07Z` | Last change (ISO-8601). |
| `reminders`  | TEXT    | &ndash;  | `[0,15,60]`        | JSON list of **offset minutes** before start. |
| `rrule`      | TEXT    | &ndash;  | `FREQ=DAILY;COUNT=10` | **RFC RRULE** for repeats. |
| `exdates`    | TEXT    | &ndash;  | `["20251015"]`     | JSON list of **excluded** occurrences (YYYYMMDD). |
| `done_dates` | TEXT    | &ndash;  | `["20251012"]`     | JSON list of **completed** occurrences (for series). |
| `source`     | TEXT    | yes      | `user` / `system:cycle` / `system:time_announce` | Origin: manual or system features. |
| `sched_rev`  | INTEGER | yes      | `1`                | **Scheduling revision** for reschedule/sync. |
| `batch_id`   | TEXT    | &ndash;  | `time:20251012`    | **Batch ID** for grouping. |

**Notes & formats**
- **Date/time** as compact strings &rarr; fast comparisons & indexes.
- **Reminders (`reminders`)**: supported offsets: `0, 5, 10, 15, 30, 60, 120`.
- **Repeats (`rrule`)**: standard RRULE (e.g., `FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8`).  
  Exceptions in `exdates`, completed series occurrences in `done_dates`.
- **Sources (`source`)**: `user`, `system:cycle`, `system:time_announce`.
- **Revision (`sched_rev`)**: increases when schedules are rebuilt.
- **Batch (`batch_id`)**: groups related items.

#### `settings` &ndash; app settings

| Field        | Type    | Required | Example                 | Purpose |
|--------------|---------|:--------:|-------------------------|---------|
| `key`       | TEXT PK | yes      | `time_announce.enabled` | Settings key |
| `value`     | TEXT    | &ndash;  | `true` / `{"wpm":12}`   | Value as text/JSON |
| `updated_at`| INTEGER | &ndash;  | `1734012345678`         | Unix millis of last change |

**Example keys**  
`time_announce.enabled`, `time_announce.cadence`, `tts.voice`, `weather.alerts.enabled`, `pollen.alerts.enabled`, `locale`, `theme.mode`, ...

### 4.3 Indexes (for speed)

```json
flowchart LR
  A[idx_activities_date] -->|"activities(date)"| DB
  B[idx_activities_priority] -->|"activities(priority)"| DB
  C[idx_activities_completed] -->|"activities(completed)"| DB
  D[idx_activities_date_source] -->|"activities(date, source)"| DB
  E[idx_activities_batch] -->|"activities(batch_id)"| DB
```
- **Fast listing**: by date, status, source (e.g., "today", "overdue", "time announcements").
- **Targeted cleanup**: quickly find whole groups via `batch_id` (e.g., a cycle set).

### 4.4 Example record (`activities`)

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

### 4.5 Frequently asked questions

- **Why are date/time stored as text?**  
  For fast indexes/sorting and robust comparisons (e.g., `WHERE date='20251203'`).

- **Can I open the DB outside the app?**  
  Yes, with a SQLite viewer. The path is usually only reachable via ADB/root. The **Copy** button in the info dialog is generally sufficient for support.

### 4.6 For tech fans (how is scheduling done?)
- Notifications are scheduled with a **deterministic ID** from `id + date + offsetMin`.  
- Each scheduled reminder carries a **payload** (incl. `activity_id`, `ymd`, `source`, `sched_rev`).  
- During cleanup the app can **reliably** find all related alarms and **cancel/reschedule** them &ndash; including series, time announcements and cycle sets.

### 4.7 Installation & uninstallation (Android)

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
- **No remnants** of the app database remain in the system &ndash; the device is **clean** in this respect.

---

### 4.8 Further stored app parameters (outside the database)

> In addition to the SQLite database, ToDay stores some parameters **on-device** (sandbox). Everything lives in the app area and is **automatically removed on uninstall**.

#### 4.8.1 Shared Preferences (key/value, plain text)

* **Location**: app sandbox (`/data/data/<package>/shared_prefs/...`) &ndash; internal, not directly accessible without root/ADB.  
* **Type**: small settings/flags as **key/value** (string, bool, double, int).

**TTS (unified schema)**

| Key             | Type   | Example                 | Description                                                 |
|-----------------|--------|-------------------------|-------------------------------------------------------------|
| `tts.enabled`   | Bool   | `true`                  | TTS global on/off.                                          |
| `tts.engine`    | String | `com.google.android.tts`| Engine reported by the system; shown in the app.            |
| `tts.locale`    | String | `de-DE`                 | Language in `ll-CC` format (hyphen, normalized).            |
| `tts.voiceName` | String | `German Germany`        | Exact display name from `getVoices`.                        |
| `tts.rate`      | Double | `1.0`                   | Speech rate `0.20–1.00`.                                    |
| `tts.pitch`     | Double | `1.0`                   | Pitch `0.50–1.50`.                                          |
| `tts.volume`    | Double | `1.0`                   | Volume `0.00–1.00`.                                         |

**Gamification &ndash; spoken sentences**

| Key                       | Type               | Example                                            | Description                                                                 |
|---------------------------|--------------------|----------------------------------------------------|-----------------------------------------------------------------------------|
| `tts.gamify.sentences.de` | String (JSON list) | `["Du raeumst auf wie ein Boss.", "..."]`         | Custom **DE** sentences. Empty/invalid list &rarr; fallback to L10N.        |
| `tts.gamify.sentences.en` | String (JSON list) | `["You're cleaning up like a boss.", "..."]`      | Custom **EN** sentences. Empty/invalid list &rarr; fallback to L10N.        |

**Background animation (Lottie, per month)**

| Key               | Type   | Example                                                       | Description                                                                  |
|-------------------|--------|---------------------------------------------------------------|------------------------------------------------------------------------------|
| `lottie.default`  | String | `assets/lottie/Cat playing animation.json`                    | Default animation (**full asset path**).                                     |
| `lottie.month.01` | String | `assets/lottie/Happy snowman jumping and waving his hand.json`| Month mapping January (**full asset path**).                                 |
| ... `lottie.month.12` | String | `assets/lottie/Thanksgiving Basket.json`                 | Month mapping December (**full asset path**). Missing key &rarr; inherits default. |
| `lottie.month.MM` | String | `"<none>"`                                                    | **No image** for month `MM` (explicitly disable animation).                  |

> **UI note:** In the picker the visible text can hide the `assets/lottie/` path prefix. The **full** asset path is always stored.

**Further examples (not TTS/Lottie/gamification):**

| Key                                | Type   | Example    | Description                                |
|------------------------------------|--------|------------|--------------------------------------------|
| `ui.theme`                         | String | `system`   | Appearance: `light`/`dark`/`system`.       |
| `locale.override`                  | String | `de`       | Force app language (otherwise system).     |
| `home.last_open_date`              | String | `20251203` | Last used date on the main screen.         |
| `cleanup.only_open.default`        | Bool   | `true`     | Default selection in the cleanup dialog.   |
| `cleanup.cancel_schedules.default` | Bool   | `true`     | Default for "Cancel alarms".               |
| `time_announce.enabled`            | Bool   | `true`     | Time announcements on/off.                 |
| `weather.units.temp`               | String | `C`        | Temperature unit.                          |

#### 4.8.2 Secure Storage (encrypted)

* **Location**: app sandbox, secured via Android Keystore (plugin `flutter_secure_storage`).  
* **Type**: **sensitive** keys/values, stored encrypted.

| Key               | Type   | Example | Description                 |
|-------------------|--------|---------|-----------------------------|
| `auth.token`      | String | `...`   | Access token (if used).     |
| `privacy.consent` | Bool   | `true`  | Flag for consents.          |

> **Note:** TTS, gamification and Lottie settings are **not** stored in Secure Storage, but in **Shared Preferences** (see above).

#### 4.8.3 Plugin/system storage

* **Awesome Notifications**: persists scheduled & active notifications (incl. payload) in the app area; is cleaned/rebuilt consistently via **Cleanup**/"Rebuild".  
* **Image/network cache**: temporary files in the app **cache directory**.  
* **Temporary files**: short-lived files (e.g., exports) in the **temp/cache path**.

#### 4.8.4 Exports/backups (optional)

* Exported files live in the **folder chosen by the user** (e.g., "Downloads") and thus **outside** the app sandbox.  
* These files remain after uninstall until they are deleted manually.

#### 4.8.5 Deletion & backup behavior

* **Clear app data** removes database, Shared Preferences, Secure Storage, plugin data and cache.  
* **Uninstall** effectively equals "delete everything".  
* **System backups** (if active) can restore settings/prefs; security-critical items in Secure Storage are typically **not** migrated between devices.

#### 4.8.6 Privacy

* No telemetry by default.  
* All data remains **local** on the device unless you deliberately export/sync it.

---

## 5) Notifications
Status chips show whether all prerequisites are met:
- **Allowed** &ndash; system permission for notifications is granted.
- **Exact alarms** &ndash; allowed, so reminders may trigger **on time**.
- **Battery optimization ignored** &ndash; prevents throttling in the background.

> If one of the switches is **off**, reminders may arrive **too late** or **not at all**. Open the corresponding system settings and allow the option.

---

## 6) Actions
- **Copy**: copies all shown information to the clipboard (for support/bug report).
- **Close**: closes the dialog.

---

## 7) Tips & troubleshooting
- After changes to permissions/alarms in **Settings**, consider running **"Rebuild notifications"**.
- Also check quiet times, "Do Not Disturb" and internet connection (for DWD/pollen).
- For support requests include the copied **info block**.