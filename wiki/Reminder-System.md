# Reminder System

> Medic's reminder system allows users to associate named, time-of-day reminders with a scanned medicine label. In v1.0.0, reminders are stored in-memory for the duration of the session.

---

## Overview

| Property | Value |
|---|---|
| **Package** | `flutter_local_notifications` ^9.3.1 |
| **Storage** | In-memory (session only in v1.0.0) |
| **Push notification** | Initialised but not yet scheduled (v1.0.0) |
| **UI** | List in OutputScreen + AddReminder dialog |
| **Data model** | `Reminder` class (text + TimeOfDay) |

---

## Architecture

```
OutputScreen (_OutputScreenState)
├── List<Reminder> reminders          (in-memory state)
├── FlutterLocalNotificationsPlugin   (initialised, future use)
├── _showReminderDialog(context)      (add reminder flow)
├── scheduleReminder(reminder)        (adds to list)
└── deleteReminder(reminder)          (removes from list)
```

---

## Data Model

```dart
// lib/screens/output_screen.dart

class Reminder {
  final String text;      // User-entered reminder name (e.g. "Take with food")
  final TimeOfDay time;   // Time of day selected via TimePicker

  Reminder({required this.text, required this.time});
}
```

`TimeOfDay` is Flutter's built-in time-only type, holding `hour` (0–23) and `minute` (0–59).

---

## Reminder List UI

Rendered in `OutputScreen` using a `ListView.builder`:

```dart
ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: reminders.length,
  itemBuilder: (context, index) {
    final reminder = reminders[index];
    return ListTile(
      title: Text(reminder.text),
      subtitle: Text(reminder.time.format(context)),  // e.g. "08:30 AM"
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,
        onPressed: () => deleteReminder(reminder),
      ),
    );
  },
)
```

`reminder.time.format(context)` respects the device's 12-hour/24-hour format preference.

---

## Add Reminder Flow

Tapping **"Add Reminder"** opens a `StatefulBuilder` dialog:

```
[Reminder Text field]    ← Free text input
[Select Time button]     ← Opens showTimePicker()
     ↓ (after selection)
[Selected: 08:30 AM]     ← Button label updates
[Cancel]  [Add]          ← Action buttons
```

**Validation:** Both fields must be non-empty/non-null. If not, a SnackBar warns:
> *"Please enter reminder text and select time."*

**On Add:**
```dart
final reminder = Reminder(text: reminderText, time: selectedTime!);
scheduleReminder(reminder);  // Adds to in-memory list
Navigator.of(context).pop();
```

---

## Notification Plugin Initialisation

The plugin is initialised in `_initializeNotifications()`:

```dart
Future<void> _initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
```

The `app_icon` refers to a drawable resource at `android/app/src/main/res/drawable/app_icon.png`. This must exist for Android notifications in a future version.

**Current state:** The plugin is initialised but no notification is scheduled. The `scheduleReminder` method currently only adds to the in-memory list.

---

## v1.1 Roadmap: Scheduled Notifications

In v1.1, reminders will fire device push notifications at the selected time using `zonedSchedule`:

```dart
// Future implementation (v1.1)
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

Future<void> scheduleNotification(Reminder reminder) async {
  final now = tz.TZDateTime.now(tz.local);
  final scheduledTime = tz.TZDateTime(
    tz.local,
    now.year, now.month, now.day,
    reminder.time.hour, reminder.time.minute,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    reminder.hashCode,
    'Medic Reminder',
    reminder.text,
    scheduledTime,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'medic_reminders',
        'Medication Reminders',
        channelDescription: 'Reminds you to take medication',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: IOSNotificationDetails(),
    ),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}
```

`matchDateTimeComponents: DateTimeComponents.time` makes the reminder repeat daily at the same time.

---

## v1.1 Roadmap: Persistent Storage

Reminders will be persisted using `shared_preferences` or `hive` so they survive app restarts:

```dart
// Future: Save reminders on add
Future<void> persistReminders() async {
  final prefs = await SharedPreferences.getInstance();
  final encoded = json.encode(reminders.map((r) => {
    'text': r.text,
    'hour': r.time.hour,
    'minute': r.time.minute,
  }).toList());
  await prefs.setString('reminders', encoded);
}
```

---

## Delete Reminder

```dart
Future<void> deleteReminder(Reminder reminder) async {
  setState(() {
    reminders.remove(reminder);
  });
  // Future: cancel the scheduled notification by ID
  // await flutterLocalNotificationsPlugin.cancel(reminder.hashCode);
}
```

The `hashCode` approach provides a deterministic notification ID per reminder object.

---

## Platform Requirements for Notifications

### Android
- `SCHEDULE_EXACT_ALARM` permission required for exact-time notifications on Android 12+
- Notification channel must be created before displaying notifications
- `app_icon` drawable resource must exist

### iOS
- Permission must be requested at runtime: `flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(...)`
- No Info.plist entry needed for local notifications (only push notifications require entitlements)

---

## Debugging Reminders

| Issue | Cause | Fix |
|---|---|---|
| Reminder not appearing in list | `setState` not called | Check `scheduleReminder` is called within `setState` |
| Time shows incorrectly | Device 12/24h format | `TimeOfDay.format(context)` respects device setting |
| List disappears on back-press | `OutputScreen` disposed | Expected — in-session only in v1.0.0 |
| Add dialog validation not firing | Both fields not set | SnackBar message guides the user |
