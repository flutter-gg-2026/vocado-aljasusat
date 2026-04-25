part of 'task_viewer_cubit.dart';

abstract class TaskViewerState {}

class TaskInitial extends TaskViewerState {}

class TaskLoading extends TaskViewerState {}

class TaskLoaded extends TaskViewerState {
  final List<TaskEntity> tasks;

  TaskLoaded({required this.tasks});
}

class TaskError extends TaskViewerState {}
