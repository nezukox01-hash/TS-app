import 'package:flutter/material.dart';

import '../models/app_task.dart';
import '../utils/task_helpers.dart';
import '../widgets/home_minimal_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.tasks,
    required this.focusMinutes,
  });

  final List<AppTask> tasks;
  final int focusMinutes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeMinimalCard(
          title: 'Focus Time',
          value: '$focusMinutes min',
        ),
        const SizedBox(height: 12),
        HomeMinimalCard(
          title: 'Tasks Completed',
          value: '${completedTasks(tasks)} / ${tasks.length}',
        ),
      ],
    );
  }
}
