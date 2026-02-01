# Home

Die **Home**-Seite ist deine Tageszentrale: Datum w&auml;hlen, Fortschritt sehen, Listen filtern und neue Aktivit&auml;ten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile
- **Titel:** *ToDay*  
- **Men&uuml; (&#8942;):** &Ouml;ffnet die Seitennavigation.

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gew&auml;hlte Datum** in zwei Formen:

- **Datumschip links** (z. B. **22. Okt. 2025**) &rarr; Tippen, um einen Datumspicker zu &ouml;ffnen (schnell zu jedem beliebigen Tag springen).
- **Langform rechts** (z. B. **Mittwoch, 22. Oktober 2025**) nur zur besseren Lesbarkeit.

Darunter findest du die **Navigation**:

- **Pfeile** &#8249; / &#8250; &rarr; Einen Tag zur&uuml;ck/vor springen.
- **Chips** **Gestern**, **Heute**, **Morgen** &rarr; Sprung direkt auf diese drei Fixpunkte.

---

## 3) Kennzahlen-Karten

Es gibt drei kompakte Kacheln:

1. **Gesamt**  
   Anzahl **aller** Aktivit&auml;ten am gew&auml;hlten Tag (offen + erledigt).

2. **Erledigt**  
   Kreisdiagramm + Z&auml;hler `x / y`. Zeigt, wie viele Eintr&auml;ge bereits abgeschlossen sind.

3. **Hohe Priorit&auml;t**  
   Anzahl der als **wichtig** markierten Aktivit&auml;ten.

**Tipp:** Tippen auf eine Karte kann (je nach Version/Einstellung) die Liste **vorfiltern**.

---

## 4) Infozeile / Mini-Status / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt.

### 4.1 Mini-Status (oberhalb der LED-Zeile)
Direkt **oberhalb** der LED-Warnzeile gibt es eine kleine Statuszeile in **derselben Schriftgr&ouml;&szlig;e** wie die LED-Warnungen.

Dort wird f&uuml;r **Heute** auch **Schritte heute** angezeigt:
- **Deutsch:** `Schritte heute: 1234`
- **Englisch:** `Steps today: 1234`

**Wichtig:**
- Es gibt **kein stilles 0**. Wenn Berechtigung fehlt oder kein Sensorwert gelesen werden kann, steht dort ein klarer Status statt einer falschen 0, z. B. **nicht verf&uuml;gbar**.
- Die Zeile ist so aufgebaut, dass sp&auml;ter weitere kleine Statuswerte erg&auml;nzt werden k&ouml;nnen.

### 4.2 DWD und Wetter
- **Wetterwarnungen DWD** &ndash; Statuspunkt (gr&uuml;n/gelb/rot) und Kurztext.  
- **Pollenflug DWD** &ndash; Statuspunkt und Kurztext, inklusive konkreter Ausl&ouml;ser (z. B. Hasel, Birke).  
- **Aktuelles Wetter** &ndash; z. B. **13&deg;C, 83 % rF.**

Die Detailansicht erreichst du &uuml;ber den **Tab DWD** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt &uuml;ber der Liste stehen Tabs. Sie filtern die Tagesansicht:

- **Offen** &ndash; alle **nicht erledigten** Aktivit&auml;ten am gew&auml;hlten Datum.  
- **&Uuml;berf&auml;llig** &ndash; Eintr&auml;ge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind.  
- **Erledigt** &ndash; bereits **abgehakte** Eintr&auml;ge des Tages.  
- **DWD** &ndash; Wetterwarnungen/Pollenflug-Details f&uuml;r deinen Ort (Daten: Deutscher Wetterdienst).

**Hinweis:** Der kleine Z&auml;hler in eckigen Klammern zeigt, wie viele Eintr&auml;ge der jeweilige Tab aktuell enth&auml;lt (z. B. `Offen [0]`).

---

## 6) Aktivit&auml;tenliste (Interaktionen)

In den Tabs **Offen / &Uuml;berf&auml;llig / Erledigt**:

- **&Ouml;ffnen/Bearbeiten:** Eintrag antippen.  
- **Als erledigt markieren:** H&auml;kchen/Checkbox tippen.  
- **Lange tippen:** Kontextaktionen (z. B. verschieben, duplizieren, l&ouml;schen; je nach Version).  
- **Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

### 6.1 Bildschirm & Medien (nur auf Home)
- **Warum geht der Bildschirm nicht aus?**  
  Solange die **Home-Seite sichtbar** und die App im **Vordergrund** ist, h&auml;lt die App das Display aktiv (**Wakelock**). So bleiben Fortschritt, Listen und Status permanent sichtbar und Bedienung ist jederzeit m&ouml;glich. Beim Verlassen der Home-Seite bzw. wenn die App in den Hintergrund geht, wird der Bildschirm wieder gem&auml;&szlig; **Systemeinstellungen** gesperrt.
- **Audio nur auf Home:**  
  **Medienwiedergabe** (Musik) und **Sprachausgaben (TTS)** werden **nur** innerhalb der Home-Seite gestartet. In anderen Bereichen der App werden keine neuen Audio/TTS-Ausgaben ausgel&ouml;st. Bereits laufende Ausgaben k&ouml;nnen je nach System- und App-Status automatisch beendet oder pausiert werden.

### 6.2 Hintergrund: Benachrichtigungen & Badges
- **Was feuert, wenn Home nicht sichtbar ist?**  
  Im **Hintergrund** bzw. wenn die Home-Seite nicht sichtbar ist, k&ouml;nnen folgende **Android-Benachrichtigungen** erscheinen:
  - Geplante **Aktivit&auml;ts-Erinnerungen** gem&auml;&szlig; deinen Eintr&auml;gen und Offsets.  
  - **Zeitansagen** (falls aktiviert und f&auml;llig) als System-Benachrichtigung.  
  - **DWD-Warnungen** und **Pollenflug**-Hinweise (falls aktiviert und neue Daten vorliegen).
  Diese Benachrichtigungen nutzen das **Systemverhalten** (Ton/Vibration nach Kanal-Einstellung). **TTS** oder **Musik** werden im Hintergrund **nicht** gestartet.
- **App-Icon-Badge:**  
  Das Badging am App-Icon wird vom **Launcher** bereitgestellt und entspricht in der Regel der **Anzahl aktiver Benachrichtigungen** der App. Die App setzt kein eigenes Badge, sondern das System/der Launcher leitet den Z&auml;hler aus den sichtbaren Benachrichtigungen ab. Darstellung (Punkt/Zahl) kann je nach Ger&auml;t/Launcher variieren.

---

## 7) Schnelltasten unten (Floating Action Buttons)

Unten rechts gibt es zwei Reihen mit Schnelltasten.

### 7.1 Obere Reihe (von links nach rechts)
1. **Hilfe** (Fragezeichen Icon)  
   &Ouml;ffnet die Hilfeansicht.

2. **Daily Briefing** (Sprachausgabe Icon)  
   Startet das Daily Briefing. Je nach Konfiguration kann mehrmaliges Tippen unterschiedliche Priorit&auml;ten ausgeben.

3. **Zyklus planen** (kreisf&ouml;rmige Pfeile)  
   &Ouml;ffnet die Zyklus Planung f&uuml;r das gew&auml;hlte Datum.

### 7.2 Untere Reihe (von links nach rechts)
1. **Sprachbefehl** (Mikrofon)  
   Startet Sprach Makros bzw. die Spracheingabe.

2. **Aufr&auml;umen** (Minus Zeichen)  
   &Ouml;ffnet den Aufr&auml;umen Dialog.

3. **Neu anlegen** (Plus)  
   &Ouml;ffnet den Dialog, um eine neue Aktivit&auml;t f&uuml;r das gew&auml;hlte Datum zu erstellen (Titel, Uhrzeit, Wiederholung, Priorit&auml;t etc.).

---

## 8) Typische Abl&auml;ufe

### Tageswechsel
- Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum w&auml;hlen.

### Tagesplan erzeugen oder aktualisieren
- **Zyklus planen** antippen und die Planung ausf&uuml;hren, damit wiederkehrende Eintr&auml;ge f&uuml;r dieses Datum angelegt werden.

### Schnell Eintr&auml;ge abhaken
- Im Tab **Offen/&Uuml;berf&auml;llig** die **Checkbox** tippen &rarr; Eintrag wandert nach **Erledigt**.

### Aufr&auml;umen
- &Uuml;ber die Schaltfl&auml;che **Aufr&auml;umen** den Dialog &ouml;ffnen, Quelle w&auml;hlen (Zyklus / Zeitansagen / User), Optionen setzen und **L&ouml;schen** tippen.

---

## 9) Was du einstellen kannst (relevant f&uuml;r Home)

- **Benachrichtigungen & Alarme**: Berechtigungen, Wichtigkeit, T&ouml;ne, "Exakte Alarme", Energiesparen.  
- **Zeitansagen**: Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall.  
- **Zyklen**: Wiederhol-Rhythmus, Start/Ende, Konfliktbehandlung.  
- **DWD-Infos**: Ein-/Ausblendung, Ort/Quelle (sofern konfigurierbar).  
- **Darstellung**: Hell/Dunkel/Automatisch, App-Sprache (Deutsch/Englisch).

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen k&ouml;nnen je nach Version variieren.

---

## 10) Tipps
- **Heute** zuerst abarbeiten: Nutze die Tabs **&Uuml;berf&auml;llig** und **Offen** als Taktgeber.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann t&auml;glich &uuml;ber die Zyklus Planung aktualisieren.  
- **DWD-Tab** im Blick behalten, wenn du wetter- oder pollenabh&auml;ngige Aufgaben hast.