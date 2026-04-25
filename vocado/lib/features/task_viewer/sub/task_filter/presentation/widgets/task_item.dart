import 'package:flutter/material.dart';
import 'package:vocado/core/extensions/task_status_extension.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';

class TaskItem extends StatelessWidget {
  final TaskFilterEntity task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: AppWidget.card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(color: AppColors.textMain),
                ),
                Text(
                  task.statusText,
                  style: TextStyle(
                    color: task.statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            AppWidget.text(text: task.description),

            const SizedBox(height: 8),

            Align(
              alignment: .centerEnd,
              child: AppWidget.text(text: task.deadlineFormatted),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}