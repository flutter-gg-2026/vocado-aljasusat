import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/voice_task_use_case.dart';
import 'voice_task_state.dart';

class VoiceTaskCubit extends Cubit<VoiceTaskState> {
  final VoiceTaskUseCase _voiceTaskUseCase;

  VoiceTaskCubit(this._voiceTaskUseCase) : super(VoiceTaskInitialState());

  Future<void> startRecording() async {
    try {
      await _voiceTaskUseCase.startRecord();
      emit(VoiceTaskRecordingState());
    } catch (e) {
      emit(const VoiceTaskErrorState(message: "Failed to start recording"));
    }
  }

  Future<void> getVoiceTaskMethod() async {
    try {
      emit(VoiceTaskLoadingState());
      final result = await _voiceTaskUseCase.getVoiceTask();

      emit(VoiceTaskSuccessState(task: result));
    } catch (e) {
      emit(const VoiceTaskErrorState(message: "Voice not clear, try again"));
    }
  }

  void reset() {
    emit(VoiceTaskInitialState());
  }
}
