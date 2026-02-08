function Write-En-Screen-Settings {
  $p = Join-Path $Screens 'settings.md'
  $c = @'
# Settings

The options are grouped into cards. Many cards have their own **Save** button &ndash; changes only take effect after saving **that** card.

---

## 1) Language
- **Language**: switches the app language (German/English).
- Note: The toggle in the online help changes the docs only, not the app language.

---

## 2) Appearance
- **App appearance**
  - **Follow system**: follows the system theme (Light/Dark).
  - **Light**: forces light theme.
  - **Dark**: forces dark theme.
- **Dynamic colors (Android 12+)**: adopts accent colors from the system/wallpaper (Material You).

---

## 3) Notifications &ndash; General (DWD)
Applies to **weather alerts** and **pollen**.

- **Country**: country code (e.g., DE).
- **ZIP code**: postal code for DWD data.
- **Alert region (optional)**: free text; useful for district-wide alerts.
- **Alerts enabled**: global toggle for DWD notifications.
- **Quiet from (hour) / Quiet until (hour)**: time window during which **no** DWD notifications are delivered.
- **Save**: applies the values of this card.

---

## 4) Weather alerts (DWD)
Uses **ZIP code** and **quiet times** from *Notifications &ndash; General*.

- **Hazard types** (individually enableable): hail, thunderstorm, storm, rain, snow, wind, frost, fog.
- **Save**: stores the selection.
- **Check now**: immediately performs a DWD request and updates status/notification.

---

## 5) Pollen (DWD)
Uses **ZIP code** and **quiet times** from *Notifications &ndash; General*.

- **Notify from intensity**: threshold from which enabled pollen types will notify (e.g., "medium").
- **Pollen types** (individually enableable): grasses, birch, alder, hazel, ash, mugwort, ragweed, rye.
- **Save**: stores threshold/types.
- **Check now**: fetches pollen values immediately and triggers notifications if applicable.

---

## 6) Voice & output (TTS)
Controls text-to-speech for spoken output/time announcements. Android focused; Desktop/Web have no function.

- **Use voice & output**: TTS global on/off.
- **Current engine**: shows the engine used by the system (e.g., `com.google.android.tts`). Selection is made at system level, not in the app.
- **Language (locale)**: selection in the format `ll-CC` (e.g., `de-DE`, `en-US`). Stored exactly as chosen.
- **Voice**: exact display name of the engine (**list is filtered by the selected language**).
- **Speech rate**: slider 0.20&ndash;1.00 (default 1.00).
- **Pitch**: slider 0.50&ndash;1.50 (default 1.00).
- **Volume**: slider 0.00&ndash;1.00 (default 1.00).
- **Preview (listen now)**: plays a sample with the currently stored values without app restart.
- Note: After fully terminating and restarting the app process, exactly the stored voice/rate/pitch/volume are used. If the selected voice is no longer available, a fallback occurs within the language (exact locale &rarr; language prefix &rarr; first available voice).

---

## 7) Time announcements
Generates time points between start and end time and notifies at the selected cadence.

- **Enable time announcements**: master switch.
- **Start time (inclusive)** / **End time (inclusive)**: time window of announcements.
- **Cadence**: every 10 / 15 / 20 / 30 minutes or hourly.
- **Generate**: schedules announcements for the selected window/cadence (quiet times from *General* are respected).

---

## 8) Background animation
Controls a Lottie animation in the background of the **"Open"** tab.

- **Default animation**: default for all months without their own entry. Default is `Cat playing animation.json`.
- **Monthly assignment**: For **January&ndash;December** you can choose a file per month. Selection from all files under `assets/lottie`.  
  - **No image**: option to deliberately show **no** animation for a month.
  - **Inherit**: leave the month selection empty &rarr; the **default animation** applies.
- **Filenames in the list**: for better readability, the prefix `assets/lottie/` is hidden in the UI; internally the **full paths** are stored.
- **Preview**: choosing a month shows the animation centered below as a preview.
- **Save**: stores the assignments.

**Storage (Shared Preferences)**
- `lottie.default` &rarr; string, e.g., `assets/lottie/Cat playing animation.json`
- `lottie.month.01` &hellip; `lottie.month.12` &rarr; string (full path) or `"<none>"` for "No image"; missing key = inherit from default.

---

## 9) Gamification: spoken sentences
Random short praise sentences when switching an activity from **Overdue** &rarr; **Done**. Spoken only if **TTS is enabled** (*Voice & output*).

- **Up to 5 sentences**: input fields for short motivational sentences. Empty fields are ignored.
- **Language**: inputs apply **per app language**. If the list is empty, the app uses suggestions from the translation:
  - German: "Du r&auml;umst auf wie ein Boss." / "Starker Move&mdash;weiter so." / "Deadline gez&auml;hmt. Nice." / "Ein Punkt weniger auf der Liste." / "Das rollt! Noch eine?"
  - English: "You're cleaning up like a boss." / "Strong move&mdash;keep going." / "Deadline tamed. Nice." / "One less on the list." / "You're on a roll! One more?"
- **Preview**: plays a randomly selected sentence immediately.
- **Save**: stores the inputs.

**Storage (Shared Preferences)**
- `tts.enabled` &rarr; bool; spoken only if `true`.  
- `tts.gamify.sentences.de` and `tts.gamify.sentences.en` &rarr; JSON list of sentences for the respective language.

---

## 10) Dangerous area (data management)
- **Debug info under activities**: shows additional diagnostic info in the lists (for troubleshooting only).
- **Rebuild notifications**: re-plans notifications for a short period (useful after system updates/permission changes).
- **Delete all activities**: permanently removes **all** activities (no undo).

---

## 11) Notes & tips
- **Permissions**: Make sure **notifications** (and, if applicable, **Exact alarms**) are allowed and battery optimization does not throttle the app &ndash; otherwise reminders may be delayed.
- **DWD offline**: Without internet, DWD data is updated only when a connection is available.
- **Multiple Save buttons**: each card saves **its** area separately.
'@
  Write-File $p $c
}