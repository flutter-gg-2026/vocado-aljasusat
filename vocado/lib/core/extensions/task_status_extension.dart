import 'package:flutter/material.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';

extension TaskStatusExtension on TaskFilterEntity {
  String get statusText {
    final now = DateTime.now();
    final isLate = deadline.isBefore(now);

    if (status == "done") return "Done";
    if (isLate) return "Late";
    return "In Progress";
  }

  Color get statusColor {
    final now = DateTime.now();
    final isLate = deadline.isBefore(now);

    if (status == "done") return Colors.green;
    if (isLate) return Colors.red;
    return Colors.blue;
  }
}