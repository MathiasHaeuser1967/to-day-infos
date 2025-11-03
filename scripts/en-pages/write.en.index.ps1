function Write-En-Index {
  $p = Join-Path $DocsEn 'index.md'
  $c = @'
# Home
Welcome to **ToDay Help** (English).

ToDay helps you plan and remember activities — with clear lists, reminders/alarms, optional spoken time announcements (TTS), and recurring cycles. Everything runs **locally on your device**. No tracking, no ads, no online account.

---

## Quick start
- Install the app and open it once.
- Allow **notifications** and set **Battery optimization → No restrictions** so reminders are not delayed.
- Tap **+** on **Home** to add your first activity. Set title, date/time, reminders, and optionally a repetition.
- Mark activities as **Done** when finished.

See also: [Quick start](quickstart.md), [Permissions](permissions.md), [FAQ](faq.md), [Privacy](privacy.md), [Changelog](changelog.md), [Imprint](impressum.md).

---

## Screens
- **Home:** your list of activities → [Home](screens/home.md)
- **Cycle planner:** schedule recurring activities → [Cycle planner](screens/cycle-planner.md)
- **Voice input (keyboard):** dictate text via the keyboard’s mic → [Voice input](screens/voice-input-keyboard.md)
- **Cleanup:** archive or delete old entries → [Cleanup](screens/cleanup.md)
- **Settings:** tune notifications, speech and more → [Settings](screens/settings.md)
- **Voice macros:** create fast voice templates → [Voice macros](screens/voice-macros.md)
- **Info:** app details & credits → [Info](screens/info.md)
'@
  Write-File $p $c
}