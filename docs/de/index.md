# ToDay â€“ Deine intelligente Tageszentrale

Willkommen zur **ToDay**-Dokumentation. Diese Seite gibt dir einen umfassenden Ãœberblick Ã¼ber die Architektur, die Funktionen und die technischen Besonderheiten der App.

---

## Was ist ToDay?

**ToDay** ist eine native Android-App zur tagesbasierten Aufgaben- und AktivitÃ¤tenverwaltung. Sie kombiniert klassisches Aufgabenmanagement mit **Sprachsteuerung (TTS/STT)**, **Echtzeit-Wetterdaten (DWD)**, **Gamification-Elementen** und einem **flexiblen Zyklus-Planer** â€“ alles in einer einzigen, lokal arbeitenden Anwendung.

Die App wurde mit **Flutter/Dart** entwickelt und nutzt eine **lokale SQLite-Datenbank** â€“ es gibt keine Cloud-Pflicht, keine Registrierung und keine AbhÃ¤ngigkeit von externen Servern fÃ¼r die KernfunktionalitÃ¤t.

---

## Kernfunktionen im Ãœberblick

| Funktion | Beschreibung |
|----------|-------------|
| **Tagesbasierte AktivitÃ¤ten** | Aufgaben mit Titel, Beschreibung, Datum, Uhrzeit, PrioritÃ¤t und mehrfachen Erinnerungen (kombinierbare Offsets). |
| **Intelligente Wiederholungen** | VollstÃ¤ndige RRULE-UnterstÃ¼tzung: tÃ¤glich, wÃ¶chentlich (mit Tagesauswahl), monatlich (Tag oder Wochentag), jÃ¤hrlich. Ende: endlos, bis Datum oder nach Anzahl. |
| **Zyklus-Planer** | Automatische Serienerzeugung mit wissenschaftlich fundierten Presets: Pomodoro (25/5), ultradiane Zyklen (90/20) und weitere. |
| **Zeitansagen** | Konfigurierbare Zeitpunkte (10/15/20/30 Min oder stÃ¼ndlich) mit TTS-Sprachausgabe. |
| **Daily Briefing** | Tagesbriefing per Sprachausgabe â€“ filterbar nach PrioritÃ¤t (hoch/mittel/niedrig) Ã¼ber Multi-Tap. |
| **Sprach-Makros** | Trigger-basierte Texterweiterung mit Vorschau-Parsing und Duplikat-PrÃ¼fung. |
| **DWD-Integration** | Wetterwarnungen (8 Gefahrentypen) und Pollenflug (8 Pollenarten) vom Deutschen Wetterdienst, PLZ-basiert. |
| **TD-Trigger-System** | Spezielle AktivitÃ¤tstitel (`TD:brief:high`, `TD:finance:gold`, `TD:steps:today`) lÃ¶sen automatisierte Aktionen aus. |
| **Gamification** | Gesprochene Lob-SÃ¤tze bei erledigten ÃœberfÃ¤lligen, Konfetti-Animationen, Heatbar-Statistiken. |
| **Barrierefreiheit** | Schriftart-Auswahl inkl. OpenDyslexic (Legasthenie-optimiert), SchriftgrÃ¶ÃŸe 80 %â€“150 %, vollstÃ¤ndige TTS-UnterstÃ¼tzung. |

---

## Architektur & Technologie

### Technologie-Stack

| Schicht | Technologie |
|---------|-------------|
| **Framework** | Flutter 3.x / Dart |
| **UI-Bibliothek** | shadcn/ui (ShadApp) + Material Design 3 |
| **Datenbank** | SQLite (lokal, kein Cloud-Sync) |
| **State Management** | ChangeNotifier / Provider |
| **Benachrichtigungen** | awesome_notifications (exakte Alarme, KanÃ¤le) |
| **Sprachausgabe** | flutter_tts (Engine/Stimme/Locale konfigurierbar) |
| **Wetterdaten** | DWD Open Data API (Deutscher Wetterdienst) |
| **Schriften** | google_fonts (dynamisch, 4 Optionen) |
| **Animationen** | Lottie (Hintergrund), Konfetti, Speed Dial |
| **Sensoren** | Android STEP_COUNTER (Schritte heute) |

### Datenfluss

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                    BenutzeroberflÃ¤che                â”‚
â”‚  Home Â· Einstellungen Â· Sprach-Makros Â· Info        â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚                    State Management                  â”‚
â”‚  AppStore Â· LocaleStore Â· ChangeNotifier            â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚                    Service-Schicht                    â”‚
â”‚  ActivityService Â· SchedulingService Â· DWD-Service  â”‚
â”‚  NotificationFacade Â· TTS-Service Â· StepCounter     â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚                    Daten-Schicht                      â”‚
â”‚  SQLite Â· SharedPreferences Â· FlutterSecureStorage  â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## Home-Screen â€“ Die Tageszentrale

Der Home-Screen ist das HerzstÃ¼ck der App. Er zeigt auf einen Blick:

| Bereich | Inhalt |
|---------|--------|
| **Kopfbereich** | Datum, Datumsnavigation, drei Kennzahlen-Karten (Gesamt, Erledigt, Hohe PrioritÃ¤t), LED-Indikatoren fÃ¼r DWD-Status. |
| **Collapsible Header** | Der Kopfbereich lÃ¤sst sich einklappen â€“ fÃ¼r bis zu dreimal mehr sichtbare AktivitÃ¤ten. |
| **Tabs** | Offen Â· ÃœberfÃ¤llig Â· Erledigt Â· DWD â€“ mit ZÃ¤hler in eckigen Klammern. |
| **AktivitÃ¤tenliste** | Sortiert nach Uhrzeit, mit Checkbox, Tap-to-Edit und Long-Press-Kontextaktionen. |
| **Speed Dial** | Ein zentraler FAB mit sechs Schnellaktionen: Hilfe, Daily Briefing, Zyklus planen, Sprachbefehl, AufrÃ¤umen, Neu anlegen. |

---

## TD-Trigger-System

Ein besonderes Feature von ToDay: **TD-Trigger** sind spezielle AktivitÃ¤tstitel, die beim FÃ¤lligwerden automatisierte Aktionen auslÃ¶sen.

| Trigger | Aktion |
|---------|--------|
| `TD:brief:high` | Tagesbriefing nur hohe PrioritÃ¤t per TTS. |
| `TD:brief:mid` | Tagesbriefing nur mittlere PrioritÃ¤t per TTS. |
| `TD:brief:low` | Tagesbriefing nur niedrige PrioritÃ¤t per TTS. |
| `TD:finance:gold` | Goldpreis-Ansage (Quelle: goldprice.org). |
| `TD:finance:silver` | Silberpreis-Ansage (Quelle: goldprice.org). |
| `TD:steps:today` | Schritte heute per TTS (Android STEP_COUNTER). |

In der AktivitÃ¤tenliste werden TD-Trigger **benutzerfreundlich** angezeigt (z. B. â€žTagesbriefing Hoch" statt `TD:brief:high`).

---

## Benachrichtigungssystem

ToDay nutzt ein robustes, mehrstufiges Benachrichtigungssystem:

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Exakte Alarme** | PÃ¼nktliche AuslÃ¶sung (Android 13+ mit Berechtigung). |
| **Mehrfach-Offsets** | Start, 5/10/15/30 Min, 1/2 Std â€“ kombinierbar pro AktivitÃ¤t. |
| **Batch-Stornierung** | Beim LÃ¶schen/AufrÃ¤umen werden zugehÃ¶rige Alarme automatisch gecancelt. |
| **Rebuild** | â€žBenachrichtigungen neu aufbauen" bereinigt Waisen-Alarme nach Updates. |
| **Ruhezeiten** | DWD-Benachrichtigungen respektieren konfigurierbare Ruhezeiten. |

---

## Datenschutz & Sicherheit

| Aspekt | Umsetzung |
|--------|-----------|
| **Lokale Datenhaltung** | Alle AktivitÃ¤ten liegen in einer lokalen SQLite-Datenbank. Kein Cloud-Zwang. |
| **Keine Registrierung** | Die App funktioniert ohne Account, E-Mail oder Login. |
| **DWD-Daten** | Ã–ffentliche API des Deutschen Wetterdienstes â€“ keine personenbezogenen Daten. |
| **Spracheingabe** | Erfolgt Ã¼ber die Tastatur-App des GerÃ¤ts (deren Datenschutzbestimmungen gelten). |
| **Sensoren** | STEP_COUNTER wird nur lokal ausgewertet, keine Ãœbertragung an Dritte. |

---

## App-Struktur: Dialoge & MenÃ¼s

### Navigationsstruktur

```
Home
â”œâ”€â”€ Speed Dial
â”‚   â”œâ”€â”€ â“ Hilfe
â”‚   â”œâ”€â”€ ðŸ—£ï¸ Daily Briefing (Multi-Tap)
â”‚   â”œâ”€â”€ ðŸ”„ Zyklus planen â†’ (Zyklus-Planer-Sheet)
â”‚   â”œâ”€â”€ ðŸŽ¤ Sprachbefehl â†’ (Spracherfassung-Sheet)
â”‚   â”œâ”€â”€ âž– AufrÃ¤umen â†’ (AufrÃ¤umen-Sheet)
â”‚   â””â”€â”€ âž• Neu anlegen â†’ (AktivitÃ¤t-Dialog)
â”œâ”€â”€ AktivitÃ¤t antippen â†’ (AktivitÃ¤t-Dialog)
â””â”€â”€ â‹® MenÃ¼
    â”œâ”€â”€ Einstellungen â†’ [Einstellungen]
    â”œâ”€â”€ Info â†’ [Info-Screen]
    â””â”€â”€ Sprach-Makros â†’ [Sprach-Makros-Screen]

Einstellungen
â”œâ”€â”€ Sprache
â”œâ”€â”€ Design
â”œâ”€â”€ Anzeige & Text (Schriftart, SchriftgrÃ¶ÃŸe, Live-Vorschau)
â”œâ”€â”€ Benachrichtigungen â€“ Allgemein (DWD)
â”œâ”€â”€ Wetterwarnungen (DWD)
â”œâ”€â”€ Pollenflug (DWD)
â”œâ”€â”€ Stimme & Ausgabe (TTS)
â”œâ”€â”€ Zeitansagen
â”œâ”€â”€ Hintergrund-Animation
â”œâ”€â”€ Gamification
â””â”€â”€ GefÃ¤hrlicher Bereich

Sprach-Makros
â”œâ”€â”€ Eintrag antippen â†’ (Makro bearbeiten â€“ Dialog)
â””â”€â”€ Langes Tippen â†’ (Makro bearbeiten â€“ Sheet)
```

---

## Vorteile auf einen Blick

| Vorteil | Beschreibung |
|---------|-------------|
| **Alles in einer App** | Aufgaben, Zyklen, Zeitansagen, Wetter, Pollen, Sprachsteuerung â€“ kein App-Hopping nÃ¶tig. |
| **100 % lokal** | Keine Cloud, kein Account, keine AbhÃ¤ngigkeit von externen Servern. |
| **Sprachgesteuert** | TTS-Ausgabe, Spracheingabe und Sprach-Makros fÃ¼r freihÃ¤ndige Bedienung. |
| **Wissenschaftliche Zyklen** | Pomodoro, ultradiane Rhythmen und weitere Presets fÃ¼r produktives Arbeiten. |
| **Barrierefreiheit** | OpenDyslexic-Schrift, skalierbare SchriftgrÃ¶ÃŸe, vollstÃ¤ndige TTS-UnterstÃ¼tzung. |
| **DWD-Integration** | Wetterwarnungen und Pollenflug direkt in der Tagesansicht â€“ PLZ-genau. |
| **Gamification** | Lob-SÃ¤tze, Konfetti und Heatbar motivieren zum Dranbleiben. |
| **Flexibel** | Lottie-Animationen pro Monat, dynamische Farben (Material You), Hell/Dunkel-Modus. |