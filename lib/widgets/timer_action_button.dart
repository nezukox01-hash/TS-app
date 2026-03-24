import 'package:flutter/material.dart';

class TimerActionButton extends StatelessWidget {
  const TimerActionButton({
    super.key,
    required this.isRunning,
    required this.onToggle,
  });

  final bool isRunning;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onToggle,
      icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
      label: Text(isRunning ? 'Pause' : 'Start'),
    );
  }
}
