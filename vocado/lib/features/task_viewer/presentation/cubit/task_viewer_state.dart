import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/domain/entities/user_entity.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskViewerInitialState extends TaskViewerState {}

class TaskViewerLoadingState extends TaskViewerState {}

class TaskViewerSuccessState extends TaskViewerState {
  final UserEntity user;
  final List<TaskEntity> tasks;
  final bool isExpanded;

  const TaskViewerSuccessState({
    required this.user,
    required this.tasks,
    required this.isExpanded,
  });

  @override
  List<Object?> get props => [user, tasks, isExpanded];
}

class TaskViewerErrorState extends TaskViewerState {
  final String message;

  const TaskViewerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}