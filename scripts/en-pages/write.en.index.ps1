function Write-En-Index {
  $p = Join-Path $DocsEn 'index.md'
  $c = @'
# Home

Welcome to the **ToDay** Help (English). Here you will find practical guides, explanations for all switches, and solutions to common problems.

---

## App overview: dialogs & menus

The following overview shows the most important **screens**, **dialogs/sheets**, and **menu items** of the app — as well as **who calls whom**.

#### ASCII fallback (call graph)

```
Home:
  - ＋ New / Edit        -> (Activity dialog)
  - ⋮ Menu > Cleanup    -> (Cleanup sheet)
  - ⋮ Menu > Cycle      -> (Cycle planner sheet)
  - Voice button        -> (Voice capture sheet)
  - Microphone          -> (Dictation sheet)
  - Privacy notice      -> (Privacy notice)

Menu (from Home):
  - Settings     -> [Settings]
  - Info         -> [Info]
  - Voice macros -> [Voice macros]

Settings:
  - Section -> [Time announcements]
  - Section -> [Weather & pollen]
  - Section -> [Language]
  - Section -> [TTS]
  - Danger zone -> (Rebuild notifications)

Voice macros:
  - Click entry               -> (Edit macro – dialog)
  - Long press / context      -> (Edit macro – sheet)
```

### Menu structure (excerpt)

**App menu (from the Home screen):**
- **Settings** – App configuration (language, time announcements, weather/pollen, TTS, danger zone)
- **Info** – System & app information (copyable for support)
- **Voice macros** – Manage voice shortcuts (create, edit, delete)

**Settings – sections:**
- **Time announcements** – Interval, time window, optional Morse, test
- **Weather & pollen** – Enable alerts, sources
- **Language** – German/English
- **TTS** – Voice, speech rate, reading options
- **Danger zone** – *Rebuild notifications* (re-schedule after system changes)

'@
  Write-File $p $c
}