import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String title = error.runtimeType.toString();
    String message = error.toString();

    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error_outline,
          size: 32,
          color: theme.colorScheme.error,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: TextStyle(color: theme.colorScheme.error),
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
