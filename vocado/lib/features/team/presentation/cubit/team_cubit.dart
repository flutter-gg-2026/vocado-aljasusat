import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/team/domain/use_cases/team_use_case.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamUseCase _teamUseCase;

  TeamCubit(this._teamUseCase) : super(TeamInitialState());

  List<TaskCreatorEntity> allTasks = [];

  Future<void> getTeamMethod() async {
    emit(TeamLoadingState());

    final result = await _teamUseCase.getTeam();

    result.when(
      (success) {
        emit(
          TeamSuccessState(
            teamMembers: success.teamMembers,
            tasksCount: success.tasksCount,
          ),
        );
      },
      (error) {
        emit(TeamErrorState(message: error.message));
      },
    );
  }

  Future<void> deleteUserMethod(String id) async {
    final result = await _teamUseCase.deleteUser(id);

    result.when(
      (success) {
        getTeamMethod();
      },
      (error) {
        emit(TeamErrorState(message: error.message));
      },
    );
  }
}