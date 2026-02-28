function Write-En-Screen-Settings {
  $p = Join-Path $Screens 'settings.md'
  $c = @'
# Settings

The options are grouped into cards. Many cards have their own **Save** button – changes only take effect after saving **that** card.

---

## 1) Language

| Option | Description |
|--------|-------------|
| **Language** | Switches the app language (German / English). |

**Note:** The toggle in the online help changes only the documentation, not the app language.

---

## 2) Appearance

| Option | Description |
|--------|-------------|
| **Follow system** | Follows the system theme (Light/Dark). |
| **Light** | Forces light theme. |
| **Dark** | Forces dark theme. |
| **Dynamic colors (Android 12+)** | Adopts accent colors from the system/wallpaper (Material You). |

### 2.1 Accent Color (when dynamic colors are disabled)

When **Dynamic Colors** are turned off, a **color circle grid** with 12 Material 3 color schemes appears. Each scheme is displayed as a tappable color circle; the active circle is marked with a white checkmark and a glow shadow.

| Scheme | Preview Color |
|--------|--------------|
| Orange M3 | 🟠 (default) |
| Amber | 🟡 |
| Deep Orange M3 | 🔴 (dark) |
| Red M3 | 🔴 |
| Pink M3 | 🩷 |
| Purple M3 | 🟣 |
| Indigo M3 | 🔵 (dark) |
| Blue M3 | 🔵 |
| Cyan M3 | 🩵 |
| Teal M3 | 🟢 (blue-green) |
| Green M3 | 🟢 |
| Espresso | 🟤 |

The color schemes are provided by **FlexColorScheme** and automatically calculate all surface container colors (AppBar, cards, dialogs, etc.).

**Migration:** On the first launch after the update, the old Orange/Violet selection is automatically migrated to the corresponding FlexScheme.

### 2.2 Surface Blend Level

Below the color circle grid there is a **slider** (0–40) that controls how much the selected accent color blends into background surfaces:

| Value | Effect |
|-------|--------|
| **0** | Neutral, grey surfaces – no color influence. |
| **10** | Light tint – subtle color hint. |
| **20** | Medium tint – clearly noticeable. |
| **30–40** | Strong tint – surfaces take on the accent color prominently. |

The current value is displayed as a number to the right of the label. Changes take effect immediately across the entire app.

---

## 3) Display & Text

The **Display & Text** section allows individual adjustment of font and font size. All changes are applied **immediately** to the entire app and saved persistently.

### 3.1 Font

| Option | Description |
|--------|-------------|
| **System** (default) | Uses the operating system's default font. |
| **Inter** | Modern, highly readable sans-serif font – optimized for screens. |
| **Roboto Slab** | Serif font with a clear character – for users who prefer a more traditional typography. |
| **OpenDyslexic** | Font specially designed for dyslexia with weighted letter shapes – a strong inclusion feature. |

Each option is displayed in the dropdown **in its own font**, so you can immediately see the difference.

### 3.2 Font Size

A **slider** with seven levels controls the global text size:

| Level | Scale | Description |
|-------|-------|-------------|
| 1 | 80 % | Very small – maximum space for content. |
| 2 | 90 % | Small. |
| 3 | 95 % | Slightly smaller than standard. |
| 4 | **100 %** | **Standard** – corresponds to the system default. |
| 5 | 110 % | Slightly larger. |
| 6 | 125 % | Large – good for impaired vision. |
| 7 | 150 % | Very large – maximum readability. |

Small and large **Aa** symbols on the left and right of the slider indicate the direction.

### 3.3 Live Preview

Below the settings, a **sample activity card** is displayed that changes in real time. This lets you immediately see how font and font size affect your task list before leaving the settings page.

---

## 4) Notifications – General (DWD)

> **Note:** DWD features (weather alerts and pollen) are only available when the app language is set to **German**. These sections are hidden in other locales.

Applies to **weather alerts** and **pollen**.

| Option | Description |
|--------|-------------|
| **Country** | Country code (e.g., DE). |
| **ZIP code** | Postal code of the location for DWD data. |
| **Alert region** (optional) | Free text; helpful for district-wide alerts. |
| **Alerts enabled** | Global switch for DWD notifications. |
| **Quiet from / Quiet until (hour)** | Time window during which **no** DWD notifications are delivered. |
| **Save** | Applies the values of this card. |

---

## 5) Weather Alerts (DWD)

> *German version only.* This section is only visible when the app language is set to German.

Uses **ZIP code** and **quiet times** from *Notifications – General*.

| Option | Description |
|--------|-------------|
| **Hazard types** | Individually enableable: hail, thunderstorm, storm, rain, snow, wind, frost, fog. |
| **Save** | Saves the selection. |
| **Check now** | Immediately performs a DWD query and updates status/notification. |

---

## 6) Pollen (DWD)

> *German version only.* This section is only visible when the app language is set to German.

Uses **ZIP code** and **quiet times** from *Notifications – General*.

| Option | Description |
|--------|-------------|
| **Notify from intensity** | Threshold from which notifications are triggered for enabled pollen types (e.g., "medium"). |
| **Pollen types** | Individually enableable: grasses, birch, alder, hazel, ash, mugwort, ragweed, rye. |
| **Save** | Applies threshold/types. |
| **Check now** | Immediately fetches pollen values and triggers notifications if applicable. |

---

## 7) Voice & Output (TTS)

Controls text-to-speech for spoken output/time announcements. Android-focused; Desktop/Web have no function.

| Option | Description |
|--------|-------------|
| **Use voice & output** | TTS global on/off. |
| **Current engine** | Displays the engine used by the system (e.g., `com.google.android.tts`). Selection is system-level, not in the app. |
| **Language (Locale)** | Selection in format `ll-CC` (e.g., `de-DE`, `en-US`). Stored exactly as chosen. |
| **Voice** | Exact display name of the engine (**list is filtered by the selected language**). |
| **Speech rate** | Slider 0.20–1.00 (default 1.00). |
| **Pitch** | Slider 0.50–1.50 (default 1.00). |
| **Volume** | Slider 0.00–1.00 (default 1.00). |
| **Preview (Listen now)** | Plays a sample with the currently saved values without app restart. |

**Note:** After fully terminating and restarting the app process, exactly the saved voice/rate/pitch/volume are used. If the chosen voice is no longer available, a fallback occurs within the language (exact locale → language prefix → first available voice).

---

## 8) Time Announcements

Generates time points between start and end time and notifies at the selected cadence.

| Option | Description |
|--------|-------------|
| **Enable time announcements** | Master switch. |
| **Start time (inclusive)** | Start of the announcement window. |
| **End time (inclusive)** | End of the announcement window. |
| **Cadence** | Every 10 / 15 / 20 / 30 minutes or hourly. |
| **Generate** | Schedules announcements for the selected window/cadence (quiet times from *General* are respected). |

### 8.1 Morse Code

| Option | Description |
|--------|-------------|
| **Use Morse** | Switch to output time announcements as Morse code instead of speech. |
| **Speed (WPM)** | Slider 10–100 WPM. Default 18 WPM. Range covers beginners to HST competitions. |
| **Farnsworth** | Slider 10–14. Controls character spacing at lower speeds. |
| **Frequency** | Slider 600–700 Hz. Pitch of the Morse signal. |
| **Volume** | Slider 0.30–1.00. |
| **Envelope (Attack/Release)** | Slider 5–8 ms. Softness of tone onsets/offsets. |
| **Boost** | Switch for amplified signal. |
| **Test Morse** | Plays a sample text with the current settings. |

---

## 9) Overdue Reminder

Recurring voice announcement for overdue activities with escalating urgency. Spoken only if **TTS is enabled** (*Voice & Output*).

| Option | Description |
|--------|-------------|
| **Enable overdue announcement** | Master switch. Default: **Off**. |
| **Repeat interval** | How often reminders are spoken: every 5 / 10 / **15** / 30 / 60 minutes. Default: **15 min**. |
| **Maximum repeats** | How many times reminders are spoken at most: Unlimited / 3 / **5** / 10. Default: **5**. |

### 9.1 Escalation Levels

The announcement becomes more urgent over time:

| Overdue since | Level | Announcement (German) | Announcement (English) |
|--------------|-------|----------------------|----------------------|
| 0–15 minutes | Friendly | "{Title} ist jetzt überfällig." | "{Title} is now overdue." |
| 15–30 minutes | Firm | "Erinnerung: {Title} wartet noch auf Dich." | "Reminder: {Title} is still waiting for you." |
| > 30 minutes | Insistent | "{Title} ist seit {Min} Minuten überfällig. Bitte erledigen!" | "{Title} has been overdue for {Min} minutes. Please take care of it!" |
| Multiple overdue | Summary | "Du hast {n} überfällige Aktivitäten. Bitte abhaken oder verschieben." | "You have {n} overdue activities. Please check them off or reschedule." |

The reminder stops automatically when the activity is **checked off, rescheduled, or deleted**, or when the maximum repeat count is reached.

---

## 10) Background Animation

Controls a Lottie animation in the background of the **"Open"** tab.

| Option | Description |
|--------|-------------|
| **Default animation** | Default for all months without their own entry. Default is `Cat playing animation.json`. |
| **Monthly assignment** | For **January–December** you can select a file for each month. Selection from all files under `assets/lottie`. |
| **No image** | Option to deliberately show **no** animation for a month. |
| **Inherit** | Leaves the month selection empty → the **default animation** applies. |
| **Preview** | Selecting a month shows the animation centered below. |
| **Save** | Applies the assignments. |

**Storage (Shared Preferences):**

| Key | Type | Example |
|-----|------|---------|
| `lottie.default` | String | `assets/lottie/Cat playing animation.json` |
| `lottie.month.01` … `lottie.month.12` | String | Full path or `"<none>"` for "No image"; missing key = inherit from default. |

---

## 11) Gamification: Spoken Sentences

Random short praise sentences when switching an activity from **Overdue** → **Done**. Spoken only if **TTS is enabled** (*Voice & Output*).

| Option | Description |
|--------|-------------|
| **Up to 5 sentences** | Input fields for short motivational sentences. Empty fields are ignored. |
| **Language** | Inputs apply **per app language**. |
| **Preview** | Plays a randomly selected sentence immediately. |
| **Save** | Applies the inputs. |

If the list is empty, the app uses the suggestions from the translation:

| Language | Example sentences |
|----------|-------------------|
| German | "Du räumst auf wie ein Boss." · "Starker Move – weiter so." · "Deadline gezähmt. Nice." · "Ein Punkt weniger auf der Liste." · "Das rollt! Noch eine?" |
| English | "You're cleaning up like a boss." · "Strong move—keep going." · "Deadline tamed. Nice." · "One less on the list." · "You're on a roll! One more?" |

**Storage (Shared Preferences):**

| Key | Type | Description |
|-----|------|-------------|
| `tts.enabled` | Bool | Spoken only if `true`. |
| `tts.gamify.sentences.de` / `.en` | JSON list | Sentences for the respective language. |

---

## 12) Danger Zone (Data Management)

| Option | Description |
|--------|-------------|
| **Debug info under activities** | Shows additional diagnostic info in the lists (for troubleshooting only). |
| **Rebuild notifications** | Re-plans notifications for a short period (useful after system updates/permission changes). |
| **Delete all activities** | Permanently removes **all** activities (no undo). |

---

## 13) Notes & Tips

- **Permissions:** Make sure **notifications** (and if applicable **exact alarms**) are allowed and battery optimization does not throttle the app – otherwise reminders may be delayed.  
- **DWD offline:** Without internet, DWD data is updated only when a connection is available.  
- **Multiple Save buttons:** Each card saves **its** area separately.  
- **Display & Text:** Changes to font and font size take effect immediately throughout the app – use the live preview to find the optimal setting.
- **Accent color & surface blend:** Color selection and blend level take effect immediately – no Save button needed. When dynamic colors are enabled, these options are hidden.
- **Overdue reminder:** Announcements are only spoken when TTS is enabled. The service checks for overdue activities every 60 seconds and speaks at the configured interval.
'@
  Write-File $p $c
}
