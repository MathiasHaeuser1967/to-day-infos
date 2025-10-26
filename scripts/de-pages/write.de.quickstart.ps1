function Write-De-Quickstart {
  $p = Join-Path $DocsDe 'quickstart.md'
  $c = @'
# Schnellstart

So bist du in wenigen Minuten betriebsbereit.

## 1) Erste Einrichtung
1. **App starten** &rarr; du landest auf **Home**.
2. **Benachrichtigungen erlauben** (siehe Dokumentation System >> Berechtigungen), damit Erinnerungen zugestellt werden k&ouml;nnen.
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
  Write-File $p $c
}
