# Add / Edit Activity

The dialog for adding or editing an activity contains all fields that describe a task in **ToDay**.

---

## 1) Title

The most important field – short, concise, unambiguous.

### TD-Trigger (Special Title)

Certain titles trigger automated actions when due:

| Trigger | Action |
|---------|--------|
| `TD:brief:high` | Daily briefing only high priority via TTS. |
| `TD:brief:mid` | Daily briefing only medium priority via TTS. |
| `TD:brief:low` | Daily briefing only low priority via TTS. |
| `TD:finance:gold` | Gold price announcement (source: goldprice.org). |
| `TD:finance:silver` | Silver price announcement (source: goldprice.org). |
| `TD:steps:today` | Steps today via TTS (Android STEP_COUNTER). |

In the activity list, TD-Triggers are displayed **user-friendly** (e.g. “Daily briefing High” instead of `TD:brief:high`).

---

## 2) Description (optional)

Free text for details, notes, or context. Shown in the detail view.

### Steps Trigger in Detail (`TD:steps:today`)

| Property | Description |
|----------|-------------|
| **Data source** | Android `TYPE_STEP_COUNTER` (cumulative hardware counter since last reboot). |
| **Calculation** | `Steps today = current counter value − stored day start value`. |
| **Day start value** | Set at the first trigger of the day. Only from the second trigger onward is a real difference available. |
| **Reboot** | After reboot, the counter starts at 0 → new start value is set automatically. |

**Correct Android Settings:**

| Setting | Path / Action |
|---------|--------------|
| **Physical Activity** | Settings → Apps → ToDay → Permissions → Physical Activity → Allow. |
| **Battery Restrictions** | Set to “No restrictions”. For Xiaomi additionally allow autostart. |

**Notes on Accuracy:**

- Most reliable: **front pants pocket** or tight-fitting pocket on the body.  
- Avoid loose jacket pocket, hoodie pocket, or freely swinging handbag.  
- In a backpack, steps may be underestimated because movement is dampened.  
- For consistent values, always use the same carrying position if possible.

---

## 3) Priority

| Level | Effect |
|-------|---------|
| **Low** | Standard display. |
| **Medium** | Standard display. |
| **High** | Influences the “High priority” metric on Home and is visually highlighted. |

---

## 4) Date

Calendar picker for the day of the activity.  
Tip: Today/Tomorrow often available, otherwise choose a date.

---

## 5) Time

Exact start time (24 h).  
Used for the position in the day and for reminders.

---

## 6) Remind

Opens the selection of reminder offsets:

| Offset | Meaning |
|--------|---------|
| **Start** | At the exact time. |
| **5 Min** | 5 minutes before. |
| **10 Min** | 10 minutes before. |
| **15 Min** | 15 minutes before. |
| **30 Min** | 30 minutes before. |
| **1 Hr** | 1 hour before. |
| **2 Hr** | 2 hours before. |

- **Multiple selection** possible (e.g. *10 Min* **and** *Start*).  
- Quick actions: **All** / **None**.  
- **Apply** confirms the selection.

> **Note:** Reminders are scheduled as notifications or alarms at the selected times (system permissions required).

---

## 7) Repeat

Defines if and how the activity repeats automatically.

### None

One-time activity.

### Daily

| Option | Description |
|--------|-------------|
| **Interval** | “Every *n* days” (− / +). |
| **Ends** | *Never* · *Until date* · *After count*. |

### Weekly

| Option | Description |
|--------|-------------|
| **Interval** | “Every *n* weeks” (− / +). |
| **Weekdays** | Choose Mon–Sun or shortcuts **Weekdays** / **Weekend**. |
| **Ends** | *Never* · *Until date* · *After count*. |

### Monthly

| Option | Description |
|--------|-------------|
| **Interval** | “Every *n* months”. |
| **Mode** | **Day of month** (e.g. *23rd*) **or** **Weekday in month** (e.g. *every 2nd Tuesday*). |
| **Ends** | *Never* · *Until date* · *After count*. |

### Yearly

| Option | Description |
|--------|-------------|
| **Interval** | “Every *n* years”. |
| **Mode** | **On date** (month + day) **or** **Weekday in month**. |
| **Ends** | *Never* · *Until date* · *After count*. |

> **Tip:** For “Birthday”, “Rent”, “Report week” choose a suitable repeat and set the **End** deliberately.

---

## 8) Actions

| Button | Effect |
|--------|---------|
| **Cancel** | Closes the dialog without saving. |
| **Add** | Creates the activity and returns to the overview. |

---

## 9) Examples

| Example | Configuration |
|---------|--------------|
| **Doctor appointment** | Date *Oct 23*, time *08:15*, remind *10 Min + Start*. |
| **Training** | Time *18:00*, **Weekly**: *Thu*, ends *Never*. |
| **Report** | **Monthly**: *Weekday in month → last weekday*, remind *1 Hr*. |

---

## 10) Notes

- **Permissions:** Allow notifications (and possibly **Exact alarms**), otherwise reminders may be late.  
- **Steps:** For `TD:steps:today` **Physical Activity** permission must be allowed, otherwise the step counter is not available.  
- **Editable:** Everything can be edited later, repeats only affect future occurrences.