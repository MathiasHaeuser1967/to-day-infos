function Write-En-Screen-AddActivity {
  $p = Join-Path $Screens 'add-activity.md'
  $c = @'
# Add activity

This dialog creates a new activity. You set title, time, reminders and (optionally) a repetition.

___

## 1) Open
• On **Home**, tap the **+** button.  
• Fill the fields and save with **Add**.

___

## 2) Title & description
• **Title**: required. Short and concise (e.g., "Doctor's appointment", "Send report").  
• **Description** (optional): details/notes.

___

## 2a) TD triggers in the title (Power feature)

You can trigger system actions via the activity title. For this, the title must start exactly with `TD:`.

Important
• A trigger is only detected if the title starts directly with `TD:`. No leading space.  
• Format: `TD:<group>:<level>`  
• Case insensitive: `td:BRIEF:HIGH` is valid.  
• Anything after the third segment is ignored and only acts as an optional label.  
  Examples: `TD:brief:high:morning` or `TD:brief:high My label`

Display rules
• The stored title remains unchanged.  
• In the activity list, a friendly label is shown instead of the raw token.  
• If your device language is English, the English label is shown.

### TD briefing triggers v1.0

| Trigger token in title | Display German | Display English | Speaks tasks with priority |
| --- | --- | --- | --- |
| `TD:brief:high` | Tagesbriefing Hoch | Daily Briefing High | High only |
| `TD:brief:mid` | Tagesbriefing Mittel | Daily Briefing Mid | Medium only |
| `TD:brief:low` | Tagesbriefing Niedrig | Daily Briefing Low | Low only |

### Input examples

• Without label  
  Title: `TD:brief:high`

• With label  
  Title: `TD:brief:mid:team`  
  The label is only text. Behavior stays `TD:brief:mid`.

### What happens when a briefing is due

When a briefing trigger activity becomes due, the title is not spoken. Instead, the app speaks a generated daily briefing.

Briefing scope
• Applies to the day of the trigger activity.

Filter rules
• The trigger activity itself is never spoken.  
• Activities whose titles start with `TD:` are never spoken.  
• Only normal tasks are spoken, matching the selected level high mid low.

Sorting
• First tasks with a time, sorted ascending by time.  
• Then tasks without a time.

Limits
• Max 5 timed tasks.  
• Max 3 untimed tasks.  
• If there are more, the briefing ends with a short: "and more tasks".

Language
• Two texts are prepared: German and English.  
• On playback, the device locale decides which text is used.  
• If no matching text is present, the app uses the existing fallback behavior.

Reminder note
• Briefing triggers should not fire twice at the start time. Therefore a "Start" reminder for TD briefing triggers is internally suppressed.

___

### TD finance triggers v1.0

Finance triggers are system triggers for price announcements. When such an activity becomes due, the app does not speak the title. Instead it speaks a generated price announcement.

| Trigger token in title | Display German | Display English | What is spoken |
| --- | --- | --- | --- |
| `TD:finance:gold` | Goldpreis Ansage | Gold price announcement | Gold price in USD plus timestamp |
| `TD:finance:silver` | Silberpreis Ansage | Silver price announcement | Silver price in USD plus timestamp |

Input examples
• Without label  
  Title: `TD:finance:gold`

• With label  
  Title: `TD:finance:silver:spot`  
  The label is only text. Behavior stays `TD:finance:silver`.

Important
• A trigger is only detected if the title starts directly with `TD:`. No leading space.  
• Case insensitive: `TD:FINANCE:GOLD` is valid.  
• Anything after the third segment is ignored and only acts as an optional label.

What happens when a finance trigger is due
• The title is not spoken.  
• The price announcement is prepared when scheduling the notification.  
• There are no network requests inside the notification callback. The callback reads payload only.

Data source and mapping
• Base endpoint: `https://data-asg.goldprice.org/dbXRates/USD`  
• Gold uses `xauClose` as the price in USD.  
• Silver uses `xagClose` as the price in USD.

Cache behavior
• Prices are cached per metal for about 10 to 15 minutes or until app restart.  
• This avoids repeated fetches during rescheduling.

Offline and error case
• If there is no network or a request fails, scheduling still continues.  
• The app speaks a clear fallback message, for example "Gold price currently not available".

Language
• Two texts are prepared: German and English.  
• On playback, the device locale decides which text is used.  
• Payload keys: `speak_de` and `speak_en` (optionally also finance fields like symbol, currency, price, timestamp).

Reminder note
• Finance triggers should not fire twice at the start time. Therefore a "Start" reminder for TD finance triggers is internally suppressed.

___

## 3) Priority
• **Low / Medium / High**  
  Affects the **"High priority"** metric on Home and helps you focus.

___

## 4) Date
• Calendar selection for the day of the activity.  
  Tip: Shortcuts like Today or Tomorrow are available; otherwise choose a date.

___

## 5) Time
• Exact start time (24-hour).  
  Used for the position within the day and for reminders.

___

## 6) Remind
• Opens the selection **Start &middot; 5 min &middot; 10 min &middot; 15 min &middot; 30 min &middot; 1 h &middot; 2 h**.  
• Multiple selection possible (e.g., *10 min* and *Start*).  
• Quick actions: **All** / **None**.  
• **Apply** confirms the selection.

> Note: Reminders are scheduled as notification or alarm at the chosen time (system permissions required).

___

## 7) Repeat
Defines whether and how the activity repeats automatically.

• **None**: one-off.  
• **Daily**  
  • Interval: "Every *n* days" (+ / +).  
  • **Ends**: *Endless* &middot; *Until date* &middot; *After count*.  
• **Weekly**  
  • Interval: "Every *n* weeks" (+ / +).  
  • Select weekdays (Mon...Sun) or shortcuts **Weekdays** or **Weekend**.  
  • **Ends**: *Endless* &middot; *Until date* &middot; *After count*.  
• **Monthly**  
  • Interval: "Every *n* months".  
  • Mode: **Day of month** (e.g., *23rd*) or **Weekday in month** (e.g., *every 2nd Tuesday*).  
  • **Ends**: *Endless* &middot; *Until date* &middot; *After count*.  
• **Yearly**  
  • Interval: "Every *n* years".  
  • Mode: **On date** (month + day) or **Weekday in month**.  
  • **Ends**: *Endless* &middot; *Until date* &middot; *After count*.

> Tip: For "Birthday", "Rent", "Report week" choose a suitable repeat and set **End** consciously.

___

## 8) Actions
• **Cancel**: closes the dialog without saving.  
• **Add**: creates the activity and returns to the overview.

___

## 9) Examples
• "**Doctor's appointment**", date *23 Oct*, time *08:15*, Remind *10 min + Start*.  
• "**Workout**", time *18:00*, **Weekly**: *Thu*, Ends *Endless*.  
• "**Report**", **Monthly**: *Weekday in month &rarr; last business day*, Remind *1 h*.

___

## 10) Notes
• **Permissions**: Allow notifications (and, if available, **Exact alarms**), otherwise reminders may be delayed.  
• **Editable**: Everything can be changed later; repeats affect future instances only.
'@
  Write-File $p $c
}
