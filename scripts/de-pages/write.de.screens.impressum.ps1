function Write-De-Screen-Impressum {
  $p = Join-Path $DocsDe 'impressum.md'
  $c = @'
# Impressum

---

## 1) Diensteanbieter nach § 5 DDG

| Feld | Wert |
|------|------|
| **Name** | Mathias Haeuser |
| **Anschrift** | Auenstrasse 36 · 82515 Wolfratshausen · Deutschland |
| **E-Mail** | [app-today@gmx.de](mailto:app-today@gmx.de) |
| **Vertretungsberechtigt** | Mathias Haeuser |

---

## 2) USt-ID / Wirtschafts-ID

| Feld | Status |
|------|--------|
| **USt-ID (§ 27a UStG)** | nicht vorhanden |
| **Wirtschafts-Identifikationsnummer (§ 139c AO)** | nicht vorhanden |

---

## 3) Aufsichtsbehörde / reglementierte Berufe

Entfällt.

---

## 4) Verbraucherstreitbeilegung / ODR

Wir sind **nicht verpflichtet** und **nicht bereit**, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen (VSBG).  
**Hinweis:** Die EU-ODR-Plattform wurde am **20.07.2025** eingestellt.

---

## 5) Haftung für Inhalte

Als Diensteanbieter sind wir gemäß § 7 Abs. 1 TMG/§ 8 DDG für eigene Inhalte nach den allgemeinen Gesetzen verantwortlich.  
Nach §§ 8–10 TMG/§§ 9–11 DDG sind wir jedoch **nicht verpflichtet**, übermittelte oder gespeicherte fremde Informationen zu überwachen. Verpflichtungen zur Entfernung/Sperrung bleiben unberührt. Eine Haftung ist erst ab Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden entfernen wir Inhalte umgehend.

---

## 6) Haftung für Links

Unser Angebot enthält Links zu externen Websites, auf deren Inhalte wir keinen Einfluss haben. Für diese Inhalte übernehmen wir **keine Gewähr**; verantwortlich ist stets der jeweilige Anbieter. Bei Bekanntwerden von Rechtsverletzungen entfernen wir derartige Links umgehend.

---

## 7) Urheberrecht

Die durch die Seitenbetreiber erstellten Inhalte und Werke unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechts bedürfen der **schriftlichen Zustimmung** des jeweiligen Autors. Downloads/Kopien sind nur für den **privaten, nicht-kommerziellen** Gebrauch gestattet.

---

## 8) Bild- und Quellenhinweise

| Quelle | Verwendung |
|--------|-----------|
| **Deutscher Wetterdienst (DWD)** | Wetter-/Pollendaten. |
| **Material Design Icons** | System-Assets und Icons. |
| **Eigenes Asset** | Favicon/App-Icon. |

---

## 9) Kontakt für rechtliche Anfragen

**E-Mail:** [app-today@gmx.de](mailto:app-today@gmx.de)

**Stand:** 22.01.2026
'@
  Write-File $p $c
}
