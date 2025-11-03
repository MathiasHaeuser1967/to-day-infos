function Write-En-Screen-Impressum {
  $p = Join-Path $DocsEn 'impressum.md'
  $c = @'
# Imprint (Legal Notice)

**Service provider / Operator**  
See the German imprint for the legally binding version.

## Consumer dispute resolution / ODR
We are **not obliged** and **not willing** to participate in dispute resolution proceedings before a consumer arbitration board (VSBG).  
**Note:** The EU ODR platform was discontinued on **2025‑07‑20**.

## Liability for content
As a service provider we are responsible for our own content according to § 7 para. 1 TMG/§ 8 DDG under general laws.  
Under §§ 8–10 TMG/§§ 9–11 DDG, we are **not obliged** to monitor transmitted or stored third‑party information or to investigate circumstances indicating unlawful activity. Obligations to remove or block the use of information under general law remain unaffected. Upon becoming aware of violations, we remove such content immediately.

## Liability for links
Our offer contains links to external websites of third parties on whose content we have no influence. Therefore, we cannot assume any liability for this external content. The respective provider or operator is always responsible for the content of the linked pages. Illegal contents were not recognizable at the time of linking. A permanent content control of the linked pages is not reasonable without specific indications of a violation of law. Upon becoming aware of violations, we remove such links immediately.

## Copyright
The content and works created by the site operator are subject to German copyright law. Duplication, processing, distribution and any kind of exploitation outside the limits of copyright require the written consent of the respective author/creator. Downloads and copies of this site are only permitted for **private, non‑commercial** use.

## Image and source credits
- Weather/Pollen: Deutscher Wetterdienst (DWD) via HTTPS
'@
  Write-File $p $c
}