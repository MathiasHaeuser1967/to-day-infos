function Write-En-Screen-VoiceMacros {
  $p = Join-Path $Screens 'voice-macros.md'
  $c = @'
# Voice macros

Speed up input with short voice **triggers** that expand into longer templates which the parser turns into an activity.

## How it works
1) You speak the **trigger**.  
2) The app replaces it with the configured **expansion** text.  
3) The **parser** extracts title/description/date/time.

**Example**  
Trigger: `macro one` → Expansion: `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`.

## List overview
- **Search** by name/trigger
- **Filter**: All · Active · Inactive
- **New macro**: **+**
'@
  Write-File $p $c
}