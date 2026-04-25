import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/models/user_model.dart';
import 'package:vocado/features/auth/data/models/login_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<LoginModel> login({required String email, required String password});
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSource(this._supabase);

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw Exception('Login failed');
    }

    final data = await _supabase
        .from('users')
        .select('id, email, role')
        .eq('id', user.id)
        .single();

    return LoginModel.fromJson(data);
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final result = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    final user = result.user!;

    final data = {"id": user.id, "name": name, "email": email, "role": "user"};

    await _supabase.from('users').insert(data);

    return UserModel.fromJson(data);
  }
}
