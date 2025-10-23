# Info

Der Dialog zeigt technische Informationen zur App, zum System, zur Datenbank und zum Benachrichtigungs-Status. Hilfreich für Support und Diagnose.

---

## 1) Aufruf & Zweck
- Aufruf über das **Menü** der App.
- Schneller Überblick für **Support** (Kopierfunktion) und **Fehleranalyse**.

---

## 2) App
- **App**: Name und **Version** (z. B. 1.0.5.1) mit **Kanal** (*Release*, *Beta*, *Debug*).

---

## 3) System
- **Betriebssystem**: Android-Build des Geräts (z. B. `android AQ3A.240912.001`).
- **Package-ID**: Eindeutige Paketkennung der App (z. B. `de.mathiashaeuser.today`).

---

## 4) Datenbank
- **SQLite**: verwendete SQLite-Version.
- **DB-Pfad**: Verzeichnis der App-Datenbank auf dem Gerät.
- **DB-Datei**: vollständiger Pfad zur Datenbankdatei (z. B. `.../databases/to_day.db`).
- **DB-Name**: logischer Name (z. B. `to_day.db`).
- **Anzahl Einträge**: Summe der Datensätze (Kurzüberblick).
- **Tabellen**: Anzahl der Tabellen in der Datenbank.

> Hinweis: Der Pfad ist aus Sicherheitsgründen i. d. R. nicht direkt zugänglich (ohne Root/adb). Für Analysen genügt der **Kopieren**-Button.

---

## 5) Benachrichtigungen
Status-Chips zeigen, ob alle Voraussetzungen erfüllt sind:
- **Erlaubt** – Systemberechtigung für Benachrichtigungen ist erteilt.
- **Exakte Alarme** – erlaubt, damit Erinnerungen **pünktlich** auslösen dürfen.
- **Akku-Optimierung ignoriert** – verhindert Drosselung im Hintergrund.

> Wenn einer der Schalter **aus** ist, können Erinnerungen **zu spät** oder **gar nicht** kommen. Öffne die entsprechenden System-Einstellungen und erlaube die Option.

---

## 6) Aktionen
- **Kopieren**: Kopiert alle angezeigten Informationen in die Zwischenablage (für Support/Fehlerbericht).
- **Schließen**: Beendet den Dialog.

---

## 7) Tipps & Fehlerbehebung
- Nach Änderungen an Rechten/Alarmen in den **Einstellungen** ggf. **„Benachrichtigungen neu aufbauen“** ausführen.
- Prüfe zusätzlich Ruhezeiten, „Nicht stören“ und Internet-Verbindung (für DWD/Pollen).
- Bei Support-Anfragen den kopierten **Info-Block** mit senden.
