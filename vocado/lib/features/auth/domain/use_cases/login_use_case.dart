import 'package:injectable/injectable.dart';

import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/entities/login_entity.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  }) {
    return _repositoryData.login(email: email, password: password);
  }
}
