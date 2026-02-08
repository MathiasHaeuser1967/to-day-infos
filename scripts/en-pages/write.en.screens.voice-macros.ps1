function Write-En-Screen-VoiceMacros {
  $p = Join-Path $Screens 'voice-macros.md'
  $c = @'
# Voice Macros

With voice macros you speak **short triggers** (e.g., "macro one") and the app automatically replaces them with a **full command text** (expansion). That text is then parsed just like *Voice input (keyboard)* — i.e., into **title, description, date, time**.

---

## 1) Purpose & Principle

The processing chain is: **Trigger → Expansion → Parsing**.

| Step | Description |
|-------|-------------|
| 1. **Trigger** | You speak the short trigger term. |
| 2. **Expansion** | The app replaces it with the stored expansion text. |
| 3. **Parsing** | The parser extracts title/description/date/time from it. |

**Example:**  
Trigger: `macro 1` → Expansion: `Title Shopping Description Milk and bread Date tomorrow Time 6 pm`.

---

## 2) Overview (List)

| Element | Description |
|---------|-------------|
| **Search** | Filters by name/trigger. |
| **Filter chips** | *All* · *Active* · *Inactive*. |
| **New Macro** | **+** (bottom right) or "Create Macro" button in empty state. |

### Entry in the List

| Area | Display |
|-------|---------|
| **Name** (left) | Internal title with **status dot** (green = active, gray = inactive). |
| **Trigger** | e.g., `macro 1`. |
| **Preview** | Short display of how the expansion text would be parsed. |
| **"Active" switch** | For quick on/off toggling. |
| **Menu (⋮)** | Edit/Delete. |

---

## 3) Create / Edit Macro

| Field | Description |
|-------|-------------|
| **Name (for you)** | Internal title, freely selectable. |
| **Trigger (spoken)** | Short, unambiguous words. Avoid easily confused terms; speak clearly. |
| **Expansion (full command text)** | Write here the complete voice command as it should be dictated (see below). |
| **Active** | Make macro immediately usable. |
| **Preview Parsing** | Shows live what the parser currently derives from the expansion. |

### Supported Keywords in the Expansion

Order arbitrary, fields optional:

| Keyword | Example Value |
|---------|--------------|
| **Title …** | Free text (e.g., "Shopping"). |
| **Description …** | Free text (e.g., "Milk and bread"). |
| **Date …** | *today*, *tomorrow*, *day after tomorrow*, *on 22 Oct*, *on Wednesday*. |
| **Time …** | *6 pm*, *07:15*. |

**Example expansion:**  
`Title Shopping Description Milk and bread Date tomorrow Time 6 pm`

Finally: **Save** or **Cancel**.

---

## 4) Usage

1. Dictate in the app (e.g., in the *Voice input (keyboard)* dialog).  
2. Speak **exactly the trigger** → the app replaces it with the **expansion** and applies the recognized fields.  
3. Then quickly review and save.

---

## 5) Manage

| Action | How |
|--------|-----|
| Toggle **Active/Inactive** | Switch in the list. |
| **Edit/Delete** | **⋮** menu of the entry. |
| **Filter** | *All*, *Active* or *Inactive*. |
| **Search** | Find by name/trigger. |

---

## 6) Tips

- Choose **unambiguous triggers** (e.g., "macro one", "meeting template") and test them beforehand.  
- Write a **robust expansion**: clear words, 24-hour time (e.g., *14:30*), avoid unnecessary filler words.  
- **Multiple fields** are possible; not all are mandatory (e.g., only *Title* + *Time*).  
- If something is not recognized correctly: check **Preview** and adjust the expansion.
'@
  Write-File $p $c
}
