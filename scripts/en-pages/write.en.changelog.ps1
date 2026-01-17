function Write-En-Changelog {
  $p = Join-Path $DocsEn 'changelog.md'
  $c = @'
# Changelog

| Version  | Type       | Description |
|----------|------------|-------------|
| 1.0.7.11 | Feature | Added a Daily Briefing button on Home. Voice output reads today&#39;s open activities by priority. |
|  | Feature | Multi-tap on the Daily Briefing button: 1x high priority, 2x medium priority, 3x low priority. Uses an internal time window to detect tap count. |
|  | Feature | Daily Briefing voice output supports German and English, based on the current app language. |
|  | Feature | TD title triggers: `TD:brief:high`, `TD:brief:mid`, `TD:brief:low`. When such an activity becomes due, the app speaks a generated daily briefing instead of reading the title. |
|  | Feature | TD briefing priority filter: `TD:brief:high` speaks **High only**, `TD:brief:mid` speaks **Medium only**, `TD:brief:low` speaks **Low only**. Other priorities are not spoken. |
|  | Feature | TD briefing scope and rules: applies to the day of the trigger activity, sorts timed tasks first (ascending time), then untimed tasks, limits to max 5 timed and max 3 untimed, adds &quot;and more tasks&quot; if there are more. The trigger activity itself and any title starting with `TD:` are not spoken. |
|  | Feature | Friendly display labels for TD triggers in the activity list instead of the raw token. German: Tagesbriefing High Mid Low. English: Daily Briefing High Mid Low. Stored title stays unchanged. |
|  | Enhancement | Home action buttons are now arranged in two rows. Original button size restored for easier tapping. |
|  | Bugfix | Fixed a release build error in the multi-tap Daily Briefing implementation (timer constant and clamp int conversion). |
|  | Bugfix | Timer is cancelled when Home is disposed to reduce side effects. |
| 1.0.7.10 | Feature | Appearance improved. If Dynamic Color is off the app now uses a vivid orange base with matching accent colors. Shad UI uses orange. System theme stays unchanged. |
|  | Feature | Splash screen with loader and a support box to copy info and restart. |
|  | Enhancement | More stable app start with a short splash and a watchdog hint on delay. |
|  | Enhancement | Faster cold start. Heavy init moved after the first frame via AppBootstrap. UI renders faster. |
|  | Enhancement | StartupMetrics logs first frame time and frame timings for diagnostics. |
|  | Enhancement | DataWarmup uses compute and isolates for JSON parsing and prep. |
|  | Enhancement | AssetWarmup precaches images only after the first frame. |
|  | Enhancement | BatteryHelper only on demand from Settings. Texts come from l10n in German and English. |
|  | Enhancement | Notifications consolidated in _initNotifications. Foreground chime port registered cleanly. |
|  | Enhancement | Lighter onCreate. runApp starts earlier. Splash navigates once bootstrap is ready. |
|  | Bugfix | Fixed &quot;ShadTheme.of()&quot; error. ShadApp is now the root wrapper. |
|  | Bugfix | Fixed &quot;darkData&quot; build error. Switched to new ShadTheme API with theme and darkTheme fields. |
|  | Bugfix | Removed the manually added awesome_notifications BootReceiver. |
|  | Bugfix | ForegroundChime init without await. More stable notification start. |
| 1.0.6.6 | Enhancement | Default speech rate on first install changed from 1.0 to 0.5 for a more comfortable voice output. |
| 1.0.6.5 | Feature | Activities with past date or time can now be created and edited. A warning appears on save. No hard block. |
| 1.0.6.4 | Release | First release. |

---

## Legend: Type

| Type         | Meaning |
|--------------|---------|
| **Feature**    | New functionality available to the user. |
| **Bugfix**     | Fix for incorrect or unintended behavior. |
| **Enhancement**| Improvement of existing features or workflows. |
| **Refactor**   | Internal code changes without affecting functionality. |
| **Release**    | Initial version or formal version milestone. |
| **Removed**    | Removed features or code components. |
'@
  Write-File $p $c
}