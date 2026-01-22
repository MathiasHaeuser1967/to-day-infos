function Write-En-Impressum {
  $p = Join-Path $DocsEn 'impressum.md'
  $c = @'
# Imprint

## 1) Service provider under Sec. 5 DDG
**Name:** Mathias Haeuser  
**Address:** Auenstrasse,36 &middot; 82515 Wolfratshausen &middot; Germany

**Contact:**  
Email: [app-today@gmx.de](mailto:app-today@gmx.de)  

**Authorized representative:** Mathias Haeuser

---

## 2) VAT ID / Economic ID
**VAT ID (Sec. 27a UStG):** "not available"  
**Business identification number (Sec. 139c AO):** "not available"

---

## 3) Supervisory authority / regulated professions (if applicable)
Not applicable.

---

## 4) Consumer dispute resolution / ODR
We are **not obliged** and **not willing** to participate in dispute resolution proceedings before a consumer arbitration board (VSBG).  
**Note:** The EU ODR platform was discontinued on **2025-07-20**.

---

## 5) Liability for content
As a service provider we are responsible for our own content according to Sec. 7(1) TMG / Sec. 8 DDG under general laws.  
Under Secs. 8-10 TMG / Secs. 9-11 DDG, we are **not obliged** to monitor transmitted or stored third-party information. Obligations to remove/block remain unaffected. Liability is only possible from the time of knowledge of a specific infringement. Upon becoming aware, we remove such content immediately.

---

## 6) Liability for links
Our offer contains links to external third-party websites on whose content we have no influence. We therefore **assume no liability** for this external content; the respective provider is always responsible. Upon becoming aware of legal violations, we will remove such links immediately.

---

## 7) Copyright
The content and works created by the site operators are subject to German copyright law. Duplication, processing, distribution and any kind of exploitation outside the limits of copyright require the **written consent** of the respective author. Downloads/copies are permitted for **private, non-commercial** use only.

---

## 8) Image and source credits
- Weather/Pollen: data from the **Deutscher Wetterdienst (DWD)**  
- Other images/icons: app assets / system assets (Material)  
- Favicon/app icon: own asset

---

## 9) Contact for legal inquiries
Email: [app-today@gmx.de](mailto:app-today@gmx.de)

**Last updated:** 2026-01-22
'@
  $enc = New-Object System.Text.UTF8Encoding($true)
  [System.IO.File]::WriteAllText($p, $c, $enc)
}