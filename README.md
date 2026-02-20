<div align="center">

# 💊 Medic — Medicine Label Scanner

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue)](#)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**Medic** is a Flutter application that helps users — especially those with visual impairments or difficulty reading — manage their medication safely. It uses on-device OCR to scan medicine labels, reads the text aloud via text-to-speech, and lets users set timed reminders for medication schedules.

</div>

---

## ✨ Features

| Feature | Description |
|---|---|
| 📷 **Camera Scan** | Capture a medicine label directly with the device camera |
| 🖼️ **Gallery Import** | Pick an existing photo from your gallery |
| ✂️ **Image Cropping** | Crop the image to focus on the relevant label text |
| 🔍 **OCR Text Recognition** | On-device text extraction powered by Google ML Kit (no internet required) |
| 🔊 **Text-to-Speech** | Scanned text is read aloud automatically — fully accessible |
| ⏰ **Medication Reminders** | Add named reminders with a specific time of day |
| 🌙 **Dark Mode** | Respects system light/dark theme |
| 📤 **Share Output** | Share the extracted text with other apps |

---

## 📱 Screenshots

> _Connect a device or emulator and run `flutter run` to see the app in action._

| Home Screen | Image Source Dialog | Scan Result |
|:---:|:---:|:---:|
| Select Image button | Camera or Gallery | Editable text + TTS |

---

## 🗂️ Architecture

```
lib/
├── main.dart                  # App entry point, MaterialApp setup
├── screens/
│   ├── home_screen.dart       # Landing screen with "Select Image" button
│   ├── options_dialog.dart    # Dialog to choose Camera or Gallery
│   ├── crop_screen.dart       # Image cropping view (crop_your_image)
│   └── output_screen.dart     # Displays extracted text, TTS, reminders
├── controllers/
│   └── ocr_controller.dart    # Thin controller delegating to OCRservice
├── services/
│   └── ocr_service.dart       # Image picking, file I/O, ML Kit OCR, sharing
└── components/
    └── utils.dart             # Shared helpers (e.g. showSnackBar)
```

### Data Flow

```
HomeScreen
  └─► OptionsDialog (Camera / Gallery)
        └─► image_picker ──► CropScreen (crop_your_image)
                                  └─► OCRservice.cropping()
                                        └─► Google ML Kit TextRecognizer
                                              └─► OutputScreen
                                                    ├─ Editable TextField
                                                    ├─ FlutterTts (auto-reads)
                                                    ├─ Reminder list
                                                    └─ Share button (FAB)
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.19**
- Dart **≥ 3.2**
- Android SDK (API 21+) or Xcode 14+ for iOS

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Kaelith69/medic.git
cd medic

# 2. Install dependencies
flutter pub get

# 3. Run on a connected device or emulator
flutter run
```

### Platform Setup

#### Android

In `android/app/src/main/AndroidManifest.xml`, ensure the following permissions are present:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

Google ML Kit text recognition models are bundled automatically via the Gradle dependency. No extra steps are required.

#### iOS

In `ios/Runner/Info.plist`, add:

```xml
<key>NSCameraUsageDescription</key>
<string>Required to scan medicine labels</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Required to select medicine label photos</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>Required for text-to-speech functionality</string>
```

---

## 📖 How to Use

### Step 1 — Open the app
Tap **"Select Image"** on the home screen.

### Step 2 — Choose your image source
A dialog will appear with two options:
- **📷 Camera** — take a live photo of your medicine label
- **🖼️ Gallery** — pick an existing photo from your library

### Step 3 — Crop the image
Use the crop handles to frame only the text you want to extract, then tap **"Crop"**.

### Step 4 — View & hear the result
- The extracted text appears in an editable text field.
- The app **automatically reads the text aloud** using text-to-speech.
- Tap the **🔊 FAB** at the bottom right to replay speech at any time.

### Step 5 — Add reminders (optional)
Tap **"Add Reminder"** to schedule a reminder:
1. Enter a reminder name (e.g. *"Take blood pressure pill"*)
2. Select the time using the system time picker
3. Tap **"Add"** — the reminder appears in the list

To remove a reminder, tap the **🗑️ delete icon** next to it.

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| [`google_mlkit_text_recognition`](https://pub.dev/packages/google_mlkit_text_recognition) | ^0.11.0 | On-device OCR |
| [`image_picker`](https://pub.dev/packages/image_picker) | ^1.0.7 | Camera / gallery access |
| [`crop_your_image`](https://pub.dev/packages/crop_your_image) | ^0.7.5 | Image cropping UI |
| [`flutter_tts`](https://pub.dev/packages/flutter_tts) | ^4.0.2 | Text-to-speech |
| [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications) | ^9.3.1 | Local reminder notifications |
| [`share_plus`](https://pub.dev/packages/share_plus) | ^7.2.1 | Share text with other apps |
| [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) | ^1.0.2 | iOS-style icons |

---

## 🧪 Running Tests

```bash
flutter test
```

The test suite validates that:
- The home screen renders the **"Select Image"** button
- Tapping the button shows the **"Choose an option"** dialog
- The dialog contains **Camera** and **Gallery** buttons

---

## 🛠️ Known Limitations

- **Reminder notifications** are listed in-app but do not yet trigger a device notification at the scheduled time. Scheduled notification support (via `flutter_local_notifications` `zonedSchedule`) can be added in a future iteration.
- OCR accuracy depends on image quality and label font clarity. Cropping tightly around the text before scanning significantly improves results.

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'Add my feature'`
4. Push and open a Pull Request

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a PR.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev) — cross-platform UI toolkit
- [Google ML Kit](https://developers.google.com/ml-kit) — on-device machine learning for text recognition
- [flutter_tts](https://pub.dev/packages/flutter_tts) — text-to-speech plugin
- [crop_your_image](https://pub.dev/packages/crop_your_image) — image cropping widget
