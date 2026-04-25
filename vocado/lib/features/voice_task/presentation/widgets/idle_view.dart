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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppWidget.text(
              text: "Create Voice Task",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            const Gap(12),
            Center(
              child: AppWidget.text(
                text:
                    "Tap the microphone and describe the task clearly.\nInclude assignee, details, and deadline.",
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const Gap(250),
            GestureDetector(
              onTap: () {
                context.read<VoiceTaskCubit>().startRecording();
              },
              child: const MicButton(),
            ),
          ],
        ),
      ),
    );
  }
}
