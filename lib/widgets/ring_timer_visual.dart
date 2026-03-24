import 'package:flutter/material.dart';

import 'progress_ring_painter.dart';

class RingTimerVisual extends StatelessWidget {
  const RingTimerVisual({
    super.key,
    required this.progress,
    required this.timeLabel,
  });

  final double progress;
  final String timeLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: CustomPaint(
        painter: ProgressRingPainter(progress: progress),
        child: Center(
          child: Text(
            timeLabel,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
