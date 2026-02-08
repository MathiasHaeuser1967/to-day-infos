function Ensure-Dir($Path){
  if(-not (Test-Path -LiteralPath $Path)){
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
  }
}

# Schreibt Inhalte zuverlässig als UTF-8 (ohne BOM) – keine Sanitizer/Ersetzungen!
function Write-File($Path,$Content){
  $dir = Split-Path -Parent $Path
  if($dir){ Ensure-Dir $dir }
  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}
