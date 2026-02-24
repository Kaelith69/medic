# Privacy

> Medic is built on a **privacy-by-design** foundation. No user data, images, or extracted text leave the device under any circumstances.

---

## Privacy Model Summary

| Concern | Medic's Position |
|---|---|
| **Network calls** | None — zero outbound HTTP requests |
| **Data storage** | No persistent storage of any user data in v1.0.0 |
| **Image retention** | Images are written to a OS temp file and never persisted to user storage |
| **Text retention** | OCR output exists only in memory during the session |
| **Analytics** | None — no crash reporters, analytics SDKs, or telemetry |
| **Third-party data sharing** | None — no data is sent to any third party |
| **Advertising** | None |
| **Account / login** | None |

---

## Data Handling Details

### Camera and Gallery Images

1. The user selects or captures an image via `image_picker`
2. The image bytes (`Uint8List`) are held in RAM only
3. During OCR, bytes are written to `Directory.systemTemp/temp_ocr.png` — the OS temp directory
4. The temp file is **never written to user-accessible storage** (no gallery, no app Documents folder)
5. The OS automatically clears temp files as part of normal device housekeeping
6. No copy of the image is retained after the `OutputScreen` is disposed

### Extracted Text

1. OCR output (`String`) is passed to `OutputScreen` via constructor parameter
2. The text is held in a `TextEditingController` and a `String` state variable
3. When the user navigates away or closes the app, the `OutputScreen` is disposed and all text is lost
4. The text is **never written to local storage, database, or any file**

### Reminders

1. Reminders are stored in a `List<Reminder>` in `_OutputScreenState` memory
2. Each `Reminder` holds a user-entered string and a `TimeOfDay`
3. All reminders are destroyed when `OutputScreen` is disposed (app restart or back navigation)
4. No reminder data is written to any persistent storage in v1.0.0

---

## Permissions

Medic requests only two permissions, and only when the corresponding action is taken:

| Permission | Platform | When requested | Why required |
|---|---|---|---|
| `CAMERA` | Android | When user taps "Camera" | To open the device camera for label scanning |
| `READ_EXTERNAL_STORAGE` / `READ_MEDIA_IMAGES` | Android | When user taps "Gallery" | To access the photo library |
| `NSCameraUsageDescription` | iOS | When user taps "Camera" | Required by iOS for camera access |
| `NSPhotoLibraryUsageDescription` | iOS | When user taps "Gallery" | Required by iOS for photo library access |

**No other permissions are requested or used.**

Microphone access is **not** requested — TTS is output only and does not use the microphone.

---

## Third-Party SDKs and Privacy

| SDK | Network access | Data collection | Notes |
|---|---|:---:|---|
| `google_mlkit_text_recognition` | ❌ None | ❌ None | On-device model only; no Google servers contacted |
| `flutter_tts` | ❌ None | ❌ None | Uses native OS TTS engine; no network |
| `flutter_local_notifications` | ❌ None | ❌ None | Local-only notifications |
| `image_picker` | ❌ None | ❌ None | OS-level file picker |
| `crop_your_image` | ❌ None | ❌ None | Pure Dart image manipulation |
| `share_plus` | ❌ None* | ❌ None | Invokes OS share sheet; data goes only where user directs |
| `cupertino_icons` | ❌ None | ❌ None | Asset bundle only |

> \* `share_plus` opens the OS share sheet. Once the user selects a destination app, data handling is governed by that app's privacy policy.

---

## Children's Privacy

Medic does not collect any personal information and is therefore safe for use by users of any age. The app has no age restrictions, user accounts, or profile data.

---

## Security Considerations

| Concern | Mitigation |
|---|---|
| Sensitive medical label content | OCR text is ephemeral (in-memory only); cleared on app close |
| Temp file exposure | Written to OS temp dir with a fixed name; OS manages lifecycle |
| Image access | `image_picker` requests runtime permissions following platform best practices |
| No hardcoded secrets | The app has no API keys, tokens, or credentials of any kind |

---

## Future Privacy Commitments

If features adding local persistence are introduced (e.g., scan history in v1.3):

- Data will be stored **on-device only** using SQLite or `shared_preferences`
- No cloud sync will be added without explicit opt-in
- A clear data deletion mechanism will be provided
- The privacy policy will be updated accordingly

---

## Contact

If you have privacy concerns or questions, please open an issue at [github.com/Kaelith69/medic/issues](https://github.com/Kaelith69/medic/issues).
