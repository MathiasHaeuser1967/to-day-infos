# Home

Die **Home**-Seite ist deine Tageszentrale: Datum wÃ¤hlen, Fortschritt sehen, Listen filtern und neue AktivitÃ¤ten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile
- **Titel:** *ToDay*  
- **MenÃ¼ (&#8942;):** Ã–ffnet die Seitennavigation.

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gewÃ¤hlte Datum** in zwei Formen:

- **Datumschip links** (z. B. **22. Okt. 2025**) â†’ Tippen, um einen Datumspicker zu Ã¶ffnen (schnell zu jedem beliebigen Tag springen).
- **Langform rechts** (z. B. **Mittwoch, 22. Oktober 2025**) nur zur besseren Lesbarkeit.

Darunter findest du die **Navigation**:

- **Pfeile** &#8249; / &#8250; â†’ Einen Tag zurÃ¼ck/vor springen.
- **Chips** **Gestern**, **Heute**, **Morgen** â†’ Sprung direkt auf diese drei Fixpunkte.

---

## 3) Kennzahlen-Karten

Es gibt drei kompakte Kacheln:

1. **Gesamt**  
   Anzahl **aller** AktivitÃ¤ten am gewÃ¤hlten Tag (offen + erledigt).

2. **Erledigt**  
   Kreisdiagramm + ZÃ¤hler `x / y`. Zeigt, wie viele EintrÃ¤ge bereits abgeschlossen sind.

3. **Hohe PrioritÃ¤t**  
   Anzahl der als **wichtig** markierten AktivitÃ¤ten.

**Tipp:** Tippen auf eine Karte kann (je nach Version/Einstellung) die Liste **vorfiltern**.

---

## 4) Infozeile / Mini-Status / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt:

### 4.1 Mini-Status (oberhalb der LED-Zeile)
Direkt **oberhalb** der LED-Warnzeile gibt es eine kleine Statuszeile in **derselben SchriftgrÃ¶ÃŸe** wie die LED-Warnungen.  
Dort wird fÃ¼r **Heute** auch **Schritte heute** angezeigt:

- **Deutsch:** `Schritte heute: 1234`
- **Englisch:** `Steps today: 1234`

**Wichtig:**
- Es gibt **kein stilles 0**. Wenn Berechtigung fehlt oder kein Sensorwert gelesen werden kann, steht dort ein klarer Status statt einer falschen 0.
- Die Zeile ist so aufgebaut, dass spÃ¤ter weitere kleine Statuswerte ergÃ¤nzt werden kÃ¶nnen.

### 4.2 DWD und Wetter
- **Wetterwarnungen DWD** - Statuspunkt (grÃ¼n/gelb/rot) und Kurztext.  
- **Pollenflug DWD** - Statuspunkt und Kurztext, inklusive konkreter AuslÃ¶ser (z. B. Hasel, Birke).  
- **Aktuelles Wetter** - z. B. **13Â°C, 83 % rF.**

Die Detailansicht erreichst du Ã¼ber den **Tab DWD** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt Ã¼ber der Liste stehen Tabs. Sie filtern die Tagesansicht:

- **Offen** - alle **nicht erledigten** AktivitÃ¤ten am gewÃ¤hlten Datum.  
- **ÃœberfÃ¤llig** - EintrÃ¤ge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind.  
- **Erledigt** - bereits **abgehakte** EintrÃ¤ge des Tages.  
- **DWD** - Wetterwarnungen/Pollenflug-Details fÃ¼r deinen Ort (Daten: Deutscher Wetterdienst).

**Hinweis:** Der kleine ZÃ¤hler in eckigen Klammern zeigt, wie viele EintrÃ¤ge der jeweilige Tab aktuell enthÃ¤lt (z. B. `Offen [0]`).

---

## 6) AktivitÃ¤tenliste (Interaktionen)

In den Tabs **Offen / ÃœberfÃ¤llig / Erledigt**:

- **Ã–ffnen/Bearbeiten:** Eintrag antippen.  
- **Als erledigt markieren:** HÃ¤kchen/Checkbox tippen.  
- **Lange tippen:** Kontextaktionen (z. B. verschieben, duplizieren, lÃ¶schen; je nach Version).  
- **Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

### 6.1 Bildschirm & Medien (nur auf Home)
- **Warum geht der Bildschirm nicht aus?**  
  Solange die **Home-Seite sichtbar** und die App im **Vordergrund** ist, hÃ¤lt die App das Display aktiv (**Wakelock**). So bleiben Fortschritt, Listen und Status permanent sichtbar und Bedienung ist jederzeit mÃ¶glich. Beim Verlassen der Home-Seite bzw. wenn die App in den Hintergrund geht, wird der Bildschirm wieder gemÃ¤ÃŸ **Systemeinstellungen** gesperrt.
- **Audio nur auf Home:**  
  **Medienwiedergabe** (Musik) und **Sprachausgaben (TTS)** werden **nur** innerhalb der Home-Seite gestartet. In anderen Bereichen der App werden keine neuen Audio/TTS-Ausgaben ausgelÃ¶st. Bereits laufende Ausgaben kÃ¶nnen je nach System- und App-Status automatisch beendet oder pausiert werden.

### 6.2 Hintergrund: Benachrichtigungen & Badges
- **Was feuert, wenn Home nicht sichtbar ist?**  
  Im **Hintergrund** bzw. wenn die Home-Seite nicht sichtbar ist, kÃ¶nnen folgende **Android-Benachrichtigungen** erscheinen:
  - Geplante **AktivitÃ¤ts-Erinnerungen** gemÃ¤ÃŸ deinen EintrÃ¤gen und Offsets.  
  - **Zeitansagen** (falls aktiviert und fÃ¤llig) als System-Benachrichtigung.  
  - **DWD-Warnungen** und **Pollenflug**-Hinweise (falls aktiviert und neue Daten vorliegen).
  Diese Benachrichtigungen nutzen das **Systemverhalten** (Ton/Vibration nach Kanal-Einstellung). **TTS** oder **Musik** werden im Hintergrund **nicht** gestartet.
- **App-Icon-Badge:**  
  Das Badging am App-Icon wird vom **Launcher** bereitgestellt und entspricht in der Regel der **Anzahl aktiver Benachrichtigungen** der App. Die App setzt kein eigenes Badge, sondern das System/der Launcher leitet den ZÃ¤hler aus den sichtbaren Benachrichtigungen ab. Darstellung (Punkt/Zahl) kann je nach GerÃ¤t/Launcher variieren.

---

## 7) Schnelltasten unten (Floating Action Buttons)

Unten rechts gibt es zwei Reihen mit Schnelltasten.

### 7.1 Obere Reihe (von links nach rechts)
1. **Hilfe** (Fragezeichen Icon)  
   Ã–ffnet die Hilfeansicht.

2. **Daily Briefing** (Sprachausgabe Icon)  
   Startet das Daily Briefing. Je nach Konfiguration kann mehrmaliges Tippen unterschiedliche PrioritÃ¤ten ausgeben.

3. **Zyklus planen** (kreisfÃ¶rmige Pfeile)  
   Ã–ffnet die Zyklus Planung fÃ¼r das gewÃ¤hlte Datum.

### 7.2 Untere Reihe (von links nach rechts)
1. **Sprachbefehl** (Mikrofon)  
   Startet Sprach Makros bzw. Spracheingabe.

2. **AufrÃ¤umen** (Minus Zeichen)  
   Ã–ffnet den AufrÃ¤umen Dialog.

3. **Neu anlegen** (Plus)  
   Ã–ffnet den Dialog, um eine neue AktivitÃ¤t fÃ¼r das gewÃ¤hlte Datum zu erstellen (Titel, Uhrzeit, Wiederholung, PrioritÃ¤t etc.).

---

## 8) Typische AblÃ¤ufe

### Tageswechsel
- Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum wÃ¤hlen.

### Tagesplan erzeugen oder aktualisieren
- **Zyklus planen** antippen und die Planung ausfÃ¼hren, damit wiederkehrende EintrÃ¤ge fÃ¼r dieses Datum angelegt werden.

### Schnell EintrÃ¤ge abhaken
- Im Tab **Offen/ÃœberfÃ¤llig** die **Checkbox** tippen â†’ Eintrag wandert nach **Erledigt**.

### AufrÃ¤umen
- Ãœber die SchaltflÃ¤che **AufrÃ¤umen** den Dialog Ã¶ffnen, Quelle wÃ¤hlen (Zyklus / Zeitansagen / User), Optionen setzen und **LÃ¶schen** tippen.

---

## 9) Was du einstellen kannst (relevant fÃ¼r Home)

- **Benachrichtigungen & Alarme**: Berechtigungen, Wichtigkeit, TÃ¶ne, "Exakte Alarme", Energiesparen.  
- **Zeitansagen**: Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall.  
- **Zyklen**: Wiederhol Rhythmus, Start/Ende, Konfliktbehandlung.  
- **DWD-Infos**: Ein Ausblendung, Ort Quelle (sofern konfigurierbar).  
- **Darstellung**: Hell Dunkel Automatisch, App Sprache (Deutsch Englisch).

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen kÃ¶nnen je nach Version variieren.

---

## 10) Tipps
- **Heute** zuerst abarbeiten: Nutze die Tabs **ÃœberfÃ¤llig** und **Offen**.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann tÃ¤glich Ã¼ber die Zyklus Planung aktualisieren.  
- **DWD Tab** im Blick behalten, wenn du wetter oder pollenabhÃ¤ngige Aufgaben hast.