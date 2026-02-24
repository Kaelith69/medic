# Roadmap

> This document tracks the planned evolution of Medic from its current v1.0.0 foundation to a comprehensive medication management platform.

---

## Current Version — v1.0.0 ✅

**Released:** Initial release

### Delivered Features

| Feature | Status |
|---|---|
| Camera and gallery image capture | ✅ Complete |
| Interactive image cropping | ✅ Complete |
| On-device OCR (Google ML Kit, Latin script) | ✅ Complete |
| Automatic TTS playback on scan | ✅ Complete |
| TTS replay button (FAB) | ✅ Complete |
| Editable OCR output text field | ✅ Complete |
| In-session medication reminders (add/delete) | ✅ Complete |
| Share extracted text via system share sheet | ✅ Complete |
| Dark mode (system preference) | ✅ Complete |
| Widget tests (HomeScreen, OptionsDialog) | ✅ Complete |

### Known Limitations

- Reminders are in-memory only (lost on app restart)
- No device push notification fires at reminder time
- Latin-script OCR only
- No scan history

---

## Milestone v1.1 — Persistent Reminders & Notifications

**Target:** Next minor release

| Feature | Priority | Notes |
|---|---|---|
| Persist reminders across sessions | 🔴 High | Use `shared_preferences` or `hive` |
| Scheduled device notifications (`zonedSchedule`) | 🔴 High | `flutter_local_notifications` already initialised |
| Notification channel setup (Android) | 🔴 High | Required for Android 8+ notification categories |
| Daily repeat reminders | 🟡 Medium | `matchDateTimeComponents: DateTimeComponents.time` |
| Cancel notification on reminder delete | 🟡 Medium | `flutterLocalNotificationsPlugin.cancel(id)` |
| Request notification permission (Android 13+ / iOS) | 🔴 High | Runtime permission flow |

---

## Milestone v1.2 — Multi-Language & Accessibility

**Target:** Following minor release

| Feature | Priority | Notes |
|---|---|---|
| Multi-script OCR (Chinese, Arabic, Devanagari, Korean) | 🟡 Medium | ML Kit supports multiple script models |
| TTS language auto-detection | 🟡 Medium | Detect text language, set TTS `setLanguage` accordingly |
| User-configurable TTS speech rate | 🟡 Medium | Slider in settings or output screen |
| User-configurable TTS pitch | 🟢 Low | Same pattern as speech rate |
| VoiceOver / TalkBack deep integration | 🔴 High | Add `Semantics` labels to all interactive elements |
| Dynamic font size support | 🟡 Medium | Respect system accessibility font size settings |

---

## Milestone v1.3 — Scan History

**Target:** Feature milestone

| Feature | Priority | Notes |
|---|---|---|
| Scan history list (title, date, preview) | 🟡 Medium | SQLite or Hive storage |
| View past scan results | 🟡 Medium | Navigate to read-only OutputScreen |
| Search/filter scan history | 🟢 Low | Simple text search |
| Delete individual scan entries | 🟡 Medium | Swipe-to-delete |
| Clear all history | 🟡 Medium | With confirmation dialog |

---

## Milestone v2.0 — Medication Intelligence

**Target:** Major version

| Feature | Priority | Notes |
|---|---|---|
| Medication name extraction & highlight | 🟡 Medium | Identify drug name from OCR output using regex/NLP |
| Dosage instruction parsing | 🟢 Low | Extract "Take 2 tablets twice daily" patterns |
| Offline medication reference database | 🟢 Low | Bundled SQLite of common medications |
| Symptom-to-medication lookup | 🟢 Low | Purely informational, not diagnostic |
| Accessibility audit (WCAG 2.1 AA) | 🔴 High | Full VoiceOver/TalkBack user testing |
| Caregiver mode (share reminders) | 🟢 Low | Export/share reminder list |

---

## Ongoing / Cross-Cutting

| Task | Status |
|---|---|
| Increase test coverage (service unit tests) | 🔲 Ongoing |
| CI/CD pipeline (GitHub Actions) | 🔲 Planned |
| Performance profiling on low-end devices | 🔲 Planned |
| Accessibility testing with screen reader users | 🔲 Planned |
| App Store / Play Store release | 🔲 Planned |

---

## Priority Key

| Symbol | Meaning |
|:---:|---|
| 🔴 | High — blocks core accessibility or reliability |
| 🟡 | Medium — significant user value |
| 🟢 | Low — nice to have |

---

## Contributing to the Roadmap

Have an idea or use case that isn't on the roadmap? Open a [GitHub Issue](https://github.com/Kaelith69/medic/issues) with the label `enhancement`. Feature requests that align with the core accessibility mission of Medic are most likely to be adopted.

See [Contributing](Contributing.md) for how to implement a roadmap feature yourself.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0.0 | 2024 | Initial release: OCR, TTS, in-session reminders, share |
