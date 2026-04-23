import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/auth/sub/sign/data/models/sign_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseSignRemoteDataSource {
  Future<SignModel> getSign();
}


@LazySingleton(as: BaseSignRemoteDataSource)
class SignRemoteDataSource implements BaseSignRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   SignRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<SignModel> getSign() async {
    try {
      return SignModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
