import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/auth/sub/login/data/models/login_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getLogin();
}


@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   LoginRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<LoginModel> getLogin() async {
    try {
      return LoginModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
