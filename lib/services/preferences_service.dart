import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
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

  /// Save locale to storage
  Future<void> saveLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("locale", locale);
  }

  /// Load locale from storage
  Future<String> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final locale = prefs.getString("locale");
    
    return locale ?? "en";
  }

  /// Save paused state to storage
  Future<void> savePausedState(bool paused) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("paused", paused);
  }

  /// Load paused state from storage
  Future<bool> loadPausedState() async {
    final prefs = await SharedPreferences.getInstance();
    final paused = prefs.getBool("paused");
    
    return paused ?? false;
  }
}