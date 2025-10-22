function Write-De-Features {
  $p = Join-Path $DocsDe 'features.md'
  $c = @'
# Funktionen

- **Home-&Uuml;bersicht:** Tagesansicht mit offenen/erledigten Aktivit&auml;ten, Kennzahlen und Fortschritt.
- **Zeitansagen:** Sprachhinweise (Text-to-Speech) zu definierten Zeiten oder Intervallen.
- **Aufr&auml;umen:** Aktivit&auml;ten eines Tages l&ouml;schen &ndash; Quelle w&auml;hlbar, inkl. Stornierung der zugeh&ouml;rigen Benachrichtigungen/Alarme.
- **Zyklen planen:** Wiederkehrende Aktivit&auml;ten automatisch erzeugen (z. B. t&auml;glich, w&ouml;chentlich).
- **Sprach-Makros:** H&auml;ufige Aktionen per Sprachbefehl ausl&ouml;sen.
'@
  Write-File $p $c
}
