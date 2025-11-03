function Write-En-Quickstart {
  $p = Join-Path $DocsEn 'quickstart.md'
  $c = @'
# Quick start

This guide gets you up and running in 2–3 minutes.

---

## 1) Install & open
Install ToDay from your preferred source and open the app once.

## 2) Allow notifications (Android 13+)
The app needs notifications for reminders and alarms. When prompted, choose **Allow**.

## 3) Battery optimization → None
Exclude ToDay from battery optimization (set **No restrictions**). Otherwise alarms may be delayed or grouped by the system.

## 4) Add your first activity
Tap **+** on **Home**, enter **Title**, optional **Description**, **Date/Time**, **Repeat** (optional), and **Reminders**. Save with **Add**.

## 5) Get reminders
Depending on your settings you'll receive **notifications/alarms** (status bar) or **spoken time announcements** (TTS).
Mark activities as **Done** when finished.

!!! warning "Background & energy saving"
    Some manufacturers (e.g. Xiaomi, Huawei, Samsung) restrict background execution.  
    **Solution:** Disable battery optimization for ToDay, allow notifications and (if available) enable *Exact alarms*.
'@
  Write-File $p $c
}