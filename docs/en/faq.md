# Frequently Asked Questions (FAQ)

> **TL;DR:** On some devices Android delays or blocks notifications and TTS in the background. Make sure notifications are allowed, battery optimization is disabled for ToDay (**No restrictions**), and enable *Exact alarms* if supported. Below youâ€™ll find detailed causes, solutions and diagnostics.

---

## 1) Sometimes I donâ€™t hear speech output (TTS)

**Symptoms**
- Time announcements are silent or start late.
- Output stops after 1â€“2 words or only works with the screen unlocked.
- Output goes to the wrong device (e.g., Bluetooth instead of speaker).

**Causes & solutions**
- **Battery optimization**: set ToDay to **No restrictions**.
- **Do Not Disturb**: allow alarms/notifications.
- **Bluetooth routing**: adjust/disable if output is routed incorrectly.
- **TTS engine**: choose a reliable engine and download voice data for offline use.

**Diagnostics**
- Test speech output in **Settings â†’ Speech/TTS**.
- Check OEM power management (some ROMs kill background tasks).

---

## 2) Notifications donâ€™t arrive (or arrive late)

- Allow notifications for ToDay.
- Disable battery optimization for ToDay (**No restrictions**).
- If supported: enable **Exact alarms** for on-time delivery.
- Ensure the device isnâ€™t in extreme power save mode.

---

## 3) What are voice macros?

Voice macros let you enter activities faster: a short **trigger** expands to a longer **template** which the app then **parses**.

- **Trigger â†’ Expansion â†’ Parsing**  
  1) You say the *trigger*.  
  2) The app replaces it with the saved *expansion* text.  
  3) The parser reads title/description/date/time from the text.
- **Example**:  
  Trigger: `macro one` â†’ Expansion:  
  `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`.

**Overview (list)**
- **Search** filters by name/trigger.
- **Filter chips**: *All* Â· *Active* Â· *Inactive*.
- **New macro**: **+**

---

## 4) Exact alarms?

If your device supports *Exact alarms*, some reminders can fire at the exact time. Without this permission, the system may group or delay alarms to save power.