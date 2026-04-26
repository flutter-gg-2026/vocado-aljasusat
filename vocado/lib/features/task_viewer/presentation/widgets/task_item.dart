import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
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
    final isCompleted = task.status == 'Completed';

    return Container(
      height: 20.h,
      margin: EdgeInsets.only(bottom: 15),
      child: AppWidget.card(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.textMain,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
            Gap(8),
            AppWidget.text(text: task.description),
            Gap(8),
            Align(
              alignment: Alignment.centerRight,
              child: AppWidget.text(text: task.deadlineFormatted),
            ),
            Gap(10),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                context.read<TaskViewerCubit>().updateStatus(
                  id: task.id,
                  status: value == true ? 'Completed' : 'In Progress',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
