import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

abstract class TeamRepositoryDomain {
  Future<Result<List<TeamEntity>, Failure>> getTeam();
}