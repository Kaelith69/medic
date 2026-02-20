import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key, required this.outputText}) : super(key: key);
  final String outputText;

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  late final TextEditingController _textController;
  late String outputText;
  bool isLoading = false;
  String errorMessage = '';
  final FlutterTts flutterTts = FlutterTts();
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  List<Reminder> reminders = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.outputText);
    outputText = widget.outputText;

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeNotifications();

    if (outputText.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        speakText(outputText);
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> speakText(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  Future<void> scheduleReminder(Reminder reminder) async {
    setState(() {
      reminders.add(reminder);
    });
  }

  Future<void> deleteReminder(Reminder reminder) async {
    setState(() {
      reminders.remove(reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Scan Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(9.0),
                width: size.width * 0.94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : outputText.isNotEmpty
                        ? TextField(
                            controller: _textController,
                            onChanged: (value) {
                              setState(() {
                                outputText = value;
                              });
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          )
                        : Text(
                            errorMessage.isNotEmpty
                                ? errorMessage
                                : 'Could not find any text in image. Try again',
                            style: TextStyle(
                              color: errorMessage.isNotEmpty
                                  ? Colors.red
                                  : const Color.fromARGB(255, 248, 12, 12),
                            ),
                          ),
              ),
              const SizedBox(height: 20),
              if (outputText.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reminders:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reminders.length,
                      itemBuilder: (context, index) {
                        final reminder = reminders[index];
                        return ListTile(
                          title: Text(reminder.text),
                          subtitle: Text(reminder.time.format(context)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              deleteReminder(reminder);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _showReminderDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                      ),
                      child: const Text(
                        'Add Reminder',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          speakText(outputText);
        },
        backgroundColor: Colors.blueGrey[900],
        child: const Icon(Icons.volume_up),
      ),
    );
  }

  Future<void> _showReminderDialog(BuildContext context) async {
    String reminderText = '';
    TimeOfDay? selectedTime;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Reminder'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      reminderText = value;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Reminder Text'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setDialogState(() {
                          selectedTime = time;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                    ),
                    child: Text(
                      selectedTime != null
                          ? 'Selected: ${selectedTime!.format(context)}'
                          : 'Select Time',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (reminderText.isNotEmpty && selectedTime != null) {
                      final reminder = Reminder(
                        text: reminderText,
                        time: selectedTime!,
                      );
                      scheduleReminder(reminder);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter reminder text and select time.',
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class Reminder {
  final String text;
  final TimeOfDay time;

  Reminder({required this.text, required this.time});
}
