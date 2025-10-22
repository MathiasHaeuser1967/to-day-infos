$ErrorActionPreference = 'Stop'
$Base    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsDe  = Join-Path $Base 'docs\de'
$Screens = Join-Path $DocsDe 'screens'

. (Join-Path $Base 'scripts\de-pages\_helpers.ps1')

if (Test-Path $DocsDe) { Remove-Item $DocsDe -Recurse -Force }
New-Item -ItemType Directory -Force -Path $Screens | Out-Null

. (Join-Path $Base 'scripts\de-pages\write.de.index.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.quickstart.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.features.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.screens.home.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.screens.settings.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.screens.cleanup.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.screens.voice-macros.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.faq.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.permissions.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.privacy.ps1')
. (Join-Path $Base 'scripts\de-pages\write.de.changelog.ps1')

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

Write-Host "DE-Seiten neu erzeugt unter $DocsDe" -ForegroundColor Green
