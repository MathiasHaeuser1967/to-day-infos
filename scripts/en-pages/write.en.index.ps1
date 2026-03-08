function Write-En-Index {
  $p = Join-Path $DocsEn 'index.md'
  $c = @'
---
template: home.html
---

<div class="td-hero" markdown>
<div class="td-hero__content" markdown>

<span class="td-hero__badge">Android App</span>

# <span>ToDay</span> – Your Intelligent Daily Hub

<p class="td-hero__subtitle">
Tasks, time announcements, weather warnings, pollen forecasts and voice control –
all in a single, locally operating app. No cloud. No account.
</p>

<div class="td-hero__actions">
  <a href="mailto:app-today@gmx.de?subject=Beta%20Tester%20ToDay&body=Hello%2C%0A%0AI%20would%20like%20to%20become%20a%20beta%20tester%20for%20the%20ToDay%20app.%0A%0AMy%20Google%20Account%20email%3A%20%5Binsert%20here%5D%0A%0ABest%20regards" class="td-btn td-btn--primary">
    <span class="material-icons">mail</span> Become a Beta Tester – app-today@gmx.de
  </a>
  <a href="/to-day-infos/en/quickstart/" class="td-btn td-btn--secondary">
    <span class="material-icons">rocket_launch</span> Quick Start
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
<span class="td-highlight__label">Local</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">6+</span>
<span class="td-highlight__label">Features</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">1x</span>
<span class="td-highlight__label">Paid</span>
</div>
<div class="td-highlight" markdown>
<span class="td-highlight__number">0</span>
<span class="td-highlight__label">Ads</span>
</div>
</div>

<div class="td-section-header" markdown>

## Why ToDay?

Everything you need for your day – in one app.

</div>

<div class="td-features" markdown>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">dashboard</span></span>

### All-in-One

Tasks, cycles, time announcements, weather, pollen and voice control – no app hopping needed.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">shield</span></span>

### Privacy First

100 % local data storage in SQLite. No cloud requirement, no account, no registration.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">record_voice_over</span></span>

### Voice Controlled

TTS output, voice input and voice macros for completely hands-free operation.
</div>

<div class="td-feature-card" markdown>
<span class="td-feature-card__icon"><span class="material-icons">center_focus_strong</span></span>

### Focus & Productivity

Pomodoro, ultradian rhythms and other scientific cycles for productive work.
</div>

</div>

<div class="td-section-header" markdown>

## Screenshots

Experience ToDay in action – Dark Mode, Light Mode and more.

</div>

<div class="td-gallery" markdown>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/home-header.png" alt="Daily overview with header" loading="lazy">
<figcaption>Daily Overview</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/home-speeddial.png" alt="Speed Dial menu" loading="lazy">
<figcaption>Speed Dial</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/settings-dwd.png" alt="DWD weather warnings" loading="lazy">
<figcaption>Weather Warnings</figcaption>
</figure>

<figure markdown>
<img src="/to-day-infos/assets/img/screenshots/settings-pollen-tts.png" alt="Pollen and TTS" loading="lazy">
<figcaption>Pollen & TTS</figcaption>
</figure>

</div>

<div class="td-download" markdown>

## Become a Beta Tester!

ToDay is currently in the **Closed Beta phase** on the Google Play Store.
Want to test the app before everyone else? Get in touch with us!

**How it works:** Send us your **Google Account email address** –
we will add you as a tester and you will receive a personal
download link directly in the Play Store.

<a href="mailto:app-today@gmx.de?subject=Beta%20Tester%20ToDay&body=Hello%2C%0A%0AI%20would%20like%20to%20become%20a%20beta%20tester%20for%20the%20ToDay%20app.%0A%0AMy%20Google%20Account%20email%3A%20%5Binsert%20here%5D%0A%0ABest%20regards" class="td-btn td-btn--primary" style="font-size:1.1rem;">
  <span class="material-icons">mail</span> Become a Beta Tester – app-today@gmx.de
</a>

<p style="margin-top:1rem;font-size:.85rem;color:#8899aa;">
  <a href="/to-day-infos/en/install/" style="color:#ff8c42;">Installation Guide</a>
</p>

</div>
'@
  Write-File $p $c
}
