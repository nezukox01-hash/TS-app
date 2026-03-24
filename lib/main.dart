import 'package:flutter/material.dart';

import 'app/app_loader.dart';
import 'app/app_shell.dart';
import 'app/theme.dart';
import 'storage/app_storage.dart';

void main() {
  runApp(const TsApp());
}

class TsApp extends StatelessWidget {
  const TsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loader = AppLoader(AppStorage());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: AppShell(
        tasks: loader.loadTasks(),
        notes: loader.loadNotes(),
        reports: loader.loadReports(),
        stats: loader.loadStats(),
      ),
    );
  }
}
