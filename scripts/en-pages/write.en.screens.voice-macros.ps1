function Write-En-Screen-VoiceMacros {
  $p = Join-Path $Screens 'voice-macros.md'
  $c = @'
# Voice macros

With voice macros you speak **short triggers** (e.g., "macro one") and the app automatically replaces them with a **full command text** (expansion). That text is then parsed just like *Voice input via keyboard* &mdash; i.e., into **title, description, date, time**.

---

## 1) Purpose & principle
- **Trigger &rarr; Expansion &rarr; Parsing**  
  1) You speak the *trigger*.  
  2) The app replaces it with the stored *expansion* text.  
  3) The parser extracts title/description/date/time from it.
- Example:  
  Trigger: `macro 1` &rarr; Expansion: `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`.

---

## 2) Overview (list)
- **Search**: filters by name/trigger.
- **Filter chips**: *All* &middot; *Active* &middot; *Inactive*.
- **New macro**: **+** (bottom right) or the "Create macro" button in the empty state.
- **Entry** shows:
  - **Name** (left) and **status dot** (green = active, gray = inactive).
  - **Trigger** (e.g., `macro 1`).
  - **Preview**: brief preview of how the expansion text would be parsed.
  - **"Active" switch** to quickly toggle on/off.
  - **Menu (&#8942;)**: edit/delete (depending on version).

---

## 3) Create/edit macro
- **Name (for you)**  
  Internal title, freely selectable.
- **Trigger (spoken)**  
  Short, unambiguous words. Avoid terms that are easily confused; speak clearly.
- **Expansion (full command text)**  
  Write the complete voice command here as it should be dictated.  
  Supported keywords (any order, fields optional):
  - **Title ...**
  - **Description ...**
  - **Date ...** &ndash; e.g., *today*, *tomorrow*, *the day after tomorrow*, *on 22 Oct*, *on Wednesday*.
  - **Time ...** &ndash; e.g., *6 pm*, *07:15*.  
  Example expansion:  
  `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`
- **Active**: make the macro available immediately.
- **Preview parsing**  
  Shows live what the parser currently derives from the expansion (**title/description/date/time**).
- **Save** / **Cancel**.

---

## 4) Usage
- Dictate in the app (e.g., in the *Voice input via keyboard* dialog).  
- Speak **exactly the trigger** &rarr; the app replaces it with the **expansion** and takes over the recognized fields.  
- Then quickly review and save.

---

## 5) Manage
- Toggle **Active/Inactive** via the switch in the list.
- **Edit/Delete** via the entry's **&#8942;** menu.
- **Filter**: *All*, *Active* or *Inactive*.
- **Search**: find by name/trigger.

---

## 6) Tips
- Choose **unambiguous triggers** (e.g., "macro one", "meeting template") and test them first.
- Write a **robust expansion**: clear words, 24-hour time (e.g., *14:30*), avoid unnecessary filler words.
- **Multiple fields** are possible; not all are mandatory (e.g., only *Title* + *Time*).
- If something is not recognized properly: check **Preview** and adjust the expansion.
'@
  Write-File $p $c
}