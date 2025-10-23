# Sprach-Makros

Mit Sprach-Makros sprichst du **kurze Trigger** (z. B. „makro eins“) und die App ersetzt sie automatisch durch einen **vollen Befehlstext** (Expansion). Dieser Text wird anschließend wie bei der *Spracheingabe (Tastatur)* geparst – also in **Titel, Beschreibung, Datum, Uhrzeit** zerlegt.

---

## 1) Zweck & Prinzip
- **Trigger → Expansion → Parsing**  
  1) Du sprichst den *Trigger*.  
  2) Die App ersetzt ihn durch den hinterlegten *Expansion*-Text.  
  3) Der Parser liest daraus Titel/Beschreibung/Datum/Uhrzeit.
- Beispiel:  
  Trigger: `makro 1` → Expansion: `Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`.

---

## 2) Übersicht (Liste)
- **Suche**: filtert nach Namen/Trigger.
- **Filterchips**: *Alle* · *Aktiv* · *Inaktiv*.
- **Neues Makro**: **+** (unten rechts) oder Button „Makro erstellen“ im Leerlauf-State.
- **Eintrag** zeigt:
  - **Name** (links) und **Statuspunkt** (grün = aktiv, grau = inaktiv).
  - **Trigger** (z. B. `makro 1`).
  - **Vorschau**: kurz, wie der Expansion-Text geparst würde.
  - **Schalter „Aktiv“** zum schnellen Ein/Aus.
  - **Menü (⋮)**: bearbeiten/löschen (je nach Version).

---

## 3) Makro erstellen/bearbeiten
- **Name (für dich)**  
  Interner Titel, frei wählbar.
- **Trigger (gesprochen)**  
  Kurze, eindeutige Worte. Vermeide leicht verwechselbare Begriffe; sprich klar.
- **Expansion (voller Befehl-Text)**  
  Schreibe hier den kompletten Sprachbefehl so, wie er diktiert werden soll.  
  Unterstützte Schlüsselwörter (Reihenfolge beliebig, Felder optional):
  - **Titel …**
  - **Beschreibung …**
  - **Datum …** – z. B. *heute*, *morgen*, *übermorgen*, *am 22.10.*, *am Mittwoch*.
  - **Uhrzeit …** – z. B. *18 Uhr*, *07:15*.  
  Beispiel-Expansion:  
  `Titel Einkauf Beschreibung Milch und Brot Datum morgen Uhrzeit 18 Uhr`
- **Aktiv**: Makro sofort nutzbar machen.
- **Vorschau-Parsing**  
  Zeigt live, was der Parser aktuell aus der Expansion ableitet (**Titel/Beschreibung/Datum/Uhrzeit**).
- **Speichern** / **Abbrechen**.

---

## 4) Verwendung
- Diktiere in der App (z. B. im Dialog *Spracheingabe (Tastatur)*).  
- Sprich **genau den Trigger** → die App ersetzt ihn durch die **Expansion** und übernimmt die erkannten Felder.  
- Danach kurz prüfen und speichern.

---

## 5) Verwalten
- **Aktiv/Inaktiv** umschalten: über den Schalter in der Liste.
- **Bearbeiten/Löschen**: über das **⋮**-Menü des Eintrags.
- **Filtern**: *Alle*, *Aktiv* oder *Inaktiv*.
- **Suchen**: Name/Trigger finden.

---

## 6) Tipps
- **Eindeutige Trigger** wählen (z. B. „makro eins“, „meeting vorlage“) und vorher testen.
- **Robuste Expansion** schreiben: klare Wörter, 24-Stunden-Zeit (z. B. *14:30*), unnötige Füllwörter vermeiden.
- **Mehrere Felder** sind möglich, nicht alle sind Pflicht (z. B. nur *Titel* + *Uhrzeit*).
- Wenn etwas nicht richtig erkannt wird: **Vorschau** prüfen und Expansion anpassen.
