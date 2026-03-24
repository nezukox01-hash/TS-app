import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/ring_timer_visual.dart';
import '../widgets/timer_action_button.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const int totalSeconds = 25 * 60;
  int remainingSeconds = totalSeconds;
  Timer? _timer;

  bool get isRunning => _timer?.isActive == true;

  void _toggleTimer() {
    if (isRunning) {
      _timer?.cancel();
      setState(() {});
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
    setState(() {});
  }

  String get _timeLabel {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = 1 - (remainingSeconds / totalSeconds);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RingTimerVisual(progress: progress, timeLabel: _timeLabel),
        const SizedBox(height: 24),
        TimerActionButton(isRunning: isRunning, onToggle: _toggleTimer),
      ],
    );
  }
}
