function Write-En-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

The **Home** page is your daily hub: choose a date, see progress, filter lists, and create new activities or control via voice.

---

## 1) Header
- **Title:** *ToDay*  
- **Menu (&#8942;):** Opens the side navigation, e.g., **Settings**, **Cleanup**, **Help**.

---

## 2) Date area & navigation

At the top you see the **selected date** in two forms:

- **Date chip on the left** (e.g., **22 Oct 2025**) &rarr; tap to open a date picker (quickly jump to any day).
- **Long form on the right** (e.g., **Wednesday, 22 October 2025**) for better readability only.

Below that you find the **navigation**:

- **Arrows** &#8249; / &#8250; &rarr; jump one day back/forward.
- **Chips** **Yesterday**, **Today**, **Tomorrow** &rarr; jump directly to these three anchors.

**Progress bar:**  
Between navigation and metrics a bar shows your daily progress in % (e.g., **62.3 %**). It is calculated from **Done / Total** activities on the selected day.

---

## 3) Metric cards

There are three compact tiles:

1. **Total**  
   Count of **all** activities on the selected day (open + done).

2. **Done**  
   Pie chart + counter `x / y`. Shows how many entries are already completed.

3. **High priority**  
   Number of activities marked as **important**.

**Tip:** Tapping a card can (depending on version/settings) **pre-filter** the list.

---

## 4) Info line / Weather & DWD

Below the metrics an **info block** is shown:
- **DWD weather alerts** &ndash; status dot (green/yellow/red) and short text.  
- **DWD pollen** &ndash; status dot and short text.  
- **Current weather** &ndash; e.g., **13&deg;C, 83% RH, sunny, clear sky**.

You can access details via the **"DWD" tab** (see below). Visibility and units are configured in **Settings**.

---

## 5) Tabs (list filter)

Tabs are directly above the list. They filter the daily view:

- **Open** &ndash; all **not done** activities on the selected date.  
- **Overdue** &ndash; entries whose time is **in the past** and are still **open**.  
- **Done** &ndash; entries already **checked off** for the day.  
- **DWD** &ndash; weather alerts/pollen details for your location (data: Deutscher Wetterdienst).

**Note:** The small counter in square brackets shows how many entries the respective tab currently contains (e.g., `Open [0]`).

---

## 6) Activities list (interactions)

In the **Open / Overdue / Done** tabs:

- **Open/Edit:** tap an entry.  
- **Mark as done:** tap the checkmark/checkbox.  
- **Long press:** context actions (e.g., move, duplicate, delete; depending on version).  
- **Sorting:** default is **by time**; future-dated/without time are shown as grouped entries.

### 6.1 Screen & media (Home only)
- **Why does the screen not turn off?**  
  As long as the **Home page is visible** and the app is in the **foreground**, the app keeps the display awake (**wakelock**). This keeps progress, lists and status permanently visible and allows interaction at any time. When you leave the Home page or the app goes to the background, the screen locks again according to your **system settings**.
- **Audio only on Home:**  
  **Media playback** (music) and **speech output (TTS)** are **only** started within the Home page. In other areas of the app no new audio/TTS outputs are triggered. Already running outputs may be stopped or paused automatically depending on system and app state.

### 6.2 Background: notifications & badges
- **What fires when Home is not visible?**  
  In the **background** or when the Home page is not visible, the following **Android notifications** may appear:
  - Scheduled **activity reminders** according to your entries and offsets.  
  - **Time announcements** (if enabled and due) as a system notification.  
  - **DWD alerts** and **pollen** notices (if enabled and new data is available).
  These notifications use the **system behavior** (sound/vibration per channel settings). **TTS** or **music** are **not** started in the background.
- **App icon badge:**  
  The badge on the app icon is provided by the **launcher** and usually equals the **number of active notifications** of the app. The app does not set its own badge; the system/launcher derives the counter from visible notifications. The display (dot/number) may vary by device/launcher.

---

## 7) Quick actions at the bottom (Floating Action Row)

From **left to right**:

1. **Run cycle** (two circular arrows)  
   Creates, for the **selected date**, the due entries from your **cycles** (repeats).

2. **Voice command** (microphone)  
   Starts **voice macros** or **speech input**.

3. **Quick action** (minus symbol)  
   Context-sensitive shortcut &ndash; e.g., open **Cleanup**, **Snooze/Defer**, or a defined **quick action**.

4. **Create new** (plus)  
   Opens the dialog to **create a new activity** for the selected date (title, time, repeat, priority, etc.).

---

## 8) Typical flows

### Change day
- Use arrows/chips to jump to **Yesterday/Today/Tomorrow**, or tap the **date chip** and choose any date.

### Generate/update daily plan
- Tap **Run cycle** &rarr; recurring entries for **this date** are created.

### Quickly check off entries
- In the **Open/Overdue** tab tap the **checkbox** &rarr; the entry moves to **Done**; progress increases.

### Cleanup
- Via the **Menu (&#8942;)** or the **quick action (&#8722;)** open the **Cleanup dialog**, choose the source (Cycle / Time announcements / User), set options (e.g., "Only open", "Cancel notifications") and tap **Delete**.

---

## 9) What you can configure (relevant for Home)

- **Notifications & alarms**: permissions, importance, sounds, "Exact alarms", power saving.  
- **Time announcements**: on/off, language/voice, time window, interval.  
- **Cycles**: repeat rhythm, start/end, conflict handling.  
- **DWD info**: show/hide, location/source (if configurable).  
- **Display**: light/dark/automatic, app language (German/English).

> You can find the mentioned options in **Settings**. Some behaviors (e.g., tapping cards &rarr; filter) may vary by version.

---

## 10) Tips
- Work on **Today** first: use the **Overdue** and **Open** tabs and the progress bar as a metronome.  
- **Cycles** save clicks: define recurring items once, then update daily via **Run cycle**.  
- Keep an eye on the **DWD** tab if you have weather- or pollen-dependent tasks.
'@
  Write-File $p $c
}