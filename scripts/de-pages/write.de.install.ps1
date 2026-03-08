function Write-De-Install {
  $p = Join-Path $DocsDe 'install.md'
  $c = @'
# Installation ueber Google Play (Closed Beta)

ToDay befindet sich aktuell in der **Closed-Beta-Phase** im Google Play Store. Das bedeutet, dass die App noch nicht oeffentlich verfuegbar ist – du kannst sie aber als eingeladener Tester direkt ueber den Play Store installieren.

---

## Voraussetzungen

| Voraussetzung | Details |
|---------------|---------|
| **Android-Geraet** | Smartphone oder Tablet mit Android 8.0 oder hoeher. |
| **Google-Account** | Du benoetigst ein Google-Konto, das mit deinem Geraet verknuepft ist. |
| **Google Play Store** | Der Play Store muss auf deinem Geraet installiert und mit deinem Google-Account angemeldet sein. |

---

## So wirst du Beta-Tester

<div class="td-install-steps" markdown>

<div class="td-install-step" markdown>

#### E-Mail senden

Schreibe eine E-Mail an **app-today@gmx.de** und teile uns die **E-Mail-Adresse deines Google-Accounts** mit. Wichtig: Es muss dieselbe Adresse sein, mit der du im Play Store angemeldet bist.

</div>

<div class="td-install-step" markdown>

#### Freischaltung abwarten

Wir fuegen deine E-Mail-Adresse in der Google Play Console zur Testerliste hinzu. Du erhaeltst anschliessend eine **Einladungs-E-Mail von Google Play**.

</div>

<div class="td-install-step" markdown>

#### Einladung annehmen

Oeffne den Link in der Einladungs-E-Mail und akzeptiere die Teilnahme am Beta-Test. Du wirst auf eine Google Play-Seite weitergeleitet.

</div>

<div class="td-install-step" markdown>

#### App installieren

Nach der Annahme erscheint die App in deinem Play Store. Tippe auf **Installieren** – fertig! Kuenftige Updates erhaeltst du automatisch ueber den Play Store.

</div>

</div>

---

## Haeufige Fragen zur Installation

**Ich habe die Einladungs-E-Mail nicht erhalten.**
Pruefe deinen Spam-Ordner. Die E-Mail kommt von Google, nicht von uns. Falls nach 24 Stunden nichts angekommen ist, schreibe uns erneut.

**Kann ich die App auf mehreren Geraeten installieren?**
Ja, solange du auf allen Geraeten mit demselben Google-Account angemeldet bist.

**Wie erhalte ich Updates?**
Updates werden automatisch ueber den Google Play Store verteilt, genau wie bei jeder anderen App.

**Was kostet die App?**
ToDay ist eine kostenpflichtige App. Als Beta-Tester erhaeltst du die App waehrend der Testphase kostenlos.

---

<div class="td-download" markdown>

## Jetzt Beta-Tester werden

<a href="mailto:app-today@gmx.de?subject=Beta-Tester%20ToDay&body=Hallo%2C%0A%0Aich%20m%C3%B6chte%20gerne%20Beta-Tester%20f%C3%BCr%20die%20ToDay-App%20werden.%0A%0AMeine%20Google-Account-E-Mail%3A%20%5Bhier%20einf%C3%BCgen%5D%0A%0AViele%20Gr%C3%BC%C3%9Fe" class="td-btn td-btn--primary" style="font-size:1.1rem;">
  <span class="material-icons">mail</span> E-Mail an app-today@gmx.de senden
</a>

</div>
'@
  Write-File $p $c
}
