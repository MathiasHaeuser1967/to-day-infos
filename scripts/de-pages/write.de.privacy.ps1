function Write-De-Privacy {
  $p = Join-Path $DocsDe 'privacy.md'
  $c = @'
# Datenschutz

Diese Seite beschreibt kurz und verständlich, wie **ToDay** mit Daten umgeht.

---

## 1) Grundsätze

- **Keine Konten. Keine Cloud. Keine Werbung. Kein Tracking.**  
- Aufgaben und Einstellungen werden **nur lokal** auf deinem Gerät gespeichert.  
- Spracheingaben für das Diktat werden **flüchtig** verarbeitet und **nicht gespeichert**.

---

## 2) Verantwortlicher

| Feld | Wert |
|------|------|
| **App** | ToDay (Android) |
| **Entwickler** | Mathias Haeuser |
| **Kontakt** | app-today@gmx.de |

*(Kein/e Datenschutzbeauftragte/r erforderlich – es werden keine serverseitigen personenbezogenen Daten verarbeitet.)*

---

## 3) Welche Daten verarbeitet die App?

| Datenkategorie | Verarbeitung |
|---------------|-------------|
| **Aufgaben & Einstellungen** | Titel, Beschreibung, Datum/Uhrzeit, Priorität, Wiederholungen, Erinnerungen u. a. → Speicherung **lokal** in der App-Datenbank (SQLite). Keine Übertragung an Dritte. |
| **Audio (Mikrofon) für Diktat** | Gesprochene Eingaben werden nur zur Erkennung verwendet und **sofort verworfen** (keine Speicherung). |
| **Netzwerkabrufe (DWD)** | Wetter-/Pollenwarnungen werden per **HTTPS** abgerufen. Keine Personalisierung, keine Profilbildung. |
| **Schrittzähler** | Android STEP_COUNTER wird nur lokal ausgewertet. Keine Übertragung an Dritte. |
| **Benachrichtigungen/Alarme** | Planung und Zustellung erfolgen **lokal** über Android. |
| **Analytics/Tracking/Ads** | **Nicht verwendet.** |

---

## 4) Berechtigungen

| Berechtigung | Zweck |
|-------------|-------|
| **Mikrofon (RECORD_AUDIO)** | Nur für Diktat (optional, Laufzeitberechtigung). |
| **Benachrichtigungen (POST_NOTIFICATIONS, Android 13+)** | Für Erinnerungen/Warnungen. |
| **Exakte Alarme (SCHEDULE_EXACT_ALARM, falls verfügbar)** | Pünktliche Auslösung von Erinnerungen. |
| **Körperliche Aktivität (ACTIVITY_RECOGNITION)** | Für den Schrittzähler-Trigger (TD:steps:today). |
| **Internet (INTERNET/ACCESS_NETWORK_STATE)** | Für DWD-Abrufe. |

---

## 5) Speicherdauer & Löschung

| Datenkategorie | Speicherdauer |
|---------------|--------------|
| **Aufgaben/Einstellungen** | Bleiben lokal, bis du sie löschst. |
| **Audio (Diktat)** | Wird nur zur Erkennung genutzt und anschließend verworfen. |

**So löschst du Daten:**

- In der App: *Einstellungen* → *Gefährlicher Bereich* → **Alle Aktivitäten löschen** (bzw. Wartungsfunktionen).  
- Android: *Einstellungen* → *Apps* → *ToDay* → *Speicher & Cache* → **Speicher löschen**.

---

## 6) Weitergabe & Drittanbieter

- Es findet **keine Weitergabe** deiner Daten durch uns an Dritte statt.  
- **Spracherkennung:** Das Diktat nutzt den **Sprachdienst deiner Tastatur/deines Geräts** (z. B. Google). Dessen Verarbeitung/Datenschutz richten sich nach den Einstellungen/Policies des jeweiligen Anbieters. Wir betreiben **keine eigenen Server** für Audio.  
- **DWD:** Abrufe erfolgen ohne Nutzerkonto; PLZ/Warnregion dienen nur zur regionalen Zuordnung.

---

## 7) Hosting dieser Website (GitHub Pages)

Diese Hilfe-Website wird über **GitHub Pages** (GitHub, Inc., 88 Colin P. Kelly Jr St, San Francisco, CA 94107, USA) ausgeliefert.

| Aspekt | Details |
|--------|---------|
| **Mögliche Server-Logs** | IP-Adresse, Datum/Uhrzeit, angeforderte URL, Referrer, User-Agent, Statuscode. |
| **Zweck** | Betrieb, Sicherheit, Missbrauchs-/Fehleranalyse. |
| **Rechtsgrundlage** | Art. 6 Abs. 1 lit. f DSGVO (berechtigtes Interesse an sicherer, technisch notwendiger Auslieferung). |
| **Übermittlung in Drittländer** | USA. GitHub stützt sich u. a. auf Standardvertragsklauseln (SCC). |

**Hinweise:**

- GitHub Privacy Statement: <https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement>  
- Wir setzen **keine** eigenen Cookies/Tracker; ein **Einwilligungsbanner** ist daher nicht erforderlich. Sollten künftig externe Dienste (z. B. Analytics/Fonts/Embeds) eingesetzt werden, erfolgt **vorher** eine Einwilligung nach § 25 TTDSG/Art. 6 Abs. 1 lit. a DSGVO.

---

## 8) Rechtsgrundlagen (DSGVO)

| Rechtsgrundlage | Anwendungsfall |
|----------------|---------------|
| **Art. 6 Abs. 1 lit. b** | Vertrag/Leistungserfüllung (Kernfunktionen der App). |
| **Art. 6 Abs. 1 lit. a** | Einwilligung (Mikrofonberechtigung für Diktat, jederzeit widerrufbar in Android). |
| **Art. 6 Abs. 1 lit. f** | Berechtigtes Interesse (sichere Bereitstellung via HTTPS, technische Caches/Stabilität). |

---

## 9) Deine Rechte

Du hast u. a. **Auskunft**, **Berichtigung**, **Löschung**, **Einschränkung**, **Datenübertragbarkeit** und **Widerspruch** (Art. 15–21 DSGVO).  
Da keine serverseitigen Konten geführt werden, kannst du deine Daten direkt **auf dem Gerät** löschen (siehe oben). Für Anliegen kontaktiere uns per E-Mail.

---

## 10) Kontakt

**E-Mail:** app-today@gmx.de

---

## 11) Änderungen & Stand

Diese Hinweise können angepasst werden, wenn sich Funktionen oder rechtliche Vorgaben ändern.  
**Stand:** 2025-10-23
'@
  Write-File $p $c
}
