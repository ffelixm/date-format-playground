import 'package:date_format_playground/services/theme_service.dart';
import 'package:date_format_playground/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  final ThemeMode themeMode = await loadThemeMode();

  runApp(App(themeMode: themeMode));
}

class App extends StatefulWidget {
  const App({
    super.key,
    required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeMode selectedThemeMode;

  @override
  void initState() {
    super.initState();
    selectedThemeMode = widget.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DateFormat Playground',
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
          saveThemeMode(newThemeMode);
          setState(() => selectedThemeMode = newThemeMode);
        },
      ),
    );
  }
}