import 'package:equatable/equatable.dart';

abstract class TaskCreatorState extends Equatable {
  const TaskCreatorState();

  @override
  List<Object?> get props => [];
}

class TaskCreatorInitialState extends TaskCreatorState {}

class TaskCreatorLoadingState extends TaskCreatorState {}

class TaskCreatorSuccessState extends TaskCreatorState {
  final String selectedFilter;

  const TaskCreatorSuccessState({this.selectedFilter = 'All'});
  
  @override
  List<Object?> get props => [selectedFilter];
}

class TaskCreatorErrorState extends TaskCreatorState {
  final String message;
  const TaskCreatorErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
