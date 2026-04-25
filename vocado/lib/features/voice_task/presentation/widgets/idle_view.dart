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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Gap(40),

            AppWidget.text(
              text: "Create Voice Task",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),

            Gap(12),

            AppWidget.text(
              text:
                  "Tap the microphone and describe the task clearly. Include the assignee, task details, and deadline.",
              color: AppColors.textMain.withValues(alpha: 0.6),
              fontSize: 16,
              fontWeight: .normal,
            ),

            Spacer(),

            Center(
              child: GestureDetector(
                onTap: () {
                  context.read<VoiceTaskCubit>().startRecording();
                },
                child: MicButton(),
              ),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
