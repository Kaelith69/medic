# OCR System

> Medic's OCR pipeline uses **Google ML Kit Text Recognition** to extract text from medicine labels entirely on-device, with no network dependency.

---

## Overview

| Property | Value |
|---|---|
| **Package** | `google_mlkit_text_recognition` ^0.11.0 |
| **Engine** | Google ML Kit Text Recognition v2 |
| **Script support** | Latin (default) |
| **Processing** | Fully on-device |
| **Internet required** | No |
| **Model bundled** | Yes (via Gradle / CocoaPods) |

---

## Pipeline

<div align="center">

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 160" width="700" height="160">
  <defs>
    <linearGradient id="ocrBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f172a"/>
      <stop offset="100%" style="stop-color:#1e293b"/>
    </linearGradient>
    <marker id="ocrArrow" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#10B981"/>
    </marker>
  </defs>
  <rect width="700" height="160" rx="12" fill="url(#ocrBg)"/>
  <!-- Step 1 -->
  <rect x="20" y="50" width="110" height="60" rx="8" fill="#0B8F87" fill-opacity="0.75"/>
  <text x="75" y="76" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="white" text-anchor="middle">Image Capture</text>
  <text x="75" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Camera / Gallery</text>
  <text x="75" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Uint8List bytes</text>
  <!-- Arrow -->
  <line x1="132" y1="80" x2="155" y2="80" stroke="#10B981" stroke-width="2" marker-end="url(#ocrArrow)"/>
  <!-- Step 2 -->
  <rect x="157" y="50" width="110" height="60" rx="8" fill="#2563EB" fill-opacity="0.75"/>
  <text x="212" y="76" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="white" text-anchor="middle">Crop Widget</text>
  <text x="212" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">crop_your_image</text>
  <text x="212" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Cropped Uint8List</text>
  <!-- Arrow -->
  <line x1="269" y1="80" x2="292" y2="80" stroke="#10B981" stroke-width="2" marker-end="url(#ocrArrow)"/>
  <!-- Step 3 -->
  <rect x="294" y="50" width="120" height="60" rx="8" fill="#2563EB" fill-opacity="0.6"/>
  <text x="354" y="76" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="white" text-anchor="middle">Temp File Write</text>
  <text x="354" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">Directory.systemTemp</text>
  <text x="354" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">temp_ocr.png</text>
  <!-- Arrow -->
  <line x1="416" y1="80" x2="439" y2="80" stroke="#10B981" stroke-width="2" marker-end="url(#ocrArrow)"/>
  <!-- Step 4 -->
  <rect x="441" y="50" width="120" height="60" rx="8" fill="#10B981" fill-opacity="0.75"/>
  <text x="501" y="76" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="white" text-anchor="middle">ML Kit OCR</text>
  <text x="501" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">TextRecognizer</text>
  <text x="501" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">processImage()</text>
  <!-- Arrow -->
  <line x1="563" y1="80" x2="586" y2="80" stroke="#10B981" stroke-width="2" marker-end="url(#ocrArrow)"/>
  <!-- Step 5 -->
  <rect x="588" y="50" width="96" height="60" rx="8" fill="#0B8F87" fill-opacity="0.75"/>
  <text x="636" y="76" font-family="'Segoe UI',Arial,sans-serif" font-size="10" font-weight="700" fill="white" text-anchor="middle">Output</text>
  <text x="636" y="92" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">RecognizedText</text>
  <text x="636" y="105" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="white" fill-opacity="0.8" text-anchor="middle">.text string</text>
  <!-- Step labels -->
  <text x="75" y="44" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">① Capture</text>
  <text x="212" y="44" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">② Crop</text>
  <text x="354" y="44" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">③ Persist</text>
  <text x="501" y="44" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">④ Recognise</text>
  <text x="636" y="44" font-family="'Segoe UI',Arial,sans-serif" font-size="9" fill="#64748b" text-anchor="middle">⑤ Return</text>
</svg>

</div>

---

## Implementation Details

### `OCRservice._scanImage`

```dart
// lib/services/ocr_service.dart

Future<void> _scanImage(BuildContext context, String path) async {
  TextRecognizer? textRecognizer;
  try {
    textRecognizer = TextRecognizer();                    // Create recogniser
    final inputImage = InputImage.fromFilePath(path);    // Wrap file path
    final RecognizedText recognisedText =
        await textRecognizer.processImage(inputImage);   // Run OCR
    
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => OutputScreen(
                  outputText: recognisedText.text,       // Pass plain text
                )),
        (Route<dynamic> route) => false);                // Clear back stack
  } catch (e) {
    if (!context.mounted) return;
    showSnackBar(context: context, content: e.toString());
  } finally {
    await textRecognizer?.close();                       // Always release resources
  }
}
```

**Key points:**
- `TextRecognizer` must be closed in `finally` to release the native ML Kit resources
- `InputImage.fromFilePath` requires an absolute file path (not bytes)
- This is why `OCRservice.cropping` writes the `Uint8List` to a temp file first
- `recognisedText.text` is the full concatenated string; block/line structure is available via `recognisedText.blocks` if needed

### Temporary File Handling

```dart
Future<void> cropping(BuildContext context, Uint8List image) async {
  try {
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/temp_ocr.png');
    await tempFile.writeAsBytes(image);       // Write cropped PNG
    if (!context.mounted) return;
    await _scanImage(context, tempFile.path); // Pass path to ML Kit
  } catch (e) { ... }
}
```

- Uses `Directory.systemTemp` (OS temp directory, automatically cleaned by the OS)
- Always writes to the same file name (`temp_ocr.png`) — safe because OCR is sequential
- The file is not explicitly deleted; OS temp cleanup handles it

---

## ML Kit Text Recognizer Lifecycle

| Event | Action |
|---|---|
| OCR starts | `TextRecognizer()` instantiated |
| OCR completes | `recognisedText` returned |
| After navigation | `textRecognizer.close()` called in `finally` |

Failing to call `.close()` leaks the native recognizer instance. The `finally` block guarantees cleanup even if an exception occurs.

---

## Output Data Model

`RecognizedText` has the following structure (available for future use):

```
RecognizedText
├── text: String          ← Full concatenated text (used by Medic v1.0)
└── blocks: List<TextBlock>
      └── TextBlock
            ├── text: String
            ├── boundingBox: Rect
            └── lines: List<TextLine>
                  └── TextLine
                        ├── text: String
                        └── elements: List<TextElement>
```

Medic currently uses only `recognisedText.text`. Structured access to blocks and bounding boxes is available for future features (e.g., highlighting specific dosage information).

---

## Accuracy Considerations

| Factor | Impact | Recommendation |
|---|---|---|
| Image resolution | High resolution = better accuracy | Use camera at full resolution |
| Lighting | Poor lighting → missed characters | Good ambient light, avoid shadows |
| Crop precision | Tight crop removes background noise | Crop to the label area only |
| Font type | Printed fonts scan better than handwritten | Printed labels only in v1.0 |
| Image blur | Motion blur significantly degrades OCR | Hold device steady |
| Label condition | Damaged or wet labels reduce accuracy | Use cleanest available copy |

---

## Multi-Script Support (Future)

ML Kit supports multiple script models. To add a new language in a future version:

```dart
// Latin (current)
TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

// Chinese (future)
TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.chinese);

// Arabic (future)
TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.devanagari);
```

Each script requires its own ML Kit model, which is bundled separately.

---

## Debugging OCR

1. Check `flutter logs` for ML Kit exceptions
2. Ensure the temp file was written: add a `print(tempFile.existsSync())` before `_scanImage`
3. Test with a high-contrast, well-lit image first to isolate accuracy issues from code issues
4. If ML Kit initialises but returns empty text, the image was processed but no text was found — the output screen handles this case with an appropriate message
