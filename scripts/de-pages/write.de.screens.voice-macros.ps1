function Write-De-Screen-VoiceMacros {
  $p = Join-Path $Screens 'voice-macros.md'
  $c = @'
# Sprach-Makros

Mit Sprach-Makros sprichst du **kurze Trigger** (z. B. „makro eins") und die App ersetzt sie automatisch durch einen **vollen Befehlstext** (Expansion). Dieser Text wird anschließend wie bei der *Spracheingabe (Tastatur)* geparst – also in **Titel, Beschreibung, Datum, Uhrzeit** zerlegt.

---

## 1) Zweck & Prinzip

Die Verarbeitungskette lautet: **Trigger → Expansion → Parsing**.

| Schritt | Beschreibung |
|---------|-------------|
| 1. **Trigger** | Du sprichst den kurzen Trigger-Begriff. |
| 2. **Expansion** | Die App ersetzt ihn durch den hinterlegten Expansion-Text. |
| 3. **Parsing** | Der Parser liest daraus Titel/Beschreibung/Datum/Uhrzeit. |

**Beispiel:**  
Trigger: `makro 1` → Expansion: `Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`.

---

## 2) Übersicht (Liste)

| Element | Beschreibung |
|---------|-------------|
| **Suche** | Filtert nach Namen/Trigger. |
| **Filterchips** | *Alle* · *Aktiv* · *Inaktiv*. |
| **Neues Makro** | **+** (unten rechts) oder Button „Makro erstellen" im Leerlauf-State. |

### Eintrag in der Liste

| Bereich | Anzeige |
|---------|---------|
| **Name** (links) | Interner Titel mit **Statuspunkt** (grün = aktiv, grau = inaktiv). |
| **Trigger** | z. B. `makro 1`. |
| **Vorschau** | Kurze Darstellung, wie der Expansion-Text geparst würde. |
| **Schalter „Aktiv"** | Zum schnellen Ein-/Ausschalten. |
| **Menü (⋮)** | Bearbeiten/Löschen. |

---

## 3) Makro erstellen / bearbeiten

| Feld | Beschreibung |
|------|-------------|
| **Name (für dich)** | Interner Titel, frei wählbar. |
| **Trigger (gesprochen)** | Kurze, eindeutige Worte. Vermeide leicht verwechselbare Begriffe; sprich klar. |
| **Expansion (voller Befehl-Text)** | Schreibe hier den kompletten Sprachbefehl so, wie er diktiert werden soll (siehe unten). |
| **Aktiv** | Makro sofort nutzbar machen. |
| **Vorschau-Parsing** | Zeigt live, was der Parser aktuell aus der Expansion ableitet. |

### Unterstützte Schlüsselwörter in der Expansion

Reihenfolge beliebig, Felder optional:

| Schlüsselwort | Beispielwert |
|--------------|-------------|
| **Titel …** | Freitext (z. B. „Einkauf"). |
| **Beschreibung …** | Freitext (z. B. „Milch und Brot"). |
| **Datum …** | *heute*, *morgen*, *übermorgen*, *am 22.10.*, *am Mittwoch*. |
| **Uhrzeit …** | *18 Uhr*, *07:15*. |

**Beispiel-Expansion:**  
`Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`

Abschließend: **Speichern** oder **Abbrechen**.

---

## 4) Verwendung

1. Diktiere in der App (z. B. im Dialog *Spracheingabe (Tastatur)*).  
2. Sprich **genau den Trigger** → die App ersetzt ihn durch die **Expansion** und übernimmt die erkannten Felder.  
3. Danach kurz prüfen und speichern.

---

## 5) Verwalten

| Aktion | Weg |
|--------|-----|
| **Aktiv/Inaktiv** umschalten | Schalter in der Liste. |
| **Bearbeiten/Löschen** | **⋮**-Menü des Eintrags. |
| **Filtern** | *Alle*, *Aktiv* oder *Inaktiv*. |
| **Suchen** | Name/Trigger finden. |

---

## 6) Tipps

- **Eindeutige Trigger** wählen (z. B. „makro eins", „meeting vorlage") und vorher testen.  
- **Robuste Expansion** schreiben: klare Wörter, 24-Stunden-Zeit (z. B. *14:30*), unnötige Füllwörter vermeiden.  
- **Mehrere Felder** sind möglich, nicht alle sind Pflicht (z. B. nur *Titel* + *Uhrzeit*).  
- Wenn etwas nicht richtig erkannt wird: **Vorschau** prüfen und Expansion anpassen.
'@
  Write-File $p $c
}
