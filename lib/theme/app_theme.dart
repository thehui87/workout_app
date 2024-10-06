import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF6200EE),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF6200EE),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF6200EE),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 4,
      ),
    );
  }
}
