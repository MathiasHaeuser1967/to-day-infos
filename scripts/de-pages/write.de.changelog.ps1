function Write-De-Changelog {
  $p = Join-Path $DocsDe 'changelog.md'
  $c = @'
# Changelog

- **1.0.0** &ndash; Erste Ver&ouml;ffentlichung der deutschen Hilfe.
'@
  Write-File $p $c
}
