import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';

import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_cubit.dart';
import 'package:vocado/features/voice_task/presentation/widgets/mic_button.dart';

class IdleView extends StatelessWidget {
  const IdleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(40),

            AppWidget.text(
              text: "Create Voice Task",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

            const Gap(12),

            AppWidget.text(
              text:
                  "Tap the microphone and describe the task clearly. Include the assignee, task details, and deadline.",
              fontSize: 14,
              color: AppColors.textSecondary,
            ),

            const Spacer(),

            Center(
              child: GestureDetector(
                onTap: () {
                  context.read<VoiceTaskCubit>().startRecording();
                },
                child: const MicButton(),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
