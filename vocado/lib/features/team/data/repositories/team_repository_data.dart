import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/team/domain/entities/team_data_entity.dart';
import 'package:vocado/features/team/data/datasources/team_remote_data_source.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/features/team/domain/repositories/team_repository_domain.dart';

@LazySingleton(as: TeamRepositoryDomain)
class TeamRepositoryData implements TeamRepositoryDomain {
  final BaseTeamRemoteDataSource remoteDataSource;

  TeamRepositoryData(this.remoteDataSource);

  @override
  Future<Result<TeamDataEntity, Failure>> getTeam() async {
    try {
      final teamResponse = await remoteDataSource.getTeam();
      final tasksCount = await remoteDataSource.getTasksCount();

      return Success(
        TeamDataEntity(
          teamMembers: teamResponse.map((e) => e.toEntity()).toList(),
          tasksCount: tasksCount,
        ),
      );
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> deleteUser(String id) async {
    try {
      await remoteDataSource.deleteUser(id);
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
