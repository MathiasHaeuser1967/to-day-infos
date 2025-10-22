function Write-De-Permissions {
  $p = Join-Path $DocsDe 'permissions.md'
  $c = @'
# Berechtigungen

ToDay ben&ouml;tigt je nach Funktion folgende System-Berechtigungen:

- **Benachrichtigungen** &ndash; zum Anzeigen von Erinnerungen/Alarme.  
- **Exakte Alarme** *(falls vom System angeboten)* &ndash; p&uuml;nktliche Ausl&ouml;sung zu festem Zeitpunkt.  
- **Mikrofon** *(nur f&uuml;r Sprach-Makros)* &ndash; Erkennung deiner Sprachbefehle.

ToDay verwendet **keine Standort-Daten** und synchronisiert **nicht** in die Cloud.
'@
  Write-File $p $c
}
