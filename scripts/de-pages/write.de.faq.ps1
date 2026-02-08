function Write-De-FAQ {
  $p = Join-Path $DocsDe 'faq.md'
  $c = @'
# Häufige Fragen (FAQ)

> **Kurzfassung:** Android kann Benachrichtigungen und TTS im Hintergrund drosseln (Doze/App-Standby, Akku-Optimierung, „Nicht stören", fehlende Sonderrechte für **exakte Alarme**). Zusätzlich können **Alt-Planungen** existieren (z. B. nach App-Updates), die man mit **„Benachrichtigungen neu aufbauen"** bereinigt. Unten findest du detaillierte Ursachen, Lösungen und Diagnosen.

---

## 1) Ich höre manchmal keine Sprachausgabe (TTS)

### Symptome

- Zeitansagen bleiben stumm / starten verspätet.  
- Ausgabe bricht nach 1–2 Wörtern ab oder nur bei entsperrtem Display hörbar.  
- Ausgabe kommt am falschen Gerät (Bluetooth statt Lautsprecher o. ä.).

### Wahrscheinliche Ursachen (Android/OS)

| Nr. | Ursache | Erklärung |
|-----|---------|-----------|
| 1 | **Doze / App-Standby / Akku-Optimierung** | Hintergrund-Audio/Jobs werden gedrosselt. |
| 2 | **„Nicht stören" (DND)** | Medienausgabe oder Benachrichtigungen unterdrückt. |
| 3 | **Audio-Fokus / Route-Konflikt** | Andere Apps (Musik/Call/Maps) halten den Fokus. |
| 4 | **TTS-Engine** | Sprachpaket fehlt/korrupt; Engine wird vom OS beendet. |
| 5 | **Bluetooth/Route** | Ausgabe wandert auf HFP/A2DP-Geräte oder Smart-Speaker. |
| 6 | **Medien-Lautstärke** | (nicht Klingelton!) zu niedrig/stumm. |
| 7 | **Hersteller-Regeln** | MIUI/EMUI/ColorOS killen Apps aggressiv im Hintergrund. |

### Was kann ich tun (Nutzer)

- **Akku-Optimierung für ToDay ausschalten** (System → Akku → Nicht optimieren).  
- **Exakte Alarme** erlauben (Android 13+: *Alarme & Erinnerungen* → ToDay → erlaubt).  
- **Nicht stören** prüfen; ggf. Ausnahmen für Wecker/Erinnerungen.  
- **Medien-Lautstärke** erhöhen; Bluetooth-Route prüfen/trennen.  
- **TTS-Engine & Stimme** installieren/prüfen (System-TTS-Einstellungen).  
- ToDay öffnen und **„Benachrichtigungen neu aufbauen"** ausführen.

### Technischer Hintergrund

TTS startet erst nach Engine-Init + Audio-Fokus. In Doze verschiebt Android Jobs in **Maintenance-Windows**. Ohne `SCHEDULE_EXACT_ALARM` werden Alarme **inexakt** (±Minuten).  
Audio-Routen (A2DP/HFP) können beim Wechsel kurz **stumm** bleiben, bis Fokus/Route zurückkommt.

**TTS-Pipeline:**

```
[Trigger] → [Berechtigungen?] → [Doze?] → [TTS-Init + Audio-Fokus] → [Audio-Route] → [Ausgabe]
              nein → (stumm)     ja → (verzögert)
```

---

## 2) Benachrichtigungen feuern noch, obwohl ich Aktivitäten gelöscht habe

### Symptome

- Erinnerung erscheint, obwohl Aktivität in ToDay gelöscht/abgehakt ist.  
- Viele alte „Zeitansage"/„Zyklus"-Erinnerungen bleiben aktiv.

### Wahrscheinliche Ursachen

| Nr. | Ursache | Erklärung |
|-----|---------|-----------|
| 1 | **Alt-Planungen** | Frühere App-Versionen → anderes ID/Payload-Schema ⇒ Cancel trifft sie nicht. |
| 2 | **OS-Queue** | Geplante Alarme verbleiben, wenn nicht explizit gecancelt (z. B. nach Crash/Update/Force-Close). |
| 3 | **Boot/Update** | Reschedule/Cancel noch nicht gelaufen. |
| 4 | **Exakte Alarme verweigert** | Cancel-Routinen sehen nur „scheduled", nicht „delivered". |

### Was kann ich tun (Nutzer)

- In **Aufräumen**: **„Benachrichtigungen/Alarme stornieren"** aktivieren und ausführen.  
- **Gefahrzone**: **„Benachrichtigungen neu aufbauen"** nutzen.

### Technischer Hintergrund

Erinnerungen werden mit deterministischer **ID** + **Payload** geplant. Nach Schema-Änderungen erkennt die Cancel-Logik ältere Einträge nicht → **einmaliges** Rebuild leert Alt-Queue.  
Android feuert geplante Alarme weiter, auch wenn der DB-Datensatz bereits entfernt ist, solange der Alarm nicht **explizit** gecancelt wurde.

**Sequenz:**

```
App:  Schedule(id, payload) → [OS-Queue]
App:  Cancel(filter)        → (Schema passt?)
                               ja → gelöscht
                               nein → bleibt (Waisen-Alarm)
Lösung: "Benachrichtigungen neu aufbauen"
```

---

## 3) Erinnerungen feuern nicht exakt zum gewünschten Zeitpunkt

### Symptome

- Auslösung verspätet (Minuten) / gar nicht, v. a. bei gesperrtem Display / nachts.

### Wahrscheinliche Ursachen

| Nr. | Ursache | Erklärung |
|-----|---------|-----------|
| 1 | **Kein Recht für exakte Alarme** | Android 13+ → OS bündelt/verschiebt. |
| 2 | **Doze / App-Standby / Batterie-Schutz** | Nur Maintenance-Fenster. |
| 3 | **DND / Ruhezeit / Digital Wellbeing** | Benachrichtigungen unterdrückt. |
| 4 | **Zeitzone/Sommerzeit (DST)** | Zeitpunkte existieren doppelt/gar nicht. |
| 5 | **Hersteller-Regeln** | App im Hintergrund eingeschränkt. |

### Was kann ich tun (Nutzer)

- **Exakte Alarme erlauben** (Android 13+).  
- **Akku-Optimierung aus**, Autostart/Hintergrund-Ausführung **erlauben**.  
- **Nicht stören**/Ruhezeiten prüfen.  
- Keine **Ultra-Energiesparmodi** nutzen.

**Ablauf:**

```
[t] → (exakt erlaubt?) nein → (inexakt ±Min)
       ja → (Doze?) ja → (Maintenance-Window)
              nein → (exakt bei t)
```

---

## 4) Diagnose-Checkliste (Schnell)

| Bereich | Prüfpunkt |
|---------|-----------|
| **Berechtigungen** | Benachrichtigungen **erlaubt**; Android 13+: Alarme & Erinnerungen → exakt erlaubt; Mikrofon (Diktat) ok. |
| **Energie & Hintergrund** | Akku-Optimierung für ToDay **deaktiviert**; Hersteller-Spezial: Autostart/BG-Ausführung erlauben. |
| **Audio** | Medien-Lautstärke ≠ 0; kein konkurrierender Player/Call hält den Fokus. |
| **Systemzustand** | „Nicht stören" aus / Ausnahmen gesetzt; nach Reboot/Update App einmal geöffnet (Boot-Reschedule). |
| **App-Wartung** | Aufräumen → mit „Benachrichtigungen stornieren"; Gefahrzone → „Benachrichtigungen neu aufbauen". |

---

## 5) Warum hilft „Benachrichtigungen neu aufbauen"?

- Löscht **alle** bekannten geplanten Einträge (inkl. Alt-Schema) aus der System-Queue.  
- Plant alles **konsistent** mit aktuellem Schema (ID/Payload) neu.  
- Behebt „Waisen-Alarme" nach Updates/Schema-Änderungen/Crash-Szenarien.

---

## 6) Hersteller-Besonderheiten (Auswahl)

| Hersteller | Empfohlene Einstellung |
|-----------|----------------------|
| **Xiaomi/MIUI** | „Autostart erlauben", Akku-Schutz → „Keine Beschränkungen". |
| **Huawei/EMUI** | „App-Start verwalten" → „Automatisch verwalten AUS", alles erlauben. |
| **Samsung** | „Adaptive Akku"/„App in Standby" → ToDay **ausnehmen**. |
| **OnePlus/OPPO/realme** | „App-Batterieverwaltung" → Keine Begrenzung. |
| **Vivo** | „I-Manager" → Energieoptimierung für ToDay deaktivieren. |

---

## 7) Wann ist es kein App-Fehler?

| Situation | Erklärung |
|-----------|-----------|
| DND/Doze/Optimierung aktiv | **System** verzögert/unterdrückt. |
| Zeitumstellung (DST) | OS **normalisiert** Zeiten. |
| Alarme aus Alt-Version | Einmalig „Neu aufbauen" nötig. |
'@
  Write-File $p $c
}
