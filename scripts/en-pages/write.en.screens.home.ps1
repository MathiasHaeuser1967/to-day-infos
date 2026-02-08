function Write-En-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

The **Home** page is your daily hub: choose a date, see progress, filter lists, and create new activities or control via voice.

---

## 1) Header

| Element | Description |
|---------|-------------|
| **Title** | *ToDay* |
| **Menu (⋮)** | Opens the side navigation. |

---

## 2) Date area & navigation

At the top you see the **selected date** in two forms:

| Element | Example | Function |
|---------|---------|----------|
| **Date chip left** | 22 Oct 2025 | Tap opens a date picker (quickly jump to any day). |
| **Long form right** | Wednesday, 22 October 2025 | Better readability – display only. |

Below that you find the **navigation**:

| Control | Action |
|---------|--------|
| **Arrows** ‹ / › | Jump one day back/forward. |
| **Chips** Yesterday / Today / Tomorrow | Jump directly to these three fixed points. |

---

## 3) Metric cards & Collapsible Header

There are three compact tiles:

| Tile | Content |
|-------|---------|
| **Total** | Count of **all** activities on the selected day (open + done). |
| **Done** | Pie chart + counter `x / y`. Shows how many entries are already completed. |
| **High Priority** | Number of activities marked as **important**. |

**Tip:** Tapping a card can (depending on version/settings) **pre-filter** the list.

### 3.1 Collapsible Header

The entire header area – date, date bar, the three metric cards, and the LED indicators – can be **collapsed** to create more space for the activities list.

| State | Display | Interaction |
|-------|---------|-------------|
| **Expanded** | Full header with all details (default on open). | Tap the **drag handle** (subtle grip below the header) to collapse. |
| **Collapsed** | Compact **52 px bar** with date chip, done/total, linear progress bar, and high priority badge. | Tap the collapsed bar to expand again. |

**Result:** In the collapsed state, instead of 2–3 activities, **6–7 activities** are visible simultaneously – tripling the usable list area.

---

## 4) Info line / Mini status / Weather & DWD

Below the metrics, an **info block** is shown.

### 4.1 Mini Status (above the LED line)

Directly **above** the LED warning line is a small status line in **the same font size** as the LED warnings.

For **Today**, **steps today** are also displayed:

| Language | Display |
|----------|---------|
| German | `Schritte heute: 1 234` |
| English | `Steps today: 1,234` |

**Important:**  
There is **no silent zero**. If permission is missing or no sensor value can be read, a clear status is shown instead of a false zero, e.g., **not available**.  
The line is structured so that additional small status values can be added later.

### 4.2 DWD and Weather

> *German version only.* The DWD features below are only available when the app language is set to German.

| Display | Description |
|---------|-------------|
| **DWD Weather Warnings** | Status dot (green/yellow/red) and short text. |
| **DWD Pollen Flight** | Status dot and short text, including specific triggers (e.g., hazel, birch). |
| **Current Weather** | e.g., **13 °C, 83 % RH.** |

You can access details via the **DWD tab** (see below). Visibility and units are configured in **Settings**.

---

## 5) Tabs (list filter)

Tabs are directly above the list. They filter the daily view:

| Tab | Content |
|-----|---------|
| **Open** | All **not done** activities on the selected date. |
| **Overdue** | Entries whose date/time is **in the past** and still **open**. |
| **Done** | Entries already **checked off** for the day. |
| **DWD** | Weather warnings/pollen details for your location (data: Deutscher Wetterdienst). *German version only.* |

**Note:** The small counter in square brackets shows how many entries the respective tab currently contains (e.g., `Open [0]`).

---

## 6) Activities list (interactions)

In the **Open / Overdue / Done** tabs:

| Gesture | Action |
|---------|--------|
| **Tap** | Open/edit entry. |
| **Tap checkbox** | Mark as done (or reset). |
| **Long press** | Context actions (e.g., move, duplicate, delete; depending on version). |

**Sorting:** Default is **by time**; future-dated/without time are shown grouped.

### 6.1 Screen & media (Home only)

| Behavior | Explanation |
|----------|-------------|
| **Display stays on** | As long as the Home page is visible and the app is in the foreground, the app keeps the display active (**wakelock**). This keeps progress, lists, and status permanently visible. When leaving the Home page or when the app goes to the background, the screen locks again according to **system settings**. |
| **Audio only on Home** | **Media playback** (music) and **speech output (TTS)** are **only** started within the Home page. In other areas of the app no new audio/TTS outputs are triggered. Already running outputs may be automatically stopped or paused depending on system and app status. |

### 6.2 Background: Notifications & Badges

**What fires when Home is not visible?**  
In the **background** or when the Home page is not visible, the following **Android notifications** may appear:

- Scheduled **activity reminders** according to your entries and offsets.  
- **Time announcements** (if enabled and due) as system notifications.  
- **DWD warnings** and **pollen flight** notices (if enabled and new data is available).

These notifications use the **system behavior** (sound/vibration per channel settings). **TTS** or **music** are **not** started in the background.

**App icon badge:**  
The badge on the app icon is provided by the **launcher** and usually equals the **number of active notifications** of the app. The app does not set its own badge; the system/launcher derives the counter from visible notifications. The display (dot/number) may vary by device/launcher.

---

## 7) Speed Dial – Quick Actions (Floating Action Button)

At the bottom right is a single **Speed Dial Button** (central FAB). Tapping it fans out **six actions** vertically upwards. Tapping the central button again or the background closes the menu.

| No. | Icon | Action | Description |
|-----|------|--------|-------------|
| 1 | ❓ Question mark | **Help** | Opens the help view. |
| 2 | 🗣️ Speech bubble | **Daily Briefing** | Starts the daily briefing (see multi-tap below). |
| 3 | 🔄 Circular arrows | **Plan cycle** | Opens the cycle planner for the selected date. |
| 4 | 🎤 Microphone | **Voice command** | Starts voice macros or speech input. |
| 5 | ➖ Minus | **Cleanup** | Opens the cleanup dialog. |
| 6 | ➕ Plus | **New entry** | Creates a new activity for the selected date. |

### 7.1 Daily Briefing – Multi-Tap with Badge

The **Daily Briefing** button in the Speed Dial supports **multi-tap** to select priority level. The Speed Dial stays open on the briefing button to allow multiple taps:

| Number of taps | Badge | Color | Priority |
|----------------|-------|-------|----------|
| 1× | **1× ▲** | 🔴 Red | Read only **high** priority. |
| 2× | **2× ■** | 🟠 Orange | Read only **medium** priority. |
| 3× | **3× ▼** | 🟢 Green | Read only **low** priority. |

**Process:** After the last tap, a short countdown (700 ms) runs. If no further tap occurs, the briefing is triggered with the selected level and the Speed Dial closes automatically.

---

## 8) Typical workflows

### Change day
Jump to **Yesterday/Today/Tomorrow** using arrows/chips or tap the **date chip** and select any date.

### Generate or update daily plan
Tap **Plan cycle** and execute the planning to create recurring entries for this date.

### Quickly check off entries
In the **Open/Overdue** tab tap the **checkbox** → entry moves to **Done**.

### Cleanup
Via the Speed Dial tap the **Cleanup** button, open the dialog, choose source (Cycle / Time announcements / User), set options, and tap **Delete**.

---

## 9) What you can configure (relevant for Home)

| Setting | Description |
|---------|-------------|
| **Notifications & alarms** | Permissions, importance, sounds, "Exact alarms", power saving. |
| **Time announcements** | On/off, language/voice, time window, interval. |
| **Cycles** | Repeat rhythm, start/end, conflict handling. |
| **DWD info** | Show/hide, location/source (if configurable). |
| **Display** | Light/dark/automatic, app language (German/English). |
| **Display & text** | Font (System/Inter/Roboto Slab/OpenDyslexic), font size (80%–150%). |

> The mentioned options are found in **Settings**. Some behaviors may vary by version.

---

## 10) Tips

- Work on **Today** first: use the **Overdue** and **Open** tabs as your metronome.  
- **Cycles** save clicks: define recurring items once, then update daily via the cycle planner.  
- Keep an eye on the **DWD tab** if you have weather- or pollen-dependent tasks (German version only).  
- **Collapse the header** when you need maximum space for your activities list.  
- Remember the **Speed Dial**: one tap opens all quick actions – no searching for individual buttons needed.
'@
  Write-File $p $c
}
