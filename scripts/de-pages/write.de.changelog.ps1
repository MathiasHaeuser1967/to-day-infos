function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

- **1.0.6.4** &ndash; Erste Ver&ouml;ffentlichung.
'@
  Write-File $p $c
}
