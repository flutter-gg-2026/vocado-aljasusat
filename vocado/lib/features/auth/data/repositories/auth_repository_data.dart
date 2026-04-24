import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/data/models/login_model.dart';
import 'package:vocado/features/auth/domain/entities/auth_entity.dart';

import 'package:vocado/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vocado/features/auth/domain/entities/login_entity.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        email: email,
        password: password,
      );

      return Success(LoginModel.fromSupabase(user).toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<AuthEntity, Failure>> getAuth() {
    // TODO: implement getAuth
    throw UnimplementedError();
  }
}
