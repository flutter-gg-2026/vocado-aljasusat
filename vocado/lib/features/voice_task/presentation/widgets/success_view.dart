import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),

            AppWidget.text(
              text: "Review Task",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

            Gap(10),

            AppWidget.text(
              text: "Please review and edit the task before confirming.",
              color: AppColors.textSecondary,
            ),

            Gap(30),

            AppWidget.text(text: "Title"),
            AppWidget.text(text: task.title, color: AppColors.textSecondary),

            Gap(20),

            AppWidget.text(text: "Description"),
            AppWidget.text(
              text: task.description,
              color: AppColors.textSecondary,
            ),

            Gap(20),

            AppWidget.text(text: "Assigned To"),
            AppWidget.text(
              text: task.assignedTo,
              color: AppColors.textSecondary,
            ),

            Gap(20),

            AppWidget.text(text: "Assigned By"),
            AppWidget.text(
              text: task.assignedBy,
              color: AppColors.textSecondary,
            ),

            Gap(20),

            AppWidget.text(text: "Deadline"),
            AppWidget.text(
              text: task.deadline.toString(),
              color: AppColors.textSecondary,
            ),

            Spacer(),

            AppWidget.button(
              title: "Confirm Task",
              onTap: () {
                // Supabase
              },
            ),

            Gap(10),

            OutlinedButton(
              onPressed: () {
                context.read<VoiceTaskCubit>().reset();
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(100.sw, 45),
                side: BorderSide(color: AppColors.accentAccent),
              ),
              child: Text(
                "Retake",
                style: TextStyle(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
