# Home

Die **Home**-Seite ist deine Tageszentrale: Datum wÃ¤hlen, Fortschritt sehen, Listen filtern und neue AktivitÃ¤ten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile

| Element | Beschreibung |
|---------|-------------|
| **Titel** | *ToDay* |
| **MenÃ¼ (â‹®)** | Ã–ffnet die Seitennavigation. |

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gewÃ¤hlte Datum** in zwei Formen:

| Element | Beispiel | Funktion |
|---------|---------|----------|
| **Datumschip links** | 22. Okt. 2025 | Tippen Ã¶ffnet einen Datumspicker (schnell zu jedem beliebigen Tag springen). |
| **Langform rechts** | Mittwoch, 22. Oktober 2025 | Bessere Lesbarkeit â€“ nur Anzeige. |

Darunter findest du die **Navigation**:

| Bedienelement | Aktion |
|--------------|--------|
| **Pfeile** â€¹ / â€º | Einen Tag zurÃ¼ck/vor springen. |
| **Chips** Gestern / Heute / Morgen | Sprung direkt auf diese drei Fixpunkte. |

---

## 3) Kennzahlen-Karten & Collapsible Header

Es gibt drei kompakte Kacheln:

| Kachel | Inhalt |
|--------|--------|
| **Gesamt** | Anzahl **aller** AktivitÃ¤ten am gewÃ¤hlten Tag (offen + erledigt). |
| **Erledigt** | Kreisdiagramm + ZÃ¤hler `x / y`. Zeigt, wie viele EintrÃ¤ge bereits abgeschlossen sind. |
| **Hohe PrioritÃ¤t** | Anzahl der als **wichtig** markierten AktivitÃ¤ten. |

**Tipp:** Tippen auf eine Karte kann (je nach Version/Einstellung) die Liste **vorfiltern**.

### 3.1 Einklappbarer Kopfbereich (Collapsible Header)

Der gesamte Kopfbereich â€“ Datum, Datumsleiste, die drei Kennzahlen-Karten und die LED-Indikatoren â€“ lÃ¤sst sich **einklappen**, um mehr Platz fÃ¼r die AktivitÃ¤tenliste zu schaffen.

| Zustand | Darstellung | Bedienung |
|---------|-------------|-----------|
| **Ausgeklappt** | Voller Kopfbereich mit allen Details (Standard beim Ã–ffnen). | Tap auf den **Drag-Handle** (dezenter Griff unter dem Header) klappt ein. |
| **Eingeklappt** | Kompakte **52 px-Leiste** mit Datum-Chip, done/total, linearem Fortschrittsbalken und Hohe-PrioritÃ¤t-Badge. | Tap auf die Collapsed-Bar klappt wieder aus. |

**Ergebnis:** Im eingeklappten Zustand sind statt 2â€“3 AktivitÃ¤ten **6â€“7 AktivitÃ¤ten** gleichzeitig sichtbar â€“ eine Verdreifachung des nutzbaren Listenbereichs.

---

## 4) Infozeile / Mini-Status / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt.

### 4.1 Mini-Status (oberhalb der LED-Zeile)

Direkt **oberhalb** der LED-Warnzeile gibt es eine kleine Statuszeile in **derselben SchriftgrÃ¶ÃŸe** wie die LED-Warnungen.

Dort wird fÃ¼r **Heute** auch **Schritte heute** angezeigt:

| Sprache | Anzeige |
|---------|---------|
| Deutsch | `Schritte heute: 1 234` |
| Englisch | `Steps today: 1,234` |

**Wichtig:**  
Es gibt **kein stilles 0**. Wenn die Berechtigung fehlt oder kein Sensorwert gelesen werden kann, steht dort ein klarer Status statt einer falschen 0, z. B. **nicht verfÃ¼gbar**.  
Die Zeile ist so aufgebaut, dass spÃ¤ter weitere kleine Statuswerte ergÃ¤nzt werden kÃ¶nnen.

### 4.2 DWD und Wetter

| Anzeige | Beschreibung |
|---------|-------------|
| **Wetterwarnungen DWD** | Statuspunkt (grÃ¼n/gelb/rot) und Kurztext. |
| **Pollenflug DWD** | Statuspunkt und Kurztext, inklusive konkreter AuslÃ¶ser (z. B. Hasel, Birke). |
| **Aktuelles Wetter** | z. B. **13 Â°C, 83 % rF.** |

Die Detailansicht erreichst du Ã¼ber den **Tab DWD** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt Ã¼ber der Liste stehen Tabs. Sie filtern die Tagesansicht:

| Tab | Inhalt |
|-----|--------|
| **Offen** | Alle **nicht erledigten** AktivitÃ¤ten am gewÃ¤hlten Datum. |
| **ÃœberfÃ¤llig** | EintrÃ¤ge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind. |
| **Erledigt** | Bereits **abgehakte** EintrÃ¤ge des Tages. |
| **DWD** | Wetterwarnungen/Pollenflug-Details fÃ¼r deinen Ort (Daten: Deutscher Wetterdienst). |

**Hinweis:** Der kleine ZÃ¤hler in eckigen Klammern zeigt, wie viele EintrÃ¤ge der jeweilige Tab aktuell enthÃ¤lt (z. B. `Offen [0]`).

---

## 6) AktivitÃ¤tenliste (Interaktionen)

In den Tabs **Offen / ÃœberfÃ¤llig / Erledigt**:

| Geste | Aktion |
|-------|--------|
| **Antippen** | Eintrag Ã¶ffnen/bearbeiten. |
| **Checkbox tippen** | Als erledigt markieren (bzw. zurÃ¼cksetzen). |
| **Lange tippen** | Kontextaktionen (z. B. verschieben, duplizieren, lÃ¶schen; je nach Version). |

**Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

### 6.1 Bildschirm & Medien (nur auf Home)

| Verhalten | ErklÃ¤rung |
|-----------|-----------|
| **Display bleibt aktiv** | Solange die Home-Seite sichtbar und die App im Vordergrund ist, hÃ¤lt die App das Display aktiv (**Wakelock**). So bleiben Fortschritt, Listen und Status permanent sichtbar. Beim Verlassen der Home-Seite bzw. wenn die App in den Hintergrund geht, wird der Bildschirm wieder gemÃ¤ÃŸ **Systemeinstellungen** gesperrt. |
| **Audio nur auf Home** | **Medienwiedergabe** (Musik) und **Sprachausgaben (TTS)** werden **nur** innerhalb der Home-Seite gestartet. In anderen Bereichen der App werden keine neuen Audio/TTS-Ausgaben ausgelÃ¶st. Bereits laufende Ausgaben kÃ¶nnen je nach System- und App-Status automatisch beendet oder pausiert werden. |

### 6.2 Hintergrund: Benachrichtigungen & Badges

**Was feuert, wenn Home nicht sichtbar ist?**  
Im **Hintergrund** bzw. wenn die Home-Seite nicht sichtbar ist, kÃ¶nnen folgende **Android-Benachrichtigungen** erscheinen:

- Geplante **AktivitÃ¤ts-Erinnerungen** gemÃ¤ÃŸ deinen EintrÃ¤gen und Offsets.  
- **Zeitansagen** (falls aktiviert und fÃ¤llig) als System-Benachrichtigung.  
- **DWD-Warnungen** und **Pollenflug**-Hinweise (falls aktiviert und neue Daten vorliegen).

Diese Benachrichtigungen nutzen das **Systemverhalten** (Ton/Vibration nach Kanal-Einstellung). **TTS** oder **Musik** werden im Hintergrund **nicht** gestartet.

**App-Icon-Badge:**  
Das Badging am App-Icon wird vom **Launcher** bereitgestellt und entspricht in der Regel der **Anzahl aktiver Benachrichtigungen** der App. Die App setzt kein eigenes Badge, sondern das System/der Launcher leitet den ZÃ¤hler aus den sichtbaren Benachrichtigungen ab. Darstellung (Punkt/Zahl) kann je nach GerÃ¤t/Launcher variieren.

---

## 7) Speed Dial â€“ Schnellaktionen (Floating Action Button)

Unten rechts befindet sich ein einzelner **Speed Dial Button** (zentraler FAB). Beim Antippen fÃ¤chern sich **sechs Aktionen** vertikal nach oben auf. Ein erneuter Tap auf den zentralen Button oder auf den Hintergrund schlieÃŸt das MenÃ¼ wieder.

| Nr. | Icon | Aktion | Beschreibung |
|-----|------|--------|-------------|
| 1 | â“ Fragezeichen | **Hilfe** | Ã–ffnet die Hilfeansicht. |
| 2 | ðŸ—£ï¸ Sprachausgabe | **Daily Briefing** | Startet das Tagesbriefing (siehe Multi-Tap unten). |
| 3 | ðŸ”„ Kreispfeile | **Zyklus planen** | Ã–ffnet die Zyklus-Planung fÃ¼r das gewÃ¤hlte Datum. |
| 4 | ðŸŽ¤ Mikrofon | **Sprachbefehl** | Startet Sprach-Makros bzw. die Spracheingabe. |
| 5 | âž– Minus | **AufrÃ¤umen** | Ã–ffnet den AufrÃ¤umen-Dialog. |
| 6 | âž• Plus | **Neu anlegen** | Erstellt eine neue AktivitÃ¤t fÃ¼r das gewÃ¤hlte Datum. |

### 7.1 Daily Briefing â€“ Multi-Tap mit Badge

Der **Daily Briefing**-Button im Speed Dial unterstÃ¼tzt **Multi-Tap** zur Auswahl der PrioritÃ¤tsstufe. Der Speed Dial bleibt beim Briefing-Button bewusst geÃ¶ffnet, damit mehrfach getippt werden kann:

| Tap-Anzahl | Badge | Farbe | PrioritÃ¤t |
|-----------|-------|-------|-----------|
| 1Ã— | **1Ã— â–²** | ðŸ”´ Rot | Nur **hohe** PrioritÃ¤t vorlesen. |
| 2Ã— | **2Ã— â– ** | ðŸŸ  Orange | Nur **mittlere** PrioritÃ¤t vorlesen. |
| 3Ã— | **3Ã— â–¼** | ðŸŸ¢ GrÃ¼n | Nur **niedrige** PrioritÃ¤t vorlesen. |

**Ablauf:** Nach dem letzten Tap lÃ¤uft ein kurzer Countdown (700 ms). Erfolgt kein weiterer Tap, wird das Briefing mit der gewÃ¤hlten Stufe ausgelÃ¶st und der Speed Dial schlieÃŸt sich automatisch.

---

## 8) Typische AblÃ¤ufe

### Tageswechsel
Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum wÃ¤hlen.

### Tagesplan erzeugen oder aktualisieren
**Zyklus planen** antippen und die Planung ausfÃ¼hren, damit wiederkehrende EintrÃ¤ge fÃ¼r dieses Datum angelegt werden.

### Schnell EintrÃ¤ge abhaken
Im Tab **Offen/ÃœberfÃ¤llig** die **Checkbox** tippen â†’ Eintrag wandert nach **Erledigt**.

### AufrÃ¤umen
Ãœber den Speed Dial die SchaltflÃ¤che **AufrÃ¤umen** antippen, den Dialog Ã¶ffnen, Quelle wÃ¤hlen (Zyklus / Zeitansagen / User), Optionen setzen und **LÃ¶schen** tippen.

---

## 9) Was du einstellen kannst (relevant fÃ¼r Home)

| Einstellung | Beschreibung |
|-------------|-------------|
| **Benachrichtigungen & Alarme** | Berechtigungen, Wichtigkeit, TÃ¶ne, â€žExakte Alarme", Energiesparen. |
| **Zeitansagen** | Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall. |
| **Zyklen** | Wiederhol-Rhythmus, Start/Ende, Konfliktbehandlung. |
| **DWD-Infos** | Ein-/Ausblendung, Ort/Quelle (sofern konfigurierbar). |
| **Darstellung** | Hell/Dunkel/Automatisch, App-Sprache (Deutsch/Englisch). |
| **Anzeige & Text** | Schriftart (System/Inter/Roboto Slab/OpenDyslexic), SchriftgrÃ¶ÃŸe (80 %â€“150 %). |

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen kÃ¶nnen je nach Version variieren.

---

## 10) Tipps

- **Heute** zuerst abarbeiten: Nutze die Tabs **ÃœberfÃ¤llig** und **Offen** als Taktgeber.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann tÃ¤glich Ã¼ber die Zyklus-Planung aktualisieren.  
- **DWD-Tab** im Blick behalten, wenn du wetter- oder pollenabhÃ¤ngige Aufgaben hast.  
- **Header einklappen**, wenn du maximalen Platz fÃ¼r deine AktivitÃ¤tenliste brauchst.  
- **Speed Dial** merken: Ein Tap Ã¶ffnet alle Schnellaktionen â€“ kein Suchen nach einzelnen Buttons nÃ¶tig.