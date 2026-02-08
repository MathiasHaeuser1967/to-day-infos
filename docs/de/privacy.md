# Datenschutz

Diese Seite beschreibt kurz und verstÃ¤ndlich, wie **ToDay** mit Daten umgeht.

---

## 1) GrundsÃ¤tze

- **Keine Konten. Keine Cloud. Keine Werbung. Kein Tracking.**  
- Aufgaben und Einstellungen werden **nur lokal** auf deinem GerÃ¤t gespeichert.  
- Spracheingaben fÃ¼r das Diktat werden **flÃ¼chtig** verarbeitet und **nicht gespeichert**.

---

## 2) Verantwortlicher

| Feld | Wert |
|------|------|
| **App** | ToDay (Android) |
| **Entwickler** | Mathias Haeuser |
| **Kontakt** | app-today@gmx.de |

*(Kein/e Datenschutzbeauftragte/r erforderlich â€“ es werden keine serverseitigen personenbezogenen Daten verarbeitet.)*

---

## 3) Welche Daten verarbeitet die App?

| Datenkategorie | Verarbeitung |
|---------------|-------------|
| **Aufgaben & Einstellungen** | Titel, Beschreibung, Datum/Uhrzeit, PrioritÃ¤t, Wiederholungen, Erinnerungen u. a. â†’ Speicherung **lokal** in der App-Datenbank (SQLite). Keine Ãœbertragung an Dritte. |
| **Audio (Mikrofon) fÃ¼r Diktat** | Gesprochene Eingaben werden nur zur Erkennung verwendet und **sofort verworfen** (keine Speicherung). |
| **Netzwerkabrufe (DWD)** | Wetter-/Pollenwarnungen werden per **HTTPS** abgerufen. Keine Personalisierung, keine Profilbildung. |
| **SchrittzÃ¤hler** | Android STEP_COUNTER wird nur lokal ausgewertet. Keine Ãœbertragung an Dritte. |
| **Benachrichtigungen/Alarme** | Planung und Zustellung erfolgen **lokal** Ã¼ber Android. |
| **Analytics/Tracking/Ads** | **Nicht verwendet.** |

---

## 4) Berechtigungen

| Berechtigung | Zweck |
|-------------|-------|
| **Mikrofon (RECORD_AUDIO)** | Nur fÃ¼r Diktat (optional, Laufzeitberechtigung). |
| **Benachrichtigungen (POST_NOTIFICATIONS, Android 13+)** | FÃ¼r Erinnerungen/Warnungen. |
| **Exakte Alarme (SCHEDULE_EXACT_ALARM, falls verfÃ¼gbar)** | PÃ¼nktliche AuslÃ¶sung von Erinnerungen. |
| **KÃ¶rperliche AktivitÃ¤t (ACTIVITY_RECOGNITION)** | FÃ¼r den SchrittzÃ¤hler-Trigger (TD:steps:today). |
| **Internet (INTERNET/ACCESS_NETWORK_STATE)** | FÃ¼r DWD-Abrufe. |

---

## 5) Speicherdauer & LÃ¶schung

| Datenkategorie | Speicherdauer |
|---------------|--------------|
| **Aufgaben/Einstellungen** | Bleiben lokal, bis du sie lÃ¶schst. |
| **Audio (Diktat)** | Wird nur zur Erkennung genutzt und anschlieÃŸend verworfen. |

**So lÃ¶schst du Daten:**

- In der App: *Einstellungen* â†’ *GefÃ¤hrlicher Bereich* â†’ **Alle AktivitÃ¤ten lÃ¶schen** (bzw. Wartungsfunktionen).  
- Android: *Einstellungen* â†’ *Apps* â†’ *ToDay* â†’ *Speicher & Cache* â†’ **Speicher lÃ¶schen**.

---

## 6) Weitergabe & Drittanbieter

- Es findet **keine Weitergabe** deiner Daten durch uns an Dritte statt.  
- **Spracherkennung:** Das Diktat nutzt den **Sprachdienst deiner Tastatur/deines GerÃ¤ts** (z. B. Google). Dessen Verarbeitung/Datenschutz richten sich nach den Einstellungen/Policies des jeweiligen Anbieters. Wir betreiben **keine eigenen Server** fÃ¼r Audio.  
- **DWD:** Abrufe erfolgen ohne Nutzerkonto; PLZ/Warnregion dienen nur zur regionalen Zuordnung.

---

## 7) Hosting dieser Website (GitHub Pages)

Diese Hilfe-Website wird Ã¼ber **GitHub Pages** (GitHub, Inc., 88 Colin P. Kelly Jr St, San Francisco, CA 94107, USA) ausgeliefert.

| Aspekt | Details |
|--------|---------|
| **MÃ¶gliche Server-Logs** | IP-Adresse, Datum/Uhrzeit, angeforderte URL, Referrer, User-Agent, Statuscode. |
| **Zweck** | Betrieb, Sicherheit, Missbrauchs-/Fehleranalyse. |
| **Rechtsgrundlage** | Art. 6 Abs. 1 lit. f DSGVO (berechtigtes Interesse an sicherer, technisch notwendiger Auslieferung). |
| **Ãœbermittlung in DrittlÃ¤nder** | USA. GitHub stÃ¼tzt sich u. a. auf Standardvertragsklauseln (SCC). |

**Hinweise:**

- GitHub Privacy Statement: <https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement>  
- Wir setzen **keine** eigenen Cookies/Tracker; ein **Einwilligungsbanner** ist daher nicht erforderlich. Sollten kÃ¼nftig externe Dienste (z. B. Analytics/Fonts/Embeds) eingesetzt werden, erfolgt **vorher** eine Einwilligung nach Â§ 25 TTDSG/Art. 6 Abs. 1 lit. a DSGVO.

---

## 8) Rechtsgrundlagen (DSGVO)

| Rechtsgrundlage | Anwendungsfall |
|----------------|---------------|
| **Art. 6 Abs. 1 lit. b** | Vertrag/LeistungserfÃ¼llung (Kernfunktionen der App). |
| **Art. 6 Abs. 1 lit. a** | Einwilligung (Mikrofonberechtigung fÃ¼r Diktat, jederzeit widerrufbar in Android). |
| **Art. 6 Abs. 1 lit. f** | Berechtigtes Interesse (sichere Bereitstellung via HTTPS, technische Caches/StabilitÃ¤t). |

---

## 9) Deine Rechte

Du hast u. a. **Auskunft**, **Berichtigung**, **LÃ¶schung**, **EinschrÃ¤nkung**, **DatenÃ¼bertragbarkeit** und **Widerspruch** (Art. 15â€“21 DSGVO).  
Da keine serverseitigen Konten gefÃ¼hrt werden, kannst du deine Daten direkt **auf dem GerÃ¤t** lÃ¶schen (siehe oben). FÃ¼r Anliegen kontaktiere uns per E-Mail.

---

## 10) Kontakt

**E-Mail:** app-today@gmx.de

---

## 11) Ã„nderungen & Stand

Diese Hinweise kÃ¶nnen angepasst werden, wenn sich Funktionen oder rechtliche Vorgaben Ã¤ndern.  
**Stand:** 2025-10-23