import 'package:equatable/equatable.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

class TeamDataEntity extends Equatable {
  final List<TeamEntity> teamMembers;
  final int tasksCount;

  const TeamDataEntity({required this.teamMembers, required this.tasksCount});

  @override
  List<Object?> get props => [teamMembers, tasksCount];
}