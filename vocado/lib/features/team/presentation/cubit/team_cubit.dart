import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/team/domain/use_cases/team_use_case.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamUseCase _teamUseCase;

  TeamCubit(this._teamUseCase) : super(TeamInitialState());

  Future<void> getTeamMethod() async {
    final result = await _teamUseCase.getTeam();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
