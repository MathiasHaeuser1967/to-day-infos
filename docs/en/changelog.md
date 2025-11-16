# Changelog

| Version | Type | Description |
|---|---|---|
| 1.0.7.0 | Feature | Appearance improved. When Dynamic Colors are off, the app now uses a strong orange base with matching accents. Shad UI uses orange. System behavior stays the same. |
| | Feature | Splash screen with loading indicator and a support box to copy and restart. |
| | Enhancement | More stable app start with a short splash and a watchdog notice if startup is delayed. |
| | Bugfix | Fixed "ShadTheme.of()". ShadApp is now the root wrapper. |
| | Bugfix | Fixed "darkData" build error. Migrated to the new ShadTheme API with "theme" and "darkTheme" fields. |
| | Bugfix | The manually added awesome_notifications BootReceiver was removed. |
| 1.0.6.6 | Enhancement | The default speech rate on first install was reduced from 1.0 to 0.5 to improve the listening experience. |
| 1.0.6.5 | Feature | Activities with past date/time can now be created and edited. A warning will appear when saving, no hard restriction anymore. |
| 1.0.6.4 | Release | Initial release |

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