<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 120" width="700" height="120">
  <defs>
    <linearGradient id="wikiHeroBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0B8F87"/>
      <stop offset="100%" style="stop-color:#2563EB"/>
    </linearGradient>
  </defs>
  <rect width="700" height="120" rx="12" fill="url(#wikiHeroBg)"/>
  <text x="350" y="52" font-family="'Segoe UI',Arial,sans-serif" font-size="32" font-weight="800" fill="white" text-anchor="middle">Medic Wiki</text>
  <text x="350" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="15" fill="white" fill-opacity="0.88" text-anchor="middle">Smart Medicine Label Scanner — Developer Documentation Hub</text>
  <text x="350" y="104" font-family="'Segoe UI',Arial,sans-serif" font-size="11" fill="white" fill-opacity="0.65" text-anchor="middle">Flutter · Google ML Kit · flutter_tts · flutter_local_notifications</text>
</svg>

</div>

# Welcome to the Medic Wiki

This wiki is the single source of truth for all developer and contributor documentation for the **Medic** project — a Flutter-based, offline-first medicine label scanner with integrated OCR, text-to-speech, and medication reminders.

---

## 📚 Documentation Index

| Page | Description |
|---|---|
| **[Architecture](Architecture.md)** | Layered architecture, component design, module map |
| **[Installation](Installation.md)** | Full setup guide for Android, iOS, and development environments |
| **[Usage](Usage.md)** | End-to-end user guide and screen-by-screen walkthrough |
| **[OCR System](OCR-System.md)** | Google ML Kit integration, image pipeline, accuracy tips |
| **[TTS System](TTS-System.md)** | flutter_tts integration, playback control, language config |
| **[Reminder System](Reminder-System.md)** | In-app reminder model, notification plugin, future scheduling |
| **[Privacy](Privacy.md)** | Privacy model, data handling, permission justifications |
| **[Contributing](Contributing.md)** | Developer onboarding, code standards, PR workflow |
| **[Troubleshooting](Troubleshooting.md)** | Common errors, platform quirks, debugging guide |
| **[Roadmap](Roadmap.md)** | Milestone planning, feature backlog, version history |

---

## 🗺️ Project At a Glance

```
Medic v1.0.0
├── Platform:     Android (API 21+) · iOS (14+)
├── Language:     Dart 3.2+ · Flutter 3.19+
├── OCR:          Google ML Kit Text Recognition (on-device)
├── TTS:          flutter_tts (native engine)
├── Reminders:    flutter_local_notifications (in-app)
├── Architecture: 3-layer (Screens / Controller / Services)
└── License:      MIT
```

---

## 🔑 Core Design Principles

1. **Offline-first** — no network calls, all processing on-device
2. **Accessibility-first** — automatic TTS on every scan, large tap targets
3. **Minimal permissions** — camera + photo library only, on demand
4. **Thin controllers** — business logic lives in services, not UI
5. **Single responsibility** — each class has one clearly defined job

---

## 🚀 Quick Start (Developer)

```bash
git clone https://github.com/Kaelith69/medic.git
cd medic
flutter pub get
flutter run          # launch on connected device / emulator
flutter test         # run widget test suite
```

See [Installation](Installation.md) for full platform-specific setup.

---

## 📂 Repository Structure

```
medic/
├── lib/
│   ├── main.dart
│   ├── screens/         # HomeScreen, OptionsDialog, CropScreen, OutputScreen
│   ├── controllers/     # OCRcontroller
│   ├── services/        # OCRservice
│   └── components/      # utils.dart (showSnackBar)
├── android/             # Android Gradle config, AndroidManifest
├── ios/                 # iOS Xcode project, Info.plist
├── test/                # Widget tests
├── wiki/                # This documentation
├── pubspec.yaml
└── analysis_options.yaml
```

---

## 🤝 Contributing

Please read [Contributing](Contributing.md) before opening a pull request. All contributions — bug fixes, features, docs, and tests — are welcome.

---

*Last updated: 2024 · License: MIT*
