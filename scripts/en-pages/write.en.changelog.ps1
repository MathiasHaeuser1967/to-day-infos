function Write-En-Changelog {
  $p = Join-Path $DocsEn 'changelog.md'
  $c = @'
# Changelog

| Version | Type | Description |
|---------|------|-------------|
| 1.0.8.1 | Feature | **Speed Dial FAB:** The six individual Floating Action Buttons on the main page were replaced by a central Speed Dial button. When tapped, all actions fan out vertically upwards (`flutter_speed_dial`). |
|| Feature | **Daily Briefing Badge:** The briefing button in the Speed Dial shows a badge/counter with priority color: 1× ▲ red (high), 2× ■ orange (medium), 3× ▼ green (low). The Speed Dial remains open on the briefing button for multi-tap. |
|| Feature | **Collapsible Header:** The header area on the main page (date, statistic cards, LEDs) can be collapsed via a drag handle. When collapsed, a compact 52 px bar shows date, progress, and high-priority badge. |
|| Feature | **Display & Text:** New settings section with font selection (System / Inter / Roboto Slab / OpenDyslexic), font size slider (80%–150%), and live preview of a sample activity card. |
|| Enhancement | Replaced 32 hardcoded font sizes with dynamic theme references (`Theme.of(context).textTheme`). The app now fully responds to font size settings. |
|| Enhancement | Integrated `google_fonts` package for font selection in settings. |
| 1.0.7.12 | Feature | New app branding: Pony icon (Christmas bell) added as the new app logo and integrated as a PNG asset in the project. |
|| Feature | AppBar menu button replaced: the three dots were replaced by the Pony icon. Tapping still opens the menu. |
|| Enhancement | Header area below the title (ShadCard) visually aligned to activity cards: width reduced by central horizontal padding so header and activity surfaces are flush. |
|| Enhancement | Header corners now fully rounded: same radius top and bottom for a calmer overall look. |
|| Enhancement | TabBar area adjusted to the same flush width as the header so all top elements are consistently aligned. |
|| Feature | New TD Steps Today trigger in the title: `TD:steps:today`. When such an activity is due, instead of the title, the number of **steps today** is spoken aloud. |
|| Feature | TD Steps Today calculation via Android sensor **STEP_COUNTER** without external services. Daily value calculated as difference: current STEP_COUNTER minus daily start baseline. |
|| Feature | TD Steps Today baseline logic (variant A): On first trigger of the day, baseline is set and clearly announced. From second trigger on the same date, the difference is spoken. |
|| Feature | TD Steps Today reset case: If current STEP_COUNTER is less than baseline, a sensor reset or device restart is assumed, baseline is reset, and counting restarts at 0 from then on. |
|| Enhancement | TD Steps Today error status instead of silent 0: If permission (ACTIVITY_RECOGNITION) or sensor value is missing, a clear error status is generated and spoken. |
|| Enhancement | Android STEP_COUNTER connection stabilized: sensor value is continuously updated in the app process so a second trigger call without a step event can deliver correct values at that moment. |
|| Feature | Home mini-status line introduced: Directly above the LED line, **steps today** is shown in the LED warning font size. Supports German and English. |
|| Enhancement | Home mini-status is extensible: the line is designed so that further small status values can be added later without restructuring the layout. |
|| Enhancement | Home mini-status values updated via existing day change watcher every minute, without new background services. |
| 1.0.7.11 | Feature | Daily Briefing button added on Home. Voice output lists open activities for today by priority. |
|| Feature | Multi-tap on the Daily Briefing button: 1× high priority, 2× medium priority, 3× low priority. Time window for multi-click defined internally. |
|| Feature | Voice output for Daily Briefing in German and English depending on current app language. |
|| Feature | TD triggers in title: `TD:brief:high`, `TD:brief:mid`, `TD:brief:low`. When such an activity is due, a generated daily briefing is spoken instead of the title. |
|| Feature | TD briefing filter by priority: `TD:brief:high` speaks only **High**, `TD:brief:mid` only **Medium**, `TD:brief:low` only **Low**. Other priorities are not read aloud. |
|| Feature | TD briefing scope and rules: applies to the day of the trigger activity, sorts tasks with time ascending first, then without time, limits to max 5 with time and max 3 without time, adds "and more tasks" if there are more. The TD trigger activity itself and all titles starting with `TD:` are not spoken. |
|| Feature | Friendly display for TD triggers in the activity list instead of raw token. German: Tagesbriefing High, Medium, Low. English: Daily Briefing High, Mid, Low. Stored title remains unchanged. |
|| Feature | New TD Finance trigger in title: `TD:finance:gold`, `TD:finance:silver`. When such an activity is due, a generated price announcement is spoken instead of the title. |
|| Feature | TD Finance data source and mapping: endpoint `https://data-asg.goldprice.org/dbXRates/USD`. Gold uses `xauClose`, silver uses `xagClose` as price in USD. |
|| Feature | TD Finance cache layer: prices cached per metal for about 10 to 15 minutes or until app restart to avoid multiple fetches during scheduling. |
|| Feature | TD Finance offline and error case: no network calls in notification callback. On network error, scheduling still occurs and a clear fallback announcement is generated. No crash, no blocking of notification system. |
|| Feature | TD Finance notification rules: default loud with sound, allowWhileIdle enabled. No duplicate notification at start time for trigger activities. |
|| Feature | Friendly display for TD Finance triggers in activity list instead of raw token. German: Gold price announcement, Silver price announcement. English: Gold price announcement, Silver price announcement. |
|| Bugfix | Daily Briefing speech now consistently filters out all activities whose title starts with `TD:` so trigger activities are not read as normal tasks. |
|| Enhancement | Bottom action buttons on Home now two-row, original size restored for better tapping. |
|| Bugfix | Fixed build error in multi-tap Daily Briefing (timer constant and clamp int conversion). |
|| Bugfix | Timer is correctly stopped when Home is closed to reduce side effects. |
| 1.0.7.10 | Feature | Appearance improved. When Dynamic Colors are off, the app now uses a vivid orange base with matching accent colors. Shad UI uses orange. System theme remains unchanged. |
|| Feature | Splash screen with loading indicator and support box for copying info and restarting. |
|| Enhancement | More stable app start with short splash and watchdog hint on delay. |
|| Enhancement | Cold start accelerated. Heavy initialization moved behind first frame via AppBootstrap. UI renders faster. |
|| Enhancement | StartupMetrics logs first-frame time and frame timings for diagnostics. |
|| Enhancement | DataWarmup uses compute and isolate for JSON parsing and preparation. |
|| Enhancement | AssetWarmup loads images into cache only after first frame. |
|| Enhancement | BatteryHelper only on demand from settings. Texts come from l10n German and English. |
|| Enhancement | Notifications consolidated in _initNotifications. Foreground chime port registered cleanly. |
|| Enhancement | onCreate lightened. runApp starts earlier. Splash navigates only when bootstrap is ready. |
|| Bugfix | Fixed "ShadTheme.of()" error. ShadApp is now the root wrapper. |
|| Bugfix | Fixed "darkData" build error. Switched to new ShadTheme API with theme and darkTheme fields. |
|| Bugfix | Removed manually added awesome_notifications BootReceiver. |
|| Bugfix | ForegroundChime init without await. More stable notification start. |
| 1.0.6.6 | Enhancement | Default speech rate on first install reduced from 1.0 to 0.5 for a more pleasant voice output. |
| 1.0.6.5 | Feature | Activities with past date/time can now be created and edited. On save a warning appears – no hard block anymore. |
| 1.0.6.4 | Release | First release. |

---

## Legend: Type

| Type | Meaning |
|------|---------|
| **Feature** | New functionality available to the user. |
| **Bugfix** | Fix for incorrect or unintended behavior. |
| **Enhancement** | Improvement of existing features or workflows. |
| **Refactor** | Internal code restructuring without functional change. |
| **Release** | Initial release or formal version milestone. |
| **Removed** | Removed features or code components. |
'@
  Write-File $p $c
}
