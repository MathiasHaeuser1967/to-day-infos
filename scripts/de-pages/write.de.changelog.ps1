function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

- **1.0.5.1** &ndash; Erste Ver&ouml;ffentlichung.
'@
  Write-File $p $c
}
