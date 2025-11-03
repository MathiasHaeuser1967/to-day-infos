function Write-En-Permissions {
  $p = Join-Path $DocsEn 'permissions.md'
  $c = @'
# Permissions

Explanation of app permissions and required system settings.

---

## 1) Confirm installation
![Confirm installation](../assets/img/de/permissions-1.png)

For sideload/USB installs confirm the system dialog with **Install**. (From Play Store this step is skipped.)

## 2) Allow notifications (Android 13+)
![Allow notifications](../assets/img/de/permissions-2.png)

Allow notifications on first launch with **Allow** – otherwise Android will **not** send reminders (cycles, time announcements, alarms).

## 3) Battery optimization: “No restrictions”
![Battery/Energy saving – No restrictions](../assets/img/de/permissions-3.png)

Exclude ToDay from battery optimizations (**No restrictions**) so reminders and (optional) exact alarms are triggered on time and not delayed/batched by the system.
'@
  Write-File $p $c
}