import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/task_status_extension.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;

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
                Text(task.title,
                    style: TextStyle(color: AppColors.textMain)),

                Text(
                  task.statusText,
                  style: TextStyle(
                    color: task.statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const Gap(8),

            AppWidget.text(text: task.description),

            const Gap(8),

            Align(
              alignment: Alignment.centerRight,
              child: AppWidget.text(text: task.deadlineFormatted),
            ),

            const Gap(10),

          
            Checkbox(
              value: task.status == "Completed",
              onChanged: (value) {
                context.read<TaskViewerCubit>().updateStatus(
                      task.id,
                      value! ? "Completed" : "in_progress",
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}