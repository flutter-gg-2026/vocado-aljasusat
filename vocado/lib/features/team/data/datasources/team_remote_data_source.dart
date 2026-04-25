import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseTeamRemoteDataSource {
  Future<TeamModel> getTeam();
}


@LazySingleton(as: BaseTeamRemoteDataSource)
class TeamRemoteDataSource implements BaseTeamRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   TeamRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<TeamModel> getTeam() async {
    try {
      return TeamModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
