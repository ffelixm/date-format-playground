import 'package:date_format_playground/data/app_data.dart';
import 'package:date_format_playground/data/app_models.dart';
import 'package:date_format_playground/ui/widgets/html_widget.dart';
import 'package:date_format_playground/ui/widgets/link_card.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.themeMode});

  final ThemeMode themeMode;

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
            getSectionTitle(HomeViewSection.about),
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: HtmlWidget(
            html: """
This website is a playground for date formatting in Dart and Flutter. It is
designed to help you explore and experiment with the available formatting
options. It also provides a brief reference of all format symbols and formatting
skeletons.
<br>
The website itself is a Flutter project written entirely in Dart.""",
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Further information",
            style: theme.textTheme.titleMedium,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final linkCard1 = LinkCard(
              title: "intl package",
              subtitle: "intl package on pub.dev",
              url: "https://pub.dev/packages/intl",
              imageAsset: "assets/images/dart_icon.png",
              color: theme.colorScheme.tertiaryContainer,
              textColor: theme.colorScheme.onTertiaryContainer,
            );
            final linkCard2 = LinkCard(
              title: "DateFormat documentation",
              subtitle: "intl documentation on pub.dev",
              url: "https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html",
              imageAsset: "assets/images/dart_icon.png",
              color: theme.colorScheme.tertiaryContainer,
              textColor: theme.colorScheme.onTertiaryContainer,
            );

            if (constraints.maxWidth < 700) {
              return Column(
                children: [
                  linkCard1,
                  linkCard2,
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(child: linkCard1),
                  Expanded(child: linkCard2),
                ],
              );
            }
          },
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Links",
            style: theme.textTheme.titleMedium,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final linkCard = LinkCard(
              title: "ffelixm on GitHub",
              subtitle: "My GitHub profile",
              url: "https://github.com/ffelixm",
              imageAsset: themeMode == ThemeMode.light ? "assets/images/github-mark.png" : "assets/images/github-mark-white.png",
              color: theme.colorScheme.tertiaryContainer,
              textColor: theme.colorScheme.onTertiaryContainer,
            );

            if (constraints.maxWidth < 700) {
              return linkCard;
            } else {
              return Row(
                children: [
                  Expanded(child: linkCard),
                  Spacer(),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
