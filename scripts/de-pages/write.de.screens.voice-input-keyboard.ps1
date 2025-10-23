function Write-De-Screen-VoiceInputKeyboard {
  $p = Join-Path $Screens 'voice-input-keyboard.md'
  $c = @'
# Spracheingabe über Tastatur

Mit dieser Eingabe erzeugst du eine Aktivität per **Diktat** über das Mikrofon deiner **Tastatur** (z. B. Gboard). Du sprichst alle Felder in einem Rutsch – die App zerlegt den Text und füllt Titel, Beschreibung, Datum und Uhrzeit vor.

---

## 1) Öffnen

- Öffne den Dialog **„Spracheingabe über Tastatur“** oder fokussiere das Eingabefeld und tippe auf das **Mikrofon-Icon** deiner Tastatur.
- Sprich danach deinen Satz (siehe Aufbau) und tippe auf **Fertig**.

---

## 2) Aufbau des gesprochenen Satzes

Verwende die **Schlüsselwörter** als Trenner. **Reihenfolge ist egal**, Felder dürfen fehlen:

- **„Titel …“**
- **„Beschreibung …“**
- **„Datum …“**
- **„Uhrzeit …“**

Beispielstruktur:  
`Titel … Beschreibung … Datum … Uhrzeit …`

---

## 3) Inhalt je Feld

- **Titel**  
  Freitext bis zum nächsten Schlüsselwort oder bis zum Ende.

- **Beschreibung** *(optional)*  
  Details/Notizen. Ebenfalls Freitext bis zum nächsten Schlüsselwort.

- **Datum** *(optional)*  
  Unterstützt typische Formate:
  - **heute**, **morgen**, **übermorgen**
  - **Wochentag**: „am Mittwoch“, „nächsten Dienstag“
  - **Kalenderdatum**: „am 22. Oktober“, „am 22.10.“
  Hinweis: Sprich klar und ohne Füllwörter.

- **Uhrzeit** *(optional)*  
  - „**18 Uhr**“, „**18:00**“, „**7 Uhr**“, „**07:15**“
  - 24-Stunden-Angaben sind am zuverlässigsten.

---

## 4) Beispiele

- **„Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr“**  
  → Titel „Einkauf“, Beschreibung „Milch und Brot“, Datum = morgen, Uhrzeit 18:00.

- **„Titel Joggen Datum Mittwoch Uhrzeit 7 Uhr“**  
  → Titel „Joggen“, Datum am nächsten Mittwoch, Uhrzeit 07:00.

- **„Titel Projekt-Review Uhrzeit 14:30“**  
  → Titel „Projekt-Review“, Uhrzeit 14:30, Datum bleibt offen (manuell wählen).

---

## 5) Nach dem Diktat

- Tippe **Fertig**. Die App analysiert den Text und füllt die Felder.
- Prüfe die erkannten Werte kurz und **speichere** die Aktivität.
- Alles ist jederzeit **manuell editierbar**.

---

## 6) Hinweise & Fehlerbehebung

- **Tastatur-Sprache**: Die Erkennung folgt der **Tastatur-Sprache** (z. B. Deutsch). Stelle sie passend ein.
- **Keine App-Mikrofonberechtigung nötig**: Die Erkennung läuft über die Tastatur/den Tastaturanbieter.
- **Ruheumgebung**: Sprich deutlich; vermeide starke Nebengeräusche.
- **Datenschutz**: Sprache wird vom Anbieter der Tastatur (z. B. Google) verarbeitet. Prüfe dessen Richtlinien.
- **Fallback**: Wenn etwas nicht korrekt erkannt wird, gib die Felder einfach klassisch per Tastatur ein.

'@
  Write-File $p $c
}
