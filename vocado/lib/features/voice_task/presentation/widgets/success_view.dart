import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_cubit.dart';

class SuccessView extends StatelessWidget {
  final VoiceTaskEntity task;

  const SuccessView({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),

            AppWidget.text(
              text: "Review Task",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

            const Gap(10),

            AppWidget.text(
              text: "Please review and edit the task before confirming.",
              color: AppColors.textSecondary,
            ),

            const Gap(30),

            AppWidget.text(text: "Title"),
            AppWidget.text(text: task.title, color: AppColors.textSecondary),

            const Gap(20),

            AppWidget.text(text: "Description"),
            AppWidget.text(
              text: task.description,
              color: AppColors.textSecondary,
            ),

            const Gap(20),

            AppWidget.text(text: "Assigned To"),
            AppWidget.text(
              text: task.assignedTo,
              color: AppColors.textSecondary,
            ),

            const Gap(20),

            AppWidget.text(text: "Assigned By"),
            AppWidget.text(
              text: task.assignedBy,
              color: AppColors.textSecondary,
            ),

            const Gap(20),

            AppWidget.text(text: "Deadline"),
            AppWidget.text(
              text: task.deadline.toString(),
              color: AppColors.textSecondary,
            ),

            const Spacer(),

            AppWidget.button(
              title: "Confirm Task",
              onTap: () {
                context.read<VoiceTaskCubit>().saveTask(task);
              },
            ),

            const Gap(10),

            AppWidget.button(
              title: "Cancel",
              onTap: () {
                context.read<VoiceTaskCubit>().reset();
              },
            ),
          ],
        ),
      ),
    );
  }
}
