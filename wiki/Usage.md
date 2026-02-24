# Usage

Complete end-to-end guide for using the Medic app, including every screen, interaction, and edge case.

---

## Screen Walkthrough

### Screen 1 — Home Screen

**File:** `lib/screens/home_screen.dart`

The home screen is the entry point. It displays:
- App bar with the title **"Medic"**
- A centered **"Select Image"** elevated button

**Action:** Tap **"Select Image"** → opens the Options Dialog.

---

### Screen 2 — Options Dialog

**File:** `lib/screens/options_dialog.dart`

An `AlertDialog` with the title **"Choose an option"** containing two buttons side-by-side:

| Button | Icon | Action |
|---|---|---|
| **Camera** | `camera_alt_outlined` | Opens device camera |
| **Gallery** | `image_outlined` | Opens photo library picker |

**Camera flow:** The device camera opens. Take a photo of your medicine label → the image is passed to the Crop Screen.

**Gallery flow:** The system photo picker opens. Select an existing photo → the image is passed to the Crop Screen.

> If no image is selected (user dismisses the picker), a snack bar shows **"No image selected"** and the dialog remains open.

---

### Screen 3 — Crop Screen

**File:** `lib/screens/crop_screen.dart`

Displays the selected image inside a full-screen interactive crop widget (`crop_your_image`).

**Controls:**
- Drag the crop handles to frame the medicine label text
- Pinch or drag to pan and zoom the image
- Tap **"Crop"** in the bottom bar to confirm

**Loading state:** While cropping is in progress, the button shows a `CircularProgressIndicator` and is disabled to prevent double-taps.

**After crop:** The cropped `Uint8List` is written to a temporary file and passed to Google ML Kit for OCR processing. The app navigates to the Output Screen once recognition is complete.

---

### Screen 4 — Output Screen

**File:** `lib/screens/output_screen.dart`

The result screen. Displayed after successful OCR.

#### Text Display

- The recognised text appears in a white, rounded card with shadow
- The text is in an editable `TextField` — tap anywhere in the text to correct OCR errors
- If no text was found, a red message is shown: **"Could not find any text in image. Try again"**

#### Automatic Text-to-Speech

- On screen load, the app **automatically reads the extracted text aloud**
- Uses `WidgetsBinding.instance.addPostFrameCallback` to speak after the first frame renders
- Uses `FlutterTts` with volume 1.0, speech rate 1.0, and pitch 1.0

#### Replay Speech

- Tap the **🔊 floating action button** (bottom-right) to replay TTS at any time
- The FAB replays the **current** text in the text field (including any edits made)

#### Reminders Section

Below the text card (only shown when text is present):

1. **List of reminders** — each shows reminder name and scheduled time with a 🗑️ delete button
2. **"Add Reminder" button** — opens the Add Reminder dialog

**Deleting a reminder:** Tap the red trash icon on any reminder tile → removed immediately.

---

### Dialog — Add Reminder

Opened from the Output Screen by tapping **"Add Reminder"**.

**Fields:**

| Field | Input | Required |
|---|---|:---:|
| Reminder Text | Free-text field | Yes |
| Time | System time picker (`TimePicker`) | Yes |

**Flow:**
1. Enter a reminder name (e.g. *"Take blood pressure pill"*)
2. Tap **"Select Time"** → system time picker opens
3. The button label updates to show the selected time (e.g. *"Selected: 08:30 AM"*)
4. Tap **"Add"** → reminder appears in the list on the Output Screen
5. Tap **"Cancel"** → closes without saving

> If either field is empty on **"Add"**, a snack bar reminds: *"Please enter reminder text and select time."*

---

## Complete User Flow (Summary)

```
Launch App
  │
  ▼
Home Screen ──[Tap "Select Image"]──► Options Dialog
                                         │
                              ┌──────────┴──────────┐
                              ▼                     ▼
                          Camera              Gallery Picker
                              └──────────┬──────────┘
                                         ▼
                                    Crop Screen
                                         │
                                 [Tap "Crop"]
                                         ▼
                              OCR Processing (ML Kit)
                                         │
                                         ▼
                                   Output Screen
                                    ├─ Read text aloud (auto)
                                    ├─ Edit text (optional)
                                    ├─ Add reminder (optional)
                                    └─ Share text (FAB)
```

---

## Sharing Extracted Text

From the Output Screen:
1. Edit the text if needed
2. Tap the **share icon** in the app bar or the floating action button (if wired)
3. The system share sheet opens — share to Messages, Email, Notes, etc.

> **Note:** In v1.0.0 the share action is triggered via `OCRcontroller.shareOutput()` which calls `Share.share(text)` from `share_plus`.

---

## Tips for Best OCR Results

| Tip | Why it helps |
|---|---|
| Crop tightly around the label text | Reduces noise from background patterns |
| Use good lighting | ML Kit performs best on well-lit, high-contrast text |
| Hold the camera steady | Motion blur significantly reduces OCR accuracy |
| Use gallery for existing photos | Allows choosing the clearest available image |
| Prefer printed labels | Handwritten text is not supported by the Latin script model |

---

## Accessibility Usage

- The app reads every scan result aloud automatically — no action needed
- To replay: tap the **🔊 FAB** at the bottom right of the Output Screen
- To correct a misread word: tap the text field, make edits, then tap **🔊 FAB** to re-read
- All interactive elements meet the 48×48dp minimum touch target size
- Dark mode is automatically applied based on system preference

---

## Known Limitations (v1.0.0)

| Limitation | Impact | Planned fix |
|---|---|:---:|
| Reminders are in-session only | Lost on app restart | v1.1 — local storage |
| No device push notification at reminder time | Reminder is visual only | v1.1 — zonedSchedule |
| Latin-script OCR only | Non-Latin labels not supported | v1.2 — multi-script |
| No scan history | Each session starts fresh | v1.3 |
