function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

| Version  | Typ       | Beschreibung |
|----------|-----------|--------------|
| 1.0.7.0 | Feature | Erscheinungsbild verbessert. Wenn Dynamische Farben aus sind, nutzt die App jetzt ein kräftiges Orange als Basis mit passenden Akzentfarben. Shad UI verwendet orange. System bleibt unverändert. |
|| Feature     | Splash Screen mit Ladeanzeige und Support Box zum Kopieren und Neustarten. |
|| Enhancement | Stabilerer App Start durch kurzen Splash und Watchdog Hinweis bei Verz&ouml;gerung. |
|| Bugfix      | Fehler &bdquo;ShadTheme.of()&ldquo; behoben. ShadApp ist jetzt der Root Wrapper. |
|| Bugfix      | Build Fehler &bdquo;darkData&ldquo; behoben. Umstellung auf neue ShadTheme API mit Feldern theme und darkTheme. |
| 1.0.6.6  | Enhancement | Das voreingestellte Sprechtempo bei Erstinstallation wurde von 1.0 auf 0.5 reduziert – für eine angenehmere Sprachausgabe. |
| 1.0.6.5  | Feature   | Aktivit&auml;ten mit Datum/Uhrzeit in der Vergangenheit k&ouml;nnen jetzt angelegt und bearbeitet werden. Beim Speichern erscheint ein Hinweis – keine harte Sperre mehr. |
| 1.0.6.4  | Release   | Erste Ver&ouml;ffentlichung |

---

## Legende: Typ

| Typ         | Bedeutung |
|-------------|-----------|
| **Feature** | Neue Funktionalität für den Nutzer. |
| **Bugfix**  | Fehlerbehebung, die unerwünschtes Verhalten korrigiert. |
| **Enhancement** | Verbesserung bestehender Funktionen oder Abläufe. |
| **Refactor** | Interne Umstrukturierung des Codes ohne funktionale Änderung. |
| **Release** | Erstveröffentlichung oder formaler Versionssprung. |
| **Removed** | Entfernte Funktionalität oder Codebestandteile. |
'@
  Write-File $p $c
}
