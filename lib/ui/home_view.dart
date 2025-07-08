import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/home/playground_card.dart';
import 'package:date_format_playground/ui/home/reference_section.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart' show dateTimeSymbolMap;

enum HomeViewSection {
  reference,
  about,
}

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
  HomeViewSection selectedSection = HomeViewSection.reference;
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
                        children: [
                          ChoiceChip.elevated(
                            label: Text("Reference", style: selectedSection == HomeViewSection.reference ? TextStyle(color: theme.colorScheme.onPrimaryContainer) : null),
                            selected: selectedSection == HomeViewSection.reference,
                            onSelected: (value) => setState(() => selectedSection = HomeViewSection.reference),
                            showCheckmark: false,
                            selectedColor: theme.colorScheme.primaryContainer,
                          ),
                          ChoiceChip.elevated(
                            label: Text("About", style: selectedSection == HomeViewSection.about ? TextStyle(color: theme.colorScheme.onPrimaryContainer) : null),
                            selected: selectedSection == HomeViewSection.about,
                            onSelected: (value) => setState(() => selectedSection = HomeViewSection.about),
                            showCheckmark: false,
                            selectedColor: theme.colorScheme.primaryContainer,
                          ),
                        ],
                      ),
                    ),
                    switch (selectedSection) {
                      HomeViewSection.reference => ReferenceSection(locale: selectedLocale),
                      HomeViewSection.about => Placeholder(),
                    }
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}