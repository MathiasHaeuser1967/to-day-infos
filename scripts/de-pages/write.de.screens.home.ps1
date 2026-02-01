function Write-De-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

Die **Home**-Seite ist deine Tageszentrale: Datum wählen, Fortschritt sehen, Listen filtern und neue Aktivitäten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile
- **Titel:** *ToDay*  
- **Menü (&#8942;):** Öffnet die Seitennavigation.

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gewählte Datum** in zwei Formen:

- **Datumschip links** (z. B. **22. Okt. 2025**) → Tippen, um einen Datumspicker zu öffnen (schnell zu jedem beliebigen Tag springen).
- **Langform rechts** (z. B. **Mittwoch, 22. Oktober 2025**) nur zur besseren Lesbarkeit.

Darunter findest du die **Navigation**:

- **Pfeile** &#8249; / &#8250; → Einen Tag zurück/vor springen.
- **Chips** **Gestern**, **Heute**, **Morgen** → Sprung direkt auf diese drei Fixpunkte.

---

## 3) Kennzahlen-Karten

Es gibt drei kompakte Kacheln:

1. **Gesamt**  
   Anzahl **aller** Aktivitäten am gewählten Tag (offen + erledigt).

2. **Erledigt**  
   Kreisdiagramm + Zähler `x / y`. Zeigt, wie viele Einträge bereits abgeschlossen sind.

3. **Hohe Priorität**  
   Anzahl der als **wichtig** markierten Aktivitäten.

**Tipp:** Tippen auf eine Karte kann (je nach Version/Einstellung) die Liste **vorfiltern**.

---

## 4) Infozeile / Mini-Status / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt:

### 4.1 Mini-Status (oberhalb der LED-Zeile)
Direkt **oberhalb** der LED-Warnzeile gibt es eine kleine Statuszeile in **derselben Schriftgröße** wie die LED-Warnungen.  
Dort wird für **Heute** auch **Schritte heute** angezeigt:

- **Deutsch:** `Schritte heute: 1234`
- **Englisch:** `Steps today: 1234`

**Wichtig:**
- Es gibt **kein stilles 0**. Wenn Berechtigung fehlt oder kein Sensorwert gelesen werden kann, steht dort ein klarer Status statt einer falschen 0.
- Die Zeile ist so aufgebaut, dass später weitere kleine Statuswerte ergänzt werden können.

### 4.2 DWD und Wetter
- **Wetterwarnungen DWD** - Statuspunkt (grün/gelb/rot) und Kurztext.  
- **Pollenflug DWD** - Statuspunkt und Kurztext, inklusive konkreter Auslöser (z. B. Hasel, Birke).  
- **Aktuelles Wetter** - z. B. **13°C, 83 % rF.**

Die Detailansicht erreichst du über den **Tab DWD** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt über der Liste stehen Tabs. Sie filtern die Tagesansicht:

- **Offen** - alle **nicht erledigten** Aktivitäten am gewählten Datum.  
- **Überfällig** - Einträge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind.  
- **Erledigt** - bereits **abgehakte** Einträge des Tages.  
- **DWD** - Wetterwarnungen/Pollenflug-Details für deinen Ort (Daten: Deutscher Wetterdienst).

**Hinweis:** Der kleine Zähler in eckigen Klammern zeigt, wie viele Einträge der jeweilige Tab aktuell enthält (z. B. `Offen [0]`).

---

## 6) Aktivitätenliste (Interaktionen)

In den Tabs **Offen / Überfällig / Erledigt**:

- **Öffnen/Bearbeiten:** Eintrag antippen.  
- **Als erledigt markieren:** Häkchen/Checkbox tippen.  
- **Lange tippen:** Kontextaktionen (z. B. verschieben, duplizieren, löschen; je nach Version).  
- **Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

### 6.1 Bildschirm & Medien (nur auf Home)
- **Warum geht der Bildschirm nicht aus?**  
  Solange die **Home-Seite sichtbar** und die App im **Vordergrund** ist, hält die App das Display aktiv (**Wakelock**). So bleiben Fortschritt, Listen und Status permanent sichtbar und Bedienung ist jederzeit möglich. Beim Verlassen der Home-Seite bzw. wenn die App in den Hintergrund geht, wird der Bildschirm wieder gemäß **Systemeinstellungen** gesperrt.
- **Audio nur auf Home:**  
  **Medienwiedergabe** (Musik) und **Sprachausgaben (TTS)** werden **nur** innerhalb der Home-Seite gestartet. In anderen Bereichen der App werden keine neuen Audio/TTS-Ausgaben ausgelöst. Bereits laufende Ausgaben können je nach System- und App-Status automatisch beendet oder pausiert werden.

### 6.2 Hintergrund: Benachrichtigungen & Badges
- **Was feuert, wenn Home nicht sichtbar ist?**  
  Im **Hintergrund** bzw. wenn die Home-Seite nicht sichtbar ist, können folgende **Android-Benachrichtigungen** erscheinen:
  - Geplante **Aktivitäts-Erinnerungen** gemäß deinen Einträgen und Offsets.  
  - **Zeitansagen** (falls aktiviert und fällig) als System-Benachrichtigung.  
  - **DWD-Warnungen** und **Pollenflug**-Hinweise (falls aktiviert und neue Daten vorliegen).
  Diese Benachrichtigungen nutzen das **Systemverhalten** (Ton/Vibration nach Kanal-Einstellung). **TTS** oder **Musik** werden im Hintergrund **nicht** gestartet.
- **App-Icon-Badge:**  
  Das Badging am App-Icon wird vom **Launcher** bereitgestellt und entspricht in der Regel der **Anzahl aktiver Benachrichtigungen** der App. Die App setzt kein eigenes Badge, sondern das System/der Launcher leitet den Zähler aus den sichtbaren Benachrichtigungen ab. Darstellung (Punkt/Zahl) kann je nach Gerät/Launcher variieren.

---

## 7) Schnelltasten unten (Floating Action Buttons)

Unten rechts gibt es zwei Reihen mit Schnelltasten.

### 7.1 Obere Reihe (von links nach rechts)
1. **Hilfe** (Fragezeichen Icon)  
   Öffnet die Hilfeansicht.

2. **Daily Briefing** (Sprachausgabe Icon)  
   Startet das Daily Briefing. Je nach Konfiguration kann mehrmaliges Tippen unterschiedliche Prioritäten ausgeben.

3. **Zyklus planen** (kreisförmige Pfeile)  
   Öffnet die Zyklus Planung für das gewählte Datum.

### 7.2 Untere Reihe (von links nach rechts)
1. **Sprachbefehl** (Mikrofon)  
   Startet Sprach Makros bzw. Spracheingabe.

2. **Aufräumen** (Minus Zeichen)  
   Öffnet den Aufräumen Dialog.

3. **Neu anlegen** (Plus)  
   Öffnet den Dialog, um eine neue Aktivität für das gewählte Datum zu erstellen (Titel, Uhrzeit, Wiederholung, Priorität etc.).

---

## 8) Typische Abläufe

### Tageswechsel
- Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum wählen.

### Tagesplan erzeugen oder aktualisieren
- **Zyklus planen** antippen und die Planung ausführen, damit wiederkehrende Einträge für dieses Datum angelegt werden.

### Schnell Einträge abhaken
- Im Tab **Offen/Überfällig** die **Checkbox** tippen → Eintrag wandert nach **Erledigt**.

### Aufräumen
- Über die Schaltfläche **Aufräumen** den Dialog öffnen, Quelle wählen (Zyklus / Zeitansagen / User), Optionen setzen und **Löschen** tippen.

---

## 9) Was du einstellen kannst (relevant für Home)

- **Benachrichtigungen & Alarme**: Berechtigungen, Wichtigkeit, Töne, "Exakte Alarme", Energiesparen.  
- **Zeitansagen**: Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall.  
- **Zyklen**: Wiederhol Rhythmus, Start/Ende, Konfliktbehandlung.  
- **DWD-Infos**: Ein Ausblendung, Ort Quelle (sofern konfigurierbar).  
- **Darstellung**: Hell Dunkel Automatisch, App Sprache (Deutsch Englisch).

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen können je nach Version variieren.

---

## 10) Tipps
- **Heute** zuerst abarbeiten: Nutze die Tabs **Überfällig** und **Offen**.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann täglich über die Zyklus Planung aktualisieren.  
- **DWD Tab** im Blick behalten, wenn du wetter oder pollenabhängige Aufgaben hast.
'@
  Write-File $p $c
}
