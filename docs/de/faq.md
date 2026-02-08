# HÃ¤ufige Fragen (FAQ)

> **Kurzfassung:** Android kann Benachrichtigungen und TTS im Hintergrund drosseln (Doze/App-Standby, Akku-Optimierung, â€žNicht stÃ¶ren", fehlende Sonderrechte fÃ¼r **exakte Alarme**). ZusÃ¤tzlich kÃ¶nnen **Alt-Planungen** existieren (z. B. nach App-Updates), die man mit **â€žBenachrichtigungen neu aufbauen"** bereinigt. Unten findest du detaillierte Ursachen, LÃ¶sungen und Diagnosen.

---

## 1) Ich hÃ¶re manchmal keine Sprachausgabe (TTS)

### Symptome

- Zeitansagen bleiben stumm / starten verspÃ¤tet.  
- Ausgabe bricht nach 1â€“2 WÃ¶rtern ab oder nur bei entsperrtem Display hÃ¶rbar.  
- Ausgabe kommt am falschen GerÃ¤t (Bluetooth statt Lautsprecher o. Ã¤.).

### Wahrscheinliche Ursachen (Android/OS)

| Nr. | Ursache | ErklÃ¤rung |
|-----|---------|-----------|
| 1 | **Doze / App-Standby / Akku-Optimierung** | Hintergrund-Audio/Jobs werden gedrosselt. |
| 2 | **â€žNicht stÃ¶ren" (DND)** | Medienausgabe oder Benachrichtigungen unterdrÃ¼ckt. |
| 3 | **Audio-Fokus / Route-Konflikt** | Andere Apps (Musik/Call/Maps) halten den Fokus. |
| 4 | **TTS-Engine** | Sprachpaket fehlt/korrupt; Engine wird vom OS beendet. |
| 5 | **Bluetooth/Route** | Ausgabe wandert auf HFP/A2DP-GerÃ¤te oder Smart-Speaker. |
| 6 | **Medien-LautstÃ¤rke** | (nicht Klingelton!) zu niedrig/stumm. |
| 7 | **Hersteller-Regeln** | MIUI/EMUI/ColorOS killen Apps aggressiv im Hintergrund. |

### Was kann ich tun (Nutzer)

- **Akku-Optimierung fÃ¼r ToDay ausschalten** (System â†’ Akku â†’ Nicht optimieren).  
- **Exakte Alarme** erlauben (Android 13+: *Alarme & Erinnerungen* â†’ ToDay â†’ erlaubt).  
- **Nicht stÃ¶ren** prÃ¼fen; ggf. Ausnahmen fÃ¼r Wecker/Erinnerungen.  
- **Medien-LautstÃ¤rke** erhÃ¶hen; Bluetooth-Route prÃ¼fen/trennen.  
- **TTS-Engine & Stimme** installieren/prÃ¼fen (System-TTS-Einstellungen).  
- ToDay Ã¶ffnen und **â€žBenachrichtigungen neu aufbauen"** ausfÃ¼hren.

### Technischer Hintergrund

TTS startet erst nach Engine-Init + Audio-Fokus. In Doze verschiebt Android Jobs in **Maintenance-Windows**. Ohne `SCHEDULE_EXACT_ALARM` werden Alarme **inexakt** (Â±Minuten).  
Audio-Routen (A2DP/HFP) kÃ¶nnen beim Wechsel kurz **stumm** bleiben, bis Fokus/Route zurÃ¼ckkommt.

**TTS-Pipeline:**

```
[Trigger] â†’ [Berechtigungen?] â†’ [Doze?] â†’ [TTS-Init + Audio-Fokus] â†’ [Audio-Route] â†’ [Ausgabe]
              nein â†’ (stumm)     ja â†’ (verzÃ¶gert)
```

---

## 2) Benachrichtigungen feuern noch, obwohl ich AktivitÃ¤ten gelÃ¶scht habe

### Symptome

- Erinnerung erscheint, obwohl AktivitÃ¤t in ToDay gelÃ¶scht/abgehakt ist.  
- Viele alte â€žZeitansage"/â€žZyklus"-Erinnerungen bleiben aktiv.

### Wahrscheinliche Ursachen

| Nr. | Ursache | ErklÃ¤rung |
|-----|---------|-----------|
| 1 | **Alt-Planungen** | FrÃ¼here App-Versionen â†’ anderes ID/Payload-Schema â‡’ Cancel trifft sie nicht. |
| 2 | **OS-Queue** | Geplante Alarme verbleiben, wenn nicht explizit gecancelt (z. B. nach Crash/Update/Force-Close). |
| 3 | **Boot/Update** | Reschedule/Cancel noch nicht gelaufen. |
| 4 | **Exakte Alarme verweigert** | Cancel-Routinen sehen nur â€žscheduled", nicht â€ždelivered". |

### Was kann ich tun (Nutzer)

- In **AufrÃ¤umen**: **â€žBenachrichtigungen/Alarme stornieren"** aktivieren und ausfÃ¼hren.  
- **Gefahrzone**: **â€žBenachrichtigungen neu aufbauen"** nutzen.

### Technischer Hintergrund

Erinnerungen werden mit deterministischer **ID** + **Payload** geplant. Nach Schema-Ã„nderungen erkennt die Cancel-Logik Ã¤ltere EintrÃ¤ge nicht â†’ **einmaliges** Rebuild leert Alt-Queue.  
Android feuert geplante Alarme weiter, auch wenn der DB-Datensatz bereits entfernt ist, solange der Alarm nicht **explizit** gecancelt wurde.

**Sequenz:**

```
App:  Schedule(id, payload) â†’ [OS-Queue]
App:  Cancel(filter)        â†’ (Schema passt?)
                               ja â†’ gelÃ¶scht
                               nein â†’ bleibt (Waisen-Alarm)
LÃ¶sung: "Benachrichtigungen neu aufbauen"
```

---

## 3) Erinnerungen feuern nicht exakt zum gewÃ¼nschten Zeitpunkt

### Symptome

- AuslÃ¶sung verspÃ¤tet (Minuten) / gar nicht, v. a. bei gesperrtem Display / nachts.

### Wahrscheinliche Ursachen

| Nr. | Ursache | ErklÃ¤rung |
|-----|---------|-----------|
| 1 | **Kein Recht fÃ¼r exakte Alarme** | Android 13+ â†’ OS bÃ¼ndelt/verschiebt. |
| 2 | **Doze / App-Standby / Batterie-Schutz** | Nur Maintenance-Fenster. |
| 3 | **DND / Ruhezeit / Digital Wellbeing** | Benachrichtigungen unterdrÃ¼ckt. |
| 4 | **Zeitzone/Sommerzeit (DST)** | Zeitpunkte existieren doppelt/gar nicht. |
| 5 | **Hersteller-Regeln** | App im Hintergrund eingeschrÃ¤nkt. |

### Was kann ich tun (Nutzer)

- **Exakte Alarme erlauben** (Android 13+).  
- **Akku-Optimierung aus**, Autostart/Hintergrund-AusfÃ¼hrung **erlauben**.  
- **Nicht stÃ¶ren**/Ruhezeiten prÃ¼fen.  
- Keine **Ultra-Energiesparmodi** nutzen.

**Ablauf:**

```
[t] â†’ (exakt erlaubt?) nein â†’ (inexakt Â±Min)
       ja â†’ (Doze?) ja â†’ (Maintenance-Window)
              nein â†’ (exakt bei t)
```

---

## 4) Diagnose-Checkliste (Schnell)

| Bereich | PrÃ¼fpunkt |
|---------|-----------|
| **Berechtigungen** | Benachrichtigungen **erlaubt**; Android 13+: Alarme & Erinnerungen â†’ exakt erlaubt; Mikrofon (Diktat) ok. |
| **Energie & Hintergrund** | Akku-Optimierung fÃ¼r ToDay **deaktiviert**; Hersteller-Spezial: Autostart/BG-AusfÃ¼hrung erlauben. |
| **Audio** | Medien-LautstÃ¤rke â‰  0; kein konkurrierender Player/Call hÃ¤lt den Fokus. |
| **Systemzustand** | â€žNicht stÃ¶ren" aus / Ausnahmen gesetzt; nach Reboot/Update App einmal geÃ¶ffnet (Boot-Reschedule). |
| **App-Wartung** | AufrÃ¤umen â†’ mit â€žBenachrichtigungen stornieren"; Gefahrzone â†’ â€žBenachrichtigungen neu aufbauen". |

---

## 5) Warum hilft â€žBenachrichtigungen neu aufbauen"?

- LÃ¶scht **alle** bekannten geplanten EintrÃ¤ge (inkl. Alt-Schema) aus der System-Queue.  
- Plant alles **konsistent** mit aktuellem Schema (ID/Payload) neu.  
- Behebt â€žWaisen-Alarme" nach Updates/Schema-Ã„nderungen/Crash-Szenarien.

---

## 6) Hersteller-Besonderheiten (Auswahl)

| Hersteller | Empfohlene Einstellung |
|-----------|----------------------|
| **Xiaomi/MIUI** | â€žAutostart erlauben", Akku-Schutz â†’ â€žKeine BeschrÃ¤nkungen". |
| **Huawei/EMUI** | â€žApp-Start verwalten" â†’ â€žAutomatisch verwalten AUS", alles erlauben. |
| **Samsung** | â€žAdaptive Akku"/â€žApp in Standby" â†’ ToDay **ausnehmen**. |
| **OnePlus/OPPO/realme** | â€žApp-Batterieverwaltung" â†’ Keine Begrenzung. |
| **Vivo** | â€žI-Manager" â†’ Energieoptimierung fÃ¼r ToDay deaktivieren. |

---

## 7) Wann ist es kein App-Fehler?

| Situation | ErklÃ¤rung |
|-----------|-----------|
| DND/Doze/Optimierung aktiv | **System** verzÃ¶gert/unterdrÃ¼ckt. |
| Zeitumstellung (DST) | OS **normalisiert** Zeiten. |
| Alarme aus Alt-Version | Einmalig â€žNeu aufbauen" nÃ¶tig. |