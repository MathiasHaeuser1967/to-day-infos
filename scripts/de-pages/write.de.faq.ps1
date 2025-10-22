function Write-De-FAQ {
  $p = Join-Path $DocsDe 'faq.md'
  $c = @'
# H&auml;ufige Fragen (FAQ)

## Benachrichtigungen kommen nicht an
- In **Einstellungen &rarr; Benachrichtigungen** die Berechtigung erteilen.  
- **Akku-Optimierung** f&uuml;r ToDay deaktivieren.  
- **Nicht st&ouml;ren** pr&uuml;fen.

## Ich h&ouml;re keine Zeitansagen
- **Zeitansagen aktivieren** und Medien-Lautst&auml;rke erh&ouml;hen.  
- TTS-Engine/Stimmpaket korrekt installiert?

## Nach dem Aufr&auml;umen bleiben Erinnerungen sichtbar
- **Benachrichtigungen/Alarme stornieren** aktivieren und erneut ausf&uuml;hren.

## App-Sprache passt nicht
- In **Einstellungen &rarr; Sprache** wechseln (Deutsch/Englisch).
'@
  Write-File $p $c
}
