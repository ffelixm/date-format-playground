import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/data/skeletons_data.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/widgets/code_block.dart';
import 'package:date_format_playground/ui/widgets/html_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SkeletonsSection extends StatelessWidget {
  const SkeletonsSection({
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
            getSectionTitle(HomeViewSection.skeletons),
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: HtmlWidget(
            html: skeletonsExplaination1,
          ),
        ),
        CodeBlock(code: skeletonsExampleCode),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: HtmlWidget(
            html: skeletonsExplaination2,
          ),
        ),
        Card(
          color: theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Table(
              columnWidths: {0: IntrinsicColumnWidth(), 1: FlexColumnWidth(), 2: IntrinsicColumnWidth()},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: skeletonsDataTitles.map((title) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                    ),
                  )).toList(),
                ),
                ...skeletonsData.map((skeleton) => TableRow(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Text(
                          skeleton.icuName,
                          style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                        ),
                        color: WidgetStatePropertyAll(
                          ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Text(
                          skeleton.formatPattern,
                          style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                        ),
                        color: WidgetStatePropertyAll(
                          ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dateTimeNotifier,
                      builder: (context, currentDateTime, _) => Text(
                        DateFormat(skeleton.formatPattern, locale).format(currentDateTime),
                        textAlign: TextAlign.end,
                        style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                      ),
                    ),
                  ]
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
