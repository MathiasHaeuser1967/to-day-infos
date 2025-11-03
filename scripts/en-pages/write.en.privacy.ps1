function Write-En-Privacy {
  $p = Join-Path $DocsEn 'privacy.md'
  $c = @'
# Privacy

*Short version: ToDay works locally on your device. There is no user tracking, no ads, and no server-side processing of personal data.*

---

## 1) Who is responsible?
The app is provided by the developer named in the [Imprint](impressum.md).

## 2) Where is data processed?
Exclusively **on your device**. There is **no** account, no cloud backend. (Weather/pollen alerts are queried from DWD via HTTPS; see below.)

## 3) What data does the app process?
- **Tasks & settings**  
  Title, description, date/time, priority, repeats, reminders etc. → Stored **locally** in the app database (SQLite). Not shared with third parties.
- **Audio (microphone) for dictation**  
  Spoken input is used solely for speech recognition and **discarded immediately** (not stored).
- **Network requests (DWD)**  
  Weather/pollen alerts are fetched via **HTTPS**. No personalization, no profiling.
- **Notifications/alarms**  
  Planned and delivered **locally** by Android.
- **Analytics/tracking/ads**  
  **Not used.**

## 4) Which permissions are used and why?
- **Notifications** – to show reminders/alarms.
- **Exact alarms** (if available) – for on-time alarms.
- **Microphone** – only when you actively use voice input via the keyboard mic.
- **Network** – to fetch weather/pollen alerts (DWD) via HTTPS.

## 5) Data sharing
No personal data is transmitted to the developer or third parties.

## 6) Contact
See [Imprint](impressum.md) for the operator’s contact details.

## 7) Changes to this notice
This notice may be updated with app releases. The current version is bundled with the app/site.
'@
  Write-File $p $c
}