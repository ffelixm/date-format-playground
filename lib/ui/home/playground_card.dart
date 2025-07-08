import 'package:date_format_playground/ui/dateformat_update_ticker.dart';
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
  final dateFormatController = TextEditingController(text: "yyyy/MM/dd HH:mm:ss");

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
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Format string",
                hintText: "yyyy/MM/dd HH:mm:ss",
                suffixIcon: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: dateFormatController.text));
                },
              ),
              ),
              style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              controller: dateFormatController,
              onChanged: (value) => setState(() {}),
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