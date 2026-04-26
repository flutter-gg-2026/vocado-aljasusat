import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

abstract class TaskViewerState {}

class TaskInitial extends TaskViewerState {}

class TaskLoading extends TaskViewerState {}

class TaskLoaded extends TaskViewerState {
  final List<TaskEntity> tasks;

  TaskLoaded({required this.tasks});
}

class TaskError extends TaskViewerState {}
