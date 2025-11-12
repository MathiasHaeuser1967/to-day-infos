function Write-En-Changelog {
  $p = Join-Path $DocsEn 'changelog.md'
  $c = @'
# Changelog

| Version  | Type      | Description |
|----------|-----------|-------------|
| 1.0.6.5  | Feature   | Activities with past date/time can now be created and edited. A warning will appear when saving – no hard restriction anymore. |
| 1.0.6.4  | Release   | Initial release |

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
