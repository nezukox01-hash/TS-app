import 'package:flutter/material.dart';

class ReminderMenuCardStatic extends StatelessWidget {
  const ReminderMenuCardStatic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.alarm_outlined),
        title: Text('Set recurring reminders'),
        subtitle: Text('Feature available in next iteration'),
      ),
    );
  }
}
