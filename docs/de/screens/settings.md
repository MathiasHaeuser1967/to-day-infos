# Einstellungen

Die Optionen sind in Karten gegliedert. Viele Karten haben einen eigenen **Speichern**-Button â€“ Ã„nderungen gelten erst nach dem Speichern **dieser** Karte.

---

## 1) Sprache

| Option | Beschreibung |
|--------|-------------|
| **Sprache** | Wechselt die App-Sprache (Deutsch / English). |

**Hinweis:** Der Umschalter in der Online-Hilfe Ã¤ndert nur die Doku, nicht die App-Sprache.

---

## 2) Design

| Option | Beschreibung |
|--------|-------------|
| **Wie System** | Folgt dem Systemthema (Hell/Dunkel). |
| **Hell** | Erzwingt helles Thema. |
| **Dunkel** | Erzwingt dunkles Thema. |
| **Dynamische Farben (Android 12+)** | Ãœbernimmt Akzentfarben vom System/Wallpaper (Material You). |

---

## 3) Anzeige & Text

Die Sektion **Anzeige & Text** ermÃ¶glicht die individuelle Anpassung von Schriftart und SchriftgrÃ¶ÃŸe. Alle Ã„nderungen werden **sofort** auf die gesamte App angewendet und persistent gespeichert.

### 3.1 Schriftart

| Option | Beschreibung |
|--------|-------------|
| **System** (Standard) | Verwendet die Standard-Schriftart des Betriebssystems. |
| **Inter** | Moderne, gut lesbare Sans-Serif-Schrift â€“ optimiert fÃ¼r Bildschirme. |
| **Roboto Slab** | Serifenschrift mit klarem Charakter â€“ fÃ¼r Nutzer, die eine traditionellere Typografie bevorzugen. |
| **OpenDyslexic** | Speziell fÃ¼r Legasthenie entwickelte Schrift mit gewichteten Buchstabenformen â€“ ein starkes Inklusions-Feature. |

Jede Option wird im Dropdown **in ihrer eigenen Schriftart** dargestellt, sodass du den Unterschied sofort erkennst.

### 3.2 SchriftgrÃ¶ÃŸe

Ein **Slider** mit sieben Stufen steuert die globale TextgrÃ¶ÃŸe:

| Stufe | Skalierung | Beschreibung |
|-------|-----------|-------------|
| 1 | 80 % | Sehr klein â€“ maximaler Platz fÃ¼r Inhalte. |
| 2 | 90 % | Klein. |
| 3 | 95 % | Etwas kleiner als Standard. |
| 4 | **100 %** | **Standard** â€“ entspricht der System-Vorgabe. |
| 5 | 110 % | Etwas grÃ¶ÃŸer. |
| 6 | 125 % | GroÃŸ â€“ gut fÃ¼r eingeschrÃ¤nkte Sehkraft. |
| 7 | 150 % | Sehr groÃŸ â€“ maximale Lesbarkeit. |

Links und rechts des Sliders zeigen ein kleines und ein groÃŸes **Aa** die Richtung an.

### 3.3 Live-Vorschau

Unterhalb der Einstellungen wird eine **Beispiel-AktivitÃ¤tskarte** angezeigt, die sich in Echtzeit Ã¤ndert. So siehst du sofort, wie sich Schriftart und SchriftgrÃ¶ÃŸe auf deine Aufgabenliste auswirken, bevor du die Einstellungsseite verlÃ¤sst.

---

## 4) Benachrichtigungen â€“ Allgemein (DWD)

Gilt fÃ¼r **Wetterwarnungen** und **Pollenflug**.

| Option | Beschreibung |
|--------|-------------|
| **Land** | LÃ¤ndercode (z. B. DE). |
| **PLZ** | Postleitzahl des Ortes fÃ¼r DWD-Daten. |
| **Warnregion** (optional) | Freier Text; hilfreich bei kreisweiten Warnungen. |
| **Warnungen aktiv** | Globaler Schalter fÃ¼r DWD-Benachrichtigungen. |
| **Ruhe ab / Ruhe bis (Stunde)** | Zeitfenster, in dem **keine** DWD-Benachrichtigungen zugestellt werden. |
| **Speichern** | Ãœbernimmt die Werte dieser Karte. |

---

## 5) Wetterwarnungen (DWD)

Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen â€“ Allgemein*.

| Option | Beschreibung |
|--------|-------------|
| **Gefahrentypen** | Einzeln aktivierbar: Hagel, Gewitter, Sturm, Regen, Schnee, Wind, Frost, Nebel. |
| **Speichern** | Merkt die Auswahl. |
| **Sofort prÃ¼fen** | FÃ¼hrt sofort eine DWD-Abfrage aus und aktualisiert Status/Benachrichtigung. |

---

## 6) Pollenflug (DWD)

Nutzt **PLZ** und **Ruhezeiten** aus *Benachrichtigungen â€“ Allgemein*.

| Option | Beschreibung |
|--------|-------------|
| **Benachrichtigen ab IntensitÃ¤t** | Schwellenwert, ab dem fÃ¼r aktivierte Pollenarten benachrichtigt wird (z. B. â€žmittel"). |
| **Pollenarten** | Einzeln aktivierbar: GrÃ¤ser, Birke, Erle, Hasel, Esche, BeifuÃŸ, Ambrosia, Roggen. |
| **Speichern** | Ãœbernimmt Schwelle/Arten. |
| **Sofort prÃ¼fen** | Holt sofort Pollenwerte und lÃ¶st ggf. Benachrichtigungen aus. |

---

## 7) Stimme & Ausgabe (TTS)

Steuert Text-to-Speech fÃ¼r gesprochene Ausgaben/Zeitansagen. Android im Fokus; Desktop/Web ohne Funktion.

| Option | Beschreibung |
|--------|-------------|
| **Stimme & Ausgabe verwenden** | TTS global ein/aus. |
| **Aktuelle Engine** | Anzeige der vom System verwendeten Engine (z. B. `com.google.android.tts`). Die Auswahl erfolgt systemseitig, nicht in der App. |
| **Sprache (Locale)** | Auswahl im Format `ll-CC` (z. B. `de-DE`, `en-US`). Wird exakt so gespeichert. |
| **Stimme** | Exakter Anzeigename der Engine (**Liste ist nach gewÃ¤hlter Sprache gefiltert**). |
| **Sprechtempo** | Regler 0,20â€“1,00 (Standard 1,00). |
| **TonhÃ¶he** | Regler 0,50â€“1,50 (Standard 1,00). |
| **LautstÃ¤rke** | Regler 0,00â€“1,00 (Standard 1,00). |
| **Vorschau (Sofort anhÃ¶ren)** | Spielt eine Probe mit den aktuell gespeicherten Werten ohne App-Neustart. |

**Hinweis:** Nach vollstÃ¤ndig beendetem und neu gestartetem App-Prozess werden genau die gespeicherten Stimme/Tempo/TonhÃ¶he/LautstÃ¤rke verwendet. Ist die gewÃ¤hlte Stimme nicht mehr verfÃ¼gbar, erfolgt ein Fallback innerhalb der Sprache (exakte Locale â†’ SprachprÃ¤fix â†’ erste verfÃ¼gbare Stimme).

---

## 8) Zeitansagen

Erzeugt Zeitpunkte zwischen Start- und Endzeit und benachrichtigt im gewÃ¤hlten Takt.

| Option | Beschreibung |
|--------|-------------|
| **Zeitansagen aktivieren** | Hauptschalter. |
| **Startzeit (einschlieÃŸlich)** | Beginn des Ansagefensters. |
| **Endzeit (einschlieÃŸlich)** | Ende des Ansagefensters. |
| **Taktung** | Alle 10 / 15 / 20 / 30 Minuten oder stÃ¼ndlich. |
| **Erzeugen** | Plant die Ansagen fÃ¼r das gewÃ¤hlte Fenster/Takt (Ruhezeiten aus *Allgemein* werden respektiert). |

---

## 9) Hintergrund-Animation

Steuert eine Lottie-Animation im Hintergrund des Tabs **â€žOffen"**.

| Option | Beschreibung |
|--------|-------------|
| **Standard-Animation** | Voreinstellung fÃ¼r alle Monate, die keinen eigenen Eintrag haben. Standard ist `Cat playing animation.json`. |
| **Monatsweise Zuweisung** | FÃ¼r **Januarâ€“Dezember** kann jeweils eine Datei gewÃ¤hlt werden. Auswahl aus allen Dateien unter `assets/lottie`. |
| **Kein Bild** | Option, um fÃ¼r einen Monat bewusst **keine** Animation anzuzeigen. |
| **Vererben** | LÃ¤sst die Monatsauswahl leer â†’ es gilt die **Standard-Animation**. |
| **Vorschau** | Auswahl eines Monats zeigt die Animation darunter zentriert. |
| **Speichern** | Ãœbernimmt die Zuordnungen. |

**Ablage (Shared Preferences):**

| SchlÃ¼ssel | Typ | Beispiel |
|-----------|-----|---------|
| `lottie.default` | String | `assets/lottie/Cat playing animation.json` |
| `lottie.month.01` â€¦ `lottie.month.12` | String | Voller Pfad oder `"<none>"` fÃ¼r â€žKein Bild"; fehlender Key = Vererbung vom Standard. |

---

## 10) Gamification: Gesprochene SÃ¤tze

ZufÃ¤llige, kurze Lob-SÃ¤tze beim Wechsel einer AktivitÃ¤t von **ÃœberfÃ¤llig** â†’ **Erledigt**. Gesprochen wird nur, wenn **TTS aktiviert** ist (*Stimme & Ausgabe*).

| Option | Beschreibung |
|--------|-------------|
| **Bis zu 5 SÃ¤tze** | Eingabefelder fÃ¼r kurze Motivations-SÃ¤tze. Leere Felder werden ignoriert. |
| **Sprache** | Die Eingaben gelten **pro App-Sprache**. |
| **Vorschau** | Spielt einen zufÃ¤llig ausgewÃ¤hlten Satz direkt ab. |
| **Speichern** | Ãœbernimmt die Eingaben. |

Bei leerer Liste nutzt die App die VorschlÃ¤ge aus der Ãœbersetzung:

| Sprache | BeispielsÃ¤tze |
|---------|--------------|
| Deutsch | â€žDu rÃ¤umst auf wie ein Boss." Â· â€žStarker Move â€“ weiter so." Â· â€žDeadline gezÃ¤hmt. Nice." Â· â€žEin Punkt weniger auf der Liste." Â· â€žDas rollt! Noch eine?" |
| Englisch | â€žYou're cleaning up like a boss." Â· â€žStrong moveâ€”keep going." Â· â€žDeadline tamed. Nice." Â· â€žOne less on the list." Â· â€žYou're on a roll! One more?" |

**Ablage (Shared Preferences):**

| SchlÃ¼ssel | Typ | Beschreibung |
|-----------|-----|-------------|
| `tts.enabled` | Bool | Nur wenn `true` wird gesprochen. |
| `tts.gamify.sentences.de` / `.en` | JSON-Liste | SÃ¤tze fÃ¼r die jeweilige Sprache. |

---

## 11) GefÃ¤hrlicher Bereich (Datenverwaltung)

| Option | Beschreibung |
|--------|-------------|
| **Debug-Infos unter AktivitÃ¤ten** | Zeigt zusÃ¤tzliche Diagnose-Infos in den Listen (nur fÃ¼r Fehlersuche). |
| **Benachrichtigungen neu aufbauen** | Plant Benachrichtigungen fÃ¼r einen kurzen Zeitraum neu (nÃ¼tzlich nach System-Updates/Rechtewechsel). |
| **Alle AktivitÃ¤ten lÃ¶schen** | Entfernt **alle** AktivitÃ¤ten unwiderruflich (kein RÃ¼ckgÃ¤ngig). |

---

## 12) Hinweise & Tipps

- **Berechtigungen:** Stelle sicher, dass **Benachrichtigungen** (und ggf. **Exakte Alarme**) erlaubt sind und Akku-Optimierung die App nicht drosselt â€“ sonst kommen Erinnerungen verspÃ¤tet.  
- **DWD offline:** Ohne Internet werden DWD-Daten erst bei Verbindung aktualisiert.  
- **Mehrere Speichern-Buttons:** Jede Karte speichert **ihren** Bereich separat.  
- **Anzeige & Text:** Ã„nderungen an Schriftart und SchriftgrÃ¶ÃŸe wirken sich sofort auf die gesamte App aus â€“ nutze die Live-Vorschau, um die optimale Einstellung zu finden.