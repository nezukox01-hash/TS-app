import '../models/app_note.dart';
import '../models/app_task.dart';
import '../models/daily_report_entry.dart';
import '../models/timer_stats.dart';
import '../storage/app_storage.dart';
import '../storage/storage_keys.dart';

class AppLoader {
  AppLoader(this._storage);

  final AppStorage _storage;

  List<AppTask> loadTasks() {
    return _storage.read<List<AppTask>>(StorageKeys.tasks) ??
        [
          AppTask(id: '1', title: 'Plan top 3 priorities'),
          AppTask(id: '2', title: '25 min focus session', isDone: true),
          AppTask(id: '3', title: 'Review notes and report'),
        ];
  }

  List<AppNote> loadNotes() {
    return _storage.read<List<AppNote>>(StorageKeys.notes) ??
        [
          AppNote(
            id: '1',
            title: 'Weekly Reflection',
            body: 'Stayed consistent with timer and daily reports.',
            createdAt: DateTime.now(),
          ),
        ];
  }

  List<DailyReportEntry> loadReports() {
    return _storage.read<List<DailyReportEntry>>(StorageKeys.reports) ??
        [
          DailyReportEntry(
            id: '1',
            date: DateTime.now().subtract(const Duration(days: 1)),
            summary: 'Good momentum. Completed all key tasks.',
            focusHours: 2.5,
          ),
        ];
  }

  TimerStats loadStats() {
    return _storage.read<TimerStats>(StorageKeys.timerStats) ??
        const TimerStats(totalMinutes: 300, sessions: 12, streak: 4);
  }
}
