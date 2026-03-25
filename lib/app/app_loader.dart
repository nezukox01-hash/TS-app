import 'package:flutter/material.dart';
import 'app_shell.dart';
import 'theme.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study With TS',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const AppShell(),
    );
  }
}
