function Write-De-Privacy {
  $p = Join-Path $DocsDe 'privacy.md'
  $c = @'
# Datenschutz

- Alle Daten werden **lokal** auf deinem Ger&auml;t verarbeitet.  
- Es findet **keine Cloud-Synchronisation** statt.  
- Die vollst&auml;ndige Datenschutzerkl&auml;rung findest du auf der Play-Store-Seite.

Bei Fragen wende dich an den Support in der App.
'@
  Write-File $p $c
}
