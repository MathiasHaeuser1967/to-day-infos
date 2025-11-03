function Write-En-Screen-CyclePlanner {
  $p = Join-Path $Screens 'cycle-planner.md'
  $c = @'
# Cycle planner

Plan regularly recurring activities in **cycles** (e.g., weekly chores).

- Define a **cycle length** (days/weeks).
- For each step, set **title**, **date/time**, **reminders**, and optional **repeat** within the cycle.
- Skip or shift steps as needed.

The planner schedules the next due activity automatically once you mark the current one as **Done**.
'@
  Write-File $p $c
}