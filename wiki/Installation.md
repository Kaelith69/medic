# Installation

Complete setup guide for running Medic on Android and iOS, including all platform-specific configuration required.

---

## Prerequisites

| Requirement | Minimum Version | Notes |
|---|---|---|
| Flutter SDK | ≥ 3.19.0 | [Install guide](https://docs.flutter.dev/get-started/install) |
| Dart SDK | ≥ 3.2.2 | Bundled with Flutter |
| Android SDK | API 21 (Android 5.0) | Android Studio or standalone SDK |
| Xcode | ≥ 14.0 | macOS only, required for iOS builds |
| CocoaPods | ≥ 1.12 | Required for iOS dependency management |
| Java | ≥ 11 | Required for Gradle (Android) |

---

## 1. Clone the Repository

```bash
git clone https://github.com/Kaelith69/medic.git
cd medic
```

---

## 2. Install Flutter Dependencies

```bash
flutter pub get
```

This downloads all packages listed in `pubspec.yaml`, including:
- `google_mlkit_text_recognition` — ML Kit OCR model
- `flutter_tts` — Text-to-speech engine
- `flutter_local_notifications` — Notification plugin
- `image_picker` — Camera and gallery
- `crop_your_image` — Image cropper
- `share_plus` — System share sheet

---

## 3. Android Setup

### 3.1 Minimum SDK Version

In `android/app/build.gradle`, confirm:

```gradle
android {
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

### 3.2 Permissions

In `android/app/src/main/AndroidManifest.xml`, ensure these permissions are declared:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

> **Note:** `READ_EXTERNAL_STORAGE` is required on Android ≤ 12. On Android 13+ (API 33+), `image_picker` uses `READ_MEDIA_IMAGES` automatically.

### 3.3 ML Kit Model Bundling

`google_mlkit_text_recognition` bundles the Latin-script OCR model via Gradle. No manual model download is needed. The model is included in the APK at build time.

### 3.4 Run on Android

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Build release APK
flutter build apk --release
```

---

## 4. iOS Setup

> iOS setup requires macOS with Xcode installed.

### 4.1 iOS Deployment Target

In `ios/Podfile`, confirm:

```ruby
platform :ios, '14.0'
```

### 4.2 CocoaPods Install

```bash
cd ios
pod install
cd ..
```

### 4.3 Info.plist Permissions

In `ios/Runner/Info.plist`, add the following permission descriptions:

```xml
<key>NSCameraUsageDescription</key>
<string>Required to scan medicine labels</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>Required to select medicine label photos</string>

<key>NSSpeechRecognitionUsageDescription</key>
<string>Required for text-to-speech functionality</string>
```

Without these entries, the app will crash when requesting camera or gallery access on iOS.

### 4.4 Run on iOS

```bash
# Open Xcode (if needed for signing)
open ios/Runner.xcworkspace

# Run via Flutter CLI
flutter run -d <ios-device-or-simulator>

# Build release IPA
flutter build ipa --release
```

> **Code Signing:** You must configure a valid Apple Developer Team in Xcode → Runner → Signing & Capabilities for device builds.

---

## 5. Verify the Setup

Run the included widget tests to verify your environment:

```bash
flutter test
```

Expected output:
```
00:XX +3: All tests passed!
```

Check the Flutter environment health:

```bash
flutter doctor -v
```

All items relevant to your target platform should show a green checkmark.

---

## 6. Common Setup Issues

### `flutter pub get` fails with version conflict

```bash
flutter pub upgrade --major-versions
```

### Android build fails: `minSdkVersion` too low

Set `minSdkVersion 21` in `android/app/build.gradle`.

### iOS: `pod install` fails

```bash
sudo gem install cocoapods
cd ios && pod install --repo-update
```

### `google_mlkit_text_recognition` Gradle error

Ensure your Android Gradle Plugin is ≥ 7.x:

```gradle
// android/build.gradle
classpath 'com.android.tools.build:gradle:7.4.2'
```

### Flutter TTS not speaking on iOS Simulator

The iOS Simulator has limited TTS support. Test TTS functionality on a physical device.

---

## 7. Development Tools (Recommended)

| Tool | Purpose |
|---|---|
| VS Code + Flutter extension | Primary IDE |
| Android Studio | Android emulator management |
| Xcode | iOS Simulator and device provisioning |
| `flutter_lints` | Already configured in `analysis_options.yaml` |

---

## 8. Environment Variables

Medic has **no environment variables or API keys**. All processing is on-device. No `.env` file is required.
