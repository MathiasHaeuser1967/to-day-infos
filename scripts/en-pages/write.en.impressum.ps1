function Write-En-Impressum {
  $p = Join-Path $DocsEn 'impressum.md'
  $c = @'
# Imprint

---

## 1) Service Provider according to § 5 DDG

| Field | Value |
|-------|-------|
| **Name** | Mathias Haeuser |
| **Address** | Auenstrasse 36 · 82515 Wolfratshausen · Germany |
| **E-Mail** | [app-today@gmx.de](mailto:app-today@gmx.de) |
| **Authorized Representative** | Mathias Haeuser |

---

## 2) VAT ID / Business ID

| Field | Status |
|-------|--------|
| **VAT ID (§ 27a UStG)** | not available |
| **Business Identification Number (§ 139c AO)** | not available |

---

## 3) Supervisory Authority / Regulated Professions

Not applicable.

---

## 4) Consumer Dispute Resolution / ODR

We are **not obligated** and **not willing** to participate in dispute resolution proceedings before a consumer arbitration board (VSBG).  
**Note:** The EU ODR platform was discontinued on **20.07.2025**.

---

## 5) Liability for Content

As service providers, we are responsible for our own content according to § 7 Abs. 1 TMG/§ 8 DDG under general laws.  
However, according to §§ 8–10 TMG/§§ 9–11 DDG, we are **not obligated** to monitor transmitted or stored external information. Obligations to remove or block remain unaffected. Liability is only possible from the time of knowledge of a concrete infringement. Upon becoming aware, we will remove content immediately.

---

## 6) Liability for Links

Our offer contains links to external websites over whose content we have no influence. We **do not assume any liability** for these external contents; the respective provider is always responsible. Upon becoming aware of legal violations, we will remove such links immediately.

---

## 7) Copyright

The content and works created by the site operators are subject to German copyright law. Duplication, processing, distribution, and any kind of exploitation outside the limits of copyright require the **written consent** of the respective author. Downloads/copies are only permitted for **private, non-commercial** use.

---

## 8) Image and Source Credits

| Source | Usage |
|--------|-------|
| **Deutscher Wetterdienst (DWD)** | Weather/Pollen data. |
| **Material Design Icons** | System assets and icons. |
| **Own Asset** | Favicon/App icon. |

---

## 9) Contact for Legal Inquiries

**E-Mail:** [app-today@gmx.de](mailto:app-today@gmx.de)

**Status:** 22.01.2026
'@
  Write-File $p $c
}
