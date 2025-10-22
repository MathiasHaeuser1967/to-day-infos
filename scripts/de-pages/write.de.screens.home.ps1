function Write-De-Screen-Home {
  $p = Join-Path $Screens 'home.md'
  $c = @'
# Home

Die **Home**-Seite ist deine Tageszentrale: Datum wählen, Fortschritt sehen, Listen filtern und neue Aktivitäten anlegen oder per Sprache steuern.

---

## 1) Kopfzeile
- **Titel:** *ToDay*  
- **Menü (&#8942;):** Öffnet die Seitennavigation, z. B. **Einstellungen**, **Aufräumen**, **Hilfe**.

---

## 2) Datumsbereich & Navigation

Oben siehst du das **gewählte Datum** in zwei Formen:

- **Datumschip links** (z. B. **22. Okt. 2025**) &rarr; Tippen, um einen Datumspicker zu öffnen (schnell zu jedem beliebigen Tag springen).
- **Langform rechts** (z. B. **Mittwoch, 22. Oktober 2025**) nur zur besseren Lesbarkeit.

Darunter findest du die **Navigation**:

- **Pfeile** &#8249; / &#8250; &rarr; Einen Tag zurück/vor springen.
- **Chips** **Gestern**, **Heute**, **Morgen** &rarr; Sprung direkt auf diese drei Fixpunkte.

**Fortschrittsbalken:**  
Zwischen Navigation und Kennzahlen zeigt ein Balken deinen Tagesfortschritt in % (z. B. **62.3 %**). Er berechnet sich aus **Erledigt / Gesamt** der Aktivitäten am gewählten Tag.

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

## 4) Infozeile / Wetter & DWD

Unter den Kennzahlen wird ein **Info-Block** angezeigt:
- **Wetterwarnungen DWD** – Statuspunkt (grün/gelb/rot) und Kurztext.  
- **Pollenflug DWD** – Statuspunkt und Kurztext.  
- **Aktuelles Wetter** – z. B. **13&deg;C, 83 % rF, Sonne, wolkenlos**.

Die Detailansicht erreichst du über den **Tab „DWD“** (siehe unten). Ein-/Ausblendung und Einheiten stellst du in **Einstellungen** ein.

---

## 5) Tabs (Listenfilter)

Direkt über der Liste stehen Tabs. Sie filtern die Tagesansicht:

- **Offen** – alle **nicht erledigten** Aktivitäten am gewählten Datum.  
- **Überfällig** – Einträge, deren Termin **in der Vergangenheit** liegt und die noch **offen** sind.  
- **Erledigt** – bereits **abgehakte** Einträge des Tages.  
- **DWD** – Wetterwarnungen/Pollenflug-Details für deinen Ort (Daten: Deutscher Wetterdienst).

**Hinweis:** Der kleine Zähler in eckigen Klammern zeigt, wie viele Einträge der jeweilige Tab aktuell enthält (z. B. `Offen [0]`).

---

## 6) Aktivitätenliste (Interaktionen)

In den Tabs **Offen / Überfällig / Erledigt**:

- **Öffnen/Bearbeiten:** Eintrag antippen.  
- **Als erledigt markieren:** Häkchen/Checkbox tippen.  
- **Lange tippen:** Kontextaktionen (z. B. verschieben, duplizieren, löschen; je nach Version).  
- **Sortierung:** Standard ist **nach Uhrzeit**; vordatiert/ohne Zeit werden gruppiert angezeigt.

---

## 7) Schnelltasten unten (Floating Action Row)

Von **links nach rechts**:

1. **Zyklus ausführen** (zwei kreisförmige Pfeile)  
   Erzeugt für das **gewählte Datum** die fälligen Einträge aus deinen **Zyklen** (Wiederholungen).

2. **Sprachbefehl** (Mikrofon)  
   Startet **Sprach-Makros** bzw. die **Spracheingabe**.

3. **Schnellaktion** (Minus-Symbol)  
   Kontextsensitive Kurzfunktion – z. B. **Aufräumen** öffnen, **Snooze/Zurückstellen** oder eine definierte **Kurzaktion**.

4. **Neu anlegen** (Plus)  
   Öffnet den Dialog, um **eine neue Aktivität** für das gewählte Datum zu erstellen (Titel, Uhrzeit, Wiederholung, Priorität etc.).

---

## 8) Typische Abläufe

### Tageswechsel
- Mit Pfeilen/Chips zu **Gestern/Heute/Morgen** springen oder auf den **Datumschip** tippen und ein beliebiges Datum wählen.

### Tagesplan erzeugen/aktualisieren
- **Zyklus ausführen** antippen &rarr; wiederkehrende Einträge für **dieses Datum** werden angelegt.

### Schnell Einträge abhaken
- Im Tab **Offen/Überfällig** die **Checkbox** tippen &rarr; Eintrag wandert nach **Erledigt**; Fortschritt steigt.

### Aufräumen
- Über das **Menü (&#8942;)** oder die **Schnellaktion (−)** den **Aufräumen-Dialog** öffnen, Quelle wählen (Zyklus / Zeitansagen / User), Optionen setzen (z. B. „Nur offene“, „Benachrichtigungen stornieren“) und **Löschen** tippen.

---

## 9) Was du einstellen kannst (relevant für Home)

- **Benachrichtigungen & Alarme**: Berechtigungen, Wichtigkeit, Töne, „Exakte Alarme“, Energiesparen.  
- **Zeitansagen**: Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall.  
- **Zyklen**: Wiederhol-Rhythmus, Start/Ende, Konfliktbehandlung.  
- **DWD-Infos**: Ein-/Ausblendung, Ort/Quelle (sofern konfigurierbar).  
- **Darstellung**: Hell/Dunkel/Automatisch, App-Sprache (Deutsch/Englisch).

> Die genannten Optionen findest du in **Einstellungen**. Einige Verhaltensweisen (z. B. Karten-Tap &rarr; Filter) können je nach Version variieren.

---

## 10) Tipps
- **Heute** zuerst abarbeiten: Nutze die Tabs **Überfällig** und **Offen** sowie den Fortschrittsbalken als Taktgeber.  
- **Zyklen** sparen Klicks: Wiederkehrendes einmal definieren, dann täglich per **Zyklus ausführen** aktualisieren.  
- **DWD-Tab** im Blick behalten, wenn du wetter- oder pollenabhängige Aufgaben hast.
'@
  Write-File $p $c
}
