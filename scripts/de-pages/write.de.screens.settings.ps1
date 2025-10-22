function Write-De-Screen-Settings {
  $p = Join-Path $Screens 'settings.md'
  $c = @'
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
  Write-File $p $c
}
