import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_color.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/widgets/task_status_extension.dart';

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
            ///  Title + Days Left
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

            /// Description
            AppWidget.text(text: task.description),

            const SizedBox(height: 8),

            /// Assigned + Deadline Date
            Align(
              alignment: .centerEnd,
              child: AppWidget.text(text: task.deadlineFormatted),
            ),

            const SizedBox(height: 12),

            ///  Actions
          ],
        ),
      ),
    );
  }
}
