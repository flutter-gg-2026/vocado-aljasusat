import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskViewerState {}

class TaskLoading extends TaskViewerState {}

class TaskLoaded extends TaskViewerState {
  final List<TaskEntity> tasks;

  const TaskLoaded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class TaskError extends TaskViewerState {
  final String message;

  const TaskError({required this.message});

  @override
  List<Object?> get props => [message];
}