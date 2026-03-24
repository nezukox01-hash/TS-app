import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const seed = Color(0xFF00BFA5);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF111315),
    useMaterial3: true,
    cardTheme: const CardThemeData(
      color: Color(0xFF1B1E21),
      margin: EdgeInsets.zero,
    ),
  );
}
