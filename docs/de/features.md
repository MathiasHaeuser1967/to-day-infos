# Funktionen

Ein Überblick über das, was **ToDay** kann.

---

## 1) Aktivitäten & Erinnerungen
- **Aktivitäten/To-Dos** mit: **Titel**, **Beschreibung**, **Datum (Y-M-D)**, **Uhrzeit (HH:mm)**, **Priorität**, **Erinnerungen** (mehrere Offsets), **Wiederholung (RRULE)**, **Ausnahmen (exdates)**, **Quelle** (z. B. `system:cycle`, `system:time_announce`), **schedRev**, **batchId**.
- **Mehrfach-Erinnerungen**: vordefinierte Offsets (Start, 5/10/15/30 Min, 1/2 Std) – kombinierbar.
- **Wiederholungen**: täglich / wöchentlich (Tage + Intervall) / monatlich (Tag im Monat oder Wochentag im Monat) / jährlich (Datum oder Wochentag in Monat).  
  Ende: **Endlos**, **Bis Datum**, **Nach Anzahl**.
- **Überfällig-Darstellung**: Segmentierung **\< 1 h**, **1–3 h**, **\> 3 h** mit Schnellaktionen und Segmentlisten.

---

## 2) Zyklen (Planer)
- Erzeugt automatisch **Serien von Aktivitäten** ab Startzeit mit Anzahl-Begrenzung (z. B. „4 von 24 möglich“).
- **Vorlagen/Presets** (Pomodoro & Co.): `25/5` (Pomodoro), `50/10`, `52/17`, `45/15`, `30/10`, `60/15`, sowie **ultradiane Zyklen** `90/15`, `90/20`, `75/15`.
- Optionaler **Fokus-Start** (z. B. zur direkten Sitzung).

---

## 3) Zeitansagen
- Erzeugt **Zeitpunkte zwischen Start- und Endzeit** im gewählten **Takt**: 10/15/20/30 Min oder **stündlich**.
- Ausgabe als **Benachrichtigung** – **TTS**.
- Zeitansagen werden als eigene **Aktivitätsquelle** (`system:time_announce`) geführt.

---

## 4) Sprache: TTS, STT & Sprach-Makros
- **Text-to-Speech (TTS)**: Engine/Stimme/Locale, **Sprechtempo** und **Tonhöhe**, Probe-Ausgabe.
- **Spracheingabe über Tastatur**: Diktat mit Schlüsselwörtern **„Titel …“, „Beschreibung …“, „Datum …“, „Uhrzeit …“** → Parser füllt Felder.
- **Sprach-Makros**: **Trigger → Expansion → Parsing**  
  CRUD (anlegen/bearbeiten/löschen), Aktiv/Filter, Vorschau-Parsing, Duplikat-Prüfung.

---

## 5) Wetter & Pollen (DWD)
- **PLZ** + optionale **Warnregion**, **Ruhezeiten** (DND für DWD).
- **Wetterwarnungen** (z. B. Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel) – pro Typ aktivierbar.
- **Pollenflug** mit **Schwellwert** („ab Intensität …“) und **Pollenarten** (Gräser, Birke, Erle, Hasel, Esche, Beifuß, Ambrosia, Roggen).
- **Sofort prüfen** startet direkt eine DWD-Abfrage.  
  Integration auf Home (Indikatoren, Infozeilen).

---

## 6) Benachrichtigungen & Alarme
- Robuste **Planung/Stornierung** je Aktivität/Datum (inkl. Batch/Offsets).
- **Exakte Alarme** (falls vom System erlaubt) für pünktliche Auslösung.
- **Cancel-Logik** für zugeordnete Benachrichtigungen beim Löschen/Aufräumen.

> Wichtig: Für zuverlässige Zustellung sind **Benachrichtigungen erlauben**, **Exakte Alarme** (falls vorhanden) und **Akku-Optimierung ignorieren** erforderlich.

---

## 7) Home-Übersicht
- **Datumsnavigation** (Gestern/Heute/Morgen/Arrows), **Fortschrittsbalken** (Erledigt / Gesamt), **Kennzahlen** (Gesamt, Erledigt, Hohe Priorität).
- **Infozeile**: Wetterwarnungen & Pollenstatus (DWD).
- **Tabs**: Offen · Überfällig · Erledigt · DWD.
- **Schnellaktionen** & **Segmentlisten** für Überfälliges.
- **FABs**: Aktivität hinzufügen, Spracheingabe, Zyklus-Generator.  
  Extras: **Heatbar/Stats** und **Konfetti** bei Erfolgen (geräte-/versionabhängig).

---

## 8) Einstellungen
- **Sprache** (DE/EN).
- **Aussehen**: Hell/Dunkel/System, **dynamische Farben** (Android 12+).
- **Benachrichtigungen – Allgemein**: Land, **PLZ**, **Warnregion**, **Ruhezeiten**, globaler Schalter.
- **Wetterwarnungen (DWD)** und **Pollen (DWD)**: fein konfigurierbar, **Sofort prüfen**.
- **TTS-Einstellungen**: Stimme, Tempo, Tonhöhe.
- **Zeitansagen**: Fenster, Taktung, TTS, **Erzeugen**.
- **Gefährlicher Bereich**: Debug-Infos unter Aktivitäten, **Benachrichtigungen neu aufbauen**, **Alle Aktivitäten löschen**.

---

## 9) Daten & Technik
- **SQLite** (lokal), Repositories für Aktivitäten & Settings.
- **Scheduling-Service** mit **RRULE-Evaluator** und **Cycle-Generator**.
- **Notification-Facade** kapselt Planung, IDs und Cancel-Pfad.
- **Info-Dialog** zeigt Version/Kanal, Android-Build, Package-ID, DB-Pfad/Datei/Tabellen/Einträge und Rechte-Status (Benachrichtigungen, Exakte Alarme, Akku-Optimierung).

---

## 10) Datenschutz & Offline
- Aktivitäten liegen **lokal** (keine Cloud-Pflicht).  
- DWD-Daten benötigen Internet; bei Offline-Betrieb Aktualisierung beim nächsten Sync.
- Spracheingabe erfolgt über die **Tastatur-App** (deren Datenschutzbestimmungen gelten).

---

## 11) Grenzen & Hinweise
- **Ruhezeiten** wirken nur für DWD-Warnungen – nicht für Aufgaben-Alarme.
- Ohne Systemrechte (**Exakte Alarme**/Benachrichtigungen/ Akku-Optimierung) können Erinnerungen verspätet sein.
- Kalender-/Zeitzonen-Besonderheiten bei RRULEs werden berücksichtigt, dennoch nach Importen prüfen.
