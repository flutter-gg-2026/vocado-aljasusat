import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_cubit.dart';
import 'package:vocado/features/voice_task/presentation/widgets/mic_button.dart';

class RecordingView extends StatelessWidget {
  const RecordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppWidget.text(
              text: "Listening...",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            const Gap(10),

            AppWidget.text(
              text: "Speak clearly and include task details",
              color: AppColors.textSecondary,
            ),

            const Gap(30),

            GestureDetector(
              onTap: () {
                context.read<VoiceTaskCubit>().getVoiceTaskMethod();
              },
              child: const MicButton(),
            ),

            const Gap(20),

            AppWidget.text(
              text: "Tap to stop recording",
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}