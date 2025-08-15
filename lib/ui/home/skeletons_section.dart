import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/data/skeletons_data.dart';
import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/widgets/code_block.dart';
import 'package:date_format_playground/ui/widgets/html_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SkeletonsSection extends StatefulWidget {
  const SkeletonsSection({
    super.key,
    required this.locale,
  });

  final String locale;

  @override
  State<SkeletonsSection> createState() => _SkeletonsSectionState();
}

class _SkeletonsSectionState extends State<SkeletonsSection> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
            html: skeletonsExplanation1,
          ),
        ),
        CodeBlock(code: skeletonsExampleCode),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: HtmlWidget(
            html: skeletonsExplanation2,
          ),
        ),
        Card(
          color: theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            // Put the children in LayoutBuilder to get its width using the constraints
            child: LayoutBuilder(
              builder: (context, constraints) => Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  // Apply width constraints to row to display it max width on bigger screens
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 4,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                skeletonsDataTitles[0],
                                style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                              ),
                              ...skeletonsData.map((skeleton) => SizedBox(
                                height: 30,
                                child: Chip(
                                  label: Text(
                                    skeleton.icuName,
                                    style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                                  ),
                                  color: WidgetStatePropertyAll(
                                    ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              Text(
                                skeletonsDataTitles[1],
                                style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                              ),
                              ...skeletonsData.map((skeleton) => SizedBox(
                                height: 30,
                                child: Chip(
                                  label: Text(
                                    skeleton.formatPattern,
                                    style: TextStyle(fontFamily: "RobotoMono", color: theme.colorScheme.onSecondaryContainer),
                                  ),
                                  color: WidgetStatePropertyAll(
                                    ElevationOverlay.applySurfaceTint(theme.colorScheme.secondaryContainer, theme.colorScheme.surfaceTint, 2),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 8,
                            children: [
                              Text(
                                skeletonsDataTitles[2],
                                style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                              ),
                              ...skeletonsData.map((skeleton) => SizedBox(
                                height: 30,
                                child: ValueListenableBuilder(
                                  valueListenable: dateTimeNotifier,
                                  builder: (context, currentDateTime, _) => Text(
                                    DateFormat(skeleton.formatPattern, widget.locale).format(currentDateTime),
                                    textAlign: TextAlign.end,
                                    style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.onSecondaryContainer),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
