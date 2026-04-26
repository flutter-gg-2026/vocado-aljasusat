import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/auth/sub/sign_up/data/models/sign_up_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseSignUpRemoteDataSource {
  Future<SignUpModel> getSignUp();
}


@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   SignUpRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<SignUpModel> getSignUp() async {
    try {
      return SignUpModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
