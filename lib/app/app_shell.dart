import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/timer_screen.dart';
import '../screens/stats_page.dart';
import '../screens/daily_report_screen.dart';
import '../screens/notes_main_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 2; // Home center

  final pages = const [
    TimerScreen(),
    StatsPage(),
    HomeScreen(),
    DailyReportScreen(),
    NotesMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0B1E3A),

        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,

        onTap: (i) => setState(() => index = i),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Timer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Report",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Notes",
          ),
        ],
      ),
    );
  }
}
