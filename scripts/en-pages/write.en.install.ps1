function Write-En-Install {
  $p = Join-Path $DocsEn 'install.md'
  $c = @'
# Installation via Google Play (Closed Beta)

ToDay is currently in the **Closed Beta phase** on the Google Play Store. This means the app is not yet publicly available – but you can install it directly from the Play Store as an invited tester.

---

## Requirements

| Requirement | Details |
|-------------|---------|
| **Android device** | Smartphone or tablet with Android 8.0 or higher. |
| **Google Account** | You need a Google account linked to your device. |
| **Google Play Store** | The Play Store must be installed on your device and signed in with your Google Account. |

---

## How to Become a Beta Tester

<div class="td-install-steps" markdown>

<div class="td-install-step" markdown>

#### Send an Email

Write an email to **app-today@gmx.de** and share the **email address of your Google Account**. Important: It must be the same address you use to sign in to the Play Store.

</div>

<div class="td-install-step" markdown>

#### Wait for Activation

We will add your email address to the tester list in the Google Play Console. You will then receive an **invitation email from Google Play**.

</div>

<div class="td-install-step" markdown>

#### Accept the Invitation

Open the link in the invitation email and accept participation in the beta test. You will be redirected to a Google Play page.

</div>

<div class="td-install-step" markdown>

#### Install the App

After accepting, the app will appear in your Play Store. Tap **Install** – done! Future updates will be delivered automatically via the Play Store.

</div>

</div>

---

## Installation FAQ

**I did not receive the invitation email.**
Check your spam folder. The email comes from Google, not from us. If nothing arrives after 24 hours, contact us again.

**Can I install the app on multiple devices?**
Yes, as long as you are signed in with the same Google Account on all devices.

**How do I receive updates?**
Updates are distributed automatically via the Google Play Store, just like any other app.

**What does the app cost?**
ToDay is a paid app. As a beta tester, you receive the app for free during the testing phase.

---

<div class="td-download" markdown>

## Become a Beta Tester Now

<a href="mailto:app-today@gmx.de?subject=Beta%20Tester%20ToDay&body=Hello%2C%0A%0AI%20would%20like%20to%20become%20a%20beta%20tester%20for%20the%20ToDay%20app.%0A%0AMy%20Google%20Account%20email%3A%20%5Binsert%20here%5D%0A%0ABest%20regards" class="td-btn td-btn--primary" style="font-size:1.1rem;">
  <span class="material-icons">mail</span> Send email to app-today@gmx.de
</a>

</div>
'@
  Write-File $p $c
}
