function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

| Version  | Typ       | Beschreibung |
|----------|-----------|--------------|
| 1.0.7.0 | Feature | Erscheinungsbild verbessert. Wenn Dynamische Farben aus sind, nutzt die App jetzt ein kräftiges Orange als Basis mit passenden Akzentfarben. Shad UI verwendet orange. System bleibt unverändert. |
|| Feature     | Splash Screen mit Ladeanzeige und Support Box zum Kopieren und Neustarten. |
|| Enhancement | Stabilerer App Start durch kurzen Splash und Watchdog Hinweis bei Verz&ouml;gerung. |
|| Enhancement | Kaltstart beschleunigt. Schwere Initialisierung hinter den ersten Frame verlegt über AppBootstrap. UI rendert schneller. |
|| Enhancement | StartupMetrics protokolliert First Frame Zeit und Frame Timings für Diagnose. |
|| Enhancement | DataWarmup nutzt compute und Isolate für JSON Parsing und Vorarbeit. |
|| Enhancement | AssetWarmup lädt Bilder erst nach dem ersten Frame in den Cache. |
|| Enhancement | BatteryHelper nur auf Wunsch aus den Einstellungen. Texte kommen aus l10n Deutsch und Englisch. |
|| Enhancement | Notifications in _initNotifications gebündelt. Foreground Chime Port wird sauber registriert. |
|| Enhancement | onCreate entlastet. runApp kommt früher. Splash navigiert erst wenn Bootstrap fertig. |
|| Bugfix      | Fehler &bdquo;ShadTheme.of()&ldquo; behoben. ShadApp ist jetzt der Root Wrapper. |
|| Bugfix      | Build Fehler &bdquo;darkData&ldquo; behoben. Umstellung auf neue ShadTheme API mit Feldern theme und darkTheme. |
|| Bugfix      | Der manuell eingetragene awesome_notifications BootReceiver wurde entfernt. |
|| Bugfix      | ForegroundChime init ohne await. Stabilerer Notification Start. |
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
