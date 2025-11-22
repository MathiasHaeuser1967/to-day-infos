function Write-De-Index {
  $p = Join-Path $DocsDe 'index.md'
  $c = @'
# Start

Willkommen zur **ToDay** Hilfe (Deutsch). Hier findest du praxisnahe Anleitungen, Erklärungen zu allen Schaltern und Lösungen für häufige Probleme.

---

## App‑Übersicht: Dialoge & Menüs

Die folgende Übersicht zeigt die wichtigsten **Screens**, **Dialoge/Sheets** und **Menüpunkte** der App – sowie **wer wen aufruft**.

#### ASCII‑Fallback (Call‑Graph)

```
Home:
  - ＋ Neu / Bearbeiten -> (Aktivität‑Dialog)
  - ⋮ Menü > Aufräumen  -> (Aufräumen‑Sheet)
  - ⋮ Menü > Zyklus     -> (Zyklus‑Planer‑Sheet)
  - Voice‑Button        -> (Spracherfassung‑Sheet)
  - Mikrofon            -> (Diktat‑Sheet)
  - Datenschutz‑Hinweis -> (Datenschutzhinweis)

Menü (vom Home):
  - Einstellungen -> [Einstellungen]
  - Info          -> [Info]
  - Sprach‑Makros -> [Sprach‑Makros]

Einstellungen:
  - Abschnitt -> [Zeitansagen]
  - Abschnitt -> [Wetter & Pollen]
  - Abschnitt -> [Sprache]
  - Abschnitt -> [TTS]
  - Gefahrzone -> (Benachrichtigungen neu aufbauen)

Sprach‑Makros:
  - Eintrag anklicken         -> (Makro bearbeiten – Dialog)
  - Langes Tippen / Kontext   -> (Makro bearbeiten – Sheet)
```

### Menüstruktur (Auszug)

**App‑Menü (vom Home‑Screen):**
- **Einstellungen** – App‑Konfiguration (Sprache, Zeitansagen, Wetter/Pollen, TTS, Gefahrzone)
- **Info** – System‑ & App‑Informationen (kopierbar für Support)
- **Sprach‑Makros** – Verwalten von Sprachkürzeln (Erstellen, Bearbeiten, Löschen)

**Einstellungen – Abschnitte:**
- **Zeitansagen** – Intervall, Zeitfenster, Test
- **Wetter & Pollen** – Warnungen aktivieren, Quellen
- **Sprache** – Deutsch/Englisch
- **TTS** – Stimme, Sprechtempo, Vorlese‑Optionen
- **Gefahrzone** – *Benachrichtigungen neu aufbauen* (Re‑Schedule bei Systemänderungen)

'@
  Write-File $p $c
}