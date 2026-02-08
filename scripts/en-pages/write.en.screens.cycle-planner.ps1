function Write-En-Screen-CyclePlanner {
  $p = Join-Path $Screens 'cycle-planner.md'
  $c = @'
# Cycle Planner

With **Cycle Planner** you automatically create recurring focus/break blocks (e.g., Pomodoro) for the day.

---

## 1) Purpose

You define the start time, template (focus/break), and how often the block should repeat. ToDay creates the individual activities in your daily plan – neatly timed, without overlaps.

---

## 2) Start Time & Repetitions

| Field | Description |
|-------|-------------|
| **Start Time** | First start date/time of the series. Tap the time to open the system time picker. |
| **Repetitions (Slider)** | Number of cycles created sequentially from the start time. |

Below the slider you see, for example:  
`4 of 24 possible repetitions (day is not exceeded).`

**Calculation Logic:**

- Cycle duration = focus + break of the chosen template (e.g., 25 + 5 = 30 min).  
- Maximum repetitions: `max = floor((24h - start time) / cycle duration)`.  
- Internally it is also ensured that no activities spill over into the next day.

---

## 3) Template

Choose a **focus/break** combination. ToDay creates one focus block and the associated break per cycle (back-to-back).

### Classic Templates

| Template | Focus | Break |
|----------|-------|-------|
| **Pomodoro** | 25 min | 5 min |
| **50/10** | 50 min | 10 min |
| **52/17** | 52 min | 17 min |
| **45/15** | 45 min | 15 min |
| **30/10** | 30 min | 10 min |
| **60/15** | 60 min | 15 min |

### Ultradian Cycles

| Template | Focus | Break |
|----------|-------|-------|
| **90/15** | 90 min | 15 min |
| **90/20** | 90 min | 20 min |
| **75/15** | 75 min | 15 min |

> **Note:** The selected template determines the cycle duration and thus the maximum possible repetitions for your day.

---

## 4) Start with Focus (Switch)

| Setting | Effect |
|---------|---------|
| **On** | The first created block is **focus**, then comes the break, and so on. |
| **Off** | Start with a **break** and then switch to focus. |

This is useful if you want to deliberately begin with a short preparation break.

---

## 5) Generate

Tap **Generate** to create the series:

- Activities are created for the **currently selected date** (from the Home view).  
- Times are calculated from start time, template, and number of repetitions.  
- Existing entries at exactly the same times will not be duplicated (conflict check).

> **Cancel:** Close the dialog without changes.

---

## 6) Examples

### Example 1: Pomodoro in the Morning

**Start time 10:00, template 25/5, repetitions 4, Start with focus: On**

| Time | Block |
|------|-------|
| 10:00 | Focus (25 min) |
| 10:25 | Break (5 min) |
| 10:30 | Focus (25 min) |
| 10:55 | Break (5 min) |
| 11:00 | Focus (25 min) |
| 11:25 | Break (5 min) |
| 11:30 | Focus (25 min) |
| 11:55 | Break (5 min) |

### Example 2: Ultradian Cycles

**Start time 08:30, template 90/20, repetitions 3, Start with focus: Off**

| Time | Block |
|------|-------|
| 08:30 | Break (20 min) |
| 08:50 | Focus (90 min) |
| 10:20 | Break (20 min) |
| 10:40 | Focus (90 min) |
| 12:10 | Break (20 min) |
| 12:30 | Focus (90 min) |

---

## 7) Tips

- **Start early:** The later the start time, the fewer repetitions fit into the day.  
- **Plan buffer:** Choose fewer repetitions if you need transfer/change time between blocks.  
- **Combine:** Generate your daily cycles in the morning and work through them via the **Open** tab.  
- **Cleanup:** If needed, you can remove generated cycles for the day via **Cleanup** (source "Cycle Planner").
'@
  Write-File $p $c
}
