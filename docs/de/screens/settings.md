# Einstellungen

Die Optionen sind in Karten gegliedert. Viele Karten haben einen eigenen **Speichern**-Button – Änderungen gelten erst nach dem Speichern **dieser** Karte.

---

## 1) Sprache

| Option | Beschreibung |
|--------|-------------|
| **Sprache** | Wechselt die App-Sprache (Deutsch / English). |

**Hinweis:** Der Umschalter in der Online-Hilfe ändert nur die Doku, nicht die App-Sprache.

---

## 2) Design

| Option | Beschreibung |
|--------|-------------|
| **Wie System** | Folgt dem Systemthema (Hell/Dunkel). |
| **Hell** | Erzwingt helles Thema. |
| **Dunkel** | Erzwingt dunkles Thema. |
| **Dynamische Farben (Android 12+)** | Übernimmt Akzentfarben vom System/Wallpaper (Material You). |

### 2.1 Akzentfarbe (bei deaktivierten dynamischen Farben)

Wenn **Dynamische Farben** ausgeschaltet sind, erscheint ein **Farbkreis-Grid** mit 12 Material-3-Farbschemata. Jedes Schema wird als tippbarer Farbkreis dargestellt; der aktive Kreis ist mit einem weißen Häkchen und einem Leuchtschatten markiert.

| Schema | Vorschaufarbe |
|--------|--------------|
| Orange M3 | 🟠 (Standard) |
| Amber | 🟡 |
| Deep Orange M3 | 🔴 (dunkel) |
| Red M3 | 🔴 |
| Pink M3 | 🩷 |
| Purple M3 | 🟣 |
| Indigo M3 | 🔵 (dunkel) |
| Blue M3 | 🔵 |
| Cyan M3 | 🩵 |
| Teal M3 | 🟢 (blaugrün) |
| Green M3 | 🟢 |
| Espresso | 🟤 |

Die Farbschemata werden von **FlexColorScheme** bereitgestellt und berechnen automatisch alle Surface-Container-Farben (AppBar, Cards, Dialoge usw.).

**Migration:** Beim ersten Start nach dem Update wird die alte Orange/Violet-Auswahl automatisch auf das entsprechende FlexScheme migriert.

### 2.2 Farbmischung (Surface Blend Level)

Unterhalb des Farbkreis-Grids befindet sich ein **Slider** (0–40), der steuert, wie stark die gewählte Akzentfarbe in die Hintergrundflächen einfließt:

| Wert | Wirkung |
|------|---------|
| **0** | Neutrale, graue Oberflächen – kein Farbeinfluss. |
| **10** | Leichte Tönung – dezenter Farbhauch. |
| **20** | Mittlere Tönung – deutlich erkennbar. |
| **30–40** | Starke Tönung – Oberflächen nehmen die Akzentfarbe deutlich auf. |

Der aktuelle Wert wird rechts neben der Beschriftung als Zahl angezeigt. Änderungen wirken sofort auf die gesamte App.

---

## 3) Anzeige & Text

Die Sektion **Anzeige & Text** ermöglicht die individuelle Anpassung von Schriftart und Schriftgröße. Alle Änderungen werden **sofort** auf die gesamte App angewendet und persistent gespeichert.

### 3.1 Schriftart

| Option | Beschreibung |
|--------|-------------|
| **System** (Standard) | Verwendet die Standard-Schriftart des Betriebssystems. |
| **Inter** | Moderne, gut lesbare Sans-Serif-Schrift – optimiert für Bildschirme. |
| **Roboto Slab** | Serifenschrift mit klarem Charakter – für Nutzer, die eine traditionellere Typografie bevorzugen. |
| **OpenDyslexic** | Speziell für Legasthenie entwickelte Schrift mit gewichteten Buchstabenformen – ein starkes Inklusions-Feature. |

Jede Option wird im Dropdown **in ihrer eigenen Schriftart** dargestellt, sodass du den Unterschied sofort erkennst.

### 3.2 Schriftgröße

Ein **Slider** mit sieben Stufen steuert die globale Textgröße:

| Stufe | Skalierung | Beschreibung |
|-------|-----------|-------------|
| 1 | 80 % | Sehr klein – maximaler Platz für Inhalte. |
| 2 | 90 % | Klein. |
| 3 | 95 % | Etwas kleiner als Standard. |
| 4 | **100 %** | **Standard** – entspricht der System-Vorgabe. |
| 5 | 110 % | Etwas größer. |
| 6 | 125 % | Groß – gut für eingeschränkte Sehkraft. |
| 7 | 150 % | Sehr groß – maximale Lesbarkeit. |

Links und rechts des Sliders zeigen ein kleines und ein großes **Aa** die Richtung an.

### 3.3 Live-Vorschau

Unterhalb der Einstellungen wird eine **Beispiel-Aktivitätskarte** angezeigt, die sich in Echtzeit ändert. So siehst du sofort, wie sich Schriftart und Schriftgröße auf deine Aufgabenliste auswirken, bevor du die Einstellungsseite verlässt.

---

## 4) Benachrichtigungen – Allgemein (DWD)

Gilt für **Wetterwarnungen** und **Pollenflug**.

| Option | Beschreibung |
|--------|-------------|
| **Land** | Ländercode (z. B. DE). |
| **PLZ** | Postleitzahl des Ortes für DWD-Daten. |
| **Warnregion** (optional) | Freier Text; hilfreich bei kreisweiten Warnungen. |
| **Warnungen aktiv** | Globaler Schalter für DWD-Benachrichtigungen. |
| **Ruhe ab / Ruhe bis (Stunde)** | Zeitfenster, in dem **keine** DWD-Benachrichtigungen zugestellt werden. |
| **Speichern** | Übernimmt die Werte dieser Karte. |

---

## 5) Wetterwarnungen (DWD)

Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen – Allgemein*.

| Option | Beschreibung |
|--------|-------------|
| **Gefahrentypen** | Einzeln aktivierbar: Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel. |
| **Speichern** | Merkt die Auswahl. |
| **Sofort prüfen** | Führt sofort eine DWD-Abfrage aus und aktualisiert Status/Benachrichtigung. |

---

## 6) Pollenflug (DWD)

Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen – Allgemein*.

| Option | Beschreibung |
|--------|-------------|
| **Benachrichtigen ab Intensität** | Schwellenwert, ab dem für aktivierte Pollenarten benachrichtigt wird (z. B. „mittel"). |
| **Pollenarten** | Einzeln aktivierbar: Gräser, Birke, Erle, Hasel, Esche, Beifuß, Ambrosia, Roggen. |
| **Speichern** | Übernimmt Schwelle/Arten. |
| **Sofort prüfen** | Holt sofort Pollenwerte und löst ggf. Benachrichtigungen aus. |

---

## 7) Stimme & Ausgabe (TTS)

Steuert Text-to-Speech für gesprochene Ausgaben/Zeitansagen. Android im Fokus; Desktop/Web ohne Funktion.

| Option | Beschreibung |
|--------|-------------|
| **Stimme & Ausgabe verwenden** | TTS global ein/aus. |
| **Aktuelle Engine** | Anzeige der vom System verwendeten Engine (z. B. `com.google.android.tts`). Die Auswahl erfolgt systemseitig, nicht in der App. |
| **Sprache (Locale)** | Auswahl im Format `ll-CC` (z. B. `de-DE`, `en-US`). Wird exakt so gespeichert. |
| **Stimme** | Exakter Anzeigename der Engine (**Liste ist nach gewählter Sprache gefiltert**). |
| **Sprechtempo** | Regler 0,20–1,00 (Standard 1,00). |
| **Tonhöhe** | Regler 0,50–1,50 (Standard 1,00). |
| **Lautstärke** | Regler 0,00–1,00 (Standard 1,00). |
| **Vorschau (Sofort anhören)** | Spielt eine Probe mit den aktuell gespeicherten Werten ohne App-Neustart. |

**Hinweis:** Nach vollständig beendetem und neu gestartetem App-Prozess werden genau die gespeicherten Stimme/Tempo/Tonhöhe/Lautstärke verwendet. Ist die gewählte Stimme nicht mehr verfügbar, erfolgt ein Fallback innerhalb der Sprache (exakte Locale → Sprachpräfix → erste verfügbare Stimme).

---

## 8) Zeitansagen

Erzeugt Zeitpunkte zwischen Start- und Endzeit und benachrichtigt im gewählten Takt.

| Option | Beschreibung |
|--------|-------------|
| **Zeitansagen aktivieren** | Hauptschalter. |
| **Startzeit (einschließlich)** | Beginn des Ansagefensters. |
| **Endzeit (einschließlich)** | Ende des Ansagefensters. |
| **Taktung** | Alle 10 / 15 / 20 / 30 Minuten oder stündlich. |
| **Erzeugen** | Plant die Ansagen für das gewählte Fenster/Takt (Ruhezeiten aus *Allgemein* werden respektiert). |

### 8.1 Morsecode

| Option | Beschreibung |
|--------|-------------|
| **Morse verwenden** | Schalter, um Zeitansagen als Morsecode statt Sprache auszugeben. |
| **Geschwindigkeit (WPM)** | Regler 10–100 WPM. Standard 18 WPM. Bereich deckt Anfänger bis HST-Wettbewerbe ab. |
| **Farnsworth** | Regler 10–14. Steuert die Zeichenabstände bei niedrigen Geschwindigkeiten. |
| **Frequenz** | Regler 600–700 Hz. Tonhöhe des Morsesignals. |
| **Lautstärke** | Regler 0,30–1,00. |
| **Hüllkurve (Attack/Release)** | Regler 5–8 ms. Weichheit der Tonanfänge/-enden. |
| **Boost** | Schalter für verstärktes Signal. |
| **Morse testen** | Spielt einen Beispieltext mit den aktuellen Einstellungen ab. |

---

## 9) Überfällig-Erinnerung

Wiederkehrende Sprachansage bei überfälligen Aktivitäten mit eskalierender Dringlichkeit. Gesprochen wird nur, wenn **TTS aktiviert** ist (*Stimme & Ausgabe*).

| Option | Beschreibung |
|--------|-------------|
| **Überfällig-Ansage aktivieren** | Hauptschalter. Standard: **Aus**. |
| **Wiederholungsintervall** | Wie oft erinnert wird: alle 5 / 10 / **15** / 30 / 60 Minuten. Standard: **15 Min**. |
| **Maximale Wiederholungen** | Wie oft maximal erinnert wird: Unbegrenzt / 3 / **5** / 10. Standard: **5**. |

### 9.1 Eskalationsstufen

Die Ansage wird mit der Zeit dringlicher:

| Überfällig seit | Stufe | Ansage (Deutsch) | Ansage (Englisch) |
|----------------|-------|-----------------|-------------------|
| 0–15 Minuten | Freundlich | „{Titel} ist jetzt überfällig." | „{Title} is now overdue." |
| 15–30 Minuten | Bestimmt | „Erinnerung: {Titel} wartet noch auf Dich." | „Reminder: {Title} is still waiting for you." |
| > 30 Minuten | Nachdrücklich | „{Titel} ist seit {Min} Minuten überfällig. Bitte erledigen!" | „{Title} has been overdue for {Min} minutes. Please take care of it!" |
| Mehrere überfällig | Zusammenfassung | „Du hast {n} überfällige Aktivitäten. Bitte abhaken oder verschieben." | „You have {n} overdue activities. Please check them off or reschedule." |

Die Erinnerung stoppt automatisch, wenn die Aktivität **abgehakt, verschoben oder gelöscht** wird, oder wenn die maximale Wiederholungsanzahl erreicht ist.

---

## 10) Hintergrund-Animation

Steuert eine Lottie-Animation im Hintergrund des Tabs **„Offen"**.

| Option | Beschreibung |
|--------|-------------|
| **Standard-Animation** | Voreinstellung für alle Monate, die keinen eigenen Eintrag haben. Standard ist `Cat playing animation.json`. |
| **Monatsweise Zuweisung** | Für **Januar–Dezember** kann jeweils eine Datei gewählt werden. Auswahl aus allen Dateien unter `assets/lottie`. |
| **Kein Bild** | Option, um für einen Monat bewusst **keine** Animation anzuzeigen. |
| **Vererben** | Lässt die Monatsauswahl leer → es gilt die **Standard-Animation**. |
| **Vorschau** | Auswahl eines Monats zeigt die Animation darunter zentriert. |
| **Speichern** | Übernimmt die Zuordnungen. |

**Ablage (Shared Preferences):**

| Schlüssel | Typ | Beispiel |
|-----------|-----|---------|
| `lottie.default` | String | `assets/lottie/Cat playing animation.json` |
| `lottie.month.01` … `lottie.month.12` | String | Voller Pfad oder `"<none>"` für „Kein Bild"; fehlender Key = Vererbung vom Standard. |

---

## 11) Gamification: Gesprochene Sätze

Zufällige, kurze Lob-Sätze beim Wechsel einer Aktivität von **Überfällig** → **Erledigt**. Gesprochen wird nur, wenn **TTS aktiviert** ist (*Stimme & Ausgabe*).

| Option | Beschreibung |
|--------|-------------|
| **Bis zu 5 Sätze** | Eingabefelder für kurze Motivations-Sätze. Leere Felder werden ignoriert. |
| **Sprache** | Die Eingaben gelten **pro App-Sprache**. |
| **Vorschau** | Spielt einen zufällig ausgewählten Satz direkt ab. |
| **Speichern** | Übernimmt die Eingaben. |

Bei leerer Liste nutzt die App die Vorschläge aus der Übersetzung:

| Sprache | Beispielsätze |
|---------|--------------|
| Deutsch | „Du räumst auf wie ein Boss." · „Starker Move – weiter so." · „Deadline gezähmt. Nice." · „Ein Punkt weniger auf der Liste." · „Das rollt! Noch eine?" |
| Englisch | „You're cleaning up like a boss." · „Strong move—keep going." · „Deadline tamed. Nice." · „One less on the list." · „You're on a roll! One more?" |

**Ablage (Shared Preferences):**

| Schlüssel | Typ | Beschreibung |
|-----------|-----|-------------|
| `tts.enabled` | Bool | Nur wenn `true` wird gesprochen. |
| `tts.gamify.sentences.de` / `.en` | JSON-Liste | Sätze für die jeweilige Sprache. |

---

## 12) Gefährlicher Bereich (Datenverwaltung)

| Option | Beschreibung |
|--------|-------------|
| **Debug-Infos unter Aktivitäten** | Zeigt zusätzliche Diagnose-Infos in den Listen (nur für Fehlersuche). |
| **Benachrichtigungen neu aufbauen** | Plant Benachrichtigungen für einen kurzen Zeitraum neu (nützlich nach System-Updates/Rechtewechsel). |
| **Alle Aktivitäten löschen** | Entfernt **alle** Aktivitäten unwiderruflich (kein Rückgängig). |

---

## 13) Hinweise & Tipps

- **Berechtigungen:** Stelle sicher, dass **Benachrichtigungen** (und ggf. **Exakte Alarme**) erlaubt sind und Akku-Optimierung die App nicht drosselt – sonst kommen Erinnerungen verspätet.  
- **DWD offline:** Ohne Internet werden DWD-Daten erst bei Verbindung aktualisiert.  
- **Mehrere Speichern-Buttons:** Jede Karte speichert **ihren** Bereich separat.  
- **Anzeige & Text:** Änderungen an Schriftart und Schriftgröße wirken sich sofort auf die gesamte App aus – nutze die Live-Vorschau, um die optimale Einstellung zu finden.
- **Akzentfarbe & Farbmischung:** Die Farbauswahl und der Blend-Level wirken sofort – kein Speichern-Button nötig. Bei aktivierten dynamischen Farben sind diese Optionen ausgeblendet.
- **Überfällig-Erinnerung:** Die Ansage erfolgt nur, wenn TTS aktiviert ist. Die Erinnerung prüft alle 60 Sekunden auf überfällige Aktivitäten und spricht im konfigurierten Intervall.