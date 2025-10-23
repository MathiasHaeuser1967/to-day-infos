# Zyklus planen

Mit **Zyklus planen** erzeugst du wiederkehrende Fokus-/Pausen-Blöcke (z. B. Pomodoro) automatisch für den Tag.

---

## 1) Zweck
Du definierst Startzeit, Vorlage (Fokus/ Pause) und wie oft sich der Block wiederholen soll. ToDay erzeugt daraus die einzelnen Aktivitäten in deinem Tagesplan – sauber getaktet, ohne Überschneidungen.

---

## 2) Startzeit & Wiederholungen

- **Startzeit**  
  Erstes Start-Datum/-Uhrzeit der Serie. Tippe auf die Zeit, um den System-Zeitpicker zu öffnen.

- **Wiederholungen (Slider)**  
  Anzahl der Zyklen, die ab Startzeit nacheinander erzeugt werden.  
  Unter dem Slider siehst du z. B.:  
  `4 von 24 möglichen Wiederholungen (Tag wird nicht überschritten).`

  **Logik:**  
  - Zyklusdauer = Fokus + Pause der gewählten Vorlage (z. B. 25+5 = 30 Min).  
  - Maximale Wiederholungen werden so berechnet, dass die Serie den Kalendertag nicht überläuft.  
    Vereinfacht: `max = floor((24h - Startzeit) / Zyklusdauer)` (intern wird zusätzlich sichergestellt, dass keine Aktivitäten in den nächsten Tag fallen).

---

## 3) Vorlage

Wähle eine **Fokus/Pause**-Kombination. ToDay erzeugt je Zyklus einen Fokus-Block und die zugehörige Pause (aufeinander folgend).

**Klassische Vorlagen**
- **25/5** – Pomodoro 25 Min Fokus, 5 Min Pause  
- **50/10** – 50 Min Fokus, 10 Min Pause  
- **52/17** – 52 Min Fokus, 17 Min Pause  
- **45/15** – 45 Min Fokus, 15 Min Pause  
- **30/10** – 30 Min Fokus, 10 Min Pause  
- **60/15** – 60 Min Fokus, 15 Min Pause

**Ultradiane Zyklen**
- **90/15** – 90 Min Fokus, 15 Min Pause  
- **90/20** – 90 Min Fokus, 20 Min Pause  
- **75/15** – 75 Min Fokus, 15 Min Pause

> Hinweis: Die gewählte Vorlage bestimmt die Zyklusdauer und damit die maximal möglichen Wiederholungen für deinen Tag.

---

## 4) Mit Fokus starten (Schalter)

- **Ein**: Der erste erzeugte Block ist **Fokus**, danach kommt die Pause, usw.  
- **Aus**: Starte mit einer **Pause** und wechsle danach in den Fokus.

Das ist praktisch, wenn du z. B. bewusst mit einer kurzen Vorbereitungs-Pause beginnen möchtest.

---

## 5) Erzeugen

Tippe auf **Erzeugen**, um die Serie anzulegen:
- Es werden Aktivitäten für das **aktuell gewählte Datum** (aus der Home-Ansicht) erzeugt.
- Zeiten werden aus Startzeit, Vorlage und Wiederholungs-Anzahl berechnet.
- Bestehende Einträge zu exakt denselben Zeitpunkten werden – soweit möglich – nicht doppelt angelegt (Konfliktprüfung).

> Abbrechen: Dialog schließen ohne Änderungen.

---

## 6) Beispiele

- **Startzeit 10:00, Vorlage 25/5, Wiederholungen 4, „Mit Fokus starten: Ein“**  
  Es entstehen 4 Fokus-Blöcke (25 Min) jeweils gefolgt von 5 Min Pause:  
  10:00 Fokus, 10:25 Pause, 10:30 Fokus, 10:55 Pause, 11:00 Fokus, 11:25 Pause, 11:30 Fokus, 11:55 Pause.

- **Startzeit 08:30, Vorlage 90/20, Wiederholungen 3, „Mit Fokus starten: Aus“**  
  08:30 Pause, 08:50 Fokus, 10:20 Pause, 10:40 Fokus, 12:10 Pause, 12:30 Fokus.

---

## 7) Tipps

- **Früh starten**: Je später die Startzeit, desto weniger Wiederholungen passen in den Tag.  
- **Puffer einplanen**: Wähle ggf. weniger Wiederholungen, wenn du zwischen Blöcken noch Weg-/Wechselzeiten brauchst.  
- **Kombinieren**: Erzeuge am Morgen deine Tageszyklen und arbeite sie über den Tab **Offen** ab.  
- **Aufräumen**: Bei Bedarf kannst du erzeugte Zyklen über **Aufräumen** für den Tag wieder entfernen (Quelle „Zyklus planen“).
