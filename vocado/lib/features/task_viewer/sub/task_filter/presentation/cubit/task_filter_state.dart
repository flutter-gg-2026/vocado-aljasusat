import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_cubit.dart';

abstract class TaskFilterState extends Equatable {
  const TaskFilterState();

  @override
  List<Object?> get props => [];
}
class TaskFilterLoadedState extends TaskFilterState {
  final List<TaskFilterEntity> tasks;

  TaskFilterLoadedState({
    required this.tasks,
  });
}

class TaskFilterInitialState extends TaskFilterState {}
class TaskFilterSuccessState extends TaskFilterState {}

class TaskFilterErrorState extends TaskFilterState {
  final String message;
  const TaskFilterErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

