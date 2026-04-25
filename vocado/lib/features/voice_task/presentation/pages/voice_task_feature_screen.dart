import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
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
      body: BgContainer(
        child: BlocBuilder<VoiceTaskCubit, VoiceTaskState>(
          builder: (context, state) {
            if (state is VoiceTaskLoadingState) {
              return LoadingWidget();
            }

            if (state is VoiceTaskInitialState) {
              return IdleView();
            }

            if (state is VoiceTaskRecordingState) {
              return RecordingView();
            }

            if (state is VoiceTaskSuccessState) {
              return SuccessView(task: state.task);
            }

            if (state is VoiceTaskErrorState) {
              return ErrorView(message: state.message);
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}