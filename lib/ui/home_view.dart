import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/services/preferences_service.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/home/about_section.dart';
import 'package:date_format_playground/ui/home/cheatsheet_section.dart';
import 'package:date_format_playground/ui/home/playground_card.dart';
import 'package:date_format_playground/ui/home/reference_section.dart';
import 'package:date_format_playground/ui/home/skeletons_section.dart';
import 'package:date_format_playground/ui/widgets/html_widget.dart';
import 'package:date_format_playground/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.locale,
  });

  final ThemeMode themeMode;
  final Function(ThemeMode themeMode) onThemeModeChanged;
  final String locale;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewSection selectedSection = HomeViewSection.values.first;
  late String selectedLocale;

  @override
  void initState() {
    super.initState();
    selectedLocale = widget.locale;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dart DateFormat Playground"),
        actions: [
          DropdownMenu(
            dropdownMenuEntries: localeList.map((l) => DropdownMenuEntry(
              value: l,
              label: l,
            )).toList(),
            initialSelection: selectedLocale,
            onSelected: (value) {
              if (value != null) {
                PreferencesService().saveLocale(value);
                setState(() => selectedLocale = value);
              }
            },
            enableFilter: false,
            enableSearch: false,
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder()
            ),
            width: 100,
          ),
          ValueListenableBuilder(
            valueListenable: pauseNotifier,
            builder: (context, isPaused, _) {
              return IconButton(
                onPressed: () {
                  PreferencesService().savePausedState(!pauseNotifier.value);
                  pauseNotifier.value = !pauseNotifier.value;
                },
                icon: Icon(isPaused ? Icons.play_arrow_outlined : Icons.pause_outlined),
                tooltip: isPaused ? "Resume periodic formatting" : "Pause periodic formatting",
              );
            }
          ),
          IconButton(
            onPressed: () => widget.onThemeModeChanged(
              widget.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            ),
            icon: Icon(
              widget.themeMode == ThemeMode.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            tooltip: widget.themeMode == ThemeMode.light ? "Switch to dark mode" : "Switch to light mode",
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
                width: constraints.maxWidth > 1000 ? 1000 : double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 32,
                  children: [
                    PlaygroundCard(
                      locale: selectedLocale,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: HomeViewSection.values.map((section) => ChoiceChip.elevated(
                          label: Text(
                            getSectionName(section),
                            style: selectedSection == section ? TextStyle(color: theme.colorScheme.onPrimaryContainer) : null,
                          ),
                          selected: selectedSection == section,
                          onSelected: (value) => setState(() => selectedSection = section),
                          showCheckmark: false,
                          selectedColor: theme.colorScheme.primaryContainer,
                        )).toList(),
                      ),
                    ),
                    switch (selectedSection) {
                      HomeViewSection.cheatsheet => CheatsheetSection(locale: selectedLocale),
                      HomeViewSection.skeletons => SkeletonsSection(locale: selectedLocale),
                      HomeViewSection.reference => ReferenceSection(locale: selectedLocale),
                      HomeViewSection.about => AboutSection(themeMode: widget.themeMode),
                    },
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Help"),
            content: Container(
              constraints: BoxConstraints(maxWidth: 700),
              child: HtmlWidget(html: helpDialogContent),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              )
            ],
          ),
        ),
        child: Icon(Icons.question_mark),
      ),
    );
  }
}