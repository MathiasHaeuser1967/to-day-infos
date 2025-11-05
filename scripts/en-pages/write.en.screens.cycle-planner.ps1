function Write-En-Screen-CyclePlanner {
  $p = Join-Path $Screens 'cycle-planner.md'
  $c = @'
# Cycle planner

With **Cycle planner** you automatically create recurring focus/break blocks (e.g., Pomodoro) for the day.

---

## 1) Purpose
You define start time, template (focus/break), and how often the block should repeat. ToDay creates the individual activities in your daily plan &mdash; neatly paced, without overlaps.

---

## 2) Start time & repetitions

- **Start time**  
  First start date/time of the series. Tap the time to open the system time picker.

- **Repetitions (slider)**  
  Number of cycles that are created sequentially from the start time.  
  Below the slider you see, for example:  
  `4 of 24 possible repetitions (day is not exceeded).`

  **Logic:**  
  - Cycle duration = focus + break of the chosen template (e.g., 25+5 = 30 min).  
  - Maximum repetitions are calculated so that the series does not overflow the calendar day.  
    Simplified: `max = floor((24h - start time) / cycle duration)` (internally it is also ensured that no activities spill into the next day).

---

## 3) Template

Choose a **focus/break** combination. ToDay creates one focus block and the associated break for each cycle (back-to-back).

**Classic templates**
- **25/5** &ndash; Pomodoro 25 min focus, 5 min break  
- **50/10** &ndash; 50 min focus, 10 min break  
- **52/17** &ndash; 52 min focus, 17 min break  
- **45/15** &ndash; 45 min focus, 15 min break  
- **30/10** &ndash; 30 min focus, 10 min break  
- **60/15** &ndash; 60 min focus, 15 min break

**Ultradian cycles**
- **90/15** &ndash; 90 min focus, 15 min break  
- **90/20** &ndash; 90 min focus, 20 min break  
- **75/15** &ndash; 75 min focus, 15 min break

> Note: The selected template determines the cycle duration and thus the maximum possible repetitions for your day.

---

## 4) Start with focus (switch)

- **On**: The first created block is **focus**, then comes the break, and so on.  
- **Off**: Start with a **break** and then switch to focus.

This is useful if you want to deliberately begin with a short preparation break.

---

## 5) Generate

Tap **Generate** to create the series:
- Activities are created for the **currently selected date** (from the Home view).
- Times are calculated from start time, template, and number of repetitions.
- Existing entries at exactly the same times will, as far as possible, not be duplicated (conflict check).

> Cancel: Close the dialog without changes.

---

## 6) Examples

- **Start time 10:00, template 25/5, repetitions 4, "Start with focus: On"**  
  This results in 4 focus blocks (25 min) each followed by a 5 min break:  
  10:00 Focus, 10:25 Break, 10:30 Focus, 10:55 Break, 11:00 Focus, 11:25 Break, 11:30 Focus, 11:55 Break.

- **Start time 08:30, template 90/20, repetitions 3, "Start with focus: Off"**  
  08:30 Break, 08:50 Focus, 10:20 Break, 10:40 Focus, 12:10 Break, 12:30 Focus.

---

## 7) Tips

- **Start early**: The later the start time, the fewer repetitions fit into the day.  
- **Plan buffer**: Choose fewer repetitions if you need transfer/change time between blocks.  
- **Combine**: Generate your daily cycles in the morning and work through them via the **Open** tab.  
- **Cleanup**: If needed, you can remove generated cycles for the day via **Cleanup** (source "Cycle planner").

'@
  Write-File $p $c
}