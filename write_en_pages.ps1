$ErrorActionPreference = 'Stop'
$Base    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsEn  = Join-Path $Base 'docs\en'
$Screens = Join-Path $DocsEn 'screens'

. (Join-Path $Base 'scripts\en-pages\_helpers.ps1')

if (Test-Path $DocsEn) { Remove-Item $DocsEn -Recurse -Force }
New-Item -ItemType Directory -Force -Path $Screens | Out-Null

. (Join-Path $Base 'scripts\en-pages\write.en.changelog.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.faq.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.features.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.index.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.permissions.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.privacy.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.quickstart.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.add-activity.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.cleanup.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.cycle-planner.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.home.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.impressum.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.info.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.settings.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.voice-input-keyboard.ps1')
. (Join-Path $Base 'scripts\en-pages\write.en.screens.voice-macros.ps1')

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
Write-En-Screen-Impressum

Write-Host "EN pages regenerated under $DocsEn" -ForegroundColor Green
