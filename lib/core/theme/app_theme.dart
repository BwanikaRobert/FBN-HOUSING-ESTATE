import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 6,
      ),
    );
  }
}
