# Contributing

Thank you for considering a contribution to Medic! This guide covers everything you need to get started.

---

## Code of Conduct

All contributors are expected to be respectful and constructive. Please keep discussions focused on the technical merits and be welcoming to contributors of all experience levels.

---

## Ways to Contribute

| Type | Description |
|---|---|
| 🐛 Bug reports | Open a GitHub Issue with reproduction steps |
| 💡 Feature requests | Open a GitHub Issue with a clear use case |
| 🔧 Bug fixes | Fork → fix → PR |
| ✨ New features | Discuss in an Issue first, then PR |
| 📚 Documentation | Improve wiki pages or README |
| 🧪 Tests | Add or improve widget/unit tests |

---

## Development Setup

### 1. Fork and Clone

```bash
# Fork on GitHub, then:
git clone https://github.com/<your-username>/medic.git
cd medic
flutter pub get
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/my-feature
# or for a bug fix:
git checkout -b fix/issue-123
```

### 3. Verify Tests Pass

```bash
flutter test
```

### 4. Run the Linter

```bash
flutter analyze
```

Fix all lint warnings before submitting. The project uses `flutter_lints` rules defined in `analysis_options.yaml`.

---

## Code Standards

### Dart / Flutter Style

- Follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use `const` constructors wherever possible
- Prefer named parameters for widget constructors with more than 2 arguments
- Always check `context.mounted` after any `await` in a widget method
- Use `final` for fields that are set once

### Architecture Rules

| Rule | Reason |
|---|---|
| No business logic in screens | Keeps screens thin and testable |
| No Flutter imports in pure service logic | Services should be unit-testable without a widget environment |
| Controller is a thin facade | One controller method per one service method |
| Close native resources in `finally` | Prevents leaks (e.g., `TextRecognizer.close()`) |

### Naming Conventions

| Element | Convention | Example |
|---|---|---|
| Classes | PascalCase | `OCRservice`, `HomeScreen` |
| Methods | camelCase | `takePhoto`, `speakText` |
| Private methods | `_` prefix | `_scanImage`, `_showReminderDialog` |
| Files | snake_case | `ocr_service.dart`, `home_screen.dart` |
| Constants | camelCase or SCREAMING_SNAKE for globals | `kPrimaryColor` |

---

## Commit Message Format

Use conventional commit messages:

```
<type>(<scope>): <short description>

Examples:
feat(ocr): add multi-script support
fix(tts): stop speech on screen dispose
docs(wiki): update OCR system page
test(home): add dialog button widget test
refactor(service): extract temp file logic
```

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `perf`, `style`

---

## Pull Request Process

1. **Check for an existing issue** — link your PR to the relevant issue (`Closes #123`)
2. **Keep PRs focused** — one feature or fix per PR
3. **Write/update tests** — new behaviour must have widget or unit tests
4. **Run `flutter test` and `flutter analyze`** — both must pass
5. **Update wiki pages** if your change affects documented behaviour
6. **Fill in the PR template** with a clear description of what changed and why

### PR Checklist

- [ ] `flutter test` passes
- [ ] `flutter analyze` shows no warnings
- [ ] New behaviour is covered by a test
- [ ] Wiki updated if behaviour changed
- [ ] `context.mounted` checked after every `await` in widget code
- [ ] No hardcoded strings that should be constants

---

## Adding Tests

Tests live in `test/widget_test.dart`. Use `flutter_test` and `WidgetTester`:

```dart
testWidgets('My new feature works', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
  // ... assertions
});
```

Refer to the existing test file for patterns.

---

## Project Structure Reminder

```
lib/
├── screens/      ← UI only, no business logic
├── controllers/  ← Thin facade, delegates to services
├── services/     ← Business logic, SDK calls
└── components/   ← Shared helpers
```

New features should follow this structure. Do not add business logic to screens.

---

## Reporting Bugs

Open a GitHub Issue and include:

1. **Flutter version:** `flutter --version`
2. **Platform:** Android / iOS, version number, device model
3. **Steps to reproduce** (numbered list)
4. **Expected behaviour**
5. **Actual behaviour**
6. **Logs:** `flutter logs` output or stack trace if available

---

## Questions

Open a GitHub Discussion or Issue tagged `question`. All questions are welcome.
