# Changelog

| Version | Typ | Beschreibung |
|---------|-----|-------------|
| 1.0.8.1 | Feature | **Speed Dial FAB:** Die sechs einzelnen Floating Action Buttons auf der Hauptseite wurden durch einen zentralen Speed Dial Button ersetzt. Beim Antippen fÃ¤chern sich alle Aktionen vertikal nach oben auf (`flutter_speed_dial`). |
|| Feature | **Daily Briefing Badge:** Der Briefing-Button im Speed Dial zeigt einen Badge/ZÃ¤hler mit PrioritÃ¤tsfarbe: 1Ã— â–² rot (hoch), 2Ã— â–  orange (mittel), 3Ã— â–¼ grÃ¼n (gering). Der Speed Dial bleibt beim Briefing-Button fÃ¼r Multi-Tap geÃ¶ffnet. |
|| Feature | **Collapsible Header:** Der Kopfbereich auf der Hauptseite (Datum, Statistik-Cards, LEDs) kann Ã¼ber einen Drag-Handle eingeklappt werden. Eingeklappt zeigt eine kompakte 52 px-Leiste Datum, Fortschritt und Hohe-PrioritÃ¤t-Badge. |
|| Feature | **Anzeige & Text:** Neue Einstellungssektion mit Schriftart-Auswahl (System / Inter / Roboto Slab / OpenDyslexic), SchriftgrÃ¶ÃŸen-Slider (80 %â€“150 %) und Live-Vorschau einer Beispiel-AktivitÃ¤tskarte. |
|| Enhancement | 32 hartcodierte SchriftgrÃ¶ÃŸen durch dynamische Theme-Referenzen (`Theme.of(context).textTheme`) ersetzt. Die App reagiert jetzt vollstÃ¤ndig auf SchriftgrÃ¶ÃŸen-Einstellungen. |
|| Enhancement | `google_fonts`-Paket integriert fÃ¼r die Schriftart-Auswahl in den Einstellungen. |
| 1.0.7.12 | Feature | Neues App-Branding: Pony-Icon (Weihnachtsglocke) als neues App-Logo hinzugefÃ¼gt und als PNG Asset im Projekt integriert. |
|| Feature | AppBar-MenÃ¼button ersetzt: die drei Punkte wurden durch das Pony-Icon ersetzt. Tippen Ã¶ffnet weiterhin das MenÃ¼. |
|| Enhancement | Kopfbereich unter dem Titel (ShadCard) optisch an Activity-Cards angepasst: Breite reduziert durch zentrales horizontales Padding, so dass Kopfbereich und Activity-FlÃ¤chen in Flucht stehen. |
|| Enhancement | Ecken des Kopfbereichs jetzt vollstÃ¤ndig abgerundet: oben und unten gleicher Radius fÃ¼r ein ruhigeres Gesamtbild. |
|| Enhancement | TabBar-Bereich auf die gleiche Fluchtbreite wie Kopfbereich umgestellt, damit alle oberen Elemente konsistent ausgerichtet sind. |
|| Feature | Neuer TD Schritte Heute Trigger im Titel: `TD:steps:today`. Wenn eine solche AktivitÃ¤t fÃ¤llig wird, wird statt des Titels die Anzahl **Schritte heute** per Sprachausgabe ausgegeben. |
|| Feature | TD Schritte Heute Berechnung Ã¼ber Android Sensor **STEP_COUNTER** ohne externe Dienste. Tageswert wird als Differenz berechnet: aktueller STEP_COUNTER minus Tages-Startwert-Baseline. |
|| Feature | TD Schritte Heute Baseline-Logik (Variante A): Beim ersten AuslÃ¶sen am Tag wird die Baseline gesetzt und klar angesagt. Ab dem zweiten AuslÃ¶sen am selben Datum wird die Differenz angesagt. |
|| Feature | TD Schritte Heute Reset-Fall: Wenn aktueller STEP_COUNTER kleiner als Baseline ist, wird ein Sensor-Reset oder GerÃ¤te-Neustart angenommen, Baseline wird neu gesetzt und es startet wieder bei 0 ab jetzt. |
|| Enhancement | TD Schritte Heute Fehlerstatus statt stilles 0: Bei fehlender Berechtigung (ACTIVITY_RECOGNITION) oder fehlendem Sensorwert wird ein klarer Fehlerstatus erzeugt und angesagt. |
|| Enhancement | Android STEP_COUNTER Anbindung stabilisiert: Sensorwert wird im App-Prozess fortlaufend aktualisiert, so dass ein zweiter Trigger-Aufruf auch ohne Schritt-Event genau in diesem Moment korrekte Werte liefern kann. |
|| Feature | Home Mini-Status Zeile eingefÃ¼hrt: Direkt oberhalb der LED-Zeile wird **Schritte heute** in der SchriftgrÃ¶ÃŸe der LED-Warnungen angezeigt. Deutsch und Englisch werden unterstÃ¼tzt. |
|| Enhancement | Home Mini-Status ist erweiterbar: Die Zeile ist so aufgebaut, dass spÃ¤ter weitere kleine Statuswerte ergÃ¤nzt werden kÃ¶nnen, ohne das Layout neu zu strukturieren. |
|| Enhancement | Aktualisierung der Home Mini-Status Werte Ã¼ber den bestehenden Day Change Watcher im Minuten-Takt, ohne neue Hintergrunddienste. |
| 1.0.7.11 | Feature | Daily Briefing Button in Home hinzugefÃ¼gt. Sprachausgabe listet offene AktivitÃ¤ten fÃ¼r heute nach PrioritÃ¤t auf. |
|| Feature | Multi-Tap am Daily Briefing Button: 1Ã— hohe PrioritÃ¤t, 2Ã— mittlere PrioritÃ¤t, 3Ã— niedrige PrioritÃ¤t. Zeitfenster fÃ¼r Mehrfachklick intern definiert. |
|| Feature | Sprachausgabe fÃ¼r Daily Briefing in Deutsch und Englisch, abhÃ¤ngig von der aktuellen App-Sprache. |
|| Feature | TD Trigger im Titel: `TD:brief:high`, `TD:brief:mid`, `TD:brief:low`. Wenn eine solche AktivitÃ¤t fÃ¤llig wird, wird statt des Titels ein generiertes Tagesbriefing per Sprachausgabe ausgegeben. |
|| Feature | TD Briefing Filter nach PrioritÃ¤t: `TD:brief:high` spricht nur **Hoch**, `TD:brief:mid` spricht nur **Mittel**, `TD:brief:low` spricht nur **Niedrig**. Andere PrioritÃ¤ten werden nicht vorgelesen. |
|| Feature | TD Briefing Scope und Regeln: gilt fÃ¼r den Tag der Trigger-AktivitÃ¤t, sortiert erst Aufgaben mit Uhrzeit aufsteigend, dann ohne Uhrzeit, begrenzt auf max. 5 mit Uhrzeit und max. 3 ohne Uhrzeit, Zusatz â€žund weitere Aufgaben" bei mehr. TD-Trigger-AktivitÃ¤t selbst und alle Titel mit `TD:` werden nicht vorgelesen. |
|| Feature | Freundliche Anzeige fÃ¼r TD Trigger in der AktivitÃ¤tenliste statt Roh-Token. Deutsch: Tagesbriefing Hoch, Mittel, Niedrig. Englisch: Daily Briefing High, Mid, Low. Gespeicherter Titel bleibt unverÃ¤ndert. |
|| Feature | Neuer TD Finance Trigger im Titel: `TD:finance:gold`, `TD:finance:silver`. Wenn eine solche AktivitÃ¤t fÃ¤llig wird, wird statt des Titels eine generierte Preisansage per Sprachausgabe ausgegeben. |
|| Feature | TD Finance Datenquelle und Mapping: Endpoint `https://data-asg.goldprice.org/dbXRates/USD`. Gold nimmt `xauClose`, Silber nimmt `xagClose` als Preis in USD. |
|| Feature | TD Finance Cache Layer: Preise werden pro Metall ca. 10 bis 15 Minuten gecached oder bis App-Neustart, um Mehrfach-Fetches beim Scheduling zu vermeiden. |
|| Feature | TD Finance Offline und Fehlerfall: Keine Netzwerk-Calls im Notification Callback. Bei Netzwerkfehler wird trotzdem gescheduled und eine klare Fallback-Ansage erzeugt. Kein Crash, keine Blockade des Notification-Systems. |
|| Feature | TD Finance Notification-Regeln: Standard laut mit Sound, allowWhileIdle aktiv. Keine doppelte Notification zum Startzeitpunkt fÃ¼r Trigger-AktivitÃ¤ten. |
|| Feature | Freundliche Anzeige fÃ¼r TD Finance Trigger in der AktivitÃ¤tenliste statt Roh-Token. Deutsch: Goldpreis-Ansage, Silberpreis-Ansage. Englisch: Gold price announcement, Silver price announcement. |
|| Bugfix | Daily Briefing Aufsage filtert jetzt konsequent alle AktivitÃ¤ten, deren Titel mit `TD:` beginnt, damit Trigger-AktivitÃ¤ten nicht als normale Aufgaben vorgelesen werden. |
|| Enhancement | Untere Action-Buttons in Home jetzt zweireihig, OriginalgrÃ¶ÃŸe wiederhergestellt fÃ¼r besseres Tippen. |
|| Bugfix | Build-Fehler im Multi-Tap Daily Briefing behoben (Timer-Konstante und Clamp-Int-Konvertierung). |
|| Bugfix | Timer wird beim SchlieÃŸen von Home korrekt beendet, um Nebenwirkungen zu reduzieren. |
| 1.0.7.10 | Feature | Erscheinungsbild verbessert. Wenn Dynamische Farben aus sind, nutzt die App jetzt ein krÃ¤ftiges Orange als Basis mit passenden Akzentfarben. Shad UI verwendet orange. System bleibt unverÃ¤ndert. |
|| Feature | Splash Screen mit Ladeanzeige und Support Box zum Kopieren und Neustarten. |
|| Enhancement | Stabilerer App-Start durch kurzen Splash und Watchdog-Hinweis bei VerzÃ¶gerung. |
|| Enhancement | Kaltstart beschleunigt. Schwere Initialisierung hinter den ersten Frame verlegt Ã¼ber AppBootstrap. UI rendert schneller. |
|| Enhancement | StartupMetrics protokolliert First-Frame-Zeit und Frame-Timings fÃ¼r Diagnose. |
|| Enhancement | DataWarmup nutzt compute und Isolate fÃ¼r JSON-Parsing und Vorarbeit. |
|| Enhancement | AssetWarmup lÃ¤dt Bilder erst nach dem ersten Frame in den Cache. |
|| Enhancement | BatteryHelper nur auf Wunsch aus den Einstellungen. Texte kommen aus l10n Deutsch und Englisch. |
|| Enhancement | Notifications in _initNotifications gebÃ¼ndelt. Foreground Chime Port wird sauber registriert. |
|| Enhancement | onCreate entlastet. runApp kommt frÃ¼her. Splash navigiert erst wenn Bootstrap fertig. |
|| Bugfix | Fehler â€žShadTheme.of()" behoben. ShadApp ist jetzt der Root Wrapper. |
|| Bugfix | Build-Fehler â€ždarkData" behoben. Umstellung auf neue ShadTheme API mit Feldern theme und darkTheme. |
|| Bugfix | Der manuell eingetragene awesome_notifications BootReceiver wurde entfernt. |
|| Bugfix | ForegroundChime init ohne await. Stabilerer Notification-Start. |
| 1.0.6.6 | Enhancement | Das voreingestellte Sprechtempo bei Erstinstallation wurde von 1.0 auf 0.5 reduziert â€“ fÃ¼r eine angenehmere Sprachausgabe. |
| 1.0.6.5 | Feature | AktivitÃ¤ten mit Datum/Uhrzeit in der Vergangenheit kÃ¶nnen jetzt angelegt und bearbeitet werden. Beim Speichern erscheint ein Hinweis â€“ keine harte Sperre mehr. |
| 1.0.6.4 | Release | Erste VerÃ¶ffentlichung. |

---

## Legende: Typ

| Typ | Bedeutung |
|-----|-----------|
| **Feature** | Neue FunktionalitÃ¤t fÃ¼r den Nutzer. |
| **Bugfix** | Fehlerbehebung, die unerwÃ¼nschtes Verhalten korrigiert. |
| **Enhancement** | Verbesserung bestehender Funktionen oder AblÃ¤ufe. |
| **Refactor** | Interne Umstrukturierung des Codes ohne funktionale Ã„nderung. |
| **Release** | ErstverÃ¶ffentlichung oder formaler Versionssprung. |
| **Removed** | Entfernte FunktionalitÃ¤t oder Codebestandteile. |