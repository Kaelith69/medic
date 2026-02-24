# Architecture

> **Medic** follows a clean 3-layer architecture: **Presentation → Controller → Service**. This keeps UI code thin, business logic testable, and third-party SDK dependencies isolated.

---

## Layer Overview

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 300" width="700" height="300">
  <defs>
    <linearGradient id="archBgW" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f172a"/>
      <stop offset="100%" style="stop-color:#1e293b"/>
    </linearGradient>
  </defs>
  <rect width="700" height="300" rx="12" fill="url(#archBgW)"/>
  <!-- Layer 1: Presentation -->
  <rect x="30" y="30" width="640" height="72" rx="8" fill="#0B8F87" fill-opacity="0.2" stroke="#0B8F87" stroke-width="1.5"/>
  <text x="50" y="52" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="#0B8F87">LAYER 1 — PRESENTATION (lib/screens/ + lib/components/)</text>
  <rect x="50" y="60" width="110" height="32" rx="5" fill="#0B8F87" fill-opacity="0.6"/>
  <text x="105" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">HomeScreen</text>
  <rect x="172" y="60" width="120" height="32" rx="5" fill="#0B8F87" fill-opacity="0.6"/>
  <text x="232" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">OptionsDialog</text>
  <rect x="304" y="60" width="110" height="32" rx="5" fill="#0B8F87" fill-opacity="0.6"/>
  <text x="359" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">CropScreen</text>
  <rect x="426" y="60" width="120" height="32" rx="5" fill="#0B8F87" fill-opacity="0.6"/>
  <text x="486" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">OutputScreen</text>
  <rect x="558" y="60" width="102" height="32" rx="5" fill="#0B8F87" fill-opacity="0.35"/>
  <text x="609" y="80" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">utils.dart</text>
  <!-- Arrow down -->
  <line x1="350" y1="104" x2="350" y2="128" stroke="#94a3b8" stroke-width="1.5" stroke-dasharray="4,3"/>
  <!-- Layer 2: Controller -->
  <rect x="30" y="130" width="640" height="62" rx="8" fill="#2563EB" fill-opacity="0.15" stroke="#2563EB" stroke-width="1.5"/>
  <text x="50" y="150" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="#2563EB">LAYER 2 — CONTROLLER (lib/controllers/)</text>
  <rect x="240" y="158" width="220" height="26" rx="5" fill="#2563EB" fill-opacity="0.65"/>
  <text x="350" y="175" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="600" fill="white" text-anchor="middle">OCRcontroller — ocr_controller.dart</text>
  <!-- Arrow down -->
  <line x1="350" y1="194" x2="350" y2="218" stroke="#94a3b8" stroke-width="1.5" stroke-dasharray="4,3"/>
  <!-- Layer 3: Service -->
  <rect x="30" y="220" width="640" height="62" rx="8" fill="#10B981" fill-opacity="0.12" stroke="#10B981" stroke-width="1.5"/>
  <text x="50" y="240" font-family="'Segoe UI',Arial,sans-serif" font-size="11" font-weight="700" fill="#10B981">LAYER 3 — SERVICES (lib/services/) + THIRD-PARTY SDKs</text>
  <rect x="50" y="248" width="110" height="26" rx="5" fill="#10B981" fill-opacity="0.6"/>
  <text x="105" y="265" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">OCRservice</text>
  <rect x="172" y="248" width="100" height="26" rx="5" fill="#10B981" fill-opacity="0.4"/>
  <text x="222" y="265" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">google_mlkit</text>
  <rect x="284" y="248" width="100" height="26" rx="5" fill="#10B981" fill-opacity="0.4"/>
  <text x="334" y="265" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">flutter_tts</text>
  <rect x="396" y="248" width="130" height="26" rx="5" fill="#10B981" fill-opacity="0.4"/>
  <text x="461" y="265" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">local_notifications</text>
  <rect x="538" y="248" width="122" height="26" rx="5" fill="#10B981" fill-opacity="0.4"/>
  <text x="599" y="265" font-family="'Segoe UI',Arial,sans-serif" font-size="9" font-weight="600" fill="white" text-anchor="middle">share_plus</text>
  <!-- Label right -->
  <text x="680" y="70" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#0B8F87" text-anchor="end">UI</text>
  <text x="680" y="163" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#2563EB" text-anchor="end">Logic</text>
  <text x="680" y="255" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#10B981" text-anchor="end">Data</text>
</svg>

</div>

---

## Layer 1 — Presentation

All UI code lives in `lib/screens/` and `lib/components/`. Screens are stateful widgets that handle user input and trigger controller methods. They contain **no business logic**.

### `HomeScreen` (`home_screen.dart`)

- Displays the app title and a single **"Select Image"** `ElevatedButton`
- On button tap, opens `OptionsDialog` as a modal dialog
- Depends on: `OptionsDialog`

### `OptionsDialog` (`options_dialog.dart`)

- `AlertDialog` with two `ElevatedButton.icon` widgets: **Camera** and **Gallery**
- Instantiates `OCRcontroller` in `initState`
- Delegates photo capture/selection to the controller
- Depends on: `OCRcontroller`

### `CropScreen` (`crop_screen.dart`)

- Wraps the `Crop` widget from `crop_your_image`
- Holds a `CropController` instance
- On "Crop" tap, calls `_controller.crop()` which triggers the `onCropped` callback
- The `onCropped` callback forwards the `Uint8List` to `OCRcontroller.cropImage()`
- Manages `isLoading` state to disable the button during processing

### `OutputScreen` (`output_screen.dart`)

The most complex screen. Responsibilities:
- Displays OCR output in an editable `TextField`
- Initialises `FlutterTts` and auto-speaks on mount (via `addPostFrameCallback`)
- Manages an in-memory `List<Reminder>` (add / delete)
- Renders a `ListView.builder` of reminder tiles
- Shows an `AlertDialog` for adding reminders (name + `TimePicker`)
- Floating action button replays TTS on demand
- Initialises `FlutterLocalNotificationsPlugin` (foundation for future scheduling)

### `utils.dart` (`components/utils.dart`)

- Single helper: `showSnackBar({context, content})` — displays a `SnackBar`

---

## Layer 2 — Controller

### `OCRcontroller` (`controllers/ocr_controller.dart`)

A thin facade that:
- Instantiates `OCRservice`
- Exposes `takePhoto`, `getPhoto`, `cropImage`, `shareOutput` as public methods
- Passes `BuildContext` through to the service layer (navigation is service-driven)

**Why a separate controller?** It decouples screens from the service implementation, making the service independently testable and swappable.

---

## Layer 3 — Services

### `OCRservice` (`services/ocr_service.dart`)

The core business logic class. Responsibilities:

| Method | Responsibility |
|---|---|
| `takePhoto(context)` | Opens camera via `ImagePicker`, reads bytes, navigates to `CropScreen` |
| `getPhoto(context)` | Opens gallery via `ImagePicker`, reads bytes, navigates to `CropScreen` |
| `cropping(context, image)` | Writes `Uint8List` to a temp file, delegates to `_scanImage` |
| `_scanImage(context, path)` | Creates `TextRecognizer`, processes image, navigates to `OutputScreen` |
| `shareOutput(context, text)` | Calls `Share.share(text)` from `share_plus` |

**Error handling:** All methods wrap in try/catch and call `showSnackBar` on failure. Context mount checks (`context.mounted`) prevent post-async setState errors.

---

## Third-Party SDK Integration Points

| SDK | Integration point | Notes |
|---|---|---|
| `google_mlkit_text_recognition` | `OCRservice._scanImage` | `TextRecognizer.processImage(InputImage)` |
| `image_picker` | `OCRservice.takePhoto` / `getPhoto` | `ImagePicker().pickImage(source:...)` |
| `crop_your_image` | `CropScreen` | `Crop` widget + `CropController` |
| `flutter_tts` | `OutputScreen` | `FlutterTts().speak(text)` |
| `flutter_local_notifications` | `OutputScreen._initializeNotifications` | Plugin initialised; scheduling is future work |
| `share_plus` | `OCRservice.shareOutput` | `Share.share(text)` |

---

## Navigation Flow

```
main.dart
  └─► HomeScreen
        └─► OptionsDialog (showDialog)
              ├─► CropScreen (Navigator.push)     [after image selected]
              │     └─► OutputScreen (Navigator.pushAndRemoveUntil)
              └─► (dismissed)
```

`Navigator.pushAndRemoveUntil` clears the back stack from `OutputScreen` so that pressing back on the result goes all the way to `HomeScreen`, not back through the crop flow.

---

## State Management

Medic uses **Flutter's built-in `setState`** for local, screen-scoped state. There is no global state manager (no Provider, Bloc, or Riverpod) because:

- Each screen manages only its own state
- There is no state shared between screens (data is passed via constructors)
- The app flow is strictly linear

This keeps the architecture simple and appropriate for the app's scope.

---

## Extension Guide

To add a new feature (e.g., scan history):

1. **Add a service method** in `OCRservice` or a new `HistoryService` class
2. **Expose it via the controller** (add a method to `OCRcontroller` or create a new controller)
3. **Create a screen** in `lib/screens/` that calls the controller
4. **Wire navigation** from an existing screen
5. **Add widget tests** in `test/`

Follow the existing pattern: services have no Flutter imports except `BuildContext` for navigation; all display logic stays in screens.
