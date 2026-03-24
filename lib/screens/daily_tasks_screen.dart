import 'package:flutter/material.dart';

import '../models/app_task.dart';

class DailyTasksScreen extends StatelessWidget {
  const DailyTasksScreen({
    super.key,
    required this.tasks,
    required this.onToggle,
  });

  final List<AppTask> tasks;
  final ValueChanged<AppTask> onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final statusColor = task.isDone ? Colors.greenAccent : Colors.orangeAccent;
        final statusText = task.isDone ? 'Done' : 'Pending';

        return Card(
          child: InkWell(
            onTap: () => onToggle(task),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: task.isDone ? Colors.greenAccent : Colors.white70,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      task.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: statusColor.withValues(alpha: 0.35)),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(color: statusColor, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
