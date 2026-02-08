function Write-De-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

Die **Home**-Seite ist deine Tageszentrale: Datum wählen, Fortschritt sehen, Listen filtern und neue Aktivitäten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile

| Element | Beschreibung |
|---------|-------------|
| **Titel** | *ToDay* |
| **Menü (⋮)** | Öffnet die Seitennavigation. |

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gewählte Datum** in zwei Formen:

| Element | Beispiel | Funktion |
|---------|---------|----------|
| **Datumschip links** | 22. Okt. 2025 | Tippen öffnet einen Datumspicker (schnell zu jedem beliebigen Tag springen). |
| **Langform rechts** | Mittwoch, 22. Oktober 2025 | Bessere Lesbarkeit – nur Anzeige. |

Darunter findest du die **Navigation**:

| Bedienelement | Aktion |
|--------------|--------|
| **Pfeile** ‹ / › | Einen Tag zurück/vor springen. |
| **Chips** Gestern / Heute / Morgen | Sprung direkt auf diese drei Fixpunkte. |

---

## 3) Kennzahlen-Karten & Collapsible Header

Es gibt drei kompakte Kacheln:

| Kachel | Inhalt |
|--------|--------|
| **Gesamt** | Anzahl **aller** Aktivitäten am gewählten Tag (offen + erledigt). |
| **Erledigt** | Kreisdiagramm + Zähler `x / y`. Zeigt, wie viele Einträge bereits abgeschlossen sind. |
| **Hohe Priorität** | Anzahl der als **wichtig** markierten Aktivitäten. |

**Tipp:** Tippen auf eine Karte kann (je nach Version/Einstellung) die Liste **vorfiltern**.

### 3.1 Einklappbarer Kopfbereich (Collapsible Header)

Der gesamte Kopfbereich – Datum, Datumsleiste, die drei Kennzahlen-Karten und die LED-Indikatoren – lässt sich **einklappen**, um mehr Platz für die Aktivitätenliste zu schaffen.

| Zustand | Darstellung | Bedienung |
|---------|-------------|-----------|
| **Ausgeklappt** | Voller Kopfbereich mit allen Details (Standard beim Öffnen). | Tap auf den **Drag-Handle** (dezenter Griff unter dem Header) klappt ein. |
| **Eingeklappt** | Kompakte **52 px-Leiste** mit Datum-Chip, done/total, linearem Fortschrittsbalken und Hohe-Priorität-Badge. | Tap auf die Collapsed-Bar klappt wieder aus. |

**Ergebnis:** Im eingeklappten Zustand sind statt 2–3 Aktivitäten **6–7 Aktivitäten** gleichzeitig sichtbar – eine Verdreifachung des nutzbaren Listenbereichs.

---

## 4) Infozeile / Mini-Status / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt.

### 4.1 Mini-Status (oberhalb der LED-Zeile)

Direkt **oberhalb** der LED-Warnzeile gibt es eine kleine Statuszeile in **derselben Schriftgröße** wie die LED-Warnungen.

Dort wird für **Heute** auch **Schritte heute** angezeigt:

| Sprache | Anzeige |
|---------|---------|
| Deutsch | `Schritte heute: 1 234` |
| Englisch | `Steps today: 1,234` |

**Wichtig:**  
Es gibt **kein stilles 0**. Wenn die Berechtigung fehlt oder kein Sensorwert gelesen werden kann, steht dort ein klarer Status statt einer falschen 0, z. B. **nicht verfügbar**.  
Die Zeile ist so aufgebaut, dass später weitere kleine Statuswerte ergänzt werden können.

### 4.2 DWD und Wetter

| Anzeige | Beschreibung |
|---------|-------------|
| **Wetterwarnungen DWD** | Statuspunkt (grün/gelb/rot) und Kurztext. |
| **Pollenflug DWD** | Statuspunkt und Kurztext, inklusive konkreter Auslöser (z. B. Hasel, Birke). |
| **Aktuelles Wetter** | z. B. **13 °C, 83 % rF.** |

Die Detailansicht erreichst du über den **Tab DWD** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt über der Liste stehen Tabs. Sie filtern die Tagesansicht:

| Tab | Inhalt |
|-----|--------|
| **Offen** | Alle **nicht erledigten** Aktivitäten am gewählten Datum. |
| **Überfällig** | Einträge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind. |
| **Erledigt** | Bereits **abgehakte** Einträge des Tages. |
| **DWD** | Wetterwarnungen/Pollenflug-Details für deinen Ort (Daten: Deutscher Wetterdienst). |

**Hinweis:** Der kleine Zähler in eckigen Klammern zeigt, wie viele Einträge der jeweilige Tab aktuell enthält (z. B. `Offen [0]`).

---

## 6) Aktivitätenliste (Interaktionen)

In den Tabs **Offen / Überfällig / Erledigt**:

| Geste | Aktion |
|-------|--------|
| **Antippen** | Eintrag öffnen/bearbeiten. |
| **Checkbox tippen** | Als erledigt markieren (bzw. zurücksetzen). |
| **Lange tippen** | Kontextaktionen (z. B. verschieben, duplizieren, löschen; je nach Version). |

**Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

### 6.1 Bildschirm & Medien (nur auf Home)

| Verhalten | Erklärung |
|-----------|-----------|
| **Display bleibt aktiv** | Solange die Home-Seite sichtbar und die App im Vordergrund ist, hält die App das Display aktiv (**Wakelock**). So bleiben Fortschritt, Listen und Status permanent sichtbar. Beim Verlassen der Home-Seite bzw. wenn die App in den Hintergrund geht, wird der Bildschirm wieder gemäß **Systemeinstellungen** gesperrt. |
| **Audio nur auf Home** | **Medienwiedergabe** (Musik) und **Sprachausgaben (TTS)** werden **nur** innerhalb der Home-Seite gestartet. In anderen Bereichen der App werden keine neuen Audio/TTS-Ausgaben ausgelöst. Bereits laufende Ausgaben können je nach System- und App-Status automatisch beendet oder pausiert werden. |

### 6.2 Hintergrund: Benachrichtigungen & Badges

**Was feuert, wenn Home nicht sichtbar ist?**  
Im **Hintergrund** bzw. wenn die Home-Seite nicht sichtbar ist, können folgende **Android-Benachrichtigungen** erscheinen:

- Geplante **Aktivitäts-Erinnerungen** gemäß deinen Einträgen und Offsets.  
- **Zeitansagen** (falls aktiviert und fällig) als System-Benachrichtigung.  
- **DWD-Warnungen** und **Pollenflug**-Hinweise (falls aktiviert und neue Daten vorliegen).

Diese Benachrichtigungen nutzen das **Systemverhalten** (Ton/Vibration nach Kanal-Einstellung). **TTS** oder **Musik** werden im Hintergrund **nicht** gestartet.

**App-Icon-Badge:**  
Das Badging am App-Icon wird vom **Launcher** bereitgestellt und entspricht in der Regel der **Anzahl aktiver Benachrichtigungen** der App. Die App setzt kein eigenes Badge, sondern das System/der Launcher leitet den Zähler aus den sichtbaren Benachrichtigungen ab. Darstellung (Punkt/Zahl) kann je nach Gerät/Launcher variieren.

---

## 7) Speed Dial – Schnellaktionen (Floating Action Button)

Unten rechts befindet sich ein einzelner **Speed Dial Button** (zentraler FAB). Beim Antippen fächern sich **sechs Aktionen** vertikal nach oben auf. Ein erneuter Tap auf den zentralen Button oder auf den Hintergrund schließt das Menü wieder.

| Nr. | Icon | Aktion | Beschreibung |
|-----|------|--------|-------------|
| 1 | ❓ Fragezeichen | **Hilfe** | Öffnet die Hilfeansicht. |
| 2 | 🗣️ Sprachausgabe | **Daily Briefing** | Startet das Tagesbriefing (siehe Multi-Tap unten). |
| 3 | 🔄 Kreispfeile | **Zyklus planen** | Öffnet die Zyklus-Planung für das gewählte Datum. |
| 4 | 🎤 Mikrofon | **Sprachbefehl** | Startet Sprach-Makros bzw. die Spracheingabe. |
| 5 | ➖ Minus | **Aufräumen** | Öffnet den Aufräumen-Dialog. |
| 6 | ➕ Plus | **Neu anlegen** | Erstellt eine neue Aktivität für das gewählte Datum. |

### 7.1 Daily Briefing – Multi-Tap mit Badge

Der **Daily Briefing**-Button im Speed Dial unterstützt **Multi-Tap** zur Auswahl der Prioritätsstufe. Der Speed Dial bleibt beim Briefing-Button bewusst geöffnet, damit mehrfach getippt werden kann:

| Tap-Anzahl | Badge | Farbe | Priorität |
|-----------|-------|-------|-----------|
| 1× | **1× ▲** | 🔴 Rot | Nur **hohe** Priorität vorlesen. |
| 2× | **2× ■** | 🟠 Orange | Nur **mittlere** Priorität vorlesen. |
| 3× | **3× ▼** | 🟢 Grün | Nur **niedrige** Priorität vorlesen. |

**Ablauf:** Nach dem letzten Tap läuft ein kurzer Countdown (700 ms). Erfolgt kein weiterer Tap, wird das Briefing mit der gewählten Stufe ausgelöst und der Speed Dial schließt sich automatisch.

---

## 8) Typische Abläufe

### Tageswechsel
Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum wählen.

### Tagesplan erzeugen oder aktualisieren
**Zyklus planen** antippen und die Planung ausführen, damit wiederkehrende Einträge für dieses Datum angelegt werden.

### Schnell Einträge abhaken
Im Tab **Offen/Überfällig** die **Checkbox** tippen → Eintrag wandert nach **Erledigt**.

### Aufräumen
Über den Speed Dial die Schaltfläche **Aufräumen** antippen, den Dialog öffnen, Quelle wählen (Zyklus / Zeitansagen / User), Optionen setzen und **Löschen** tippen.

---

## 9) Was du einstellen kannst (relevant für Home)

| Einstellung | Beschreibung |
|-------------|-------------|
| **Benachrichtigungen & Alarme** | Berechtigungen, Wichtigkeit, Töne, „Exakte Alarme", Energiesparen. |
| **Zeitansagen** | Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall. |
| **Zyklen** | Wiederhol-Rhythmus, Start/Ende, Konfliktbehandlung. |
| **DWD-Infos** | Ein-/Ausblendung, Ort/Quelle (sofern konfigurierbar). |
| **Darstellung** | Hell/Dunkel/Automatisch, App-Sprache (Deutsch/Englisch). |
| **Anzeige & Text** | Schriftart (System/Inter/Roboto Slab/OpenDyslexic), Schriftgröße (80 %–150 %). |

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen können je nach Version variieren.

---

## 10) Tipps

- **Heute** zuerst abarbeiten: Nutze die Tabs **Überfällig** und **Offen** als Taktgeber.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann täglich über die Zyklus-Planung aktualisieren.  
- **DWD-Tab** im Blick behalten, wenn du wetter- oder pollenabhängige Aufgaben hast.  
- **Header einklappen**, wenn du maximalen Platz für deine Aktivitätenliste brauchst.  
- **Speed Dial** merken: Ein Tap öffnet alle Schnellaktionen – kein Suchen nach einzelnen Buttons nötig.
'@
  Write-File $p $c
}
