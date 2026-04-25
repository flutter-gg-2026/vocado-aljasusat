import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';

abstract class TaskCreatorState extends Equatable {
  const TaskCreatorState();

  @override
  List<Object?> get props => [];
}

class TaskCreatorInitialState extends TaskCreatorState {}

class TaskCreatorLoadingState extends TaskCreatorState {}

class TaskCreatorSuccessState extends TaskCreatorState {
  final List<TaskCreatorEntity> tasks;
  final String selectedFilter;

  const TaskCreatorSuccessState({
    required this.tasks,
    this.selectedFilter = 'All',
  });

  @override
  List<Object?> get props => [tasks, selectedFilter];
}

class TaskCreatorErrorState extends TaskCreatorState {
  final String message;
  const TaskCreatorErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
