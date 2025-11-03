$ErrorActionPreference = 'Stop'
$Base    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsEn  = Join-Path $Base 'docs\en'
$Screens = Join-Path $DocsEn 'screens'

. (Join-Path $Base 'scripts\en-pages\_helpers.ps1')

if (Test-Path $DocsEn) { Remove-Item $DocsEn -Recurse -Force }
New-Item -ItemType Directory -Force -Path $Screens | Out-Null

# Alle Writer-Skripte (außer _helpers.ps1) automatisch dot-sourcen
Get-ChildItem -Path (Join-Path $Base 'scripts\en-pages') -Filter *.ps1 |
  Where-Object { $_.Name -ne '_helpers.ps1' } |
  ForEach-Object { . $_.FullName }

# Funktionen in gewünschter Reihenfolge ausführen
Write-En-Index
Write-En-Quickstart
Write-En-Features
Write-En-FAQ
Write-En-Permissions
Write-En-Privacy
Write-En-Changelog
Write-En-Screen-Home
Write-En-Screen-Settings
Write-En-Screen-Cleanup
Write-En-Screen-VoiceMacros
Write-En-Screen-CyclePlanner
Write-En-Screen-VoiceInputKeyboard
Write-En-Screen-AddActivity
Write-En-Screen-Info
Write-En-Impressum

Write-Host "EN pages regenerated under $DocsEn" -ForegroundColor Green
