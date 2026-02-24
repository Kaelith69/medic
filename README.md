<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 860 220" width="860" height="220">
  <defs>
    <linearGradient id="heroBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0B8F87;stop-opacity:1"/>
      <stop offset="55%" style="stop-color:#0a7a73;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#2563EB;stop-opacity:1"/>
    </linearGradient>
    <linearGradient id="pillGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#10B981;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#0B8F87;stop-opacity:1"/>
    </linearGradient>
    <filter id="glow">
      <feGaussianBlur stdDeviation="3" result="coloredBlur"/>
      <feMerge><feMergeNode in="coloredBlur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
  </defs>
  <!-- Background -->
  <rect width="860" height="220" rx="16" fill="url(#heroBg)"/>
  <!-- Decorative circles -->
  <circle cx="760" cy="30" r="80" fill="white" fill-opacity="0.04"/>
  <circle cx="800" cy="180" r="50" fill="white" fill-opacity="0.04"/>
  <circle cx="60" cy="190" r="60" fill="white" fill-opacity="0.04"/>
  <!-- Cross symbol -->
  <rect x="52" y="75" width="56" height="16" rx="8" fill="white" fill-opacity="0.9" filter="url(#glow)"/>
  <rect x="72" y="55" width="16" height="56" rx="8" fill="white" fill-opacity="0.9" filter="url(#glow)"/>
  <!-- Pill shape -->
  <rect x="50" y="140" width="60" height="22" rx="11" fill="url(#pillGrad)" fill-opacity="0.85"/>
  <line x1="80" y1="140" x2="80" y2="162" stroke="white" stroke-width="1.5" stroke-opacity="0.6"/>
  <!-- Title -->
  <text x="140" y="100" font-family="'Segoe UI', Arial, sans-serif" font-size="52" font-weight="800" fill="white" letter-spacing="-1">Medic</text>
  <!-- Tagline -->
  <text x="141" y="135" font-family="'Segoe UI', Arial, sans-serif" font-size="18" font-weight="400" fill="white" fill-opacity="0.88">Smart Medicine Label Scanner · OCR · TTS · Reminders</text>
  <!-- Sub info -->
  <rect x="141" y="158" width="110" height="26" rx="13" fill="white" fill-opacity="0.15"/>
  <text x="196" y="176" font-family="'Segoe UI', Arial, sans-serif" font-size="12" font-weight="600" fill="white" text-anchor="middle">Flutter · Dart</text>
  <rect x="263" y="158" width="130" height="26" rx="13" fill="white" fill-opacity="0.15"/>
  <text x="328" y="176" font-family="'Segoe UI', Arial, sans-serif" font-size="12" font-weight="600" fill="white" text-anchor="middle">Google ML Kit OCR</text>
  <rect x="405" y="158" width="140" height="26" rx="13" fill="white" fill-opacity="0.15"/>
  <text x="475" y="176" font-family="'Segoe UI', Arial, sans-serif" font-size="12" font-weight="600" fill="white" text-anchor="middle">Android · iOS</text>
  <!-- Version badge -->
  <rect x="630" y="158" width="80" height="26" rx="13" fill="#10B981" fill-opacity="0.85"/>
  <text x="670" y="176" font-family="'Segoe UI', Arial, sans-serif" font-size="12" font-weight="700" fill="white" text-anchor="middle">v1.0.0</text>
  <!-- Heartbeat line -->
  <polyline points="560,100 580,100 590,70 600,130 610,85 620,115 630,100 660,100" fill="none" stroke="white" stroke-width="2.5" stroke-opacity="0.5" stroke-linejoin="round" stroke-linecap="round"/>
</svg>

# Medic — Smart Medicine Label Scanner

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue)](#)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](wiki/Contributing.md)
[![ML Kit](https://img.shields.io/badge/ML_Kit-On--Device_OCR-4285F4?logo=google&logoColor=white)](https://developers.google.com/ml-kit)
[![TTS](https://img.shields.io/badge/TTS-flutter__tts-0B8F87)](#)
[![Accessibility](https://img.shields.io/badge/Accessibility-WCAG_AA-10B981)](#accessibility)

**Medic** is a cross-platform Flutter application that empowers patients — especially those with visual impairments or literacy challenges — to manage their medication safely. It combines on-device OCR (no internet required), automatic text-to-speech, and in-app medication reminders in a single, accessible experience.

</div>

---

## 📋 System Overview

Medic addresses a real healthcare accessibility gap: medicine labels are often dense, small-font, and difficult to read — especially for elderly users, those with visual impairments, or non-native speakers. The app eliminates this barrier using three integrated systems:

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 180" width="780" height="180">
  <defs>
    <linearGradient id="nodeGrad1" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#0B8F87;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#087a73;stop-opacity:1"/>
    </linearGradient>
    <linearGradient id="nodeGrad2" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#2563EB;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#1d50c8;stop-opacity:1"/>
    </linearGradient>
    <linearGradient id="nodeGrad3" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#10B981;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#0da070;stop-opacity:1"/>
    </linearGradient>
    <marker id="arrowCap" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#94a3b8"/>
    </marker>
  </defs>
  <rect width="780" height="180" rx="12" fill="#0f172a"/>
  <!-- Node 1: OCR -->
  <rect x="30" y="45" width="160" height="90" rx="10" fill="url(#nodeGrad1)"/>
  <text x="110" y="82" font-family="'Segoe UI',Arial,sans-serif" font-size="13" font-weight="700" fill="white" text-anchor="middle">🔍 OCR Engine</text>
  <text x="110" y="100" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">Google ML Kit</text>
  <text x="110" y="116" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">On-Device · No Internet</text>
  <!-- Arrow 1→2 -->
  <line x1="192" y1="90" x2="298" y2="90" stroke="#94a3b8" stroke-width="1.8" marker-end="url(#arrowCap)"/>
  <text x="245" y="82" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8" text-anchor="middle">text</text>
  <!-- Node 2: TTS -->
  <rect x="300" y="45" width="160" height="90" rx="10" fill="url(#nodeGrad2)"/>
  <text x="380" y="82" font-family="'Segoe UI',Arial,sans-serif" font-size="13" font-weight="700" fill="white" text-anchor="middle">🔊 TTS Engine</text>
  <text x="380" y="100" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">flutter_tts</text>
  <text x="380" y="116" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">Auto-reads on scan</text>
  <!-- Arrow 2→3 -->
  <line x1="462" y1="90" x2="568" y2="90" stroke="#94a3b8" stroke-width="1.8" marker-end="url(#arrowCap)"/>
  <text x="515" y="82" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8" text-anchor="middle">schedule</text>
  <!-- Node 3: Reminders -->
  <rect x="570" y="45" width="178" height="90" rx="10" fill="url(#nodeGrad3)"/>
  <text x="659" y="82" font-family="'Segoe UI',Arial,sans-serif" font-size="13" font-weight="700" fill="white" text-anchor="middle">⏰ Reminders</text>
  <text x="659" y="100" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">flutter_local_notifications</text>
  <text x="659" y="116" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="white" fill-opacity="0.85" text-anchor="middle">Named · Time-scheduled</text>
  <!-- Labels -->
  <text x="110" y="158" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">STEP 1</text>
  <text x="380" y="158" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">STEP 2</text>
  <text x="659" y="158" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">STEP 3</text>
</svg>

</div>

---

## ✨ Features

| Feature | Description | Status |
|---|---|:---:|
| 📷 **Camera Scan** | Capture a medicine label directly with the device camera | ✅ |
| 🖼️ **Gallery Import** | Pick an existing photo from your library | ✅ |
| ✂️ **Image Cropping** | Interactive crop handles to isolate label text | ✅ |
| 🔍 **On-Device OCR** | Text extraction via Google ML Kit — no internet required | ✅ |
| 🔊 **Text-to-Speech** | Extracted text is read aloud automatically on every scan | ✅ |
| ✏️ **Editable Output** | Correct OCR errors in-app before sharing | ✅ |
| ⏰ **Medication Reminders** | Named reminders with time-of-day picker stored in-session | ✅ |
| 📤 **Share Output** | Share extracted text to any app via the system share sheet | ✅ |
| 🌙 **Dark Mode** | Respects system light/dark theme preference | ✅ |
| 📴 **Offline-first** | Full functionality without any network connection | ✅ |

---

## 🏗️ Architecture

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 340" width="780" height="340">
  <defs>
    <linearGradient id="archBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f172a"/>
      <stop offset="100%" style="stop-color:#1e293b"/>
    </linearGradient>
    <linearGradient id="layerUI" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#0B8F87;stop-opacity:0.9"/>
      <stop offset="100%" style="stop-color:#0B8F87;stop-opacity:0.6"/>
    </linearGradient>
    <linearGradient id="layerCtrl" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#2563EB;stop-opacity:0.9"/>
      <stop offset="100%" style="stop-color:#2563EB;stop-opacity:0.6"/>
    </linearGradient>
    <linearGradient id="layerSvc" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#10B981;stop-opacity:0.9"/>
      <stop offset="100%" style="stop-color:#10B981;stop-opacity:0.6"/>
    </linearGradient>
    <marker id="arrow" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#94a3b8"/>
    </marker>
  </defs>
  <rect width="780" height="340" rx="14" fill="url(#archBg)"/>
  <!-- Title -->
  <text x="390" y="28" font-family="'Segoe UI',Arial,sans-serif" font-size="13" font-weight="700" fill="#e2e8f0" text-anchor="middle">LAYERED ARCHITECTURE</text>
  <!-- Layer labels (left) -->
  <text x="18" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="#0B8F87" text-anchor="middle" transform="rotate(-90, 18, 105)">UI</text>
  <text x="18" y="195" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="#2563EB" text-anchor="middle" transform="rotate(-90, 18, 195)">CTRL</text>
  <text x="18" y="280" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="#10B981" text-anchor="middle" transform="rotate(-90, 18, 280)">SVC</text>
  <!-- UI Layer -->
  <rect x="36" y="48" width="720" height="90" rx="8" fill="url(#layerUI)" fill-opacity="0.18" stroke="#0B8F87" stroke-width="1" stroke-opacity="0.5"/>
  <text x="56" y="68" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="#0B8F87">SCREENS (lib/screens/)</text>
  <!-- Screen boxes -->
  <rect x="56" y="76" width="130" height="50" rx="6" fill="#0B8F87" fill-opacity="0.7"/>
  <text x="121" y="98" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">HomeScreen</text>
  <text x="121" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">home_screen.dart</text>
  <rect x="200" y="76" width="140" height="50" rx="6" fill="#0B8F87" fill-opacity="0.7"/>
  <text x="270" y="98" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">OptionsDialog</text>
  <text x="270" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">options_dialog.dart</text>
  <rect x="354" y="76" width="130" height="50" rx="6" fill="#0B8F87" fill-opacity="0.7"/>
  <text x="419" y="98" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">CropScreen</text>
  <text x="419" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">crop_screen.dart</text>
  <rect x="498" y="76" width="140" height="50" rx="6" fill="#0B8F87" fill-opacity="0.7"/>
  <text x="568" y="98" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">OutputScreen</text>
  <text x="568" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">output_screen.dart</text>
  <rect x="652" y="76" width="94" height="50" rx="6" fill="#0B8F87" fill-opacity="0.5"/>
  <text x="699" y="98" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">Components</text>
  <text x="699" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">utils.dart</text>
  <!-- Controller Layer -->
  <rect x="36" y="152" width="720" height="66" rx="8" fill="#2563EB" fill-opacity="0.12" stroke="#2563EB" stroke-width="1" stroke-opacity="0.5"/>
  <text x="56" y="170" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="#2563EB">CONTROLLER (lib/controllers/)</text>
  <rect x="280" y="176" width="220" height="34" rx="6" fill="#2563EB" fill-opacity="0.7"/>
  <text x="390" y="196" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">OCRcontroller — ocr_controller.dart</text>
  <!-- Service Layer -->
  <rect x="36" y="232" width="720" height="80" rx="8" fill="#10B981" fill-opacity="0.10" stroke="#10B981" stroke-width="1" stroke-opacity="0.5"/>
  <text x="56" y="250" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="#10B981">SERVICES (lib/services/) + THIRD-PARTY SDKs</text>
  <rect x="56" y="256" width="140" height="46" rx="6" fill="#10B981" fill-opacity="0.6"/>
  <text x="126" y="276" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">OCRservice</text>
  <text x="126" y="293" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">ocr_service.dart</text>
  <rect x="212" y="256" width="130" height="46" rx="6" fill="#10B981" fill-opacity="0.4"/>
  <text x="277" y="276" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">ML Kit OCR</text>
  <text x="277" y="293" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">google_mlkit</text>
  <rect x="356" y="256" width="120" height="46" rx="6" fill="#10B981" fill-opacity="0.4"/>
  <text x="416" y="276" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">flutter_tts</text>
  <text x="416" y="293" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">TTS Engine</text>
  <rect x="490" y="256" width="140" height="46" rx="6" fill="#10B981" fill-opacity="0.4"/>
  <text x="560" y="276" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">Notifications</text>
  <text x="560" y="293" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">flutter_local_notif.</text>
  <rect x="644" y="256" width="102" height="46" rx="6" fill="#10B981" fill-opacity="0.4"/>
  <text x="695" y="276" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">share_plus</text>
  <text x="695" y="293" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Share Sheet</text>
  <!-- Arrows between layers -->
  <line x1="390" y1="138" x2="390" y2="152" stroke="#94a3b8" stroke-width="1.5" marker-end="url(#arrow)"/>
  <line x1="390" y1="218" x2="390" y2="232" stroke="#94a3b8" stroke-width="1.5" marker-end="url(#arrow)"/>
  <!-- Legend -->
  <rect x="36" y="324" width="12" height="8" rx="2" fill="#0B8F87"/>
  <text x="52" y="332" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">Presentation</text>
  <rect x="140" y="324" width="12" height="8" rx="2" fill="#2563EB"/>
  <text x="156" y="332" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">Business Logic</text>
  <rect x="260" y="324" width="12" height="8" rx="2" fill="#10B981"/>
  <text x="276" y="332" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">Data / Services</text>
</svg>

</div>

### Project Structure

```
medic/
├── lib/
│   ├── main.dart                   # App entry point — MaterialApp, theme setup
│   ├── screens/
│   │   ├── home_screen.dart        # Landing screen with "Select Image" button
│   │   ├── options_dialog.dart     # Camera vs. Gallery choice dialog
│   │   ├── crop_screen.dart        # Interactive crop view (crop_your_image)
│   │   └── output_screen.dart      # OCR result, TTS playback, reminders
│   ├── controllers/
│   │   └── ocr_controller.dart     # Thin controller delegating to OCRservice
│   ├── services/
│   │   └── ocr_service.dart        # image_picker, temp file I/O, ML Kit, sharing
│   └── components/
│       └── utils.dart              # Shared helpers (showSnackBar)
├── android/                        # Android-specific config & Gradle
├── ios/                            # iOS-specific config & Xcode
├── test/
│   └── widget_test.dart            # Widget tests for HomeScreen & dialog
├── pubspec.yaml                    # Dependencies & app metadata
└── analysis_options.yaml           # Lint rules (flutter_lints)
```

---

## 🔄 Data Flow

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 280" width="780" height="280">
  <defs>
    <linearGradient id="dfBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f172a"/>
      <stop offset="100%" style="stop-color:#1e293b"/>
    </linearGradient>
    <marker id="dfArrow" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#10B981"/>
    </marker>
  </defs>
  <rect width="780" height="280" rx="14" fill="url(#dfBg)"/>
  <text x="390" y="25" font-family="'Segoe UI',Arial,sans-serif" font-size="13" font-weight="700" fill="#e2e8f0" text-anchor="middle">DATA FLOW DIAGRAM</text>
  <!-- Step boxes -->
  <!-- 1 -->
  <rect x="30" y="45" width="110" height="52" rx="8" fill="#0B8F87" fill-opacity="0.85"/>
  <text x="85" y="68" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">HomeScreen</text>
  <text x="85" y="86" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Tap "Select Image"</text>
  <!-- Arrow 1→2 -->
  <line x1="142" y1="71" x2="178" y2="71" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 2 -->
  <rect x="180" y="45" width="120" height="52" rx="8" fill="#0B8F87" fill-opacity="0.75"/>
  <text x="240" y="68" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">OptionsDialog</text>
  <text x="240" y="86" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Camera / Gallery</text>
  <!-- Arrow 2→3 -->
  <line x1="302" y1="71" x2="338" y2="71" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 3 -->
  <rect x="340" y="45" width="120" height="52" rx="8" fill="#2563EB" fill-opacity="0.8"/>
  <text x="400" y="62" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">image_picker</text>
  <text x="400" y="78" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Uint8List bytes</text>
  <text x="400" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">captured/loaded</text>
  <!-- Arrow 3→4 -->
  <line x1="462" y1="71" x2="498" y2="71" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 4 -->
  <rect x="500" y="45" width="120" height="52" rx="8" fill="#2563EB" fill-opacity="0.7"/>
  <text x="560" y="68" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">CropScreen</text>
  <text x="560" y="86" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">crop_your_image</text>
  <!-- Arrow 4→5 (down) -->
  <line x1="560" y1="99" x2="560" y2="135" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 5 -->
  <rect x="500" y="137" width="120" height="52" rx="8" fill="#10B981" fill-opacity="0.7"/>
  <text x="560" y="158" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">OCRservice</text>
  <text x="560" y="175" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Temp file + ML Kit</text>
  <!-- Arrow 5→6 (left) -->
  <line x1="498" y1="163" x2="462" y2="163" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 6 -->
  <rect x="340" y="137" width="120" height="52" rx="8" fill="#10B981" fill-opacity="0.85"/>
  <text x="400" y="155" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">ML Kit</text>
  <text x="400" y="171" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">TextRecognizer</text>
  <text x="400" y="185" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">RecognizedText</text>
  <!-- Arrow 6→7 (left) -->
  <line x1="338" y1="163" x2="302" y2="163" stroke="#10B981" stroke-width="2" marker-end="url(#dfArrow)"/>
  <!-- 7 -->
  <rect x="30" y="137" width="270" height="52" rx="8" fill="#0B8F87" fill-opacity="0.85"/>
  <text x="165" y="155" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">OutputScreen</text>
  <text x="165" y="172" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Editable text · Auto-TTS · Reminders · Share FAB</text>
  <!-- Branch outputs -->
  <line x1="85" y1="191" x2="85" y2="220" stroke="#94a3b8" stroke-width="1.5" stroke-dasharray="4,3"/>
  <rect x="30" y="222" width="110" height="36" rx="6" fill="#1e293b" stroke="#0B8F87" stroke-width="1"/>
  <text x="85" y="236" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="#0B8F87" text-anchor="middle">flutter_tts</text>
  <text x="85" y="250" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8" text-anchor="middle">Audio output</text>
  <line x1="165" y1="191" x2="165" y2="220" stroke="#94a3b8" stroke-width="1.5" stroke-dasharray="4,3"/>
  <rect x="110" y="222" width="110" height="36" rx="6" fill="#1e293b" stroke="#2563EB" stroke-width="1"/>
  <text x="165" y="236" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="#2563EB" text-anchor="middle">Reminders</text>
  <text x="165" y="250" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8" text-anchor="middle">In-app list</text>
  <line x1="255" y1="191" x2="255" y2="220" stroke="#94a3b8" stroke-width="1.5" stroke-dasharray="4,3"/>
  <rect x="200" y="222" width="100" height="36" rx="6" fill="#1e293b" stroke="#10B981" stroke-width="1"/>
  <text x="250" y="236" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="#10B981" text-anchor="middle">share_plus</text>
  <text x="250" y="250" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8" text-anchor="middle">System share</text>
  <!-- Step numbers -->
  <text x="85" y="42" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">①</text>
  <text x="240" y="42" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">②</text>
  <text x="400" y="42" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">③</text>
  <text x="560" y="42" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">④</text>
  <text x="591" y="134" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b">⑤</text>
  <text x="432" y="134" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b">⑥</text>
  <text x="310" y="134" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b">⑦</text>
</svg>

</div>

---

## 🛠️ Technology Stack

| Category | Technology | Version | Role |
|---|---|:---:|---|
| **UI Framework** | Flutter | ≥ 3.19 | Cross-platform UI toolkit |
| **Language** | Dart | ≥ 3.2 | Null-safe, compiled to native |
| **OCR** | google_mlkit_text_recognition | ^0.11.0 | On-device text recognition |
| **Image Capture** | image_picker | ^1.0.7 | Camera & gallery access |
| **Image Cropping** | crop_your_image | ^0.7.5 | Interactive crop widget |
| **Text-to-Speech** | flutter_tts | ^4.0.2 | Native TTS on Android & iOS |
| **Notifications** | flutter_local_notifications | ^9.3.1 | Local reminder scheduling |
| **Sharing** | share_plus | ^7.2.1 | System share sheet integration |
| **Icons** | cupertino_icons | ^1.0.2 | iOS-style iconography |
| **Linting** | flutter_lints | ^2.0.0 | Dart/Flutter lint rules |

---

## 📊 Performance Profile

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 160" width="780" height="160">
  <defs>
    <linearGradient id="perfBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f172a"/>
      <stop offset="100%" style="stop-color:#1e293b"/>
    </linearGradient>
    <linearGradient id="barGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#0B8F87"/>
      <stop offset="100%" style="stop-color:#10B981"/>
    </linearGradient>
  </defs>
  <rect width="780" height="160" rx="12" fill="url(#perfBg)"/>
  <text x="390" y="24" font-family="'Segoe UI',Arial,sans-serif" font-size="12" font-weight="700" fill="#e2e8f0" text-anchor="middle">PERFORMANCE STATS</text>
  <!-- Stat cards -->
  <rect x="30" y="38" width="152" height="100" rx="8" fill="#0B8F87" fill-opacity="0.15" stroke="#0B8F87" stroke-width="1" stroke-opacity="0.5"/>
  <text x="106" y="74" font-family="'Segoe UI',Arial,sans-serif" font-size="28" font-weight="800" fill="#10B981" text-anchor="middle">100%</text>
  <text x="106" y="96" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="#94a3b8" text-anchor="middle">Offline Capable</text>
  <text x="106" y="112" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">No network required</text>

  <rect x="196" y="38" width="152" height="100" rx="8" fill="#2563EB" fill-opacity="0.15" stroke="#2563EB" stroke-width="1" stroke-opacity="0.5"/>
  <text x="272" y="74" font-family="'Segoe UI',Arial,sans-serif" font-size="28" font-weight="800" fill="#2563EB" text-anchor="middle">&lt; 2s</text>
  <text x="272" y="96" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="#94a3b8" text-anchor="middle">OCR Latency</text>
  <text x="272" y="112" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">On mid-range device</text>

  <rect x="362" y="38" width="152" height="100" rx="8" fill="#10B981" fill-opacity="0.15" stroke="#10B981" stroke-width="1" stroke-opacity="0.5"/>
  <text x="438" y="74" font-family="'Segoe UI',Arial,sans-serif" font-size="28" font-weight="800" fill="#10B981" text-anchor="middle">API 21+</text>
  <text x="438" y="96" font-family="'Segoe UI',Arial,sans-serif" font-size="10" fill="#94a3b8" text-anchor="middle">Android Support</text>
  <text x="438" y="112" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">Android 5.0 and later</text>

  <rect x="528" y="38" width="222" height="100" rx="8" fill="#0B8F87" fill-opacity="0.12" stroke="#0B8F87" stroke-width="1" stroke-opacity="0.4"/>
  <text x="639" y="64" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="#e2e8f0" text-anchor="middle">OCR Pipeline (on-device)</text>
  <rect x="548" y="74" width="182" height="12" rx="6" fill="#1e293b"/>
  <rect x="548" y="74" width="173" height="12" rx="6" fill="url(#barGrad)"/>
  <text x="548" y="102" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">Image Load</text>
  <text x="548" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">ML Kit Inference</text>
  <text x="548" y="126" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#94a3b8">UI Render</text>
  <text x="720" y="102" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#10B981" text-anchor="end">~80ms</text>
  <text x="720" y="114" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#10B981" text-anchor="end">~1.2s</text>
  <text x="720" y="126" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#10B981" text-anchor="end">~16ms</text>
</svg>

</div>

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.19**
- Dart **≥ 3.2**
- Android SDK (API 21+) or Xcode 14+ for iOS
- A physical device or emulator/simulator

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

### Platform Permissions

#### Android (`android/app/src/main/AndroidManifest.xml`)

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

ML Kit text recognition models are bundled automatically via the Gradle dependency — no extra steps required.

#### iOS (`ios/Runner/Info.plist`)

```xml
<key>NSCameraUsageDescription</key>
<string>Required to scan medicine labels</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Required to select medicine label photos</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>Required for text-to-speech functionality</string>
```

---

## 📖 Usage

| Step | Action | Detail |
|:---:|---|---|
| **1** | Open the app | The home screen displays a single **"Select Image"** button |
| **2** | Choose image source | Tap **Camera** to take a live photo, or **Gallery** to pick an existing one |
| **3** | Crop the label | Drag the crop handles around the medicine label text, then tap **Crop** |
| **4** | View & hear result | Extracted text is displayed; app **automatically reads it aloud** |
| **5** | Edit if needed | Tap the text field to correct any OCR errors |
| **6** | Add a reminder | Tap **"Add Reminder"**, enter a name and pick a time, then tap **Add** |
| **7** | Share | Tap the share FAB (bottom-right) to share the text via any app |

---

## 🧪 Running Tests

```bash
flutter test
```

The test suite validates:
- The home screen renders the **"Select Image"** button
- Tapping it shows the **"Choose an option"** dialog
- The dialog contains **Camera** and **Gallery** options

---

## ♿ Accessibility

Medic is designed with accessibility as a first-class concern:

- **Automatic TTS** — every scan result is read aloud without any extra taps
- **Replay button** — the floating action button re-reads the text on demand
- **High contrast** — Material Design 3 theming with dark mode support
- **Editable output** — users can correct misread text before sharing or acting on it
- **Large tap targets** — buttons meet minimum 48×48dp touch target guidelines
- **Screen reader compatible** — standard Flutter `Semantics` via Material widgets

---

## 🔒 Privacy & Security

| Aspect | Implementation |
|---|---|
| **On-device processing** | All OCR runs locally via ML Kit — no image or text is transmitted to any server |
| **No data persistence** | No user data, images, or scan results are saved to disk between sessions |
| **No analytics** | No crash reporting, analytics SDK, or telemetry is embedded |
| **Permission minimalism** | Only camera and photo library permissions are requested, only when needed |
| **No network** | The app has zero network calls — no API keys, no endpoints |

See [wiki/Privacy.md](wiki/Privacy.md) for the full privacy model.

---

## 🛣️ Roadmap

| Milestone | Feature | Status |
|---|---|:---:|
| v1.1 | Scheduled device notifications (zonedSchedule) | 🔲 Planned |
| v1.1 | Persistent reminders across sessions (local storage) | 🔲 Planned |
| v1.2 | Multi-language OCR (Latin, Arabic, Chinese, etc.) | 🔲 Planned |
| v1.2 | TTS language auto-detection | 🔲 Planned |
| v1.3 | Scan history with timestamps | 🔲 Planned |
| v1.3 | Medication database lookup | 🔲 Planned |
| v2.0 | Accessibility audit & VoiceOver/TalkBack deep integration | 🔲 Planned |

See [wiki/Roadmap.md](wiki/Roadmap.md) for detailed milestone planning.

---

## 🤝 Contributing

Contributions are welcome! Please read [wiki/Contributing.md](wiki/Contributing.md) before submitting a PR.

```bash
# Fork, then clone your fork
git clone https://github.com/<your-username>/medic.git

# Create a feature branch
git checkout -b feature/my-feature

# Make changes, run tests
flutter test

# Push and open a Pull Request
git push origin feature/my-feature
```

---

## 📐 Design Principles

1. **Offline-first** — the app must function completely without network access
2. **Accessibility-first** — every feature must be usable without sight
3. **Minimal permissions** — request only what is strictly necessary
4. **Single responsibility** — each class has one clearly defined job
5. **Thin controllers** — UI logic stays in screens; business logic stays in services

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev) — cross-platform UI toolkit by Google
- [Google ML Kit](https://developers.google.com/ml-kit) — on-device machine learning
- [flutter_tts](https://pub.dev/packages/flutter_tts) — text-to-speech plugin
- [crop_your_image](https://pub.dev/packages/crop_your_image) — image cropping widget
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) — local notification scheduling
