import 'package:flutter/material.dart';

import '../models/timer_stats.dart';
import '../widgets/summary_row.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({
    super.key,
    required this.stats,
  });

  final TimerStats stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryRow(label: 'Total focus minutes', value: '${stats.totalMinutes}'),
        SummaryRow(label: 'Sessions completed', value: '${stats.sessions}'),
        SummaryRow(label: 'Current streak', value: '${stats.streak} days'),
      ],
    );
  }
}
