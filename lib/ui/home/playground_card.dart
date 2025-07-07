import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PlaygroundCard extends StatefulWidget {
  const PlaygroundCard({
    super.key,
    required this.isPaused,
  });

  final bool isPaused;

  @override
  State<PlaygroundCard> createState() => _PlaygroundCardState();
}

class _PlaygroundCardState extends State<PlaygroundCard> {
  final dateFormatController = TextEditingController(text: "yyyy/MM/dd HH:mm:ss");
  DateTime currentDateTime = DateTime.now();
  Timer? updateTimer;

  @override
  void initState() {
    super.initState();

    updateTimer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (mounted) {
          setState(() {
            if (!widget.isPaused) {
              currentDateTime = DateTime.now();
            }
          });
        }
      }
    );
  }

  @override
  void dispose() {
    dateFormatController.dispose();
    updateTimer?.cancel();
    super.dispose();
  }

  String get formattedDate {
    try {
      return DateFormat(dateFormatController.text).format(currentDateTime);
    } catch (e) {
      return "Invalid Date Format: $e";
    }
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
            Text(
              formattedDate,
              style: theme.textTheme.displaySmall!.copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}