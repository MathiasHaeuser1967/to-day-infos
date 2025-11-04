function Write-En-Changelog {
  $p = Join-Path $DocsEn 'changelog.md'
  $c = @'
# Changelog

- **1.0.6.4** &ndash; Initial release.
'@
  Write-File $p $c
}
