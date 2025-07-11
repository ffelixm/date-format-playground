import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/data/cheatsheet_data.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheatsheetSection extends StatelessWidget {
  const CheatsheetSection({
    super.key,
    required this.locale,
  });

  final String locale;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            getSectionTitle(HomeViewSection.cheatsheet),
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(cheatsheetNote),
        ),
        Card(
          color: theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {0: FixedColumnWidth(70), 3: IntrinsicColumnWidth()},
              children: [
                TableRow(
                  children: cheatsheetDataTitles.map((title) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                    ),
                  )).toList(),
                ),
                ...cheatsheetData.map((row) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Chip(
                          label: Text(
                            row.symbol,
                            style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                          ),
                          color: WidgetStatePropertyAll(
                            ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      row.meaning,
                      style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                    ),
                    Text(
                      row.presentation,
                      style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dateTimeNotifier,
                      builder: (context, currentDateTime, _) => Text(
                        DateFormat('${row.exampleFormat} ', locale).format(currentDateTime).trim(),
                        textAlign: TextAlign.end,
                        style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                      ),
                    ),
                  ]
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}