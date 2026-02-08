function Write-En-Features {
  $p = Join-Path $DocsEn 'features.md'
  $c = @'
# Features

An overview of what **ToDay** can do.

---

## 1) Activities & Reminders

| Feature | Description |
|---------|-------------|
| **Fields** | Title, description, date (Y-M-D), time (HH:mm), priority, reminders (multiple offsets), repeat (RRULE), exceptions (exdates), source (e.g., `system:cycle`, `system:time_announce`), schedRev, batchId. |
| **Multiple Reminders** | Predefined offsets (start, 5/10/15/30 min, 1/2 h) – combinable. |
| **Repeats** | Daily / weekly (days + interval) / monthly (day in month or weekday in month) / yearly (date or weekday in month). End: endless, until date, after count. |
| **Overdue Display** | Segmentation **< 1 h**, **1–3 h**, **> 3 h** with quick actions and segmented lists. |

---

## 2) Cycles (Planner)

Automatically generates **series of activities** from start time with count limit (e.g., "4 of 24 possible").

| Preset | Work Phase / Break |
|--------|-------------------|
| Pomodoro | 25 / 5 min |
| 50/10 | 50 / 10 min |
| 52/17 | 52 / 17 min |
| 45/15 | 45 / 15 min |
| 30/10 | 30 / 10 min |
| 60/15 | 60 / 15 min |
| Ultradian 90/15 | 90 / 15 min |
| Ultradian 90/20 | 90 / 20 min |
| Ultradian 75/15 | 75 / 15 min |

Optional **focus start** (e.g., to jump directly into a session).

---

## 3) Time Announcements

| Feature | Description |
|---------|-------------|
| **Time Points** | Generates time points between start and end time at the selected interval. |
| **Interval** | 10 / 15 / 20 / 30 min or hourly. |
| **Output** | Notification with TTS voice output. |
| **Source** | Time announcements are tracked as their own activity source (`system:time_announce`). |

---

## 4) Speech: TTS, STT & Voice Macros

| Function | Description |
|----------|-------------|
| **Text-to-Speech (TTS)** | Engine/voice/locale, speech rate and pitch, test output. |
| **Speech Input via Keyboard** | Dictation with keywords "Title ...", "Description ...", "Date ...", "Time ..." → parser fills fields. |
| **Voice Macros** | Trigger → expansion → parsing. CRUD (create/edit/delete), active/filter, preview parsing, duplicate check. |

---

## 5) Weather & Pollen (DWD)

| Feature | Description |
|---------|-------------|
| **Location** | ZIP code + optional alert region, quiet times (DND for DWD). |
| **Weather Alerts** | Hail, thunderstorm, storm, rain, snow, wind, frost, fog – activatable per type. |
| **Pollen** | Threshold ("from intensity ...") and pollen types (grasses, birch, alder, hazel, ash, mugwort, ragweed, rye). |
| **Check Now** | Starts an immediate DWD query. Integration on Home (indicators, info lines). |

*Note: The Weather & Pollen features (DWD) are only available in the German version.*

---

## 6) Notifications & Alarms

| Feature | Description |
|---------|-------------|
| **Scheduling/Cancellation** | Robust logic per activity/date (including batch/offsets). |
| **Exact Alarms** | If allowed by the system, for punctual triggering. |
| **Cancel Logic** | Associated notifications are cancelled when deleting/cleaning up. |

> **Important:** For reliable delivery, **allow notifications**, **exact alarms** (if available), and **ignore battery optimization** are required.

---

## 7) Home Overview

| Element | Description |
|---------|-------------|
| **Date Navigation** | Yesterday / Today / Tomorrow / arrows, date picker. |
| **Key Figures** | Total, done (pie chart + counter), high priority. |
| **Collapsible Header** | The entire header area can be collapsed via a drag handle. When collapsed, a compact 52 px bar shows date, progress, and high-priority badge – allowing up to three times more visible activities. |
| **Info Line** | Weather alerts & pollen status (DWD), mini-status (steps today). |
| **Tabs** | Open · Overdue · Done · DWD. |
| **Speed Dial** | A central FAB that unfolds six actions on tap: Help, Daily Briefing (multi-tap with badge), Plan Cycle, Voice Command, Cleanup, New Entry. |
| **Extras** | Heatbar/stats and confetti on achievements (device/version dependent). |

*Note: The DWD tab is only available in the German version.*

---

## 8) Settings

| Section | Options |
|---------|---------|
| **Language** | German / English. |
| **Appearance** | Light / Dark / System, dynamic colors (Android 12+). |
| **Display & Text** | Font (System / Inter / Roboto Slab / OpenDyslexic), font size (80%–150%), live preview. |
| **Notifications – General** | Country, ZIP, alert region, quiet times, global switch. |
| **Weather Alerts (DWD)** | Danger types finely configurable, check now. |
| **Pollen (DWD)** | Threshold, pollen types, check now. |
| **Voice & Output (TTS)** | Voice, rate, pitch, volume, preview. |
| **Time Announcements** | Window, interval, TTS, generate. |
| **Background Animation** | Lottie animations per month or default. |
| **Gamification** | Spoken praise sentences when overdue → done. |
| **Danger Zone** | Debug info, rebuild notifications, delete all activities. |

*Note: The Weather Alerts and Pollen sections (DWD) are only visible when the locale is set to German.*

---

## 9) Data & Tech

| Component | Description |
|-----------|-------------|
| **SQLite** | Local database, repositories for activities & settings. |
| **Scheduling Service** | RRULE evaluator and cycle generator. |
| **Notification Facade** | Encapsulates scheduling, IDs, and cancel path. |
| **Info Dialog** | Shows version/channel, Android build, package ID, DB path/file/tables/entries, and permission status. |
| **Theme System** | Dynamic TextTheme via `google_fonts`, global TextScaler via `AppStore`. |

---

## 10) Privacy & Offline

| Aspect | Description |
|--------|-------------|
| **Local Data Storage** | Activities are stored locally (no cloud required). |
| **DWD Data** | Requires internet; when offline, updates on next sync. |
| **Speech Input** | Performed via the keyboard app (its privacy policy applies). |

---

## 11) Limits & Notes

- **Quiet times** only affect DWD alerts – not task alarms.  
- Without system permissions (exact alarms / notifications / battery optimization), reminders may be delayed.  
- Calendar/time zone specifics for RRULEs are considered; nevertheless, verify after imports.
'@
  Write-File $p $c
}
