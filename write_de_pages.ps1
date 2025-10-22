# write_de_pages.ps1 – ASCII + HTML-Entities, UTF-8 (mit BOM), absoluter Pfad (robust)
$ErrorActionPreference = 'Stop'

# Skriptverzeichnis (robust, auch in Windows PowerShell)
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
  $Content | Out-File -LiteralPath $Path -Encoding utf8  # UTF-8 mit BOM – für PS am zuverlässigsten
}

# 1) Clean
if (Test-Path $DocsDe) { Remove-Item $DocsDe -Recurse -Force }
Ensure-Dir $DocsDe
Ensure-Dir $Screens

# 2) Dateien schreiben (ASCII + HTML-Entities)

# index.md
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

# quickstart.md
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

# features.md
Write-File (Join-Path $DocsDe 'features.md') @'
# Funktionen

- **Home-&Uuml;bersicht:** Tagesansicht mit offenen/erledigten Aktivit&auml;ten, Kennzahlen und Fortschritt.
- **Zeitansagen:** Sprachhinweise (Text-to-Speech) zu definierten Zeiten oder Intervallen.
- **Aufr&auml;umen:** Aktivit&auml;ten eines Tages l&ouml;schen &ndash; Quelle w&auml;hlbar, inkl. Stornierung der zugeh&ouml;rigen Benachrichtigungen/Alarme.
- **Zyklen planen:** Wiederkehrende Aktivit&auml;ten automatisch erzeugen (z. B. t&auml;glich, w&ouml;chentlich).
- **Sprach-Makros:** H&auml;ufige Aktionen per Sprachbefehl ausl&ouml;sen.
'@

# screens/home.md
Write-File (Join-Path $Screens 'home.md') @'
# Home

Die Startseite zeigt deine Aktivit&auml;ten des gew&auml;hlten Tages mit Fortschritt und Kennzahlen.

## Datum & Navigation
- **Gestern / Heute / Morgen:** Schnelltasten, um einen Tag zur&uuml;ck bzw. vor zu springen.
- **Datumszeile:** zeigt das aktuell gew&auml;hlte Datum in Langform. Die Auswahl beeinflusst u. a. das **Aufr&auml;umen**.

## Kennzahlen
- **Gesamt:** Anzahl aller Aktivit&auml;ten des Tages (offen + erledigt).  
- **Erledigt:** wie viele bereits abgeschlossen sind.  
- **Hohe Priorit&auml;t:** Anzahl der als wichtig markierten Aktivit&auml;ten.

## Liste der Aktivit&auml;ten
- **&Ouml;ffnen:** Aktivit&auml;t antippen.  
- **Als erledigt markieren:** H&auml;kchen/Checkbox tippen.  
- **Kontextaktionen:** (falls verf&uuml;gbar) lang tippen.

## Aufr&auml;umen &ouml;ffnen
&Uuml;ber das Men&uuml; oder Icon **Aufr&auml;umen** den Bereinigungs-Dialog f&uuml;r das aktuell gew&auml;hlte Datum &ouml;ffnen.
'@

# screens/settings.md
Write-File (Join-Path $Screens 'settings.md') @'
# Einstellungen

Hier passt du Benachrichtigungen, Zeitansagen, Zyklen und allgemeines Verhalten an. Bezeichnungen k&ouml;nnen je nach Android-Version und Ger&auml;t leicht abweichen.

## Benachrichtigungen

### Berechtigung
- **Benachrichtigungen erlauben**: Systemberechtigung, ohne die **keine** Erinnerungen erscheinen. Bei erster Nutzung best&auml;tigen.

### Kan&auml;le & Wichtigkeit
- **Kanal/Wichtigkeit** (falls verf&uuml;gbar): steuert Sichtbarkeit, Ton, Vibration.
  - *Stumm/Normal/Hoch/Dringend*: je h&ouml;her, desto auff&auml;lliger (Heads-Up, Ton).
  - **Tipp:** F&uuml;r kritische Erinnerungen "hoch" oder "dringend" w&auml;hlen.

### Exakte Alarme
- **Exakte Alarme erlauben** (falls verf&uuml;gbar): erm&ouml;glicht die p&uuml;nktliche Ausl&ouml;sung zum geplanten Zeitpunkt.
  - Ohne diese Erlaubnis kann Android Erinnerungen zusammenlegen oder verz&ouml;gern.

### Akku-Optimierung
- **Vom Energiesparen ausnehmen** (Systemeinstellung): verhindert, dass ToDay im Hintergrund "schlafen" gelegt wird und Benachrichtigungen zu sp&auml;t kommen.

### Benachrichtigungst&ouml;ne (wenn angeboten)
- **Ton/Vibration**: akustisches bzw. haptisches Feedback je Erinnerung.
- **Nicht st&ouml;ren**: beachtet die Systemregel; ggf. werden T&ouml;ne unterdr&uuml;ckt.

## Zeitansagen (Text-to-Speech)

### Aktivieren/Deaktivieren
- Schaltet alle **Zeitansagen** global **ein/aus**.

### Stimme & Sprache
- Auswahl der **Sprache** und **Stimme** deiner TTS-Engine (z. B. Google TTS).
- **Lautst&auml;rke**: verwendet die **Medien-Lautst&auml;rke** des Ger&auml;ts.

### Zeitfenster & Rhythmus
- **Zeitfenster**: Zeitraum, in dem Ansagen erlaubt sind (z. B. 08:00&ndash;20:00).
- **Intervall**: H&auml;ufigkeit der Ansagen (z. B. st&uuml;ndlich, alle 30 Minuten).

### Verhalten bei "Nicht st&ouml;ren"
- Je nach Systemmodus werden Ansagen/Benachrichtigungen ggf. unterdr&uuml;ckt.

## Zyklen planen

### Wiederholungen
- **T&auml;glich/W&ouml;chentlich/Benutzerdefiniert**: Intervall, in dem neue Aktivit&auml;ten automatisch erzeugt werden.

### Start/Ende
- Aktiver Zeitraum des Zyklus. Au&szlig;erhalb werden keine neuen Eintr&auml;ge erzeugt.

### Kollisionen & Dubletten
- Beim Erzeugen wird auf vorhandene Eintr&auml;ge gepr&uuml;ft, um Dubletten zu vermeiden.

## Allgemein

### Design
- **Hell/Dunkel/System**: Erscheinungsbild der App.

### Sprache
- **Deutsch/Englisch**: App-Sprache unabh&auml;ngig von der Ger&auml;tesprache.

### Datenpflege
- Verkn&uuml;pfungen zu **Aufr&auml;umen** und weiteren Wartungs-Funktionen.
'@

# screens/cleanup.md
Write-File (Join-Path $Screens 'cleanup.md') @'
# Aufr&auml;umen

Mit **Aufr&auml;umen** entfernst du Aktivit&auml;ten eines Tages &ndash; optional inklusive der zugeh&ouml;rigen **Benachrichtigungen/Alarme**. Die Wirkung gilt immer f&uuml;r das **gew&auml;hlte Datum**.

## Datum w&auml;hlen
- **Gestern / Heute / Morgen**: Schnellauswahl.
- **Datumsanzeige**: zeigt das Ziel-Datum, auf das sich die Bereinigung bezieht.

## W&auml;hle, was gel&ouml;scht werden soll (Quelle)
Du w&auml;hlst **genau eine Quelle**. Nur Eintr&auml;ge, die an diesem Tag **aus dieser Quelle** stammen, werden gel&ouml;scht:

- **Zyklus planen** &ndash; automatisch aus wiederkehrenden Zyklen erzeugte Aktivit&auml;ten.  
- **Zeitansagen** &ndash; Aktivit&auml;ten, die durch Zeitansagen entstanden sind.  
- **User** &ndash; manuell erstellte Aktivit&auml;ten.

!!! info "Sicherheit"
    Andere Quellen bleiben unangetastet. Du ver&auml;nderst nicht versehentlich Inhalte au&szlig;erhalb der gew&auml;hlten Quelle.

## Optionen

### Nur offene Aktivit&auml;ten
- **Ein**: l&ouml;scht **nur** Eintr&auml;ge, die **nicht** als *Erledigt* markiert sind.  
- **Aus**: l&ouml;scht **alle** passenden Eintr&auml;ge &ndash; offen **und** erledigt.

### Benachrichtigungen/Alarme stornieren
- **Ein**: ToDay entfernt zus&auml;tzlich **alle** zu den gel&ouml;schten Aktivit&auml;ten geh&ouml;renden Benachrichtigungen &ndash; sowohl **geplante** als auch bereits **angezeigte**.
- **Aus**: Es werden nur Aktivit&auml;ten gel&ouml;scht; vorhandene Benachrichtigungen bleiben zun&auml;chst sichtbar.

!!! tip
    Aktivieren, wenn du "liegengebliebene" Erinnerungen vollst&auml;ndig aufr&auml;umen m&ouml;chtest.

## L&ouml;schen ausf&uuml;hren
1. Datum und **Quelle** w&auml;hlen.  
2. **Optionen** pr&uuml;fen/setzen.  
3. **L&ouml;schen** tippen &rarr; der Dialog schlie&szlig;t, und du kehrst zu **Home** zur&uuml;ck.

## H&auml;ufige Fragen

**Nach dem L&ouml;schen sehe ich noch Benachrichtigungen.**  
&rarr; Stelle sicher, dass **Benachrichtigungen/Alarme stornieren** aktiv war.

**Ich will nur manuell erstellte Eintr&auml;ge l&ouml;schen.**  
&rarr; W&auml;hle die Quelle **User**.
'@

# screens/voice-macros.md
Write-File (Join-Path $Screens 'voice-macros.md') @'
# Sprach-Makros

Mit Sprach-Makros l&ouml;st du h&auml;ufige Aktionen per Sprache aus.

## Neues Makro anlegen
1. **Neu** ausw&auml;hlen und einen pr&auml;gnanten Namen vergeben.  
2. **Aktion** w&auml;hlen (z. B. Aktivit&auml;t starten/stoppen).  
3. Speichern.

## Nutzen
- Sprich den konfigurierten Befehl &ndash; die zugeordnete Aktion wird ausgef&uuml;hrt.

## Tipps
- Verwende **eindeutige, kurze** Befehle.  
- Pr&uuml;fe, ob **TTS** und **Spracherkennung** auf dem Ger&auml;t korrekt eingerichtet sind.
'@

# faq.md
Write-File (Join-Path $DocsDe 'faq.md') @'
# H&auml;ufige Fragen (FAQ)

## Benachrichtigungen kommen nicht an
- In **Einstellungen &rarr; Benachrichtigungen** die Berechtigung erteilen.  
- **Akku-Optimierung** f&uuml;r ToDay deaktivieren.  
- **Nicht st&ouml;ren** pr&uuml;fen.

## Ich h&ouml;re keine Zeitansagen
- **Zeitansagen aktivieren** und Medien-Lautst&auml;rke erh&ouml;hen.  
- TTS-Engine/Stimmpaket korrekt installiert?

## Nach dem Aufr&auml;umen bleiben Erinnerungen sichtbar
- **Benachrichtigungen/Alarme stornieren** aktivieren und erneut ausf&uuml;hren.

## App-Sprache passt nicht
- In **Einstellungen &rarr; Sprache** wechseln (Deutsch/Englisch).
'@

# permissions.md
Write-File (Join-Path $DocsDe 'permissions.md') @'
# Berechtigungen

ToDay ben&ouml;tigt je nach Funktion folgende System-Berechtigungen:

- **Benachrichtigungen** &ndash; zum Anzeigen von Erinnerungen/Alarmen.  
- **Exakte Alarme** *(falls vom System angeboten)* &ndash; p&uuml;nktliche Ausl&ouml;sung zu festem Zeitpunkt.  
- **Mikrofon** *(nur f&uuml;r Sprach-Makros)* &ndash; Erkennung deiner Sprachbefehle.

ToDay verwendet **keine Standort-Daten** und synchronisiert **nicht** in die Cloud.
'@

# privacy.md
Write-File (Join-Path $DocsDe 'privacy.md') @'
# Datenschutz

- Alle Daten werden **lokal** auf deinem Ger&auml;t verarbeitet.  
- Es findet **keine Cloud-Synchronisation** statt.  
- Die vollst&auml;ndige Datenschutzerkl&auml;rung findest du auf der Play-Store-Seite.

Bei Fragen wende dich an den Support in der App.
'@

# changelog.md
Write-File (Join-Path $DocsDe 'changelog.md') @'
# Changelog

- **1.0.0** &ndash; Erste Ver&ouml;ffentlichung der deutschen Hilfe.
'@

Write-Host "DE-Seiten neu erzeugt unter $DocsDe (HTML-Entities, UTF-8)." -ForegroundColor Green
