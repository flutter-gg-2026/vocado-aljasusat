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
  final String userName;

  const TaskCreatorSuccessState({
    required this.tasks,
    this.selectedFilter = 'All',
    this.userName = 'User',
  });

  @override
  List<Object?> get props => [tasks, selectedFilter, userName];
}

class TaskCreatorErrorState extends TaskCreatorState {
  final String message;
  const TaskCreatorErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
