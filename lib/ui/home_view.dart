import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final Function(ThemeMode themeMode) onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onThemeModeChanged(
              themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            ),
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: constraints.maxWidth > 600 ? 600 : double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: const Placeholder(),
              ),
            ),
          );
        },
      ),
    );
  }
}