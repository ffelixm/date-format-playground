import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
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

    final formatParam = getFormatParam();
    if (formatParam != null) {
      dateFormatController.text = formatParam;
    }

    dateFormatController.addListener(() => updateFormatParam(dateFormatController.text));
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
                      labelText: "Format string",
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
                    Clipboard.setData(ClipboardData(text: dateFormatController.text));
                  },
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: getFormatShareUrl(dateFormatController.text)));
                  },
                  icon: Icon(Icons.share),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: DateFormatUpdateTicker().currentDateTime,
              builder: (context, currentDateTime, _) {
                String formattedDate;
                try {
                  formattedDate = DateFormat(dateFormatController.text, widget.locale).format(currentDateTime);
                } catch (e) {
                  formattedDate = "Invalid Date Format: $e";
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