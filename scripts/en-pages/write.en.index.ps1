function Write-En-Index {
  $p = Join-Path $DocsEn 'index.md'
  $c = @'
# ToDay – Your Intelligent Daily Hub

Welcome to the **ToDay** documentation. This page provides you with a comprehensive overview of the app’s architecture, features, and technical details.

---

## What is ToDay?

**ToDay** is a native Android app for day-based task and activity management. It combines classic task management with **voice control (TTS/STT)**, **real-time weather data (German version only)**, **gamification elements**, and a **flexible cycle planner** – all in a single, locally operating application.

The app is developed with **Flutter/Dart** and uses a **local SQLite database** – no cloud requirement, no registration, and no dependency on external servers for core functionality.

---

## Core Features at a Glance

| Feature | Description |
|---------|-------------|
| **Day-Based Activities** | Tasks with title, description, date, time, priority, and multiple reminders (combinable offsets). |
| **Intelligent Recurrences** | Full RRULE support: daily, weekly (with day selection), monthly (day or weekday), yearly. End: endless, until date, or after count. |
| **Cycle Planner** | Automatic series generation with scientifically based presets: Pomodoro (25/5), ultradian cycles (90/20), and more. |
| **Time Announcements** | Configurable times (10/15/20/30 min or hourly) with TTS voice output. |
| **Daily Briefing** | Daily briefing via speech output – filterable by priority (high/medium/low) via multi-tap. |
| **Voice Macros** | Trigger-based text expansion with preview parsing and duplicate checking. |
| **German Weather Service Integration** | Weather warnings (8 hazard types) and pollen forecasts (8 pollen types) from the German Weather Service, ZIP code based. *German version only.* |
| **TD Trigger System** | Special activity titles (`TD:brief:high`, `TD:finance:gold`, `TD:steps:today`) trigger automated actions. |
| **Gamification** | Spoken praise phrases for completed overdue tasks, confetti animations, heatbar statistics. |
| **Accessibility** | Font selection including OpenDyslexic (dyslexia-optimized), font size 80%–150%, full TTS support. |

---

## Architecture & Technology

### Technology Stack

| Layer | Technology |
|-------|------------|
| **Framework** | Flutter 3.x / Dart |
| **UI Library** | shadcn/ui (ShadApp) + Material Design 3 |
| **Database** | SQLite (local, no cloud sync) |
| **State Management** | ChangeNotifier / Provider |
| **Notifications** | awesome_notifications (precise alarms, channels) |
| **Speech Output** | flutter_tts (engine/voice/locale configurable) |
| **Weather Data** | DWD Open Data API (German Weather Service) |
| **Fonts** | google_fonts (dynamic, 4 options) |
| **Animations** | Lottie (background), confetti, speed dial |
| **Sensors** | Android STEP_COUNTER (steps today) |

### Data Flow

```mermaid
flowchart TD
  subgraph UI["User Interface"]
    direction LR
    H[Home] --- E[Settings] --- SM[Voice Macros] --- I[Info]
  end
  subgraph STATE["State Management"]
    direction LR
    AS[AppStore] --- LS[LocaleStore] --- CN[ChangeNotifier]
  end
  subgraph SERVICE["Service Layer"]
    direction LR
    AcS[ActivityService] --- ScS[SchedulingService] --- DS[DWD-Service]
    NF[NotificationFacade] --- TS[TTS-Service] --- SC[StepCounter]
  end
  subgraph DATA["Data Layer"]
    direction LR
    SQ[SQLite] --- SP[SharedPreferences] --- FSS[FlutterSecureStorage]
  end
  UI --> STATE --> SERVICE --> DATA
```

---

## Home Screen – The Daily Hub

The home screen is the heart of the app. It shows at a glance:

| Area | Content |
|------|---------|
| **Header** | Date, date navigation, three key figure cards (total, done, high priority), LED indicators for DWD status. |
| **Collapsible Header** | The header can be collapsed – allowing up to three times more visible activities. |
| **Tabs** | Open · Overdue · Done · DWD – with counters in square brackets. *DWD tab only available in German version.* |
| **Activity List** | Sorted by time, with checkbox, tap-to-edit, and long-press context actions. |
| **Speed Dial** | A central FAB with six quick actions: Help, Daily Briefing, Plan Cycle, Voice Command, Cleanup, New Entry. |

---

## TD Trigger System

A special feature of ToDay: **TD Triggers** are special activity titles that trigger automated actions when due.

| Trigger | Action |
|---------|--------|
| `TD:brief:high` | Daily briefing for high priority via TTS. |
| `TD:brief:mid` | Daily briefing for medium priority via TTS. |
| `TD:brief:low` | Daily briefing for low priority via TTS. |
| `TD:finance:gold` | Gold price announcement (source: goldprice.org). |
| `TD:finance:silver` | Silver price announcement (source: goldprice.org). |
| `TD:steps:today` | Steps today via TTS (Android STEP_COUNTER). |

In the activity list, TD triggers are displayed **user-friendly** (e.g., “Daily Briefing High” instead of `TD:brief:high`).

---

## Notification System

ToDay uses a robust, multi-level notification system:

| Feature | Description |
|---------|-------------|
| **Precise Alarms** | Timely triggering (Android 13+ with permission). |
| **Multiple Offsets** | Start, 5/10/15/30 min, 1/2 hr – combinable per activity. |
| **Batch Cancellation** | Related alarms are automatically canceled when deleting/cleaning up. |
| **Rebuild** | “Rebuild notifications” cleans up orphan alarms after updates. |
| **Quiet Times** | DWD notifications respect configurable quiet times. *German version only.* |

---

## Privacy & Security

| Aspect | Implementation |
|--------|----------------|
| **Local Data Storage** | All activities are stored in a local SQLite database. No cloud required. |
| **No Registration** | The app works without account, email, or login. |
| **DWD Data** | Public API of the German Weather Service – no personal data. *German version only.* |
| **Voice Input** | Done via the device’s keyboard app (subject to its privacy policy). |
| **Sensors** | STEP_COUNTER is evaluated locally only, no transmission to third parties. |

---

## App Structure: Dialogs & Menus

### Navigation Structure

```mermaid
graph LR
  Home --> SD[Speed Dial]
  SD --> Help
  SD --> DB[Daily Briefing]
  SD --> CP[Plan Cycle]
  SD --> VC[Voice Command]
  SD --> CL[Cleanup]
  SD --> NE[New Entry]
  Home --> AT[Tap Activity]
  Home --> Menu
  Menu --> Settings
  Menu --> Info
  Menu --> SM[Voice Macros]
```

**Settings Sections:** Language, Design, Display and Text (font, font size, live preview), Notifications, Weather Warnings (German version only), Pollen Forecast (German version only), Voice and Output (TTS), Time Announcements, Background Animation, Gamification, Danger Zone.

**Voice Macros:** Tap entry (edit macro as dialog), long press (edit macro as sheet).

---

## Benefits at a Glance

| Benefit | Description |
|---------|-------------|
| **All-in-One App** | Tasks, cycles, time announcements, weather, pollen, voice control – no app hopping needed. |
| **100% Local** | No cloud, no account, no dependency on external servers. |
| **Voice Controlled** | TTS output, voice input, and voice macros for hands-free operation. |
| **Scientific Cycles** | Pomodoro, ultradian rhythms, and other presets for productive work. |
| **Accessibility** | OpenDyslexic font, scalable font size, full TTS support. |
| **German Weather Service Integration** | Weather warnings and pollen forecasts directly in the daily view – ZIP code precise. *German version only.* |
| **Gamification** | Praise phrases, confetti, and heatbar motivate you to keep going. |
| **Flexible** | Lottie animations per month, dynamic colors (Material You), light/dark mode. |
'@
  Write-File $p $c
}
