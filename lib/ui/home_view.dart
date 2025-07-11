import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/home/playground_card.dart';
import 'package:date_format_playground/ui/home/reference_section.dart';
import 'package:date_format_playground/ui/widgets/html_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart' show dateTimeSymbolMap;

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final Function(ThemeMode themeMode) onThemeModeChanged;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewSection selectedSection = HomeViewSection.values.first;
  String selectedLocale = "en";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dart/Flutter DateFormat Playground"),
        actions: [
          DropdownMenu(
            dropdownMenuEntries: dateTimeSymbolMap().keys.map((l) => DropdownMenuEntry(
              value: l,
              label: l,
            )).toList(),
            initialSelection: selectedLocale,
            onSelected: (value) {
              if (value != null) setState(() => selectedLocale = value);
            },
            enableFilter: false,
            enableSearch: false,
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder()
            ),
            width: 100,
          ),
          ValueListenableBuilder(
            valueListenable: DateFormatUpdateTicker().isPaused,
            builder: (context, isPaused, _) {
              return IconButton(
                onPressed: () => DateFormatUpdateTicker().togglePause(),
                icon: Icon(isPaused ? Icons.play_arrow_outlined : Icons.pause_outlined),
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
                      HomeViewSection.cheatsheet => const Placeholder(),
                      HomeViewSection.skeletons => const Placeholder(),
                      HomeViewSection.reference => ReferenceSection(locale: selectedLocale),
                      HomeViewSection.about => const Placeholder(),
                    }
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
              child: HtmlWidget(html: """
This webseite is intended to be a playground for date formatting in Dart/Flutter using the <a href="https://pub.dev/packages/intl">intl package</a>.
<br><br>
On top you can see the playground. Input any format pattern and see the result immediately.
<br>
In the top right corner you can toggle light/dark mode, set the locale for all date formatting and play/pause periodic format updates.
<br><br>
The rest of this site is divided into 4 sections:
<ul>
<li><b>Cheatsheet</b>: List of all available format symbols</li>
<li><b>Skeletons</b>: List of all available skeletons. Skeletons are presets with an own constructor and returns real localized results</li>
<li><b>Reference</b>: Full reference of all usage cases of all format symbols</li>
<li><b>About</b>: About this app</li>
</ul>"""),
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