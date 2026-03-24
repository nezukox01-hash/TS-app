import 'package:flutter/material.dart';

import '../models/daily_report_entry.dart';
import '../utils/app_helpers.dart';

class DailyReportScreen extends StatelessWidget {
  const DailyReportScreen({
    super.key,
    required this.reports,
  });

  final List<DailyReportEntry> reports;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final entry = reports[index];
        return Card(
          child: ListTile(
            title: Text(formatDate(entry.date)),
            subtitle: Text(entry.summary),
            trailing: Text('${entry.focusHours.toStringAsFixed(1)}h'),
          ),
        );
      },
    );
  }
}
