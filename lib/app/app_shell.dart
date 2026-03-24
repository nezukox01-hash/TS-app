import 'package:flutter/material.dart';

import '../models/app_note.dart';
import '../models/app_task.dart';
import '../models/daily_report_entry.dart';
import '../models/timer_stats.dart';
import '../screens/daily_report_screen.dart';
import '../screens/daily_tasks_screen.dart';
import '../screens/home_screen.dart';
import '../screens/notes_list_screen.dart';
import '../screens/notes_main_screen.dart';
import '../screens/stats_page.dart';
import '../screens/timer_screen.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/nav_item.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.tasks,
    required this.notes,
    required this.reports,
    required this.stats,
  });

  final List<AppTask> tasks;
  final List<AppNote> notes;
  final List<DailyReportEntry> reports;
  final TimerStats stats;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 2;

  static const _items = [
    NavItem(label: 'Timer', icon: Icons.timer_outlined),
    NavItem(label: 'Stats', icon: Icons.bar_chart_rounded),
    NavItem(label: 'Home', icon: Icons.home_outlined),
    NavItem(label: 'Report', icon: Icons.description_outlined),
    NavItem(label: 'Notes', icon: Icons.sticky_note_2_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _ScreenFrame(title: 'Timer', child: TimerScreen()),
      _ScreenFrame(title: 'Stats', child: StatsPage(stats: widget.stats)),
      _ScreenFrame(
        title: 'Home',
        child: HomeScreen(tasks: widget.tasks, focusMinutes: widget.stats.totalMinutes),
      ),
      _ScreenFrame(title: 'Daily Report', child: DailyReportScreen(reports: widget.reports)),
      _NotesHost(notes: widget.notes),
    ];

    return Scaffold(
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16), child: pages[_currentIndex])),
      bottomNavigationBar: CustomBottomNav(
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton.extended(
              onPressed: () => _showTasksBottomSheet(context),
              icon: const Icon(Icons.checklist),
              label: const Text('Daily Tasks'),
            )
          : null,
    );
  }

  void _showTasksBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DailyTasksScreen(
              tasks: widget.tasks,
              onToggle: (task) {
                setState(() {
                  task.isDone = !task.isDone;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _ScreenFrame extends StatelessWidget {
  const _ScreenFrame({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 14),
        Expanded(child: child),
      ],
    );
  }
}

class _NotesHost extends StatefulWidget {
  const _NotesHost({required this.notes});

  final List<AppNote> notes;

  @override
  State<_NotesHost> createState() => _NotesHostState();
}

class _NotesHostState extends State<_NotesHost> {
  bool _showList = false;

  @override
  Widget build(BuildContext context) {
    return _ScreenFrame(
      title: 'Notes',
      child: _showList
          ? NotesListScreen(notes: widget.notes)
          : NotesMainScreen(onOpenList: () => setState(() => _showList = true)),
    );
  }
}
