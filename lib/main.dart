import 'dart:async';

import 'package:date_format_playground/services/preferences_service.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  final ThemeMode themeMode = await PreferencesService().loadThemeMode();
  final String locale = await PreferencesService().loadLocale();
  final bool paused = await PreferencesService().loadPausedState();

  runApp(
    App(
      themeMode: themeMode,
      locale: locale,
      paused: paused,
    ),
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
    required this.themeMode,
    required this.locale,
    required this.paused,
  });

  final ThemeMode themeMode;
  final String locale;
  final bool paused;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeMode selectedThemeMode;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    selectedThemeMode = widget.themeMode;
    pauseNotifier.value = widget.paused;
    _timer = startGlobalTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart DateFormat Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: selectedThemeMode,
      debugShowCheckedModeBanner: false,
      home: HomeView(
        themeMode: selectedThemeMode,
        onThemeModeChanged: (newThemeMode) {
          PreferencesService().saveThemeMode(newThemeMode);
          setState(() => selectedThemeMode = newThemeMode);
        },
        locale: widget.locale,
      ),
    );
  }
}