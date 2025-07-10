import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HtmlWidget extends StatelessWidget {
  const HtmlWidget({
    super.key,
    required this.html,
    this.fontSize,
    this.color,
  });

  final String html;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: html,
      style: {
        "body": Style(
          color: color,
          fontSize: fontSize != null ? FontSize(fontSize!) : null,
          margin: Margins.all(0)
        ),
      },
      onLinkTap: (url, attributes, element) => launchUrlString(url!),
    );
  }
}