import 'package:date_format_playground/ui/home/playground_card.dart';
import 'package:flutter/material.dart';

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
  bool isUpdatePaused = false;
  HomeViewSection selectedSection = HomeViewSection.reference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart/Flutter DateFormat Playground"),
        actions: [
          IconButton(
            onPressed: () => setState(() => isUpdatePaused = !isUpdatePaused),
            icon: Icon(isUpdatePaused ? Icons.play_arrow_outlined : Icons.pause_outlined),
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
                      isPaused: isUpdatePaused,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Wrap(
                        spacing: 8,
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          ChoiceChip(
                            label: Text("Reference"),
                            selected: selectedSection == HomeViewSection.reference,
                            onSelected: (value) => setState(() => selectedSection = HomeViewSection.reference),
                            showCheckmark: false,
                          ),
                          ChoiceChip(
                            label: Text("About"),
                            selected: selectedSection == HomeViewSection.about,
                            onSelected: (value) => setState(() => selectedSection = HomeViewSection.about),
                            showCheckmark: false,
                          ),
                        ],
                      ),
                    )
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