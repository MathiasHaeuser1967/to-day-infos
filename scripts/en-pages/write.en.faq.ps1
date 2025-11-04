function Write-En-FAQ {
  $p = Join-Path $DocsEn 'faq.md'
  $c = @'
# Frequently Asked Questions (FAQ)

> **TL;DR:** Android can throttle notifications and TTS in the background (Doze/app standby, battery optimization, "Do Not Disturb", missing special permission for **exact alarms**). In addition, **legacy schedules** can exist (e.g., after app updates) which you can clean up with **"Rebuild notifications"**. Below you will find detailed causes, solutions, and diagnostics.

---

## 1) Sometimes I do not hear speech output (TTS)

**Symptoms**
- Time announcements remain silent / start late.
- Output stops after 1-2 words or is only audible with the screen unlocked.
- Output goes to the wrong device (Bluetooth instead of speaker, etc.).

**Likely causes (Android/OS)**
1) **Doze / app standby / battery optimization**: background audio/jobs are throttled.  
2) **"Do Not Disturb" (DND)**: media output or notifications suppressed.  
3) **Audio focus / route conflict**: other apps (music/call/maps) hold focus.  
4) **TTS engine**: voice package missing/corrupt; engine is terminated by the OS.  
5) **Bluetooth/route**: output moves to HFP/A2DP devices or smart speakers.  
6) **Media volume**: (not ringer!) too low/muted.  
7) **OEM rules**: MIUI/EMUI/ColorOS aggressively kill apps in the background.

**What can I do (user)**
- **Disable battery optimization for ToDay** (System -> Battery -> Do not optimize).  
- Allow **exact alarms** (Android 13+: *Alarms & Reminders* -> ToDay -> allowed).  
- Check **Do Not Disturb**; set exceptions for alarms/reminders if needed.  
- Increase **media volume**; check/disconnect the Bluetooth route.  
- Install/check **TTS engine & voice** (system TTS settings).  
- Open ToDay and run **"Rebuild notifications"**.

**Technical background**
- TTS only starts after engine init + audio focus. In Doze, Android shifts jobs into **maintenance windows**. Without `SCHEDULE_EXACT_ALARM`, alarms become **inexact** (+/- minutes).  
- Audio routes (A2DP/HFP) can be briefly **silent** during handover until focus/route returns.

**TTS pipeline (ASCII)**
```
[Trigger] -> [Permissions?] -> [Doze?] -> [TTS init + audio focus] -> [Audio route] -> [Output]
             no -> (silent)     yes -> (delayed)
```

---

## 2) Notifications still fire even though I deleted activities

**Symptoms**
- A reminder appears even though the activity in ToDay was deleted/checked off.  
- Many old "Time announcement"/"Cycle" reminders remain active.

**Likely causes**
1) **Legacy schedules** (earlier app versions) -> different ID/payload schema, so cancel does not hit them.  
2) **OS queue**: scheduled alarms remain if not **explicitly** canceled (e.g., after crash/update/force-close).  
3) **Boot/update**: reschedule/cancel has not run yet.  
4) **Exact alarms denied**: cancel routines only see "scheduled", not "delivered".

**What can I do (user)**
- In **Cleanup**: enable **"Cancel notifications/alarms"** and execute it.  
- In **Danger zone**: use **"Rebuild notifications"**.

**Technical background**
- Reminders are scheduled with deterministic **ID** + **payload**. After schema changes the cancel logic does not recognize older entries -> a **one-time** rebuild clears the legacy queue.  
- Android continues to fire scheduled alarms even if the DB record has already been removed, as long as the alarm was not **explicitly** canceled.

**Sequence (ASCII)**
```
App:  Schedule(id, payload) -> [OS queue]
App:  Cancel(filter)        -> (schema matches?)
                               yes -> deleted
                               no  -> remains (orphan alarm)
Solution: "Rebuild notifications"
```

---

## 3) Reminders do not fire **exactly** at the desired time

**Symptoms**
- Triggered late (minutes) / not at all, especially with the screen locked / at night.

**Likely causes**
1) **No permission for exact alarms** (Android 13+) -> OS batches/shifts.  
2) **Doze / app standby / battery protection** -> only maintenance windows.  
3) **DND / quiet time / Digital Wellbeing** -> notifications suppressed.  
4) **Time zone/daylight saving time (DST)** -> instants exist twice/not at all.  
5) **OEM rules** -> app restricted in background.

**What can I do (user)**
- **Allow exact alarms** (Android 13+).  
- **Disable battery optimization**, allow auto start/background execution.  
- Check **Do Not Disturb**/quiet times.  
- Do not use **ultra power saving** modes.

**Flow (ASCII)**
```
[t] -> (exact allowed?) no  -> (inexact +/- min)
      yes -> (Doze?)   yes -> (maintenance window)
                         no -> (exact at t)
```

---

## 4) Diagnostic checklist (quick)

1) **Permissions**
- Notifications **allowed**  
- Android 13+: **Alarms & Reminders -> exact allowed**  
- Microphone (dictation) ok, media audio available

2) **Power & background**
- Battery optimization for ToDay **disabled**  
- OEM special: **Allow auto start/background execution**

3) **Audio**
- Media volume != 0  
- No competing player/call holds audio focus

4) **System state**
- "Do Not Disturb" off / exceptions set  
- After reboot/update **open the app once** (boot reschedule)

5) **App maintenance**
- **Cleanup** -> with "Cancel notifications"  
- **Danger zone** -> "Rebuild notifications"

---

## 5) Why does "Rebuild notifications" help?

- Deletes **all** known scheduled entries (incl. legacy schema) from the system queue.  
- Re-schedules everything **consistently** with the current schema (ID/payload).  
- Fixes "orphan alarms" after updates/schema changes/crash scenarios.

---

## 6) OEM specifics (selection)

- **Xiaomi/MIUI**: "Allow autostart", battery protection -> "No restrictions".  
- **Huawei/EMUI**: "Manage app start" -> "Automatically manage OFF", allow everything.  
- **Samsung**: "Adaptive battery"/"App in standby" -> **exclude** ToDay.  
- **OnePlus/OPPO/realme**: "App battery management" -> No limitation.  
- **Vivo**: "I-Manager" -> disable energy optimization for ToDay.

---

## 7) When is it **not** an app bug?

- DND/Doze/optimization active -> the **system** delays/suppresses.  
- Daylight saving time (**DST**) -> OS **normalizes** times.  
- Alarms from an **old version** -> one-time "Rebuild" needed.
'@
  Write-File $p $c
}
