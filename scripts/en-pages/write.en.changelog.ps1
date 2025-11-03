function Write-En-Changelog {
  $p = Join-Path $DocsEn 'changelog.md'
  $c = @'
# Changelog

- **1.0.5.1** – Initial release.
'@
  Write-File $p $c
}