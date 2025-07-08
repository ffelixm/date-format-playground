import 'dart:async';
import 'package:flutter/material.dart';

class DateFormatUpdateTicker extends ChangeNotifier {
  final ValueNotifier<DateTime> currentDateTime = ValueNotifier(DateTime.now());
  final ValueNotifier<bool> isPaused = ValueNotifier(false);

  Timer? _timer;

  DateFormatUpdateTicker._internal() {
    _timer = Timer.periodic(Duration(milliseconds: 20), (_) {
      if (!isPaused.value) {
        currentDateTime.value = DateTime.now();
      }
    });
  }

  static final DateFormatUpdateTicker _instance = DateFormatUpdateTicker._internal();

  factory DateFormatUpdateTicker() => _instance;

  void togglePause() => isPaused.value = !isPaused.value;

  @override
  void dispose() {
    _timer?.cancel();
    currentDateTime.dispose();
    isPaused.dispose();
    super.dispose();
  }
}