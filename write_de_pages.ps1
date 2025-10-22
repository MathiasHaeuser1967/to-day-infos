$ErrorActionPreference = 'Stop'

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$DocsDe    = Join-Path $ScriptDir 'docs\de'
$Screens   = Join-Path $DocsDe 'screens'

function Ensure-Dir([string]$Path) {
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -Type Directory -Force -Path $Path | Out-Null
  }
}
function Write-File([string]$Path, [string]$Content) {
  $dir = Split-Path -Parent $Path
  if ($dir) { Ensure-Dir $dir }
  $Content | Out-File -LiteralPath $Path -Encoding utf8
}

if (Test-Path $DocsDe) { Remove-Item $DocsDe -Recurse -Force }
Ensure-Dir $DocsDe
Ensure-Dir $Screens

Write-File (Join-Path $DocsDe 'index.md') @'
# Start

Willkommen zur **ToDay** Hilfe (Deutsch). Hier findest du praxisnahe Anleitungen, Erkl&auml;rungen zu allen Schaltern und L&ouml;sungen f&uuml;r h&auml;ufige Probleme.

- **Schnellstart:** [Schnellstart](quickstart.md)
- **Hauptfunktionen:** [Funktionen](features.md)
- **Screens:** [Home](screens/home.md) - [Einstellungen](screens/settings.md) - [Aufr&auml;umen](screens/cleanup.md) - [Sprach-Makros](screens/voice-macros.md)
- **FAQ:** [H&auml;ufige Fragen](faq.md)
- **Berechtigungen & Datenschutz:** [Berechtigungen](permissions.md) - [Datenschutz](privacy.md)

!!! tip "Hilfe direkt aus der App"
    &rarr; &Uuml;ber das Fragezeichen-Icon springst du direkt an die passende Stelle dieser Online-Hilfe.
'@

Write-File (Join-Path $DocsDe 'quickstart.md') @'
# Schnellstart

So bist du in wenigen Minuten betriebsbereit.

## 1) Erste Einrichtung
1. **App starten** &rarr; du landest auf **Home**.
2. **Benachrichtigungen erlauben** (Android-Abfrage best&auml;tigen), damit Erinnerungen zugestellt werden k&ouml;nnen.
3. Optional: In **Einstellungen &rarr; Zeitansagen** die Sprachansagen aktivieren (Text-to-Speech).

## 2) Erste Aktivit&auml;t anlegen
1. Auf **+ Neu** tippen.
2. **Titel** vergeben (kurz & eindeutig).
3. **Datum/Uhrzeit** w&auml;hlen.
4. Optional **Wiederholen** aktivieren, wenn die Aktivit&auml;t regelm&auml;&szlig;ig anf&auml;llt.
5. **Speichern** &rarr; die Aktivit&auml;t erscheint auf **Home**.

## 3) Erinnern lassen
- Je nach Konfiguration erh&auml;ltst du **Benachrichtigungen/Alarme** (Statusleiste) oder **Zeitansagen** (gesprochene Hinweise).
- Markiere Aktivit&auml;ten als **Erledigt**, wenn du fertig bist.

!!! warning "Hintergrundbetrieb & Energiesparen"
    Manche Hersteller (z. B. Xiaomi, Huawei, Samsung) beschr&auml;nken Apps im Hintergrund.  
    **L&ouml;sung:** Akku-Optimierung f&uuml;r ToDay ausschalten, Benachrichtigungen erlauben und *Exakte Alarme* (falls verf&uuml;gbar) aktivieren.
'@

Write-File (Join-Path $DocsDe 'features.md') @'
# Funktionen

- **Home-&Uuml;bersicht:** Tagesansicht mit offenen/erledigten Aktivit&auml;ten, Kennzahlen und Fortschritt.
- **Zeitansagen:** Sprachhinweise (Text-to-Speech) zu definierten Zeiten oder Intervallen.
- **Aufr&auml;umen:** Aktivit&auml;ten eines Tages l&ouml;schen &ndash; Quelle w&auml;hlbar, inkl. Stornierung der zugeh&ouml;rigen Benachrichtigungen/Alarme.
- **Zyklen planen:** Wiederkehrende Aktivit&auml;ten automatisch erzeugen (z. B. t&auml;glich, w&ouml;chentlich).
- **Sprach-Makros:** H&auml;ufige Aktionen per Sprachbefehl ausl&ouml;sen.
'@

Write-File (Join-Path $Screens 'home.md') @'
# Home

Die **Home**-Seite ist deine Tageszentrale: Datum w&auml;hlen, Fortschritt sehen, Listen filtern und neue Aktivit&auml;ten anlegen oder per Sprache steuern.

## 1) Kopfzeile
- **Titel:** *ToDay*
- **Men&uuml; (⋮):** Navigation zu **Einstellungen**, **Aufr&auml;umen**, **Hilfe** u. a.

## 2) Datumsbereich & Navigation
- **Datumschip links** (z. B. `22. Okt. 2025`): Tippen &rarr; Datumspicker f&uuml;r beliebiges Datum.
- **Langform rechts** (z. B. `Mittwoch, 22. Oktober 2025`): Lesbarkeit.
- **Pfeile** `‹` / `›`: Einen Tag zur&uuml;ck/vor.
- **Chips** **Gestern**, **Heute**, **Morgen**: Sofortiger Sprung.
- **Fortschrittsbalken**: Tagesfortschritt in % aus **Erledigt / Gesamt**.

## 3) Kennzahlen-Karten
1. **Gesamt**: Alle Aktivit&auml;ten des Tages (offen + erledigt).
2. **Erledigt**: Kreisdiagramm + `x / y` erledigt.
3. **Hohe Priorit&auml;t**: Anzahl wichtiger Eintr&auml;ge.
*Hinweis:* Ein Antippen kann die Liste vorfiltern (abh&auml;ngig von Version/Einstellungen).

## 4) Infozeile / Wetter & DWD
- **Wetterwarnungen DWD**: Statuspunkt und Kurztext.
- **Pollenflug DWD**: Statuspunkt und Kurztext.
- **Aktuelles Wetter**: z. B. `13°C, 83% rF, Sonne, wolkenlos`.
Detail-Ansicht im **Tab „DWD“**. Sichtbarkeit und Einheiten in **Einstellungen**.

## 5) Tabs (Listenfilter)
- **Offen**: Nicht erledigte Aktivit&auml;ten am gew&auml;hlten Datum.
- **&Uuml;berf&auml;llig**: Termin in der Vergangenheit und noch offen.
- **Erledigt**: Abgehakte Eintr&auml;ge des Tages.
- **DWD**: Wetterwarnungen/Pollenflug-Details.
Z&auml;hler in eckigen Klammern zeigt die Anzahl je Tab (z. B. `Offen [3]`).

## 6) Aktivit&auml;tenliste
- **&Ouml;ffnen/Bearbeiten**: Eintrag antippen.
- **Erledigen**: Checkbox tippen.
- **Langes Tippen**: Kontextaktionen (verschieben, duplizieren, l&ouml;schen; je nach Version).
- **Sortierung**: i. d. R. nach Uhrzeit; vordatiert/ohne Zeit gruppiert.

## 7) Schnelltasten unten
1. **Zyklus ausf&uuml;hren** (zwei Pfeile): Erzeugt f&uuml;r das gew&auml;hlte Datum f&auml;llige Eintr&auml;ge aus deinen **Zyklen** neu.
2. **Sprachbefehl** (Mikrofon): Startet **Sprach-Makros**/Spracheingabe.
3. **Schnellaktion** (−): Kontextabh&auml;ngige Kurzfunktion, z. B. **Aufr&auml;umen**, Snooze o.&auml;. (je nach Version).
4. **Neu** (＋): Neue Aktivit&auml;t f&uuml;r das Datum anlegen (Titel, Uhrzeit, Wiederholung, Priorit&auml;t usw.).

## 8) Typische Abl&auml;ufe
- **Tageswechsel**: Pfeile/Chips nutzen oder Datumschip tippen.
- **Tagesplan erzeugen**: **Zyklus ausf&uuml;hren** dr&uuml;cken.
- **Schnell abhaken**: In **Offen/&Uuml;berf&auml;llig** die Checkbox tippen.
- **Aufr&auml;umen**: &uuml;ber Men&uuml; oder Schnellaktion den Dialog &ouml;ffnen, Quelle w&auml;hlen (Zyklus/Zeitansagen/User), Optionen setzen und **L&ouml;schen**.

## 9) Relevante Einstellungen
- **Benachrichtigungen & Alarme**: Wichtigkeit, T&ouml;ne, „Exakte Alarme“, Energiesparen.
- **Zeitansagen**: Ein/Aus, Sprache/Stimme, Zeitfenster, Intervall.
- **Zyklen**: Rhythmus, Start/Ende, Dubletten-Vermeidung.
- **DWD-Infos**: Ein-/Ausblenden, Ort/Quelle.
- **Darstellung**: Hell/Dunkel/Auto, App-Sprache (DE/EN).

## 10) Tipps
- **Heute zuerst**: **&Uuml;berf&auml;llig** und **Offen** als Fokus; Fortschrittsbalken als Taktgeber.
- **Zyklen nutzen**: Wiederkehrendes einmal definieren, dann t&auml;glich mit **Zyklus ausf&uuml;hren** aktualisieren.
- **DWD** im Blick, wenn Aufgaben wetter- oder pollenabh&auml;ngig sind.
'@

Write-File (Join-Path $Screens 'settings.md') @'
# Einstellungen

Hier passt du Benachrichtigungen, Zeitansagen, Zyklen und allgemeines Verhalten an. Bezeichnungen k&ouml;nnen je nach Android-Version und Ger&auml;t leicht abweichen.

## Benachrichtigungen
### Berechtigung
- **Benachrichtigungen erlauben**: Ohne diese Berechtigung erscheinen keine Erinnerungen.

### Kan&auml;le & Wichtigkeit
- **Kanal/Wichtigkeit** (falls verf&uuml;gbar): steuert Sichtbarkeit, Ton, Vibration.
- **Tipp:** F&uuml;r kritische Erinnerungen "hoch"/"dringend" w&auml;hlen.

### Exakte Alarme
- **Erlauben** (falls verf&uuml;gbar): p&uuml;nktliche Ausl&ouml;sung. Ohne Erlaubnis kann Android verz&ouml;gern.

### Akku-Optimierung
- **Vom Energiesparen ausnehmen**: verhindert zu sp&auml;te/ausbleibende Erinnerungen.

## Zeitansagen (Text-to-Speech)
- **Ein/Aus**, **Sprache/Stimme**, **Zeitfenster**, **Intervall**, Beachtung von **Nicht st&ouml;ren**.

## Zyklen planen
- **T&auml;glich/W&ouml;chentlich/Benutzerdefiniert**, **Start/Ende**, Dubletten-Vermeidung.

## Allgemein
- **Design** (Hell/Dunkel/System), **Sprache** (Deutsch/Englisch), **Datenpflege** (Aufr&auml;umen).
'@

Write-File (Join-Path $Screens 'cleanup.md') @'
# Aufr&auml;umen

Mit **Aufr&auml;umen** entfernst du Aktivit&auml;ten eines Tages &ndash; optional inklusive der zugeh&ouml;rigen **Benachrichtigungen/Alarme**. Die Wirkung gilt f&uuml;r das **gew&auml;hlte Datum**.

## Datum w&auml;hlen
- **Gestern/Heute/Morgen** oder Datumsanzeige.

## Quelle (genau eine)
- **Zyklus planen**, **Zeitansagen**, **User**.

## Optionen
- **Nur offene Aktivit&auml;ten**: nur nicht erledigte l&ouml;schen.
- **Benachrichtigungen/Alarme stornieren**: geplante und angezeigte Erinnerungen der gel&ouml;schten Eintr&auml;ge entfernen.

## Ausf&uuml;hren
- Quelle und Optionen w&auml;hlen &rarr; **L&ouml;schen** tippen &rarr; Dialog schlie&szlig;t, R&uuml;ckkehr zu **Home**.
'@

Write-File (Join-Path $Screens 'voice-macros.md') @'
# Sprach-Makros

Mit Sprach-Makros l&ouml;st du h&auml;ufige Aktionen per Sprache aus.

## Neues Makro
1. **Neu** w&auml;hlen, Namen vergeben.
2. **Aktion** festlegen (z. B. Aktivit&auml;t starten/stoppen).
3. Speichern.

## Nutzung
- Befehl sprechen, Aktion wird ausgef&uuml;hrt.

## Tipps
- Kurze, eindeutige Befehle.
- TTS/Spracherkennung korrekt eingerichtet?
'@

Write-File (Join-Path $DocsDe 'faq.md') @'
# H&auml;ufige Fragen (FAQ)

## Benachrichtigungen kommen nicht an
- **Einstellungen &rarr; Benachrichtigungen** pr&uuml;fen, Akku-Optimierung f&uuml;r ToDay ausschalten, **Nicht st&ouml;ren** pr&uuml;fen.

## Ich h&ouml;re keine Zeitansagen
- **Zeitansagen aktivieren**, Medien-Lautst&auml;rke erh&ouml;hen, TTS-Engine/Stimmpaket pr&uuml;fen.

## Nach dem Aufr&auml;umen bleiben Erinnerungen sichtbar
- **Benachrichtigungen/Alarme stornieren** aktivieren und erneut ausf&uuml;hren.

## App-Sprache passt nicht
- In **Einstellungen &rarr; Sprache** wechseln (Deutsch/Englisch).
'@

Write-File (Join-Path $DocsDe 'permissions.md') @'
# Berechtigungen

- **Benachrichtigungen** &ndash; Erinnerungen anzeigen.
- **Exakte Alarme** *(falls verf&uuml;gbar)* &ndash; p&uuml;nktliche Ausl&ouml;sung.
- **Mikrofon** *(nur f&uuml;r Sprach-Makros)* &ndash; Sprachbefehle.
'@

Write-File (Join-Path $DocsDe 'privacy.md') @'
# Datenschutz

- Alle Daten **lokal** auf deinem Ger&auml;t.
- **Keine** Cloud-Synchronisation.
- Vollst&auml;ndige Datenschutzerkl&auml;rung: Play-Store-Seite der App.
'@

Write-File (Join-Path $DocsDe 'changelog.md') @'
# Changelog

- **1.0.0** &ndash; Erste Ver&ouml;ffentlichung der deutschen Hilfe.
'@

Write-Host "DE-Seiten neu erzeugt unter $DocsDe" -ForegroundColor Green
