function Write-De-Screen-Settings {
  $p = Join-Path $Screens 'settings.md'
  $c = @'
# Einstellungen

Die Optionen sind in Karten gegliedert. Viele Karten haben einen eigenen **Speichern**-Button – Änderungen gelten erst nach dem Speichern **dieser** Karte.

---

## 1) Sprache
- **Sprache**: Wechselt die App-Sprache (Deutsch/English).
- Hinweis: Der Umschalter in der Online-Hilfe ändert nur die Doku, nicht die App-Sprache.

---

## 2) Design
- **Darstellung der App**
  - **Wie System**: folgt dem Systemthema (Hell/Dunkel).
  - **Hell**: erzwingt helles Thema.
  - **Dunkel**: erzwingt dunkles Thema.
- **Dynamische Farben (Android 12+)**: übernimmt Akzentfarben vom System/Wallpaper (Material-You).

---

## 3) Benachrichtigungen – Allgemein (DWD)
Gilt für **Wetterwarnungen** und **Pollenflug**.

- **Land**: Ländercode (z. B. DE).
- **PLZ**: Postleitzahl des Ortes für DWD-Daten.
- **Warnregion (optional)**: freier Text; hilfreich bei kreisweiten Warnungen.
- **Warnungen aktiv**: globaler Schalter für DWD-Benachrichtigungen.
- **Ruhe ab (Stunde) / Ruhe bis (Stunde)**: Zeitfenster, in dem **keine** DWD-Benachrichtigungen zugestellt werden.
- **Speichern**: übernimmt die Werte dieser Karte.

---

## 4) Wetterwarnungen (DWD)
Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen – Allgemein*.

- **Gefahrentypen** (einzeln aktivierbar): Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel.
- **Speichern**: merkt die Auswahl.
- **Sofort prüfen**: führt sofort eine DWD-Abfrage aus und aktualisiert Status/Benachrichtigung.

---

## 5) Pollenflug (DWD)
Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen – Allgemein*.

- **Benachrichtigen ab Intensität**: Schwellenwert, ab dem für aktivierte Pollenarten benachrichtigt wird (z. B. „mittel“).
- **Pollenarten** (einzeln aktivierbar): Gräser, Birke, Erle, Hasel, Esche, Beifuß, Ambrosia, Roggen.
- **Speichern**: übernimmt Schwelle/Arten.
- **Sofort prüfen**: holt sofort Pollenwerte und löst ggf. Benachrichtigungen aus.

---

## 6) Stimme & Ausgabe (TTS)
Steuert Text-to-Speech für gesprochene Ausgaben/Zeitansagen.

- **Stimme & Ausgabe verwenden**: TTS global ein/aus.
- **Stimme**: Auswahl der verfügbaren TTS-Stimmen/Engines des Geräts.
- **Sprechtempo**: Regler für Geschwindigkeit (Standard ~1.0).
- **Tonhöhe**: Regler für Tonhöhe (Standard ~1.0).
- **Speichern**: übernimmt TTS-Einstellungen.
- **Sofort anhören**: spielt eine Probe mit den aktuellen Werten.

---

## 7) Zeitansagen
Erzeugt Zeitpunkte zwischen Start- und Endzeit und benachrichtigt im gewählten Takt.

- **Zeitansagen aktivieren**: Hauptschalter.
- **Startzeit (einschließlich)** / **Endzeit (einschließlich)**: Zeitfenster der Ansagen.
- **Taktung**: Alle 10 / 15 / 20 / 30 Minuten oder stündlich.
- **Uhrzeit als Morse statt TTS**: ersetzt Sprache durch Morse-Ton.
- **Erzeugen**: plant die Ansagen für das gewählte Fenster/Takt (Ruhezeiten aus *Allgemein* werden respektiert).

---

## 8) Gefährlicher Bereich (Datenverwaltung)
- **Debug-Infos unter Aktivitäten**: zeigt zusätzliche Diagnose-Infos in den Listen (nur für Fehlersuche).
- **Benachrichtigungen neu aufbauen**: plant Benachrichtigungen für einen kurzen Zeitraum neu (nützlich nach System-Updates/Rechtewechsel).
- **Alle Aktivitäten löschen**: entfernt **alle** Aktivitäten unwiderruflich (kein Rückgängig).

---

## 9) Hinweise & Tipps
- **Berechtigungen**: Stelle sicher, dass **Benachrichtigungen** (und ggf. **Exakte Alarme**) erlaubt sind und Akku-Optimierung die App nicht drosselt – sonst kommen Erinnerungen verspätet.
- **DWD offline**: Ohne Internet werden DWD-Daten erst bei Verbindung aktualisiert.
- **Mehrere Speichern-Buttons**: Jede Karte speichert **ihren** Bereich separat.
'@
  Write-File $p $c
}
