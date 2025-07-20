import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.url,
    required this.imageAsset,
    this.color,
    this.textColor,
  });

  /// Link card title
  final String title;
  /// Link card subtitle (optional)
  final String? subtitle;
  /// Url that should be launched when user taps on card
  final String url;
  /// Image shown as leading widget
  final String imageAsset;
  /// Card background color
  final Color? color;
  /// Card text color
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle ?? ''),
        leading: Image.asset(
          imageAsset,
          gaplessPlayback: true,
        ),
        onTap: () => launchUrlString(url),
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    );
  }
}