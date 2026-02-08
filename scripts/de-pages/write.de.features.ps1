function Write-De-Features {
  $p = Join-Path $DocsDe 'features.md'
  $c = @'
# Funktionen

Ein Überblick über das, was **ToDay** kann.

---

## 1) Aktivitäten & Erinnerungen

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Felder** | Titel, Beschreibung, Datum (Y-M-D), Uhrzeit (HH:mm), Priorität, Erinnerungen (mehrere Offsets), Wiederholung (RRULE), Ausnahmen (exdates), Quelle (z. B. `system:cycle`, `system:time_announce`), schedRev, batchId. |
| **Mehrfach-Erinnerungen** | Vordefinierte Offsets (Start, 5/10/15/30 Min, 1/2 Std) – kombinierbar. |
| **Wiederholungen** | Täglich / wöchentlich (Tage + Intervall) / monatlich (Tag im Monat oder Wochentag im Monat) / jährlich (Datum oder Wochentag in Monat). Ende: Endlos, Bis Datum, Nach Anzahl. |
| **Überfällig-Darstellung** | Segmentierung **< 1 h**, **1–3 h**, **> 3 h** mit Schnellaktionen und Segmentlisten. |

---

## 2) Zyklen (Planer)

Erzeugt automatisch **Serien von Aktivitäten** ab Startzeit mit Anzahl-Begrenzung (z. B. „4 von 24 möglich").

| Preset | Arbeitsphase / Pause |
|--------|---------------------|
| Pomodoro | 25 / 5 Min |
| 50/10 | 50 / 10 Min |
| 52/17 | 52 / 17 Min |
| 45/15 | 45 / 15 Min |
| 30/10 | 30 / 10 Min |
| 60/15 | 60 / 15 Min |
| Ultradian 90/15 | 90 / 15 Min |
| Ultradian 90/20 | 90 / 20 Min |
| Ultradian 75/15 | 75 / 15 Min |

Optionaler **Fokus-Start** (z. B. zur direkten Sitzung).

---

## 3) Zeitansagen

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Zeitpunkte** | Erzeugt Zeitpunkte zwischen Start- und Endzeit im gewählten Takt. |
| **Taktung** | 10 / 15 / 20 / 30 Min oder stündlich. |
| **Ausgabe** | Benachrichtigung mit TTS-Sprachausgabe. |
| **Quelle** | Zeitansagen werden als eigene Aktivitätsquelle (`system:time_announce`) geführt. |

---

## 4) Sprache: TTS, STT & Sprach-Makros

| Funktion | Beschreibung |
|----------|-------------|
| **Text-to-Speech (TTS)** | Engine/Stimme/Locale, Sprechtempo und Tonhöhe, Probe-Ausgabe. |
| **Spracheingabe über Tastatur** | Diktat mit Schlüsselwörtern „Titel …", „Beschreibung …", „Datum …", „Uhrzeit …" → Parser füllt Felder. |
| **Sprach-Makros** | Trigger → Expansion → Parsing. CRUD (anlegen/bearbeiten/löschen), Aktiv/Filter, Vorschau-Parsing, Duplikat-Prüfung. |

---

## 5) Wetter & Pollen (DWD)

| Funktion | Beschreibung |
|----------|-------------|
| **Standort** | PLZ + optionale Warnregion, Ruhezeiten (DND für DWD). |
| **Wetterwarnungen** | Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel – pro Typ aktivierbar. |
| **Pollenflug** | Schwellwert („ab Intensität …") und Pollenarten (Gräser, Birke, Erle, Hasel, Esche, Beifuß, Ambrosia, Roggen). |
| **Sofort prüfen** | Startet direkt eine DWD-Abfrage. Integration auf Home (Indikatoren, Infozeilen). |

---

## 6) Benachrichtigungen & Alarme

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Planung/Stornierung** | Robuste Logik je Aktivität/Datum (inkl. Batch/Offsets). |
| **Exakte Alarme** | Falls vom System erlaubt, für pünktliche Auslösung. |
| **Cancel-Logik** | Zugeordnete Benachrichtigungen werden beim Löschen/Aufräumen storniert. |

> **Wichtig:** Für zuverlässige Zustellung sind **Benachrichtigungen erlauben**, **Exakte Alarme** (falls vorhanden) und **Akku-Optimierung ignorieren** erforderlich.

---

## 7) Home-Übersicht

| Element | Beschreibung |
|---------|-------------|
| **Datumsnavigation** | Gestern / Heute / Morgen / Pfeile, Datumspicker. |
| **Kennzahlen** | Gesamt, Erledigt (Kreisdiagramm + Zähler), Hohe Priorität. |
| **Collapsible Header** | Der gesamte Kopfbereich lässt sich über einen Drag-Handle einklappen. Eingeklappt zeigt eine kompakte 52 px-Leiste Datum, Fortschritt und Hohe-Priorität-Badge – für bis zu dreimal mehr sichtbare Aktivitäten. |
| **Infozeile** | Wetterwarnungen & Pollenstatus (DWD), Mini-Status (Schritte heute). |
| **Tabs** | Offen · Überfällig · Erledigt · DWD. |
| **Speed Dial** | Ein zentraler FAB, der beim Antippen sechs Aktionen auffächert: Hilfe, Daily Briefing (Multi-Tap mit Badge), Zyklus planen, Sprachbefehl, Aufräumen, Neu anlegen. |
| **Extras** | Heatbar/Stats und Konfetti bei Erfolgen (geräte-/versionabhängig). |

---

## 8) Einstellungen

| Sektion | Optionen |
|---------|---------|
| **Sprache** | Deutsch / English. |
| **Design** | Hell / Dunkel / System, dynamische Farben (Android 12+). |
| **Anzeige & Text** | Schriftart (System / Inter / Roboto Slab / OpenDyslexic), Schriftgröße (80 %–150 %), Live-Vorschau. |
| **Benachrichtigungen – Allgemein** | Land, PLZ, Warnregion, Ruhezeiten, globaler Schalter. |
| **Wetterwarnungen (DWD)** | Gefahrentypen fein konfigurierbar, Sofort prüfen. |
| **Pollenflug (DWD)** | Schwellwert, Pollenarten, Sofort prüfen. |
| **Stimme & Ausgabe (TTS)** | Stimme, Tempo, Tonhöhe, Lautstärke, Vorschau. |
| **Zeitansagen** | Fenster, Taktung, TTS, Erzeugen. |
| **Hintergrund-Animation** | Lottie-Animationen pro Monat oder Standard. |
| **Gamification** | Gesprochene Lob-Sätze bei Überfällig → Erledigt. |
| **Gefährlicher Bereich** | Debug-Infos, Benachrichtigungen neu aufbauen, Alle Aktivitäten löschen. |

---

## 9) Daten & Technik

| Komponente | Beschreibung |
|-----------|-------------|
| **SQLite** | Lokale Datenbank, Repositories für Aktivitäten & Settings. |
| **Scheduling-Service** | RRULE-Evaluator und Cycle-Generator. |
| **Notification-Facade** | Kapselt Planung, IDs und Cancel-Pfad. |
| **Info-Dialog** | Zeigt Version/Kanal, Android-Build, Package-ID, DB-Pfad/Datei/Tabellen/Einträge und Rechte-Status. |
| **Theme-System** | Dynamisches TextTheme über `google_fonts`, globaler TextScaler über `AppStore`. |

---

## 10) Datenschutz & Offline

| Aspekt | Beschreibung |
|--------|-------------|
| **Lokale Datenhaltung** | Aktivitäten liegen lokal (keine Cloud-Pflicht). |
| **DWD-Daten** | Benötigen Internet; bei Offline-Betrieb Aktualisierung beim nächsten Sync. |
| **Spracheingabe** | Erfolgt über die Tastatur-App (deren Datenschutzbestimmungen gelten). |

---

## 11) Grenzen & Hinweise

- **Ruhezeiten** wirken nur für DWD-Warnungen – nicht für Aufgaben-Alarme.  
- Ohne Systemrechte (Exakte Alarme / Benachrichtigungen / Akku-Optimierung) können Erinnerungen verspätet sein.  
- Kalender-/Zeitzonen-Besonderheiten bei RRULEs werden berücksichtigt, dennoch nach Importen prüfen.
'@
  Write-File $p $c
}
