import 'package:equatable/equatable.dart';
import '../../domain/entities/voice_task_entity.dart';

abstract class VoiceTaskState extends Equatable {
  const VoiceTaskState();

  @override
  List<Object?> get props => [];
}

class VoiceTaskInitialState extends VoiceTaskState {}

class VoiceTaskRecordingState extends VoiceTaskState {}

class VoiceTaskLoadingState extends VoiceTaskState {}

class VoiceTaskSuccessState extends VoiceTaskState {
  final VoiceTaskEntity task;

  const VoiceTaskSuccessState({required this.task});

  @override
  List<Object?> get props => [task];
}
class VoiceTaskSavedState extends VoiceTaskState {}

class VoiceTaskErrorState extends VoiceTaskState {
  final String message;

  const VoiceTaskErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}