import 'package:equatable/equatable.dart';

abstract class TaskFilterState extends Equatable {
  const TaskFilterState();

  @override
  List<Object?> get props => [];
}

class TaskFilterInitialState extends TaskFilterState {}
class TaskFilterSuccessState extends TaskFilterState {}

class TaskFilterErrorState extends TaskFilterState {
  final String message;
  const TaskFilterErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

