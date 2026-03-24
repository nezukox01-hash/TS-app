class DailyReportEntry {
  DailyReportEntry({
    required this.id,
    required this.date,
    required this.summary,
    required this.focusHours,
  });

  final String id;
  final DateTime date;
  final String summary;
  final double focusHours;
}
