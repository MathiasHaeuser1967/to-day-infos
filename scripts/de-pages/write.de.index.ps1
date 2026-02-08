function Write-De-Index {
  $p = Join-Path $DocsDe 'index.md'
  $c = @'
# ToDay – Deine intelligente Tageszentrale

Willkommen zur **ToDay**-Dokumentation. Diese Seite gibt dir einen umfassenden Überblick über die Architektur, die Funktionen und die technischen Besonderheiten der App.

---

## Was ist ToDay?

**ToDay** ist eine native Android-App zur tagesbasierten Aufgaben- und Aktivitätenverwaltung. Sie kombiniert klassisches Aufgabenmanagement mit **Sprachsteuerung (TTS/STT)**, **Echtzeit-Wetterdaten (DWD)**, **Gamification-Elementen** und einem **flexiblen Zyklus-Planer** – alles in einer einzigen, lokal arbeitenden Anwendung.

Die App wurde mit **Flutter/Dart** entwickelt und nutzt eine **lokale SQLite-Datenbank** – es gibt keine Cloud-Pflicht, keine Registrierung und keine Abhängigkeit von externen Servern für die Kernfunktionalität.

---

## Kernfunktionen im Überblick

| Funktion | Beschreibung |
|----------|-------------|
| **Tagesbasierte Aktivitäten** | Aufgaben mit Titel, Beschreibung, Datum, Uhrzeit, Priorität und mehrfachen Erinnerungen (kombinierbare Offsets). |
| **Intelligente Wiederholungen** | Vollständige RRULE-Unterstützung: täglich, wöchentlich (mit Tagesauswahl), monatlich (Tag oder Wochentag), jährlich. Ende: endlos, bis Datum oder nach Anzahl. |
| **Zyklus-Planer** | Automatische Serienerzeugung mit wissenschaftlich fundierten Presets: Pomodoro (25/5), ultradiane Zyklen (90/20) und weitere. |
| **Zeitansagen** | Konfigurierbare Zeitpunkte (10/15/20/30 Min oder stündlich) mit TTS-Sprachausgabe. |
| **Daily Briefing** | Tagesbriefing per Sprachausgabe – filterbar nach Priorität (hoch/mittel/niedrig) über Multi-Tap. |
| **Sprach-Makros** | Trigger-basierte Texterweiterung mit Vorschau-Parsing und Duplikat-Prüfung. |
| **DWD-Integration** | Wetterwarnungen (8 Gefahrentypen) und Pollenflug (8 Pollenarten) vom Deutschen Wetterdienst, PLZ-basiert. |
| **TD-Trigger-System** | Spezielle Aktivitätstitel (`TD:brief:high`, `TD:finance:gold`, `TD:steps:today`) lösen automatisierte Aktionen aus. |
| **Gamification** | Gesprochene Lob-Sätze bei erledigten Überfälligen, Konfetti-Animationen, Heatbar-Statistiken. |
| **Barrierefreiheit** | Schriftart-Auswahl inkl. OpenDyslexic (Legasthenie-optimiert), Schriftgröße 80 %–150 %, vollständige TTS-Unterstützung. |

---

## Architektur & Technologie

### Technologie-Stack

| Schicht | Technologie |
|---------|-------------|
| **Framework** | Flutter 3.x / Dart |
| **UI-Bibliothek** | shadcn/ui (ShadApp) + Material Design 3 |
| **Datenbank** | SQLite (lokal, kein Cloud-Sync) |
| **State Management** | ChangeNotifier / Provider |
| **Benachrichtigungen** | awesome_notifications (exakte Alarme, Kanäle) |
| **Sprachausgabe** | flutter_tts (Engine/Stimme/Locale konfigurierbar) |
| **Wetterdaten** | DWD Open Data API (Deutscher Wetterdienst) |
| **Schriften** | google_fonts (dynamisch, 4 Optionen) |
| **Animationen** | Lottie (Hintergrund), Konfetti, Speed Dial |
| **Sensoren** | Android STEP_COUNTER (Schritte heute) |

### Datenfluss

```mermaid
block-beta
  columns 1
  block:ui["Benutzeroberflaeche\nHome - Einstellungen - Sprach-Makros - Info"]
  end
  block:state["State Management\nAppStore - LocaleStore - ChangeNotifier"]
  end
  block:service["Service-Schicht\nActivityService - SchedulingService - DWD-Service\nNotificationFacade - TTS-Service - StepCounter"]
  end
  block:data["Daten-Schicht\nSQLite - SharedPreferences - FlutterSecureStorage"]
  end
  ui --> state --> service --> data
```

---

## Home-Screen – Die Tageszentrale

Der Home-Screen ist das Herzstück der App. Er zeigt auf einen Blick:

| Bereich | Inhalt |
|---------|--------|
| **Kopfbereich** | Datum, Datumsnavigation, drei Kennzahlen-Karten (Gesamt, Erledigt, Hohe Priorität), LED-Indikatoren für DWD-Status. |
| **Collapsible Header** | Der Kopfbereich lässt sich einklappen – für bis zu dreimal mehr sichtbare Aktivitäten. |
| **Tabs** | Offen · Überfällig · Erledigt · DWD – mit Zähler in eckigen Klammern. |
| **Aktivitätenliste** | Sortiert nach Uhrzeit, mit Checkbox, Tap-to-Edit und Long-Press-Kontextaktionen. |
| **Speed Dial** | Ein zentraler FAB mit sechs Schnellaktionen: Hilfe, Daily Briefing, Zyklus planen, Sprachbefehl, Aufräumen, Neu anlegen. |

---

## TD-Trigger-System

Ein besonderes Feature von ToDay: **TD-Trigger** sind spezielle Aktivitätstitel, die beim Fälligwerden automatisierte Aktionen auslösen.

| Trigger | Aktion |
|---------|--------|
| `TD:brief:high` | Tagesbriefing nur hohe Priorität per TTS. |
| `TD:brief:mid` | Tagesbriefing nur mittlere Priorität per TTS. |
| `TD:brief:low` | Tagesbriefing nur niedrige Priorität per TTS. |
| `TD:finance:gold` | Goldpreis-Ansage (Quelle: goldprice.org). |
| `TD:finance:silver` | Silberpreis-Ansage (Quelle: goldprice.org). |
| `TD:steps:today` | Schritte heute per TTS (Android STEP_COUNTER). |

In der Aktivitätenliste werden TD-Trigger **benutzerfreundlich** angezeigt (z. B. „Tagesbriefing Hoch" statt `TD:brief:high`).

---

## Benachrichtigungssystem

ToDay nutzt ein robustes, mehrstufiges Benachrichtigungssystem:

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Exakte Alarme** | Pünktliche Auslösung (Android 13+ mit Berechtigung). |
| **Mehrfach-Offsets** | Start, 5/10/15/30 Min, 1/2 Std – kombinierbar pro Aktivität. |
| **Batch-Stornierung** | Beim Löschen/Aufräumen werden zugehörige Alarme automatisch gecancelt. |
| **Rebuild** | „Benachrichtigungen neu aufbauen" bereinigt Waisen-Alarme nach Updates. |
| **Ruhezeiten** | DWD-Benachrichtigungen respektieren konfigurierbare Ruhezeiten. |

---

## Datenschutz & Sicherheit

| Aspekt | Umsetzung |
|--------|-----------|
| **Lokale Datenhaltung** | Alle Aktivitäten liegen in einer lokalen SQLite-Datenbank. Kein Cloud-Zwang. |
| **Keine Registrierung** | Die App funktioniert ohne Account, E-Mail oder Login. |
| **DWD-Daten** | Öffentliche API des Deutschen Wetterdienstes – keine personenbezogenen Daten. |
| **Spracheingabe** | Erfolgt über die Tastatur-App des Geräts (deren Datenschutzbestimmungen gelten). |
| **Sensoren** | STEP_COUNTER wird nur lokal ausgewertet, keine Übertragung an Dritte. |

---

## App-Struktur: Dialoge & Menüs

### Navigationsstruktur

```mermaid
graph LR
  Home --> SD[Speed Dial]
  SD --> Hilfe
  SD --> DB[Daily Briefing]
  SD --> ZP[Zyklus planen]
  SD --> SB[Sprachbefehl]
  SD --> AR[Aufraeumen]
  SD --> NA[Neu anlegen]
  Home --> AK[Aktivitaet antippen]
  Home --> Menu
  Menu --> Einstellungen
  Menu --> Info
  Menu --> SM[Sprach-Makros]
```

**Einstellungen-Bereiche:** Sprache, Design, Anzeige und Text (Schriftart, Schriftgroesse, Live-Vorschau), Benachrichtigungen, Wetterwarnungen (DWD), Pollenflug (DWD), Stimme und Ausgabe (TTS), Zeitansagen, Hintergrund-Animation, Gamification, Gefaehrlicher Bereich.

**Sprach-Makros:** Eintrag antippen (Makro bearbeiten als Dialog), Langes Tippen (Makro bearbeiten als Sheet).

---

## Vorteile auf einen Blick

| Vorteil | Beschreibung |
|---------|-------------|
| **Alles in einer App** | Aufgaben, Zyklen, Zeitansagen, Wetter, Pollen, Sprachsteuerung – kein App-Hopping nötig. |
| **100 % lokal** | Keine Cloud, kein Account, keine Abhängigkeit von externen Servern. |
| **Sprachgesteuert** | TTS-Ausgabe, Spracheingabe und Sprach-Makros für freihändige Bedienung. |
| **Wissenschaftliche Zyklen** | Pomodoro, ultradiane Rhythmen und weitere Presets für produktives Arbeiten. |
| **Barrierefreiheit** | OpenDyslexic-Schrift, skalierbare Schriftgröße, vollständige TTS-Unterstützung. |
| **DWD-Integration** | Wetterwarnungen und Pollenflug direkt in der Tagesansicht – PLZ-genau. |
| **Gamification** | Lob-Sätze, Konfetti und Heatbar motivieren zum Dranbleiben. |
| **Flexibel** | Lottie-Animationen pro Monat, dynamische Farben (Material You), Hell/Dunkel-Modus. |
'@
  Write-File $p $c
}
