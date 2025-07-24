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
The website itself is a <a href="https://www.flutter.dev">Flutter</a> project
written entirely in <a href="https://www.dart.dev">Dart</a>.""",
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
        Row(
          children: [
            Expanded(
              child: LinkCard(
                title: "intl package",
                subtitle: "intl package on pub.dev",
                url: "https://pub.dev/packages/intl",
                imageAsset: "assets/images/dart_icon.png",
                color: theme.colorScheme.tertiaryContainer,
                textColor: theme.colorScheme.onTertiaryContainer,
              ),
            ),
            Expanded(
              child: LinkCard(
                title: "DateFormat documentation",
                subtitle: "intl package documentation on pub.dev",
                url: "https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html",
                imageAsset: "assets/images/dart_icon.png",
                color: theme.colorScheme.tertiaryContainer,
                textColor: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Links",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: LinkCard(
                title: "ffelixm",
                subtitle: "ffelixm on GitHub",
                url: "https://github.com/ffelixm",
                imageAsset: themeMode == ThemeMode.light ? "assets/images/github-mark.png" : "assets/images/github-mark-white.png",
                color: theme.colorScheme.tertiaryContainer,
                textColor: theme.colorScheme.onTertiaryContainer,
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
