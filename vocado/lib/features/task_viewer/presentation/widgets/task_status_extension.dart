import 'package:flutter/material.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

extension TaskStatusExtension on TaskEntity {
  String get statusText {
    final now = DateTime.now();
    final isLate = deadline.isBefore(now);

    if (status == "Completed") return "Completed";
    if (isLate) return "Late";
    return "In Progress";
  }

  Color get statusColor {
    final now = DateTime.now();
    final isLate = deadline.isBefore(now);

    if (status == "Completed") return Colors.green;
    if (isLate) return Colors.red;
    return Colors.blue;
  }
}