import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/team/domain/entities/team_data_entity.dart';

abstract class TeamRepositoryDomain {
  Future<Result<TeamDataEntity, Failure>> getTeam();
  Future<Result<void, Failure>> deleteUser(String id);
}