import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
import 'package:date_format_playground/ui/widgets/error_widget.dart';
import 'package:date_format_playground/utils/web_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PlaygroundCard extends StatefulWidget {
  const PlaygroundCard({
    super.key,
    required this.locale,
  });

  final String locale;

  @override
  State<PlaygroundCard> createState() => _PlaygroundCardState();
}

class _PlaygroundCardState extends State<PlaygroundCard> {
  final dateFormatController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final formatParam = getFormatPatternParam();
    if (formatParam != null) {
      dateFormatController.text = formatParam;
    }

    dateFormatController.addListener(() => updateFormatPattern(dateFormatController.text));
  }

  @override
  void dispose() {
    dateFormatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Format pattern",
                      hintText: "Input format pattern, e.g. 'yyyy/MM/dd'",
                    ),
                    style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                    controller: dateFormatController,
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    if (dateFormatController.text.isNotEmpty) {
                      Clipboard.setData(ClipboardData(text: dateFormatController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Format pattern copied to clipboard"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  tooltip: "Copy format pattern",
                ),
                IconButton(
                  onPressed: () {
                    if (dateFormatController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Share format pattern"),
                            content: TextField(
                              readOnly: true,
                              controller: TextEditingController(text: getFormatPatternShareUrl(dateFormatController.text)),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.copy),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(text: getFormatPatternShareUrl(dateFormatController.text)));
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Share URL copied to clipboard"),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  tooltip: "Copy share URL",
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Close"),
                              )
                            ],
                          );
                        }
                      );
                    }
                  },
                  icon: Icon(Icons.share),
                  tooltip: "Share format pattern",
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: dateTimeNotifier,
              builder: (context, currentDateTime, _) {
                String formattedDate;
                try {
                  formattedDate = DateFormat(dateFormatController.text, widget.locale).format(currentDateTime);
                } catch (e) {
                  return ErrorMessage(error: e);
                }

                return Text(
                  formattedDate,
                  style: theme.textTheme.displaySmall!.copyWith(color: theme.colorScheme.onPrimaryContainer),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}