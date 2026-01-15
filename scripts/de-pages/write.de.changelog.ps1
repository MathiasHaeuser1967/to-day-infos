function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

| Version  | Typ       | Beschreibung |
|----------|-----------|--------------|
| 1.0.7.11| Feature | Daily Briefing Button in Home hinzugef&uuml;gt. Sprachausgabe listet offene Aktivit&auml;ten f&uuml;r heute nach Priorit&auml;t auf. |
|| Feature | Multi-Tap am Daily Briefing Button: 1x hohe Priorit&auml;t, 2x mittlere Priorit&auml;t, 3x niedrige Priorit&auml;t. Zeitfenster f&uuml;r Mehrfachklick intern definiert. |
|| Feature | Sprachausgabe f&uuml;r Daily Briefing in Deutsch und Englisch, abh&auml;ngig von der aktuellen App-Sprache. |
|| Enhancement | Untere Action-Buttons in Home jetzt zweireihig, Originalgr&ouml;&szlig;e wiederhergestellt f&uuml;r besseres Tippen. |
|| Bugfix | Build-Fehler im Multi-Tap Daily Briefing behoben (Timer-Konstante und Clamp-Int Konvertierung). |
|| Bugfix | Timer wird beim Schlie&szlig;en von Home korrekt beendet, um Nebenwirkungen zu reduzieren. |
| 1.0.7.10| Feature | Erscheinungsbild verbessert. Wenn Dynamische Farben aus sind, nutzt die App jetzt ein kr&auml;ftiges Orange als Basis mit passenden Akzentfarben. Shad UI verwendet orange. System bleibt unver&auml;ndert. |
|| Feature     | Splash Screen mit Ladeanzeige und Support Box zum Kopieren und Neustarten. |
|| Enhancement | Stabilerer App Start durch kurzen Splash und Watchdog Hinweis bei Verz&ouml;gerung. |
|| Enhancement | Kaltstart beschleunigt. Schwere Initialisierung hinter den ersten Frame verlegt &uuml;ber AppBootstrap. UI rendert schneller. |
|| Enhancement | StartupMetrics protokolliert First Frame Zeit und Frame Timings f&uuml;r Diagnose. |
|| Enhancement | DataWarmup nutzt compute und Isolate f&uuml;r JSON Parsing und Vorarbeit. |
|| Enhancement | AssetWarmup l&auml;dt Bilder erst nach dem ersten Frame in den Cache. |
|| Enhancement | BatteryHelper nur auf Wunsch aus den Einstellungen. Texte kommen aus l10n Deutsch und Englisch. |
|| Enhancement | Notifications in _initNotifications geb&uuml;ndelt. Foreground Chime Port wird sauber registriert. |
|| Enhancement | onCreate entlastet. runApp kommt fr&uuml;her. Splash navigiert erst wenn Bootstrap fertig. |
|| Bugfix      | Fehler &bdquo;ShadTheme.of()&ldquo; behoben. ShadApp ist jetzt der Root Wrapper. |
|| Bugfix      | Build Fehler &bdquo;darkData&ldquo; behoben. Umstellung auf neue ShadTheme API mit Feldern theme und darkTheme. |
|| Bugfix      | Der manuell eingetragene awesome_notifications BootReceiver wurde entfernt. |
|| Bugfix      | ForegroundChime init ohne await. Stabilerer Notification Start. |
| 1.0.6.6  | Enhancement | Das voreingestellte Sprechtempo bei Erstinstallation wurde von 1.0 auf 0.5 reduziert &ndash; f&uuml;r eine angenehmere Sprachausgabe. |
| 1.0.6.5  | Feature   | Aktivit&auml;ten mit Datum/Uhrzeit in der Vergangenheit k&ouml;nnen jetzt angelegt und bearbeitet werden. Beim Speichern erscheint ein Hinweis &ndash; keine harte Sperre mehr. |
| 1.0.6.4  | Release   | Erste Ver&ouml;ffentlichung |

---

## Legende: Typ

| Typ         | Bedeutung |
|-------------|-----------|
| **Feature** | Neue Funktionalit&auml;t f&uuml;r den Nutzer. |
| **Bugfix**  | Fehlerbehebung, die unerw&uuml;nschtes Verhalten korrigiert. |
| **Enhancement** | Verbesserung bestehender Funktionen oder Abl&auml;ufe. |
| **Refactor** | Interne Umstrukturierung des Codes ohne funktionale &Auml;nderung. |
| **Release** | Erstver&ouml;ffentlichung oder formaler Versionssprung. |
| **Removed** | Entfernte Funktionalit&auml;t oder Codebestandteile. |
'@
  Write-File $p $c
}
