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
- **App:** ToDay (Android)  
- **Entwickler:** Mathias Haeuser  
- **Kontakt:** mathias.haeuser@gmx.net  
*(Kein/e Datenschutzbeauftragte/r erforderlich – es werden keine serverseitigen personenbezogenen Daten verarbeitet.)*

---

## 3) Welche Daten verarbeitet die App?
- **Aufgaben & Einstellungen**  
  Titel, Beschreibung, Datum/Uhrzeit, Priorität, Wiederholungen, Erinnerungen u. a.  
  → Speicherung **lokal** in der App-Datenbank (SQLite). Keine Übertragung an Dritte.
- **Audio (Mikrofon) für Diktat**  
  Gesprochene Eingaben werden nur zur Erkennung verwendet und **sofort verworfen** (keine Speicherung).
- **Netzwerkabrufe (DWD)**  
  Wetter-/Pollenwarnungen werden per **HTTPS** abgerufen. Keine Personalisierung, keine Profilbildung.
- **Benachrichtigungen/Alarme**  
  Planung und Zustellung erfolgen **lokal** über Android.
- **Analytics/Tracking/Ads**  
  **Nicht verwendet.**

---

## 4) Berechtigungen
- **Mikrofon (RECORD_AUDIO):** nur für Diktat (optional, Laufzeitberechtigung).  
- **Benachrichtigungen (POST_NOTIFICATIONS, Android 13+):** für Erinnerungen/Warnungen.  
- **Exakte Alarme (SCHEDULE_EXACT_ALARM, falls verfügbar):** pünktliche Auslösung von Erinnerungen.  
- **Internet (INTERNET/ACCESS_NETWORK_STATE):** für DWD-Abrufe.

---

## 5) Speicherdauer & Löschung
- **Aufgaben/Einstellungen:** bleiben lokal, bis du sie löscht.  
- **Audio (Diktat):** wird nur zur Erkennung genutzt und anschließend verworfen.  
- **So löscht du Daten:**  
  - In der App: *Einstellungen* → *Gefährlicher Bereich* → **Alle Aktivitäten löschen** (bzw. Wartungsfunktionen).  
  - Android: *Einstellungen* → *Apps* → *ToDay* → *Speicher & Cache* → **Speicher löschen**.

---

## 6) Weitergabe & Drittanbieter
- Es findet **keine Weitergabe** deiner Daten durch uns an Dritte statt.  
- **Spracherkennung:** Das Diktat nutzt den **Sprachdienst deiner Tastatur/deines Geräts** (z. B. Google). Dessen Verarbeitung/Datenschutz richten sich nach den Einstellungen/Policies des jeweiligen Anbieters. Wir betreiben **keine eigenen Server** für Audio.  
- **DWD:** Abrufe erfolgen ohne Nutzerkonto; PLZ/Warnregion dienen nur zur regionalen Zuordnung.

---

## 7) Rechtsgrundlagen (DSGVO)
- **Art. 6 Abs. 1 lit. b** – Vertrag/Leistungserfüllung (Kernfunktionen der App).  
- **Art. 6 Abs. 1 lit. a** – Einwilligung (Mikrofonberechtigung für Diktat, jederzeit widerrufbar in Android).  
- **Art. 6 Abs. 1 lit. f** – Berechtigtes Interesse (sichere Bereitstellung via HTTPS, technische Caches/Stabilität).

---

## 8) Deine Rechte
Du hast u. a. **Auskunft**, **Berichtigung**, **Löschung**, **Einschränkung**, **Datenübertragbarkeit** und **Widerspruch** (Art. 15–21 DSGVO).  
Da keine serverseitigen Konten geführt werden, kannst du deine Daten direkt **auf dem Gerät** löschen (siehe oben). Für Anliegen kontaktiere uns per E-Mail.

---

## 9) Kontakt
**E-Mail:** mathias.haeuser@gmx.net

---

## 10) Änderungen & Stand
Diese Hinweise können angepasst werden, wenn sich Funktionen oder rechtliche Vorgaben ändern.  
**Stand:** 2025-10-22
'@
  Write-File $p $c
}
