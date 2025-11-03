function Write-En-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

The **Home** screen shows your activities. Tap an item to open details; use the checkbox to mark **Done**.

**Top actions**
- **+**: add a new activity
- **Search**: filter the list
- **Menu**: Settings, Cleanup, Info

**List**
- Shows title, date/time, repeat and reminder badges.
- Overdue items appear at the top.
- Swipe actions (if enabled by your launcher/ROM) for quick complete/snooze.

**Notifications & speech**
- Depending on settings you'll receive notifications/alarms and optional spoken time announcements (TTS).
'@
  Write-File $p $c
}