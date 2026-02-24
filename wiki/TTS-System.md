# TTS System

> Medic uses **flutter_tts** to provide automatic text-to-speech playback of every scanned medicine label, making the app fully accessible without sight.

---

## Overview

| Property | Value |
|---|---|
| **Package** | `flutter_tts` ^4.0.2 |
| **Engine** | Native platform TTS (Android: TextToSpeech API; iOS: AVSpeechSynthesizer) |
| **Auto-play** | Yes — reads aloud on every successful scan |
| **Replay** | Yes — floating action button replays on demand |
| **Language** | Device default |
| **Internet required** | No |

---

## Architecture

TTS is entirely contained within `OutputScreen`. There is no dedicated TTS service class — the `FlutterTts` instance is owned by the `_OutputScreenState`.

```
OutputScreen (_OutputScreenState)
├── FlutterTts flutterTts          (instance field)
├── initState()
│     └── WidgetsBinding.addPostFrameCallback → speakText(outputText)
├── speakText(text)
│     ├── flutterTts.setVolume(1.0)
│     ├── flutterTts.setSpeechRate(1.0)
│     ├── flutterTts.setPitch(1.0)
│     └── flutterTts.speak(text)
├── dispose()
│     └── flutterTts.stop()
└── FloatingActionButton
      └── onPressed → speakText(outputText)
```

---

## Implementation

### Initialisation

```dart
// lib/screens/output_screen.dart
final FlutterTts flutterTts = FlutterTts();

@override
void initState() {
  super.initState();
  _textController = TextEditingController(text: widget.outputText);
  outputText = widget.outputText;

  // ...notification init...

  if (outputText.isNotEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      speakText(outputText);   // Auto-speak after first frame
    });
  }
}
```

`addPostFrameCallback` defers the TTS call until after the widget tree is fully built, avoiding issues with calling platform channels before the widget is mounted.

### Speaking

```dart
Future<void> speakText(String text) async {
  await flutterTts.setVolume(1.0);      // Maximum volume
  await flutterTts.setSpeechRate(1.0);  // Normal speed
  await flutterTts.setPitch(1.0);       // Normal pitch
  await flutterTts.speak(text);
}
```

### Cleanup

```dart
@override
void dispose() {
  _textController.dispose();
  flutterTts.stop();   // Stop any ongoing speech on screen dispose
  super.dispose();
}
```

Calling `flutterTts.stop()` in `dispose` prevents orphaned audio playing after the screen is removed from the widget tree.

---

## Auto-Read Behaviour

- TTS fires automatically on every successful OCR scan
- If the OCR result is empty, TTS is not triggered (guarded by `if (outputText.isNotEmpty)`)
- If the user edits the text and taps the **🔊 FAB**, the **edited** text is spoken (not the original OCR output), because `speakText` uses the live `outputText` state variable

---

## Replay Button

```dart
FloatingActionButton(
  onPressed: () {
    speakText(outputText);   // Uses current text field value
  },
  backgroundColor: Colors.blueGrey[900],
  child: const Icon(Icons.volume_up),
)
```

Located at the bottom-right of the Output Screen. Reads the current contents of the text field, including any user edits.

---

## Platform Behaviour

### Android

- Uses Android's `TextToSpeech` API
- Language defaults to device locale
- TTS engine is always available (bundled with Android)
- Works on physical devices and most emulators

### iOS

- Uses `AVSpeechSynthesizer`
- TTS works on physical devices
- **iOS Simulator has limited TTS support** — test on a physical device for full experience
- Requires no Info.plist key for basic TTS (only speech recognition requires a key)

---

## Configuration Options

The current v1.0.0 implementation uses fixed TTS parameters. Future versions can expose these as user settings:

| Parameter | Current Value | `FlutterTts` API | Notes |
|---|---|---|---|
| Volume | 1.0 | `setVolume(0.0–1.0)` | 0.0 = silent, 1.0 = max |
| Speech Rate | 1.0 | `setSpeechRate(0.0–2.0)` | 0.5 = slow, 1.0 = normal, 2.0 = fast |
| Pitch | 1.0 | `setPitch(0.5–2.0)` | 0.5 = low, 1.0 = normal, 2.0 = high |
| Language | Device default | `setLanguage("en-US")` | BCP-47 language code |

---

## Accessibility Impact

TTS is the central accessibility feature of Medic:

| User need | How TTS helps |
|---|---|
| Visual impairment | Label is read aloud without requiring any vision |
| Low literacy | Complex pharmaceutical text is spoken clearly |
| Elderly users | No need to squint at small label fonts |
| Non-native speakers | Can set TTS to a more familiar language (future feature) |
| Hands-free use | Auto-play means no interaction needed after cropping |

---

## Extending TTS

### Adding User-Configurable Speed

```dart
// In a settings screen or dialog
double _speechRate = 1.0;

Slider(
  value: _speechRate,
  min: 0.5,
  max: 2.0,
  onChanged: (value) => setState(() => _speechRate = value),
)

// In speakText:
await flutterTts.setSpeechRate(_speechRate);
```

### Adding Language Selection

```dart
final availableLanguages = await flutterTts.getLanguages;

// Show in a DropdownButton
await flutterTts.setLanguage(selectedLanguage);
```

### Listening to TTS Completion Events

```dart
flutterTts.setCompletionHandler(() {
  // Called when speech finishes
  setState(() => isSpeaking = false);
});
```

---

## Debugging TTS

| Issue | Diagnosis | Fix |
|---|---|---|
| No audio on Android emulator | Emulator has no audio output | Test on physical device |
| No audio on iOS Simulator | Limited Simulator TTS | Test on physical device |
| TTS speaks old text after edit | `speakText` uses `outputText` state | Ensure `onChanged` updates `outputText` |
| TTS crashes on dispose | `flutterTts.stop()` not called | Already handled in `dispose()` |
| Language mismatch | Device locale set to non-English | Use `setLanguage()` for explicit language |
