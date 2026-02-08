# Funktionen

Ein Ãœberblick Ã¼ber das, was **ToDay** kann.

---

## 1) AktivitÃ¤ten & Erinnerungen

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Felder** | Titel, Beschreibung, Datum (Y-M-D), Uhrzeit (HH:mm), PrioritÃ¤t, Erinnerungen (mehrere Offsets), Wiederholung (RRULE), Ausnahmen (exdates), Quelle (z. B. `system:cycle`, `system:time_announce`), schedRev, batchId. |
| **Mehrfach-Erinnerungen** | Vordefinierte Offsets (Start, 5/10/15/30 Min, 1/2 Std) â€“ kombinierbar. |
| **Wiederholungen** | TÃ¤glich / wÃ¶chentlich (Tage + Intervall) / monatlich (Tag im Monat oder Wochentag im Monat) / jÃ¤hrlich (Datum oder Wochentag in Monat). Ende: Endlos, Bis Datum, Nach Anzahl. |
| **ÃœberfÃ¤llig-Darstellung** | Segmentierung **< 1 h**, **1â€“3 h**, **> 3 h** mit Schnellaktionen und Segmentlisten. |

---

## 2) Zyklen (Planer)

Erzeugt automatisch **Serien von AktivitÃ¤ten** ab Startzeit mit Anzahl-Begrenzung (z. B. â€ž4 von 24 mÃ¶glich").

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
| **Zeitpunkte** | Erzeugt Zeitpunkte zwischen Start- und Endzeit im gewÃ¤hlten Takt. |
| **Taktung** | 10 / 15 / 20 / 30 Min oder stÃ¼ndlich. |
| **Ausgabe** | Benachrichtigung mit TTS-Sprachausgabe. |
| **Quelle** | Zeitansagen werden als eigene AktivitÃ¤tsquelle (`system:time_announce`) gefÃ¼hrt. |

---

## 4) Sprache: TTS, STT & Sprach-Makros

| Funktion | Beschreibung |
|----------|-------------|
| **Text-to-Speech (TTS)** | Engine/Stimme/Locale, Sprechtempo und TonhÃ¶he, Probe-Ausgabe. |
| **Spracheingabe Ã¼ber Tastatur** | Diktat mit SchlÃ¼sselwÃ¶rtern â€žTitel â€¦", â€žBeschreibung â€¦", â€žDatum â€¦", â€žUhrzeit â€¦" â†’ Parser fÃ¼llt Felder. |
| **Sprach-Makros** | Trigger â†’ Expansion â†’ Parsing. CRUD (anlegen/bearbeiten/lÃ¶schen), Aktiv/Filter, Vorschau-Parsing, Duplikat-PrÃ¼fung. |

---

## 5) Wetter & Pollen (DWD)

| Funktion | Beschreibung |
|----------|-------------|
| **Standort** | PLZ + optionale Warnregion, Ruhezeiten (DND fÃ¼r DWD). |
| **Wetterwarnungen** | Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel â€“ pro Typ aktivierbar. |
| **Pollenflug** | Schwellwert (â€žab IntensitÃ¤t â€¦") und Pollenarten (GrÃ¤ser, Birke, Erle, Hasel, Esche, BeifuÃŸ, Ambrosia, Roggen). |
| **Sofort prÃ¼fen** | Startet direkt eine DWD-Abfrage. Integration auf Home (Indikatoren, Infozeilen). |

---

## 6) Benachrichtigungen & Alarme

| Eigenschaft | Beschreibung |
|-------------|-------------|
| **Planung/Stornierung** | Robuste Logik je AktivitÃ¤t/Datum (inkl. Batch/Offsets). |
| **Exakte Alarme** | Falls vom System erlaubt, fÃ¼r pÃ¼nktliche AuslÃ¶sung. |
| **Cancel-Logik** | Zugeordnete Benachrichtigungen werden beim LÃ¶schen/AufrÃ¤umen storniert. |

> **Wichtig:** FÃ¼r zuverlÃ¤ssige Zustellung sind **Benachrichtigungen erlauben**, **Exakte Alarme** (falls vorhanden) und **Akku-Optimierung ignorieren** erforderlich.

---

## 7) Home-Ãœbersicht

| Element | Beschreibung |
|---------|-------------|
| **Datumsnavigation** | Gestern / Heute / Morgen / Pfeile, Datumspicker. |
| **Kennzahlen** | Gesamt, Erledigt (Kreisdiagramm + ZÃ¤hler), Hohe PrioritÃ¤t. |
| **Collapsible Header** | Der gesamte Kopfbereich lÃ¤sst sich Ã¼ber einen Drag-Handle einklappen. Eingeklappt zeigt eine kompakte 52 px-Leiste Datum, Fortschritt und Hohe-PrioritÃ¤t-Badge â€“ fÃ¼r bis zu dreimal mehr sichtbare AktivitÃ¤ten. |
| **Infozeile** | Wetterwarnungen & Pollenstatus (DWD), Mini-Status (Schritte heute). |
| **Tabs** | Offen Â· ÃœberfÃ¤llig Â· Erledigt Â· DWD. |
| **Speed Dial** | Ein zentraler FAB, der beim Antippen sechs Aktionen auffÃ¤chert: Hilfe, Daily Briefing (Multi-Tap mit Badge), Zyklus planen, Sprachbefehl, AufrÃ¤umen, Neu anlegen. |
| **Extras** | Heatbar/Stats und Konfetti bei Erfolgen (gerÃ¤te-/versionabhÃ¤ngig). |

---

## 8) Einstellungen

| Sektion | Optionen |
|---------|---------|
| **Sprache** | Deutsch / English. |
| **Design** | Hell / Dunkel / System, dynamische Farben (Android 12+). |
| **Anzeige & Text** | Schriftart (System / Inter / Roboto Slab / OpenDyslexic), SchriftgrÃ¶ÃŸe (80 %â€“150 %), Live-Vorschau. |
| **Benachrichtigungen â€“ Allgemein** | Land, PLZ, Warnregion, Ruhezeiten, globaler Schalter. |
| **Wetterwarnungen (DWD)** | Gefahrentypen fein konfigurierbar, Sofort prÃ¼fen. |
| **Pollenflug (DWD)** | Schwellwert, Pollenarten, Sofort prÃ¼fen. |
| **Stimme & Ausgabe (TTS)** | Stimme, Tempo, TonhÃ¶he, LautstÃ¤rke, Vorschau. |
| **Zeitansagen** | Fenster, Taktung, TTS, Erzeugen. |
| **Hintergrund-Animation** | Lottie-Animationen pro Monat oder Standard. |
| **Gamification** | Gesprochene Lob-SÃ¤tze bei ÃœberfÃ¤llig â†’ Erledigt. |
| **GefÃ¤hrlicher Bereich** | Debug-Infos, Benachrichtigungen neu aufbauen, Alle AktivitÃ¤ten lÃ¶schen. |

---

## 9) Daten & Technik

| Komponente | Beschreibung |
|-----------|-------------|
| **SQLite** | Lokale Datenbank, Repositories fÃ¼r AktivitÃ¤ten & Settings. |
| **Scheduling-Service** | RRULE-Evaluator und Cycle-Generator. |
| **Notification-Facade** | Kapselt Planung, IDs und Cancel-Pfad. |
| **Info-Dialog** | Zeigt Version/Kanal, Android-Build, Package-ID, DB-Pfad/Datei/Tabellen/EintrÃ¤ge und Rechte-Status. |
| **Theme-System** | Dynamisches TextTheme Ã¼ber `google_fonts`, globaler TextScaler Ã¼ber `AppStore`. |

---

## 10) Datenschutz & Offline

| Aspekt | Beschreibung |
|--------|-------------|
| **Lokale Datenhaltung** | AktivitÃ¤ten liegen lokal (keine Cloud-Pflicht). |
| **DWD-Daten** | BenÃ¶tigen Internet; bei Offline-Betrieb Aktualisierung beim nÃ¤chsten Sync. |
| **Spracheingabe** | Erfolgt Ã¼ber die Tastatur-App (deren Datenschutzbestimmungen gelten). |

---

## 11) Grenzen & Hinweise

- **Ruhezeiten** wirken nur fÃ¼r DWD-Warnungen â€“ nicht fÃ¼r Aufgaben-Alarme.  
- Ohne Systemrechte (Exakte Alarme / Benachrichtigungen / Akku-Optimierung) kÃ¶nnen Erinnerungen verspÃ¤tet sein.  
- Kalender-/Zeitzonen-Besonderheiten bei RRULEs werden berÃ¼cksichtigt, dennoch nach Importen prÃ¼fen.