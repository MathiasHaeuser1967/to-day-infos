# Sprach-Makros

Mit Sprach-Makros sprichst du **kurze Trigger** (z. B. â€žmakro eins") und die App ersetzt sie automatisch durch einen **vollen Befehlstext** (Expansion). Dieser Text wird anschlieÃŸend wie bei der *Spracheingabe (Tastatur)* geparst â€“ also in **Titel, Beschreibung, Datum, Uhrzeit** zerlegt.

---

## 1) Zweck & Prinzip

Die Verarbeitungskette lautet: **Trigger â†’ Expansion â†’ Parsing**.

| Schritt | Beschreibung |
|---------|-------------|
| 1. **Trigger** | Du sprichst den kurzen Trigger-Begriff. |
| 2. **Expansion** | Die App ersetzt ihn durch den hinterlegten Expansion-Text. |
| 3. **Parsing** | Der Parser liest daraus Titel/Beschreibung/Datum/Uhrzeit. |

**Beispiel:**  
Trigger: `makro 1` â†’ Expansion: `Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`.

---

## 2) Ãœbersicht (Liste)

| Element | Beschreibung |
|---------|-------------|
| **Suche** | Filtert nach Namen/Trigger. |
| **Filterchips** | *Alle* Â· *Aktiv* Â· *Inaktiv*. |
| **Neues Makro** | **+** (unten rechts) oder Button â€žMakro erstellen" im Leerlauf-State. |

### Eintrag in der Liste

| Bereich | Anzeige |
|---------|---------|
| **Name** (links) | Interner Titel mit **Statuspunkt** (grÃ¼n = aktiv, grau = inaktiv). |
| **Trigger** | z. B. `makro 1`. |
| **Vorschau** | Kurze Darstellung, wie der Expansion-Text geparst wÃ¼rde. |
| **Schalter â€žAktiv"** | Zum schnellen Ein-/Ausschalten. |
| **MenÃ¼ (â‹®)** | Bearbeiten/LÃ¶schen. |

---

## 3) Makro erstellen / bearbeiten

| Feld | Beschreibung |
|------|-------------|
| **Name (fÃ¼r dich)** | Interner Titel, frei wÃ¤hlbar. |
| **Trigger (gesprochen)** | Kurze, eindeutige Worte. Vermeide leicht verwechselbare Begriffe; sprich klar. |
| **Expansion (voller Befehl-Text)** | Schreibe hier den kompletten Sprachbefehl so, wie er diktiert werden soll (siehe unten). |
| **Aktiv** | Makro sofort nutzbar machen. |
| **Vorschau-Parsing** | Zeigt live, was der Parser aktuell aus der Expansion ableitet. |

### UnterstÃ¼tzte SchlÃ¼sselwÃ¶rter in der Expansion

Reihenfolge beliebig, Felder optional:

| SchlÃ¼sselwort | Beispielwert |
|--------------|-------------|
| **Titel â€¦** | Freitext (z. B. â€žEinkauf"). |
| **Beschreibung â€¦** | Freitext (z. B. â€žMilch und Brot"). |
| **Datum â€¦** | *heute*, *morgen*, *Ã¼bermorgen*, *am 22.10.*, *am Mittwoch*. |
| **Uhrzeit â€¦** | *18 Uhr*, *07:15*. |

**Beispiel-Expansion:**  
`Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`

AbschlieÃŸend: **Speichern** oder **Abbrechen**.

---

## 4) Verwendung

1. Diktiere in der App (z. B. im Dialog *Spracheingabe (Tastatur)*).  
2. Sprich **genau den Trigger** â†’ die App ersetzt ihn durch die **Expansion** und Ã¼bernimmt die erkannten Felder.  
3. Danach kurz prÃ¼fen und speichern.

---

## 5) Verwalten

| Aktion | Weg |
|--------|-----|
| **Aktiv/Inaktiv** umschalten | Schalter in der Liste. |
| **Bearbeiten/LÃ¶schen** | **â‹®**-MenÃ¼ des Eintrags. |
| **Filtern** | *Alle*, *Aktiv* oder *Inaktiv*. |
| **Suchen** | Name/Trigger finden. |

---

## 6) Tipps

- **Eindeutige Trigger** wÃ¤hlen (z. B. â€žmakro eins", â€žmeeting vorlage") und vorher testen.  
- **Robuste Expansion** schreiben: klare WÃ¶rter, 24-Stunden-Zeit (z. B. *14:30*), unnÃ¶tige FÃ¼llwÃ¶rter vermeiden.  
- **Mehrere Felder** sind mÃ¶glich, nicht alle sind Pflicht (z. B. nur *Titel* + *Uhrzeit*).  
- Wenn etwas nicht richtig erkannt wird: **Vorschau** prÃ¼fen und Expansion anpassen.