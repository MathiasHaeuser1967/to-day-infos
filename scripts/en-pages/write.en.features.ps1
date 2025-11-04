function Write-En-Features {
  $p = Join-Path $DocsEn 'features.md'
  $c = @'
# Features

An overview of what **ToDay** can do.

---

## 1) Activities & reminders
- **Activities/To-Dos** with: **title**, **description**, **date (Y-M-D)**, **time (HH:mm)**, **priority**, **reminders** (multiple offsets), **repeat (RRULE)**, **exceptions (exdates)**, **source** (e.g., `system:cycle`, `system:time_announce`), **schedRev**, **batchId**.
- **Multiple reminders**: predefined offsets (start, 5/10/15/30 min, 1/2 h) &ndash; can be combined.
- **Repeats**: daily / weekly (days + interval) / monthly (day in month or weekday in month) / yearly (date or weekday in month).  
  End: **endless**, **until date**, **after count**.
- **Overdue display**: segmentation **&lt; 1 h**, **1&ndash;3 h**, **&gt; 3 h** with quick actions and segmented lists.

---

## 2) Cycles (planner)
- Automatically creates **series of activities** from the start time with a count limit (e.g., "4 of 24 possible").
- **Templates/presets** (Pomodoro & co.): `25/5` (Pomodoro), `50/10`, `52/17`, `45/15`, `30/10`, `60/15`, as well as **ultradian cycles** `90/15`, `90/20`, `75/15`.
- Optional **focus start** (e.g., to jump directly into a session).

---

## 3) Time announcements
- Generates **time points between start and end time** at the selected **interval**: 10/15/20/30 min or **hourly**.
- Output as **notification** &ndash; optionally **TTS** or **Morse tone**.
- Time announcements are tracked as their own **activity source** (`system:time_announce`).

---

## 4) Speech: TTS, STT & voice macros
- **Text-to-Speech (TTS)**: engine/voice/locale, **speech rate** and **pitch**, test output.
- **Speech input via keyboard**: dictate with keywords **"Title ...", "Description ...", "Date ...", "Time ..."** &rarr; parser fills fields.
- **Voice macros**: **trigger &rarr; expansion &rarr; parsing**  
  CRUD (create/edit/delete), active/filter, preview parsing, duplicate check.

---

## 5) Weather & pollen (DWD)
- **ZIP code** + optional **alert region**, **quiet times** (DND for DWD).
- **Weather alerts** (e.g., hail, thunderstorm, storm, rain, snow, wind, frost, fog) &ndash; can be enabled per type.
- **Pollen** with **threshold** ("from intensity ...") and **pollen types** (grasses, birch, alder, hazel, ash, mugwort, ragweed, rye).
- **Check now** starts a DWD query immediately.  
  Integration on Home (indicators, info lines).

---

## 6) Notifications & alarms
- Robust **scheduling/cancel** per activity/date (including batch/offsets).
- **Exact alarms** (if allowed by the system) for on-time triggering.
- **Cancel logic** for associated notifications when deleting/cleaning up.

> Important: For reliable delivery, **allow notifications**, **exact alarms** (if available), and **ignore battery optimization**.

---

## 7) Home overview
- **Date navigation** (Yesterday/Today/Tomorrow/Arrows), **progress bar** (done / total), **key figures** (total, done, high priority).
- **Info line**: weather alerts & pollen status (DWD).
- **Tabs**: Open &middot; Overdue &middot; Done &middot; DWD.
- **Quick actions** & **segmented lists** for overdue items.
- **FABs**: add activity, speech input, cycle generator.  
  Extras: **heatbar/stats** and **confetti** on achievements (device/version dependent).

---

## 8) Settings
- **Language** (DE/EN).
- **Appearance**: light/dark/system, **dynamic colors** (Android 12+).
- **Notifications &ndash; general**: country, **ZIP**, **alert region**, **quiet times**, global switch.
- **Weather alerts (DWD)** and **pollen (DWD)**: finely configurable, **check now**.
- **TTS settings**: voice, rate, pitch.
- **Time announcements**: window, interval, Morse instead of TTS, **generate**.
- **Dangerous area**: debug info under activities, **rebuild notifications**, **delete all activities**.

---

## 9) Data & tech
- **SQLite** (local), repositories for activities & settings.
- **Scheduling service** with **RRULE evaluator** and **cycle generator**.
- **Notification facade** encapsulates scheduling, IDs and cancel path.
- **Info dialog** shows version/channel, Android build, package ID, DB path/file/tables/entries and permission status (notifications, exact alarms, battery optimization).

---

## 10) Privacy & offline
- Activities are stored **locally** (no cloud requirement).  
- DWD data requires internet; when offline, it updates on next sync.
- Speech input is handled by the **keyboard app** (its privacy policy applies).

---

## 11) Limits & notes
- **Quiet times** affect DWD alerts only &ndash; not task alarms.
- Without system permissions (**exact alarms**/notifications/battery optimization) reminders may be delayed.
- Calendar/time zone specifics for RRULEs are taken into account; nevertheless, verify after imports.
'@
  Write-File $p $c
}