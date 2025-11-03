function Write-En-Features {
  $p = Join-Path $DocsEn 'features.md'
  $c = @'
# Features

- **Activities & reminders**: plan tasks with date/time, repeat and multiple reminders.
- **Spoken time (TTS)**: optional time announcements, configurable.
- **Cycle planner**: schedule recurring activities in cycles.
- **Voice input**: dictate text via the keyboard mic (no audio is stored).
- **Cleanup**: archive/delete old entries with a guided dialog.
- **Exact alarms** (if supported by the device).
- **Local first**: data stored locally in SQLite; no account required.
- **Privacy-friendly**: no analytics, no tracking, no ads.
- **Weather/pollen alerts (DWD)**: fetched securely via HTTPS; no profiling.
- **Material design** with dark/light theme.
'@
  Write-File $p $c
}