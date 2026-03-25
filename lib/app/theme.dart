import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0B1E3A),

    primaryColor: Colors.blue,

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0B1E3A),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
