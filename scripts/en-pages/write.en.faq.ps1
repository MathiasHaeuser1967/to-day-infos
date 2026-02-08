function Write-En-FAQ {
  $p = Join-Path $DocsEn 'faq.md'
  $c = @'
# Frequently Asked Questions (FAQ)

> **TL;DR:** Android can throttle notifications and TTS in the background (Doze/app standby, battery optimization, "Do Not Disturb", missing special permission for **exact alarms**). In addition, **legacy schedules** can exist (e.g., after app updates) which you can clean up with **"Rebuild notifications"**. Below you will find detailed causes, solutions, and diagnostics.

---

## 1) Sometimes I do not hear speech output (TTS)

### Symptoms

- Time announcements remain silent / start late.  
- Output stops after 1–2 words or is only audible with the screen unlocked.  
- Output goes to the wrong device (Bluetooth instead of speaker, etc.).

### Likely causes (Android/OS)

| Nr. | Cause | Explanation |
|-----|---------|-----------|
| 1 | **Doze / App Standby / Battery Optimization** | Background audio/jobs are throttled. |
| 2 | **"Do Not Disturb" (DND)** | Media output or notifications suppressed. |
| 3 | **Audio Focus / Route Conflict** | Other apps (music/call/maps) hold the focus. |
| 4 | **TTS Engine** | Voice package missing/corrupt; engine is terminated by the OS. |
| 5 | **Bluetooth/Route** | Output moves to HFP/A2DP devices or smart speakers. |
| 6 | **Media Volume** | (not ringer!) too low/muted. |
| 7 | **Manufacturer Rules** | MIUI/EMUI/ColorOS aggressively kill apps in the background. |

### What can I do (user)

- **Disable battery optimization for ToDay** (System → Battery → Do not optimize).  
- Allow **exact alarms** (Android 13+: *Alarms & Reminders* → ToDay → allowed).  
- Check **Do Not Disturb**; set exceptions for alarms/reminders if needed.  
- Increase **media volume**; check/disconnect the Bluetooth route.  
- Install/check **TTS engine & voice** (system TTS settings).  
- Open ToDay and run **"Rebuild notifications"**.

### Technical background

TTS only starts after engine initialization + audio focus. In Doze, Android shifts jobs into **maintenance windows**. Without `SCHEDULE_EXACT_ALARM`, alarms become **inexact** (±minutes).  
Audio routes (A2DP/HFP) can be briefly **silent** during handover until focus/route returns.

**TTS pipeline:**

```mermaid
flowchart LR
  A[Trigger] --> B{Permissions?}
  B -- no --> X1[silent]
  B -- yes --> C{Doze?}
  C -- yes --> X2[delayed]
  C -- no --> D[TTS init + audio focus]
  D --> E[Audio route]
  E --> F[Output]
```

---

## 2) Notifications still fire even though I deleted activities

### Symptoms

- A reminder appears even though the activity in ToDay was deleted/checked off.  
- Many old "Time announcement"/"Cycle" reminders remain active.

### Likely causes

| Nr. | Cause | Explanation |
|-----|---------|-----------|
| 1 | **Legacy schedules** | Earlier app versions → different ID/payload schema ⇒ Cancel does not affect them. |
| 2 | **OS queue** | Scheduled alarms remain if not explicitly canceled (e.g., after crash/update/force-close). |
| 3 | **Boot/Update** | Reschedule/cancel has not run yet. |
| 4 | **Exact alarms denied** | Cancel routines only see "scheduled", not "delivered". |

### What can I do (user)

- In **Cleanup**: enable and run **"Cancel notifications/alarms"**.  
- In **Danger Zone**: use **"Rebuild notifications"**.

### Technical background

Reminders are scheduled with deterministic **ID** + **payload**. After schema changes, the cancel logic does not recognize older entries → a **one-time** rebuild clears the legacy queue.  
Android continues to fire scheduled alarms even if the DB record has already been removed, as long as the alarm was not **explicitly** canceled.

**Sequence:**

```mermaid
flowchart LR
  A1[Schedule id+payload] --> Q[OS queue]
  A2[Cancel filter] --> S{Schema matches?}
  S -- yes --> D[deleted]
  S -- no --> W[remains as orphan alarm]
  W -. Solution .-> R[Rebuild notifications]
```

---

## 3) Reminders do not fire exactly at the desired time

### Symptoms

- Triggered late (minutes) / not at all, especially with the screen locked / at night.

### Likely causes

| Nr. | Cause | Explanation |
|-----|---------|-----------|
| 1 | **No permission for exact alarms** | Android 13+ → OS batches/shifts. |
| 2 | **Doze / App Standby / Battery Protection** | Only maintenance windows. |
| 3 | **DND / Quiet Time / Digital Wellbeing** | Notifications suppressed. |
| 4 | **Time Zone/Daylight Saving Time (DST)** | Instants exist twice/not at all. |
| 5 | **Manufacturer Rules** | App restricted in background. |

### What can I do (user)

- **Allow exact alarms** (Android 13+).  
- **Disable battery optimization**, allow auto start/background execution.  
- Check **Do Not Disturb**/quiet times.  
- Do not use **ultra power saving** modes.

**Flow:**

```mermaid
flowchart LR
  T[Time t] --> E{Exact allowed?}
  E -- no --> I[inexact +/- min]
  E -- yes --> DZ{Doze?}
  DZ -- yes --> M[maintenance window]
  DZ -- no --> OK[exact at t]
```

---

## 4) Diagnostic checklist (quick)

| Area | Checkpoint |
|---------|-----------|
| **Permissions** | Notifications **allowed**; Android 13+: Alarms & Reminders → exact allowed; Microphone (dictation) ok. |
| **Power & Background** | Battery optimization for ToDay **disabled**; Manufacturer-specific: allow auto start/background execution. |
| **Audio** | Media volume ≠ 0; no competing player/call holds audio focus. |
| **System State** | "Do Not Disturb" off / exceptions set; after reboot/update open app once (boot reschedule). |
| **App Maintenance** | Cleanup → with "Cancel notifications"; Danger Zone → "Rebuild notifications". |

---

## 5) Why does "Rebuild notifications" help?

- Deletes **all** known scheduled entries (including legacy schema) from the system queue.  
- Reschedules everything **consistently** with the current schema (ID/payload).  
- Fixes "orphan alarms" after updates/schema changes/crash scenarios.

---

## 6) Manufacturer specifics (selection)

| Manufacturer | Recommended Setting |
|-----------|----------------------|
| **Xiaomi/MIUI** | "Allow autostart", battery protection → "No restrictions". |
| **Huawei/EMUI** | "Manage app start" → "Automatically manage OFF", allow everything. |
| **Samsung** | "Adaptive battery"/"App in standby" → exclude ToDay. |
| **OnePlus/OPPO/realme** | "App battery management" → no limitation. |
| **Vivo** | "I-Manager" → disable energy optimization for ToDay. |

---

## 7) When is it not an app bug?

| Situation | Explanation |
|-----------|-----------|
| DND/Doze/Optimization active | The **system** delays/suppresses. |
| Time change (DST) | OS **normalizes** times. |
| Alarms from old version | One-time "Rebuild" needed. |
'@
  Write-File $p $c
}
