import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitialState extends TeamState {}

class TeamLoadingState extends TeamState {}

class TeamSuccessState extends TeamState {
  final List<TeamEntity> teamMembers;
  final List<TaskCreatorEntity> tasks;

  const TeamSuccessState({required this.teamMembers, required this.tasks});

  @override
  List<Object?> get props => [teamMembers];
}

class TeamErrorState extends TeamState {
  final String message;

  const TeamErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
