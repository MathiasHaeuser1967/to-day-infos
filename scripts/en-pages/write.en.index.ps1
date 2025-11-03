function Write-En-Index {
  $p = Join-Path $DocsEn 'index.md'
  $c = @'
# Home
Welcome to **ToDay Help**.

ToDay helps you plan and remember activities – with clear lists, reminders, spoken time announcements (TTS), and optional cycles.
Everything runs **locally on your device**. There is **no tracking, no ads, no online account**.

---

## Quick start
- Install the app and open it once.
- Allow **notifications** and set **Battery optimization → None** (No restrictions), so reminders aren't delayed.
- Tap **+** on **Home** to add your first activity. Set title, date/time, reminders, and (optional) repetition.
- Mark activities as **Done** when finished.

See: [Quick start](quickstart.md), [Permissions](permissions.md), [FAQ](faq.md), [Privacy](privacy.md), [Changelog](changelog.md), [Imprint](impressum.md).

---

## Screens
- **Home:** your list of activities → [Home](screens/home.md)
- **Cycle planner:** plan recurring activities → [Cycle planner](screens/cycle-planner.md)
- **Voice input (keyboard):** dictate text via the keyboard mic → [Voice input](screens/voice-input-keyboard.md)
- **Cleanup:** archive or delete old entries → [Cleanup](screens/cleanup.md)
- **Settings:** tune notifications, speech and more → [Settings](screens/settings.md)
- **Info:** app details & credits → [Info](screens/info.md)
'@
  Write-File $p $c
}