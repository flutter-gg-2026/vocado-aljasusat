import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<TeamModel>> getTeam();
}

@LazySingleton(as: BaseTeamRemoteDataSource)
class TeamRemoteDataSource implements BaseTeamRemoteDataSource {
  final SupabaseClient _supabase;

  TeamRemoteDataSource(this._supabase);

  @override
  Future<List<TeamModel>> getTeam() async {
    try {
      final response = await _supabase
          .from('users')
          .select()
          .eq('role', 'user');

      return response.map<TeamModel>((json) {
        return TeamModel.fromJson(json);
      }).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
