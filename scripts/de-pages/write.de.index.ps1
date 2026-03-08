function Write-De-Index {
  $p = Join-Path $DocsDe 'index.md'
  $c = @'
---
template: home.html
---

<div class="td-hero" markdown>
<div class="td-hero__content" markdown>

<span class="td-hero__badge">Android App</span>

# <span>ToDay</span> – Deine intelligente Tageszentrale

<p class="td-hero__subtitle">
Aufgaben, Zeitansagen, Wetterwarnungen, Pollenflug und Sprachsteuerung –
alles in einer einzigen, lokal arbeitenden App. Ohne Cloud. Ohne Account.
</p>

<div class="td-hero__actions">
  <a href="mailto:app-today@gmx.de?subject=Beta-Tester%20ToDay&body=Hallo%2C%0A%0Aich%20m%C3%B6chte%20gerne%20Beta-Tester%20f%C3%BCr%20die%20ToDay-App%20werden.%0A%0AMeine%20Google-Account-E-Mail%3A%20%5Bhier%20einf%C3%BCgen%5D%0A%0AViele%20Gr%C3%BC%C3%9Fe" class="td-btn td-btn--primary">
    <span class="material-icons">mail</span> Beta-Tester werden
  </a>
  <a href="/to-day-infos/quickstart/" class="td-btn td-btn--secondary">
    <span class="material-icons">rocket_launch</span> Schnellstart
  </a>
</div>

<div class="td-hero__visual">
  <img src="/to-day-infos/assets/img/screenshots/home-dark.png" alt="ToDay Dark Mode" loading="lazy">
  <img src="/to-day-infos/assets/img/screenshots/home-light-en.png" alt="ToDay Light Mode" loading="lazy">
</div>

</div>
</div>

<div class="td-highlights" markdown>
<div class="td-highlight" markdown>
<span class="td-highlight__number">100 %</span>
<span class="td-highlight__label">Lokal</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">6+</span>
<span class="td-highlight__label">Features</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">1x</span>
<span class="td-highlight__label">Kostenpflichtig</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">0</span>
<span class="td-highlight__label">Werbung</span>
</div>
</div>

<div class="td-section-header" markdown>

## Warum ToDay?

Alles, was du fuer deinen Tag brauchst – in einer App.

</div>

<div class="td-features" markdown>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">dashboard</span></span>

### Alles in Einem

Aufgaben, Zyklen, Zeitansagen, Wetter, Pollen und Sprachsteuerung – kein App-Hopping noetig.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">shield</span></span>

### Privatsphaere zuerst

100 % lokale Datenhaltung in SQLite. Kein Cloud-Zwang, kein Account, keine Registrierung.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">record_voice_over</span></span>

### Sprachgesteuert

TTS-Ausgabe, Spracheingabe und Sprach-Makros fuer komplett freihaendige Bedienung.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">center_focus_strong</span></span>

### Fokus & Produktivitaet

Pomodoro, ultradiane Rhythmen und weitere wissenschaftliche Zyklen fuer produktives Arbeiten.
</div>

</div>

<div class="td-section-header" markdown>

## Screenshots

Erlebe ToDay in Aktion – Dark Mode, Light Mode und mehr.

</div>

<div class="td-gallery" markdown>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/home-header.png" alt="Tagesuebersicht mit Header" loading="lazy">
<figcaption>Tagesuebersicht</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/home-speeddial.png" alt="Speed Dial Menue" loading="lazy">
<figcaption>Speed Dial</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/settings-dwd.png" alt="DWD Wetterwarnungen" loading="lazy">
<figcaption>Wetterwarnungen</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/settings-pollen-tts.png" alt="Pollenflug und TTS" loading="lazy">
<figcaption>Pollen & TTS</figcaption>
</figure>

</div>

<div class="td-download" markdown>

## Werde Beta-Tester!

ToDay befindet sich aktuell in der **Closed-Beta-Phase** im Google Play Store.
Du moechtest die App vor allen anderen testen? Dann melde dich bei uns!

**So funktioniert es:** Sende uns deine **Google-Account-E-Mail-Adresse** –
wir schalten dich als Tester frei und du erhaeltst einen persoenlichen
Download-Link direkt im Play Store.

<a href="mailto:app-today@gmx.de?subject=Beta-Tester%20ToDay&body=Hallo%2C%0A%0Aich%20m%C3%B6chte%20gerne%20Beta-Tester%20f%C3%BCr%20die%20ToDay-App%20werden.%0A%0AMeine%20Google-Account-E-Mail%3A%20%5Bhier%20einf%C3%BCgen%5D%0A%0AViele%20Gr%C3%BC%C3%9Fe" class="td-btn td-btn--primary" style="font-size:1.1rem;">
  <span class="material-icons">mail</span> Beta-Tester werden – E-Mail senden
</a>

<p style="margin-top:1rem;font-size:.85rem;color:#8899aa;">
  <a href="/to-day-infos/install/" style="color:#ff8c42;">Zur Installationsanleitung</a>
</p>

</div>
'@
  Write-File $p $c
}
