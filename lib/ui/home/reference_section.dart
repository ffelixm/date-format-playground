import 'package:date_format_playground/data/reference_data.dart';
import 'package:date_format_playground/data/reference_models.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReferenceSectionCard extends StatelessWidget {
  const ReferenceSectionCard({
    super.key,
    required this.referenceSectionCardData,
    required this.locale,
  });

  final ReferenceSectionCardData referenceSectionCardData;
  final String locale;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Text(
                  referenceSectionCardData.title,
                  style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                ),
                Chip(
                  label: Text(
                    switch (referenceSectionCardData.formatType) {
                      FormatType.number => "Number",
                      FormatType.text => "Text",
                      FormatType.textAndNumber => "Text & Number",
                    },
                    style: TextStyle(color: theme.colorScheme.onTertiaryContainer),
                  ),
                  color: WidgetStatePropertyAll(theme.colorScheme.tertiaryContainer),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    referenceSectionCardData.formatPattern,
                    style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onPrimaryContainer),
                  ),
                  color: WidgetStatePropertyAll(theme.colorScheme.primaryContainer),
                ),
              ],
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FixedColumnWidth(140),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(100),
              },
              children: referenceSectionCardData.rows.map((row) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Text(
                          row.formatPattern,
                          style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                        ),
                        color: WidgetStatePropertyAll(
                          ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    row.description,
                    style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                  ),
                  ValueListenableBuilder(
                    valueListenable: DateFormatUpdateTicker().currentDateTime,
                    builder: (context, currentDateTime, _) => Text(
                      DateFormat(row.formatPattern, locale).format(currentDateTime),
                      textAlign: TextAlign.end,
                      style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                    ),
                  ),
                ]
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ReferenceSection extends StatefulWidget {
  const ReferenceSection({
    super.key,
    required this.locale,
  });

  final String locale;

  @override
  State<ReferenceSection> createState() => _ReferenceSectionState();
}

class _ReferenceSectionState extends State<ReferenceSection> {
  ReferenceSectionSubsection selectedSection = ReferenceSectionSubsection.year;

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
            "Reference of all formatting patterns",
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Wrap(
            spacing: 8,
            runSpacing: 6,
            children: ReferenceSectionSubsection.values.map((section) => ChoiceChip(
                label: Text(
                  getReferenceSectionName(section),
                  style: selectedSection == section ? TextStyle(color: theme.colorScheme.onTertiaryContainer) : null,
                ),
                selected: selectedSection == section,
                showCheckmark: false,
                selectedColor: theme.colorScheme.tertiaryContainer,
                onSelected: (value) => setState(() => selectedSection = section),
              ),
            ).toList(),
          ),
        ),
        ...getReferenceSectionCardData(selectedSection).map(
          (sectionData) => ReferenceSectionCard(
            referenceSectionCardData: sectionData,
            locale: widget.locale,
          ),
        ),
      ],
    );
  }
}
