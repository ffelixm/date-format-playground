import 'dart:async';
import 'package:flutter/material.dart';

final dateTimeNotifier = ValueNotifier<DateTime>(DateTime.now());
final pauseNotifier = ValueNotifier<bool>(false);

Timer startGlobalTimer() => Timer.periodic(
  const Duration(milliseconds: 20),
  (timer) {
    if (!pauseNotifier.value) {
      dateTimeNotifier.value = DateTime.now();
    }
  },
);