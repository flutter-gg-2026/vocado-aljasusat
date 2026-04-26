import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:vocado/features/voice_task/domain/use_cases/voice_task_use_case.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_state.dart';

class VoiceTaskCubit extends Cubit<VoiceTaskState> {
  final VoiceTaskUseCase _voiceTaskUseCase;

  VoiceTaskCubit(this._voiceTaskUseCase) : super(VoiceTaskInitialState());

  Future<void> startRecording() async {
    emit(VoiceTaskLoadingState());

    final result = await _voiceTaskUseCase.startRecord();

    result.when(
      (success) {
        emit(VoiceTaskRecordingState());
      },
      (error) {
        emit(VoiceTaskErrorState(message: error.message));
      },
    );
  }

  Future<void> getVoiceTaskMethod() async {
    emit(VoiceTaskLoadingState());

    final result = await _voiceTaskUseCase.getVoiceTask();

    result.when(
      (task) {
        emit(VoiceTaskSuccessState(task: task));
      },
      (error) {
        emit(VoiceTaskErrorState(message: error.message));
      },
    );
  }

  Future<void> saveTask(VoiceTaskEntity task) async {
    emit(VoiceTaskLoadingState());

    final result = await _voiceTaskUseCase.saveTask(task);

    result.when(
      (success) {
        emit(VoiceTaskSavedState());
      },
      (error) {
        emit(VoiceTaskErrorState(message: error.message));
      },
    );
  }

  void reset() {
    emit(VoiceTaskInitialState());
  }
}