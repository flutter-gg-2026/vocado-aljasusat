
import 'package:flutter/material.dart';

extension DateHelper on DateTime {
  String get daysLeftText {
    final now = DateTime.now();
    final diff = difference(now).inDays;

    if (diff < 0) return "Late";
    if (diff == 0) return "Today";
    return "$diff days left";
  }

  Color get daysLeftColor {
    final now = DateTime.now();
    final diff = difference(now).inDays;

    if (diff < 0) return Colors.red;
    if (diff == 0) return Colors.orange;
    return Colors.green;
  }
}
