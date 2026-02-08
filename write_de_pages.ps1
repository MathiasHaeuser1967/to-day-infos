$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Base    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsDe  = Join-Path $Base 'docs\de'
$Screens = Join-Path $DocsDe 'screens'

# ---------------------------------------------------------------------------
# PowerShell 5.1 liest dot-sourced Dateien mit der System-Codepage (oft
# Windows-1252 statt UTF-8). Daher lesen wir jede PS1-Datei explizit als
# UTF-8 und fuehren sie per ScriptBlock im aktuellen Scope aus.
# ---------------------------------------------------------------------------
$_u = New-Object System.Text.UTF8Encoding($false)

. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\_helpers.ps1'), $_u)))

if (Test-Path $DocsDe) { Remove-Item $DocsDe -Recurse -Force }
New-Item -ItemType Directory -Force -Path $Screens | Out-Null

. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.index.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.quickstart.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.features.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.home.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.settings.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.cleanup.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.voice-macros.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.faq.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.permissions.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.privacy.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.changelog.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.cycle-planner.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.voice-input-keyboard.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.add-activity.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.info.ps1'), $_u)))
. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\de-pages\write.de.screens.impressum.ps1'), $_u)))

Write-De-Index
Write-De-Quickstart
Write-De-Features
Write-De-Screen-Home
Write-De-Screen-Settings
Write-De-Screen-Cleanup
Write-De-Screen-VoiceMacros
Write-De-FAQ
Write-De-Permissions
Write-De-Privacy
Write-De-Changelog
Write-De-Screen-CyclePlanner
Write-De-Screen-VoiceInputKeyboard
Write-De-Screen-AddActivity
Write-De-Screen-Info
Write-De-Screen-Impressum

Write-Host "DE-Seiten neu erzeugt unter $DocsDe" -ForegroundColor Green
