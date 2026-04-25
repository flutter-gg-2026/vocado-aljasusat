import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/theme/app_colors.dart';

import 'package:vocado/features/voice_task/presentation/widgets/error_view.dart';
import 'package:vocado/features/voice_task/presentation/widgets/idle_view.dart';
import 'package:vocado/features/voice_task/presentation/widgets/recording_view.dart';
import 'package:vocado/features/voice_task/presentation/widgets/success_view.dart';
import '../cubit/voice_task_cubit.dart';
import '../cubit/voice_task_state.dart';

class VoiceTaskFeatureScreen extends StatelessWidget {
  const VoiceTaskFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.backgroundGradient,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: BlocListener<VoiceTaskCubit, VoiceTaskState>(
          listener: (context, state) {
            if (state is VoiceTaskSavedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Task saved successfully")),
              );

              context.read<VoiceTaskCubit>().reset();
            }
          },
          child: BlocBuilder<VoiceTaskCubit, VoiceTaskState>(
            builder: (context, state) {
              if (state is VoiceTaskLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is VoiceTaskInitialState) {
                return const IdleView();
              }

              if (state is VoiceTaskRecordingState) {
                return const RecordingView();
              }

              if (state is VoiceTaskSuccessState) {
                return SuccessView(task: state.task);
              }

              if (state is VoiceTaskErrorState) {
                return ErrorView(message: state.message);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
