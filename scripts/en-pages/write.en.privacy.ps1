function Write-En-Privacy {
  $p = Join-Path $DocsEn 'privacy.md'
  $c = @'
# Privacy

This page briefly and clearly describes how **ToDay** handles data.

---

## 1) Principles

- **No accounts. No cloud. No ads. No tracking.**  
- Tasks and settings are stored **only locally** on your device.  
- Spoken input for dictation is processed **ephemerally** and **not stored**.

---

## 2) Controller

| Field | Value |
|-------|-------|
| **App** | ToDay (Android) |
| **Developer** | Mathias Haeuser |
| **Contact** | app-today@gmx.de |

*(No data protection officer required – no server-side personal data is processed.)*

---

## 3) What data does the app process?

| Data category | Processing |
|---------------|------------|
| **Tasks & settings** | Title, description, date/time, priority, repeats, reminders, etc. → Stored **locally** in the app database (SQLite). No transfer to third parties. |
| **Audio (microphone) for dictation** | Spoken input is used only for recognition and **discarded immediately** (not stored). |
| **Network requests (DWD)** | Weather/pollen alerts are retrieved via **HTTPS**. No personalization, no profiling. *(German version only)* |
| **Step counter** | Android STEP_COUNTER is evaluated only locally. No transfer to third parties. |
| **Notifications/alarms** | Scheduling and delivery take place **locally** via Android. |
| **Analytics/tracking/ads** | **Not used.** |

---

## 4) Permissions

| Permission | Purpose |
|------------|---------|
| **Microphone (RECORD_AUDIO)** | Only for dictation (optional, runtime permission). |
| **Notifications (POST_NOTIFICATIONS, Android 13+)** | For reminders/alerts. |
| **Exact alarms (SCHEDULE_EXACT_ALARM, if available)** | On-time triggering of reminders. |
| **Physical activity (ACTIVITY_RECOGNITION)** | For the step counter trigger (TD:steps:today). |
| **Internet (INTERNET/ACCESS_NETWORK_STATE)** | For DWD requests. *(German version only)* |

---

## 5) Storage duration & deletion

| Data category | Storage duration |
|---------------|------------------|
| **Tasks/settings** | Remain local until you delete them. |
| **Audio (dictation)** | Used only for recognition, then discarded. |

**How to delete data:**

- In the app: *Settings* → *Danger Zone* → **Delete all activities** (or maintenance functions).  
- Android: *Settings* → *Apps* → *ToDay* → *Storage & cache* → **Clear storage**.

---

## 6) Disclosure & third parties

- There is **no disclosure** of your data by us to third parties.  
- **Speech recognition:** Dictation uses the **speech service of your keyboard/device** (e.g., Google). Its processing/privacy is governed by the provider's settings/policies. We run **no own servers** for audio.  
- **DWD:** Requests are made without a user account; ZIP code/alert region are used only for regional assignment. *(German version only)*

---

## 7) Hosting of this website (GitHub Pages)

This help website is delivered via **GitHub Pages** (GitHub, Inc., 88 Colin P. Kelly Jr St, San Francisco, CA 94107, USA).

| Aspect | Details |
|--------|---------|
| **Possible server logs** | IP address, date/time, requested URL, referrer, user agent, status code. |
| **Purpose** | Operation, security, abuse/error analysis. |
| **Legal basis** | Art. 6(1)(f) GDPR (legitimate interest in secure, technically necessary delivery). |
| **Third-country transfers** | USA. GitHub relies, among other things, on Standard Contractual Clauses (SCC). |

**Notes:**

- GitHub Privacy Statement: <https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement>  
- We set **no** own cookies/trackers; therefore a **consent banner** is not required. If external services (e.g., analytics/fonts/embeds) are used in the future, **prior** consent under sec. 25 TTDSG/Art. 6(1)(a) GDPR will be obtained.

---

## 8) Legal bases (GDPR)

| Legal basis | Use case |
|-------------|----------|
| **Art. 6(1)(b)** | Contract/performance (core app functions). |
| **Art. 6(1)(a)** | Consent (microphone permission for dictation; revocable at any time in Android). |
| **Art. 6(1)(f)** | Legitimate interest (secure delivery via HTTPS, technical caches/stability). |

---

## 9) Your rights

You have, among others, the rights to **access**, **rectification**, **erasure**, **restriction**, **data portability**, and **objection** (Art. 15–21 GDPR).  
As no server-side accounts are maintained, you can delete your data directly **on the device** (see above). For requests, contact us by email.

---

## 10) Contact

**Email:** app-today@gmx.de

---

## 11) Changes & version

These notes may be adjusted if functions or legal requirements change.  
**Last updated:** 2025-10-23
'@
  Write-File $p $c
}
