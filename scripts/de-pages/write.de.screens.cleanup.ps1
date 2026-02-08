function Write-De-Screen-Cleanup {
  $p = Join-Path $Screens 'cleanup.md'
  $c = @'
# Aufräumen

Mit **Aufräumen** entfernst du Aktivitäten eines Tages – optional inklusive der zugehörigen **Benachrichtigungen/Alarme**. Die Wirkung gilt immer für das **gewählte Datum**.

---

## 1) Datum wählen

| Option | Beschreibung |
|--------|-------------|
| **Gestern / Heute / Morgen** | Schnellauswahl. |
| **Datumsanzeige** | Zeigt das Ziel-Datum, auf das sich die Bereinigung bezieht. |

---

## 2) Wähle, was gelöscht werden soll (Quelle)

Du wählst **genau eine Quelle**. Nur Einträge, die an diesem Tag **aus dieser Quelle** stammen, werden gelöscht:

| Quelle | Beschreibung |
|--------|-------------|
| **Zyklus planen** | Automatisch aus wiederkehrenden Zyklen erzeugte Aktivitäten. |
| **Zeitansagen** | Aktivitäten, die durch Zeitansagen entstanden sind. |

!!! info "Sicherheit"
    Andere Quellen bleiben unangetastet. Du veränderst nicht versehentlich Inhalte außerhalb der gewählten Quelle.

---

## 3) Optionen

### Nur offene Aktivitäten

| Einstellung | Wirkung |
|-------------|---------|
| **Ein** | Löscht **nur** Einträge, die **nicht** als *Erledigt* markiert sind. |
| **Aus** | Löscht **alle** passenden Einträge – offen **und** erledigt. |

### Benachrichtigungen/Alarme stornieren

| Einstellung | Wirkung |
|-------------|---------|
| **Ein** | Entfernt zusätzlich **alle** zu den gelöschten Aktivitäten gehörenden Benachrichtigungen – sowohl **geplante** als auch bereits **angezeigte**. |
| **Aus** | Es werden nur Aktivitäten gelöscht; vorhandene Benachrichtigungen bleiben zunächst sichtbar. |

!!! tip
    Aktivieren, wenn du „liegengebliebene" Erinnerungen vollständig aufräumen möchtest.

---

## 4) Löschen ausführen

| Schritt | Aktion |
|---------|--------|
| 1 | Datum und **Quelle** wählen. |
| 2 | **Optionen** prüfen/setzen. |
| 3 | **Löschen** tippen → der Dialog schließt, und du kehrst zu **Home** zurück. |
'@
  Write-File $p $c
}
