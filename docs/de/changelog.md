# Changelog

| Version | Typ | Beschreibung |
|---------|-----|-------------|
| 1.0.7.15 | Feature | **FlexColorScheme Akzentfarbe:** Die bisherige Orange/Violet-Auswahl wurde durch 12 Material-3-Farbschemata ersetzt (`flex_color_scheme`). In den Einstellungen zeigt ein Farbkreis-Grid alle Varianten als tippbare Kreise. |
|| Feature | **Surface-Blend-Level:** Neuer Slider in den Erscheinungsbild-Einstellungen. Regelt, wie stark die gewählte Akzentfarbe in Hintergrundflächen einfließt (0–40). FlexColorScheme berechnet alle Surface-Container-Farben automatisch. |
|| Feature | **Überfällig-Erinnerung (Overdue Nag):** Wiederkehrende Sprachansage bei überfälligen Aktivitäten mit drei Eskalationsstufen: freundlich (0–15 Min), bestimmt (15–30 Min), nachdrücklich (> 30 Min). Bei mehreren überfälligen Aktivitäten wird eine Zusammenfassung gesprochen. |
|| Feature | **Überfällig-Erinnerung Konfiguration:** Neue Einstellungssektion mit Aktivieren/Deaktivieren, Wiederholungsintervall (5/10/15/30/60 Minuten) und maximaler Wiederholungsanzahl (unbegrenzt/3/5/10). Standard: deaktiviert. |
|| Enhancement | **Morse WPM-Maximum erhöht:** Die maximale Morse-Geschwindigkeit wurde von 45 auf 100 WPM angehoben, um auch HST-Wettbewerbe (High Speed Telegraphy) abzudecken. |
|| Enhancement | **l10n-Schlüssel erweitert:** 15 neue Lokalisierungsschlüssel für Deutsch und Englisch (Farbmischung, Überfällig-Erinnerung). |
|| Enhancement | **Theme-Erzeugung modernisiert:** Manuelle `ColorScheme.copyWith()`-Aufrufe durch `FlexThemeData.light/dark()` ersetzt. Surface-Farben und Blend-Level werden jetzt automatisch berechnet. |
|| Enhancement | **Migration bestehender Einstellungen:** Alte Orange/Violet-Auswahl wird beim ersten Start automatisch auf das entsprechende FlexScheme migriert. |
| 1.0.7.14 | Feature | **Speed Dial FAB:** Die sechs einzelnen Floating Action Buttons auf der Hauptseite wurden durch einen zentralen Speed Dial Button ersetzt. Beim Antippen fächern sich alle Aktionen vertikal nach oben auf (`flutter_speed_dial`). |
|| Feature | **Daily Briefing Badge:** Der Briefing-Button im Speed Dial zeigt einen Badge/Zähler mit Prioritätsfarbe: 1× ▲ rot (hoch), 2× ■ orange (mittel), 3× ▼ grün (gering). Der Speed Dial bleibt beim Briefing-Button für Multi-Tap geöffnet. |
|| Feature | **Collapsible Header:** Der Kopfbereich auf der Hauptseite (Datum, Statistik-Cards, LEDs) kann über einen Drag-Handle eingeklappt werden. Eingeklappt zeigt eine kompakte 52 px-Leiste Datum, Fortschritt und Hohe-Priorität-Badge. |
|| Feature | **Anzeige & Text:** Neue Einstellungssektion mit Schriftart-Auswahl (System / Inter / Roboto Slab / OpenDyslexic), Schriftgrößen-Slider (80 %–150 %) und Live-Vorschau einer Beispiel-Aktivitätskarte. |
|| Enhancement | 32 hartcodierte Schriftgrößen durch dynamische Theme-Referenzen (`Theme.of(context).textTheme`) ersetzt. Die App reagiert jetzt vollständig auf Schriftgrößen-Einstellungen. |
|| Enhancement | `google_fonts`-Paket integriert für die Schriftart-Auswahl in den Einstellungen. |
| 1.0.7.12 | Feature | Neues App-Branding: Pony-Icon (Weihnachtsglocke) als neues App-Logo hinzugefügt und als PNG Asset im Projekt integriert. |
|| Feature | AppBar-Menübutton ersetzt: die drei Punkte wurden durch das Pony-Icon ersetzt. Tippen öffnet weiterhin das Menü. |
|| Enhancement | Kopfbereich unter dem Titel (ShadCard) optisch an Activity-Cards angepasst: Breite reduziert durch zentrales horizontales Padding, so dass Kopfbereich und Activity-Flächen in Flucht stehen. |
|| Enhancement | Ecken des Kopfbereichs jetzt vollständig abgerundet: oben und unten gleicher Radius für ein ruhigeres Gesamtbild. |
|| Enhancement | TabBar-Bereich auf die gleiche Fluchtbreite wie Kopfbereich umgestellt, damit alle oberen Elemente konsistent ausgerichtet sind. |
|| Feature | Neuer TD Schritte Heute Trigger im Titel: `TD:steps:today`. Wenn eine solche Aktivität fällig wird, wird statt des Titels die Anzahl **Schritte heute** per Sprachausgabe ausgegeben. |
|| Feature | TD Schritte Heute Berechnung über Android Sensor **STEP_COUNTER** ohne externe Dienste. Tageswert wird als Differenz berechnet: aktueller STEP_COUNTER minus Tages-Startwert-Baseline. |
|| Feature | TD Schritte Heute Baseline-Logik (Variante A): Beim ersten Auslösen am Tag wird die Baseline gesetzt und klar angesagt. Ab dem zweiten Auslösen am selben Datum wird die Differenz angesagt. |
|| Feature | TD Schritte Heute Reset-Fall: Wenn aktueller STEP_COUNTER kleiner als Baseline ist, wird ein Sensor-Reset oder Geräte-Neustart angenommen, Baseline wird neu gesetzt und es startet wieder bei 0 ab jetzt. |
|| Enhancement | TD Schritte Heute Fehlerstatus statt stilles 0: Bei fehlender Berechtigung (ACTIVITY_RECOGNITION) oder fehlendem Sensorwert wird ein klarer Fehlerstatus erzeugt und angesagt. |
|| Enhancement | Android STEP_COUNTER Anbindung stabilisiert: Sensorwert wird im App-Prozess fortlaufend aktualisiert, so dass ein zweiter Trigger-Aufruf auch ohne Schritt-Event genau in diesem Moment korrekte Werte liefern kann. |
|| Feature | Home Mini-Status Zeile eingeführt: Direkt oberhalb der LED-Zeile wird **Schritte heute** in der Schriftgröße der LED-Warnungen angezeigt. Deutsch und Englisch werden unterstützt. |
|| Enhancement | Home Mini-Status ist erweiterbar: Die Zeile ist so aufgebaut, dass später weitere kleine Statuswerte ergänzt werden können, ohne das Layout neu zu strukturieren. |
|| Enhancement | Aktualisierung der Home Mini-Status Werte über den bestehenden Day Change Watcher im Minuten-Takt, ohne neue Hintergrunddienste. |
| 1.0.7.11 | Feature | Daily Briefing Button in Home hinzugefügt. Sprachausgabe listet offene Aktivitäten für heute nach Priorität auf. |
|| Feature | Multi-Tap am Daily Briefing Button: 1× hohe Priorität, 2× mittlere Priorität, 3× niedrige Priorität. Zeitfenster für Mehrfachklick intern definiert. |
|| Feature | Sprachausgabe für Daily Briefing in Deutsch und Englisch, abhängig von der aktuellen App-Sprache. |
|| Feature | TD Trigger im Titel: `TD:brief:high`, `TD:brief:mid`, `TD:brief:low`. Wenn eine solche Aktivität fällig wird, wird statt des Titels ein generiertes Tagesbriefing per Sprachausgabe ausgegeben. |
|| Feature | TD Briefing Filter nach Priorität: `TD:brief:high` spricht nur **Hoch**, `TD:brief:mid` spricht nur **Mittel**, `TD:brief:low` spricht nur **Niedrig**. Andere Prioritäten werden nicht vorgelesen. |
|| Feature | TD Briefing Scope und Regeln: gilt für den Tag der Trigger-Aktivität, sortiert erst Aufgaben mit Uhrzeit aufsteigend, dann ohne Uhrzeit, begrenzt auf max. 5 mit Uhrzeit und max. 3 ohne Uhrzeit, Zusatz „und weitere Aufgaben" bei mehr. TD-Trigger-Aktivität selbst und alle Titel mit `TD:` werden nicht vorgelesen. |
|| Feature | Freundliche Anzeige für TD Trigger in der Aktivitätenliste statt Roh-Token. Deutsch: Tagesbriefing Hoch, Mittel, Niedrig. Englisch: Daily Briefing High, Mid, Low. Gespeicherter Titel bleibt unverändert. |
|| Feature | Neuer TD Finance Trigger im Titel: `TD:finance:gold`, `TD:finance:silver`. Wenn eine solche Aktivität fällig wird, wird statt des Titels eine generierte Preisansage per Sprachausgabe ausgegeben. |
|| Feature | TD Finance Datenquelle und Mapping: Endpoint `https://data-asg.goldprice.org/dbXRates/USD`. Gold nimmt `xauClose`, Silber nimmt `xagClose` als Preis in USD. |
|| Feature | TD Finance Cache Layer: Preise werden pro Metall ca. 10 bis 15 Minuten gecached oder bis App-Neustart, um Mehrfach-Fetches beim Scheduling zu vermeiden. |
|| Feature | TD Finance Offline und Fehlerfall: Keine Netzwerk-Calls im Notification Callback. Bei Netzwerkfehler wird trotzdem gescheduled und eine klare Fallback-Ansage erzeugt. Kein Crash, keine Blockade des Notification-Systems. |
|| Feature | TD Finance Notification-Regeln: Standard laut mit Sound, allowWhileIdle aktiv. Keine doppelte Notification zum Startzeitpunkt für Trigger-Aktivitäten. |
|| Feature | Freundliche Anzeige für TD Finance Trigger in der Aktivitätenliste statt Roh-Token. Deutsch: Goldpreis-Ansage, Silberpreis-Ansage. Englisch: Gold price announcement, Silver price announcement. |
|| Bugfix | Daily Briefing Aufsage filtert jetzt konsequent alle Aktivitäten, deren Titel mit `TD:` beginnt, damit Trigger-Aktivitäten nicht als normale Aufgaben vorgelesen werden. |
|| Enhancement | Untere Action-Buttons in Home jetzt zweireihig, Originalgröße wiederhergestellt für besseres Tippen. |
|| Bugfix | Build-Fehler im Multi-Tap Daily Briefing behoben (Timer-Konstante und Clamp-Int-Konvertierung). |
|| Bugfix | Timer wird beim Schließen von Home korrekt beendet, um Nebenwirkungen zu reduzieren. |
| 1.0.7.10 | Feature | Erscheinungsbild verbessert. Wenn Dynamische Farben aus sind, nutzt die App jetzt ein kräftiges Orange als Basis mit passenden Akzentfarben. Shad UI verwendet orange. System bleibt unverändert. |
|| Feature | Splash Screen mit Ladeanzeige und Support Box zum Kopieren und Neustarten. |
|| Enhancement | Stabilerer App-Start durch kurzen Splash und Watchdog-Hinweis bei Verzögerung. |
|| Enhancement | Kaltstart beschleunigt. Schwere Initialisierung hinter den ersten Frame verlegt über AppBootstrap. UI rendert schneller. |
|| Enhancement | StartupMetrics protokolliert First-Frame-Zeit und Frame-Timings für Diagnose. |
|| Enhancement | DataWarmup nutzt compute und Isolate für JSON-Parsing und Vorarbeit. |
|| Enhancement | AssetWarmup lädt Bilder erst nach dem ersten Frame in den Cache. |
|| Enhancement | BatteryHelper nur auf Wunsch aus den Einstellungen. Texte kommen aus l10n Deutsch und Englisch. |
|| Enhancement | Notifications in _initNotifications gebündelt. Foreground Chime Port wird sauber registriert. |
|| Enhancement | onCreate entlastet. runApp kommt früher. Splash navigiert erst wenn Bootstrap fertig. |
|| Bugfix | Fehler „ShadTheme.of()" behoben. ShadApp ist jetzt der Root Wrapper. |
|| Bugfix | Build-Fehler „darkData" behoben. Umstellung auf neue ShadTheme API mit Feldern theme und darkTheme. |
|| Bugfix | Der manuell eingetragene awesome_notifications BootReceiver wurde entfernt. |
|| Bugfix | ForegroundChime init ohne await. Stabilerer Notification-Start. |
| 1.0.6.6 | Enhancement | Das voreingestellte Sprechtempo bei Erstinstallation wurde von 1.0 auf 0.5 reduziert – für eine angenehmere Sprachausgabe. |
| 1.0.6.5 | Feature | Aktivitäten mit Datum/Uhrzeit in der Vergangenheit können jetzt angelegt und bearbeitet werden. Beim Speichern erscheint ein Hinweis – keine harte Sperre mehr. |
| 1.0.6.4 | Release | Erste Veröffentlichung. |

---

## Legende: Typ

| Typ | Bedeutung |
|-----|-----------|
| **Feature** | Neue Funktionalität für den Nutzer. |
| **Bugfix** | Fehlerbehebung, die unerwünschtes Verhalten korrigiert. |
| **Enhancement** | Verbesserung bestehender Funktionen oder Abläufe. |
| **Refactor** | Interne Umstrukturierung des Codes ohne funktionale Änderung. |
| **Release** | Erstveröffentlichung oder formaler Versionssprung. |
| **Removed** | Entfernte Funktionalität oder Codebestandteile. |