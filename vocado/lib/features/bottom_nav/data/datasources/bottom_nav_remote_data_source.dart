import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/bottom_nav/data/models/bottom_nav_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseBottomNavRemoteDataSource {
  Future<BottomNavModel> getBottomNav();
}


@LazySingleton(as: BaseBottomNavRemoteDataSource)
class BottomNavRemoteDataSource implements BaseBottomNavRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   BottomNavRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<BottomNavModel> getBottomNav() async {
    try {
      return BottomNavModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
