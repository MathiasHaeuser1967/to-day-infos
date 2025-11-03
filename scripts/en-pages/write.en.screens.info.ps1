function Write-En-Screen-Info {
  $p = Join-Path $Screens 'info.md'
  $c = @'
# Info

General information about the app.

- **Version & build**: shown in the app
- **Developer**: see [Imprint](../impressum.md)
- **Permissions used**: Notifications, Exact alarms (if supported), Microphone (voice input), Network (DWD alerts)
- **Libraries & acknowledgements**: open‑source components as listed in the app
- **Privacy**: see [Privacy](../privacy.md)

For detailed credits and notices, see the acknowledgements section in the app.
'@
  Write-File $p $c
}