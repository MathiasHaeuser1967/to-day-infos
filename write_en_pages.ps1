$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Base    = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsEn  = Join-Path $Base 'docs\en'
$Screens = Join-Path $DocsEn 'screens'

# ---------------------------------------------------------------------------
# PowerShell 5.1 reads dot-sourced files with the system code page (often
# Windows-1252 instead of UTF-8). We read each PS1 file explicitly as UTF-8
# and execute it via ScriptBlock in the current scope.
# ---------------------------------------------------------------------------
$_u = New-Object System.Text.UTF8Encoding($false)

. ([ScriptBlock]::Create([System.IO.File]::ReadAllText((Join-Path $Base 'scripts\en-pages\_helpers.ps1'), $_u)))

if (Test-Path $DocsEn) { Remove-Item $DocsEn -Recurse -Force }
New-Item -ItemType Directory -Force -Path $Screens | Out-Null

# Load all writer scripts (except _helpers.ps1) with explicit UTF-8
# NOTE: foreach (not ForEach-Object) keeps the current scope so that
#       function definitions become visible at script level.
$_scripts = Get-ChildItem -Path (Join-Path $Base 'scripts\en-pages') -Filter *.ps1 |
              Where-Object { $_.Name -ne '_helpers.ps1' }
foreach ($_s in $_scripts) {
  . ([ScriptBlock]::Create([System.IO.File]::ReadAllText($_s.FullName, $_u)))
}

# Execute functions in desired order
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
