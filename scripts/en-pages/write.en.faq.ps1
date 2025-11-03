function Write-En-FAQ {
  $p = Join-Path $DocsEn 'faq.md'
  $c = @'
# Frequently Asked Questions (FAQ)

> **TL;DR:** Android can delay or block notifications and TTS in the background on some devices. Make sure notifications are allowed, battery optimization is disabled for ToDay, and (if available) enable *Exact alarms*. Below you'll find detailed causes, solutions and diagnostics.

---

## 1) Sometimes I don't hear speech output (TTS)

**Symptoms**
- Time announcements are silent / start late.
- Output stops after 1–2 words or only works with the screen unlocked.
- Output goes to the wrong device (e.g., Bluetooth instead of speaker).

**Causes & solutions**
- **Battery optimization**: set ToDay to **No restrictions**.
- **Do Not Disturb**: allow alarms/notifications.
- **Bluetooth routing**: disable/adjust BT if output is routed incorrectly.
- **TTS engine**: choose a reliable engine in system settings; download voice data for offline use.

**Diagnostics**
- Test speech output in **Settings → Speech/TTS**.
- Check whether system logs show blocked background execution (manufacturer ROMs).

---

## 2) Notifications don't arrive (or arrive late)

- Allow notifications for ToDay.
- Disable battery optimization for ToDay (**No restrictions**).
- If supported: enable **Exact alarms** for on-time delivery.
- Ensure the device is not in power-save or extreme power-save mode.

---

## 3) What do voice macros do?

Voice macros let you enter activities faster by saying a short **trigger** that expands into a longer **template** which the app then **parses**.

- **Trigger → Expansion → Parsing**  
  1) You say the *trigger*.  
  2) The app replaces it with the saved *expansion* text.  
  3) The parser reads title/description/date/time from the text.
- Example:  
  Trigger: `macro one` → Expansion: `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`.

**List view**
- **Search** filters by name/trigger.
- **Filter chips**: *All* · *Active* · *Inactive*.
- **New macro**: **+**

---

## 4) Exact alarms?

If your device supports *exact alarms*, the app can schedule some reminders to fire at the exact time. On devices/versions without this permission, the system may group or delay alarms slightly to save power.
'@
  Write-File $p $c
}