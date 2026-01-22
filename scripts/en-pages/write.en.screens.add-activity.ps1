function Write-En-Screen-AddActivity {
  $p = Join-Path $Screens 'add-activity.md'
  $c = @'
# Add activity

This dialog creates a new activity. You choose the title, date and time, reminders, and optionally a repeat rule.

---

## 1) Open
- On **Home**, tap the **+** button.
- Fill in the fields and save with **Add**.

---

## 2) Title and description
- **Title**: Required. Short and clear (for example “Doctor appointment”, “Send report”).
- **Description** (optional): Details or notes.

---

## 2a) TD triggers in the title (power feature)

You can trigger certain system actions via the activity title. For that, the title must start exactly with `TD:`.

Important
- A trigger is only recognized if the title starts directly with `TD:`. No space before it.
- Format: `TD:<group>:<level>`
- Case insensitive: `td:BRIEF:HIGH` is valid.
- Anything after the third segment is ignored and is only an optional label.
  Examples: `TD:brief:high:morning` or `TD:brief:high My label`

Display rules
- The stored title remains unchanged.
- In the activity list, a friendly display text is shown instead of the token.
- If the device language is English, the English display text is shown.

### TD briefing trigger

Trigger token in the title: `TD:brief:<level>`
- `TD:brief:high`
  Display German: Daily briefing high
  Display English: Daily briefing high
- `TD:brief:mid`
  Display German: Daily briefing medium
  Display English: Daily briefing mid
- `TD:brief:low`
  Display German: Daily briefing low
  Display English: Daily briefing low

### Input examples

- Without label
  Title: `TD:brief:high`

- With label
  Title: `TD:brief:mid:team`
  The label is just text. Behavior stays `TD:brief:mid`.

### What happens when a briefing becomes due

When a briefing trigger activity becomes due, the app does not read the title aloud. Instead, it speaks a daily briefing.

Briefing scope
- Applies to the day of the trigger activity.

Filter rules
- The trigger activity itself is never read aloud.
- Activities whose title starts with `TD:` are never read aloud.
- Only normal tasks are read aloud, matching the level high mid low.

Sorting
- First, tasks with a time, ascending by time.
- Then, tasks without a time.

Limits
- Max 5 tasks with a time.
- Max 3 tasks without a time.
- If there are more, the app ends with a short “and more tasks”.

Language
- Two texts are prepared: German and English.
- On playback, the device locale decides which text is used.
- If no matching text exists, the app uses the existing fallback.

Reminder note
- For briefing triggers there should be no duplicate notification at the start time. Therefore a “Start” reminder is internally suppressed for TD briefing triggers.

---

### TD finance trigger

Finance triggers are system triggers for price announcements. When such an activity becomes due, the app does not read the title aloud, but a generated price announcement.

Trigger token in the title: `TD:finance:<metal>`
- `TD:finance:gold`
  Display German: Gold price announcement
  Display English: Gold price announcement
- `TD:finance:silver`
  Display German: Silver price announcement
  Display English: Silver price announcement

Input examples
- Without label
  Title: `TD:finance:gold`

- With label
  Title: `TD:finance:silver:spot`
  The label is just text. Behavior stays `TD:finance:silver`.

Important
- A trigger is only recognized if the title starts directly with `TD:`. No space before it.
- Case insensitive: `TD:FINANCE:GOLD` is valid.
- Anything after the third segment is ignored and is only an optional label.

What happens when a finance trigger becomes due
- The title is not read aloud.
- Instead, a price announcement is prepared when scheduling the notification.
- There are no network calls in the notification callback. The callback only uses the payload.

Data source and price mapping
- Base endpoint: `https://data-asg.goldprice.org/dbXRates/USD`
- Gold uses `xauClose` as the price in USD.
- Silver uses `xagClose` as the price in USD.

Cache behavior
- The app caches prices per metal for about 10 to 15 minutes or until the app is restarted.
- This avoids fetching new prices repeatedly during rescheduling.

Offline and error case
- If there is no network or an error occurs, scheduling still happens.
- The app then speaks a clear fallback message, for example “Gold price currently unavailable”.

Language
- Two texts are prepared: German and English.
- On playback, the device locale decides which text is used.
- Payload keys: `speak_de` and `speak_en`

---

## 3) Priority
- **Low / Medium / High**
  Affects the **High priority** metric on Home and helps you focus.

---

## 4) Date
- Calendar picker for the activity day.
  Tip: Today and tomorrow are often available, otherwise pick a date.

---

## 5) Time
- Exact start time (24 h).
  Used for ordering within the day and for reminders.

---

## 6) Reminders
- Opens the selection **Start · 5 min · 10 min · 15 min · 30 min · 1 h · 2 h**.
- Multiple selection is possible (for example 10 min and Start).
- Quick actions: **All** or **None**.
- **Apply** confirms the selection.

> Note: Reminders are scheduled as notifications or alarms at the selected times (system permissions required).

---

## 7) Repeat
Defines if and how the activity repeats automatically.

- **None**: one time.
- **Daily**
  - Interval: “Every n days” (− / +).
  - **Ends**: Never · Until date · After count.
- **Weekly**
  - Interval: “Every n weeks” (− / +).
  - Select weekdays (Mon…Sun) or shortcuts **Weekdays** or **Weekend**.
  - **Ends**: Never · Until date · After count.
- **Monthly**
  - Interval: “Every n months”.
  - Mode: **Day of month** (for example 23) or **Weekday in month** (for example every 2nd Tuesday).
  - **Ends**: Never · Until date · After count.
- **Yearly**
  - Interval: “Every n years”.
  - Mode: **On date** (month + day) or **Weekday in month**.
  - **Ends**: Never · Until date · After count.

> Tip: For “Birthday”, “Rent”, “Report week” choose a suitable repeat rule and set an end deliberately.

---

## 8) Actions
- **Cancel**: closes the dialog without saving.
- **Add**: creates the activity and returns to the overview.

---

## 9) Examples
- “Doctor appointment”, date 23 Oct, time 08:15, reminders 10 min + Start.
- “Workout”, time 18:00, **Weekly**: Thu, ends Never.
- “Report”, **Monthly**: weekday in month → last weekday, reminder 1 h.

---

## 10) Notes
- **Permissions**: allow notifications (and possibly **Exact alarms**), otherwise reminders may be late.
- **Editable**: everything can be edited later. Repeat rules only affect future occurrences.
'@
  Write-File $p $c
}
