# Troubleshooting

Common errors, platform quirks, and debugging techniques for Medic.

---

## Quick Reference

| Symptom | Likely Cause | Jump to |
|---|---|---|
| `flutter pub get` fails | Version conflict | [Setup Issues](#setup-issues) |
| App crashes on camera tap | Missing Android permission | [Android Issues](#android-issues) |
| No TTS audio | Platform / emulator limitation | [TTS Issues](#tts-issues) |
| OCR returns empty text | Image quality or wrong script | [OCR Issues](#ocr-issues) |
| Reminder list disappears | In-session only (v1.0.0) | [Reminder Issues](#reminder-issues) |
| iOS build fails | CocoaPods or signing issue | [iOS Issues](#ios-issues) |
| `flutter analyze` warning | Lint violation | [Lint Issues](#lint-issues) |

---

## Setup Issues

### `flutter pub get` fails with resolution error

```
Because medic requires flutter_local_notifications ^9.3.1 which requires...
```

**Fix:** Run the resolver with major version upgrades:
```bash
flutter pub upgrade --major-versions
```

Or pin the conflicting version explicitly in `pubspec.yaml`.

---

### `flutter doctor` shows issues

Run `flutter doctor -v` for verbose output. Common fixes:

| Issue | Fix |
|---|---|
| Android licenses not accepted | `flutter doctor --android-licenses` |
| Xcode not installed | Install from Mac App Store |
| CocoaPods not installed | `sudo gem install cocoapods` |
| Android Studio not found | Set `ANDROID_HOME` env variable |

---

## Android Issues

### App crashes when tapping "Camera"

**Cause:** Missing `CAMERA` permission in `AndroidManifest.xml`

**Fix:** Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

---

### App crashes on gallery access (Android ≤ 12)

**Cause:** Missing `READ_EXTERNAL_STORAGE` permission

**Fix:**
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

---

### ML Kit Gradle build error

```
Could not resolve com.google.mlkit:text-recognition:...
```

**Fix:** Ensure your Gradle plugin version is compatible:
```gradle
// android/build.gradle
classpath 'com.android.tools.build:gradle:7.4.2'
```

Also ensure `google()` is in your repositories list.

---

### `minSdkVersion` error

```
uses-sdk:minSdkVersion 16 cannot be smaller than version 21
```

**Fix:** In `android/app/build.gradle`:
```gradle
defaultConfig {
    minSdkVersion 21
}
```

---

## iOS Issues

### `pod install` fails

```bash
# Reset CocoaPods cache
cd ios
rm -rf Pods Podfile.lock
pod install --repo-update
```

---

### Xcode code signing error

```
Provisioning profile ... doesn't include the currently selected device
```

**Fix:** In Xcode → Runner target → Signing & Capabilities, set your Apple Developer Team.

---

### Info.plist permission crash (iOS)

```
This app has crashed because it attempted to access privacy-sensitive data
without a usage description.
```

**Fix:** Add the required keys to `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>Required to scan medicine labels</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Required to select medicine label photos</string>
```

---

### TTS not working on iOS Simulator

**Cause:** iOS Simulator has limited TTS (AVSpeechSynthesizer) support.

**Fix:** Test TTS on a physical iOS device.

---

## OCR Issues

### OCR returns empty string

The output screen shows: *"Could not find any text in image."*

**Possible causes:**
1. **Image too blurry** — retake with better lighting and a steady hand
2. **Background noise** — crop more tightly around the label text only
3. **Non-Latin script** — v1.0.0 only supports Latin-script text (English, French, Spanish, etc.)
4. **Very small text** — use a higher resolution camera if available
5. **Dark / damaged label** — use good ambient lighting; avoid shadows and glare

---

### OCR output has many errors

**Causes and fixes:**

| Cause | Fix |
|---|---|
| Motion blur | Hold device still; use gallery image if available |
| Poor lighting | Move to better-lit area |
| Label too far away | Get closer; fill the frame |
| Crop not tight enough | Crop more precisely around text only |
| Glossy label causing glare | Change angle to reduce reflections |

---

### OCR crashes with native exception

Check `flutter logs` for the stack trace. Common causes:
- Temp file write failed (low device storage) → `showSnackBar` will display the error
- ML Kit native library not loaded → ensure Gradle sync was successful

---

## TTS Issues

### No audio after scanning

1. Check device volume is not muted
2. Check `Do Not Disturb` / Silent mode is off
3. On Android emulator: TTS requires audio output configured in AVD settings
4. Test on a physical device

---

### TTS speaks the wrong text after editing

**Cause:** The FAB calls `speakText(outputText)`. If `outputText` state was not updated by the `onChanged` callback, it may be stale.

**Verify:** The `TextField` has `onChanged: (value) { setState(() { outputText = value; }); }` — this should keep `outputText` in sync.

---

### TTS speech rate too fast/slow

This is configurable in the `speakText` method:
```dart
await flutterTts.setSpeechRate(0.7);  // Slower: 0.0–1.0, faster: 1.0–2.0
```

A user-facing setting for speech rate is planned for v1.2.

---

## Reminder Issues

### Reminders disappear after leaving the Output Screen

**This is expected behaviour in v1.0.0.** Reminders are stored in-memory only. Persistent reminders are planned for v1.1.

---

### "Add" button does nothing

Validation requires both fields to be filled:
- Enter reminder text in the text field
- Tap "Select Time" and choose a time

If both are filled and the button still does nothing, check the console for errors.

---

### Time format shows incorrectly

`TimeOfDay.format(context)` uses the device's system 12h/24h preference. Change the device setting in system preferences.

---

## Lint Issues

### `flutter analyze` warnings

Run:
```bash
flutter analyze
```

Common warnings and fixes:

| Warning | Fix |
|---|---|
| `use_build_context_synchronously` | Add `if (!context.mounted) return;` after every `await` |
| `prefer_const_constructors` | Add `const` keyword |
| `avoid_print` | Replace `print()` with a logger or remove |
| `unused_import` | Remove the import |

---

## Getting More Help

1. Check existing [GitHub Issues](https://github.com/Kaelith69/medic/issues)
2. Run `flutter doctor -v` and include the output in your issue
3. Include the full stack trace from `flutter logs` or the Dart DevTools console
4. Specify Flutter version (`flutter --version`), platform, and device model
