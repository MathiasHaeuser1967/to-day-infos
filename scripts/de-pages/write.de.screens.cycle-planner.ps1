function Write-De-Screen-CyclePlanner {
  $p = Join-Path $Screens 'cycle-planner.md'
  $c = @'
# Zyklus planen

Mit **Zyklus planen** erzeugst du wiederkehrende Fokus-/Pausen-Blöcke (z. B. Pomodoro) automatisch für den Tag.

---

## 1) Zweck

Du definierst Startzeit, Vorlage (Fokus/Pause) und wie oft sich der Block wiederholen soll. ToDay erzeugt daraus die einzelnen Aktivitäten in deinem Tagesplan – sauber getaktet, ohne Überschneidungen.

---

## 2) Startzeit & Wiederholungen

| Feld | Beschreibung |
|------|-------------|
| **Startzeit** | Erstes Start-Datum/-Uhrzeit der Serie. Tippe auf die Zeit, um den System-Zeitpicker zu öffnen. |
| **Wiederholungen (Slider)** | Anzahl der Zyklen, die ab Startzeit nacheinander erzeugt werden. |

Unter dem Slider siehst du z. B.:  
`4 von 24 möglichen Wiederholungen (Tag wird nicht überschritten).`

**Berechnungslogik:**

- Zyklusdauer = Fokus + Pause der gewählten Vorlage (z. B. 25 + 5 = 30 Min).  
- Maximale Wiederholungen: `max = floor((24h - Startzeit) / Zyklusdauer)`.  
- Intern wird zusätzlich sichergestellt, dass keine Aktivitäten in den nächsten Tag fallen.

---

## 3) Vorlage

Wähle eine **Fokus/Pause**-Kombination. ToDay erzeugt je Zyklus einen Fokus-Block und die zugehörige Pause (aufeinander folgend).

### Klassische Vorlagen

| Vorlage | Fokus | Pause |
|---------|-------|-------|
| **Pomodoro** | 25 Min | 5 Min |
| **50/10** | 50 Min | 10 Min |
| **52/17** | 52 Min | 17 Min |
| **45/15** | 45 Min | 15 Min |
| **30/10** | 30 Min | 10 Min |
| **60/15** | 60 Min | 15 Min |

### Ultradiane Zyklen

| Vorlage | Fokus | Pause |
|---------|-------|-------|
| **90/15** | 90 Min | 15 Min |
| **90/20** | 90 Min | 20 Min |
| **75/15** | 75 Min | 15 Min |

> **Hinweis:** Die gewählte Vorlage bestimmt die Zyklusdauer und damit die maximal möglichen Wiederholungen für deinen Tag.

---

## 4) Mit Fokus starten (Schalter)

| Einstellung | Wirkung |
|-------------|---------|
| **Ein** | Der erste erzeugte Block ist **Fokus**, danach kommt die Pause, usw. |
| **Aus** | Starte mit einer **Pause** und wechsle danach in den Fokus. |

Das ist praktisch, wenn du z. B. bewusst mit einer kurzen Vorbereitungs-Pause beginnen möchtest.

---

## 5) Erzeugen

Tippe auf **Erzeugen**, um die Serie anzulegen:

- Es werden Aktivitäten für das **aktuell gewählte Datum** (aus der Home-Ansicht) erzeugt.  
- Zeiten werden aus Startzeit, Vorlage und Wiederholungs-Anzahl berechnet.  
- Bestehende Einträge zu exakt denselben Zeitpunkten werden nicht doppelt angelegt (Konfliktprüfung).

> **Abbrechen:** Dialog schließen ohne Änderungen.

---

## 6) Beispiele

### Beispiel 1: Pomodoro am Vormittag

**Startzeit 10:00, Vorlage 25/5, Wiederholungen 4, Mit Fokus starten: Ein**

| Zeit | Block |
|------|-------|
| 10:00 | Fokus (25 Min) |
| 10:25 | Pause (5 Min) |
| 10:30 | Fokus (25 Min) |
| 10:55 | Pause (5 Min) |
| 11:00 | Fokus (25 Min) |
| 11:25 | Pause (5 Min) |
| 11:30 | Fokus (25 Min) |
| 11:55 | Pause (5 Min) |

### Beispiel 2: Ultradiane Zyklen

**Startzeit 08:30, Vorlage 90/20, Wiederholungen 3, Mit Fokus starten: Aus**

| Zeit | Block |
|------|-------|
| 08:30 | Pause (20 Min) |
| 08:50 | Fokus (90 Min) |
| 10:20 | Pause (20 Min) |
| 10:40 | Fokus (90 Min) |
| 12:10 | Pause (20 Min) |
| 12:30 | Fokus (90 Min) |

---

## 7) Tipps

- **Früh starten:** Je später die Startzeit, desto weniger Wiederholungen passen in den Tag.  
- **Puffer einplanen:** Wähle ggf. weniger Wiederholungen, wenn du zwischen Blöcken noch Weg-/Wechselzeiten brauchst.  
- **Kombinieren:** Erzeuge am Morgen deine Tageszyklen und arbeite sie über den Tab **Offen** ab.  
- **Aufräumen:** Bei Bedarf kannst du erzeugte Zyklen über **Aufräumen** für den Tag wieder entfernen (Quelle "Zyklus planen").
'@
  Write-File $p $c
}
