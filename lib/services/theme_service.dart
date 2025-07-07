import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Save theme mode to storage
Future<void> saveThemeMode(ThemeMode mode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("theme_mode", mode.toString());
}

/// Load theme mode from storage
Future<ThemeMode> loadThemeMode() async {
  final prefs = await SharedPreferences.getInstance();
  final themeString = prefs.getString("theme_mode");

  switch (themeString) {
    case 'ThemeMode.dark':
      return ThemeMode.dark;
    case 'ThemeMode.light':
      return ThemeMode.light;
    default:
      return ThemeMode.light;
  }
}