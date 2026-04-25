import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';

import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_cubit.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppWidget.text(
                text: "Something went wrong",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

              const Gap(10),

              AppWidget.text(text: message, color: AppColors.textSecondary),

              const Gap(20),

              AppWidget.button(
                title: "Try Again",
                onTap: () {
                  context.read<VoiceTaskCubit>().reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
