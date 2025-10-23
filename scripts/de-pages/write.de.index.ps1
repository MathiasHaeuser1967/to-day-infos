function Write-De-Index {
  $p = Join-Path $DocsDe 'index.md'
  $c = @'
# Start

Willkommen zur **ToDay** Hilfe (Deutsch). Hier findest du praxisnahe Anleitungen, Erkl&auml;rungen zu allen Schaltern und L&ouml;sungen f&uuml;r h&auml;ufige Probleme.

'@
  Write-File $p $c
}
