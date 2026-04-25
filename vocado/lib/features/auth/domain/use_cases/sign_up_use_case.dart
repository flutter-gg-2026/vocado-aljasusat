import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepositoryDomain _repositoryData;

  SignUpUseCase(this._repositoryData);
  Future<Result<UserEntity, Failure>> signUp({
    required String email,
    required String password,
    required String name,
  }) {
    return _repositoryData.signUp(email: email, password: password, name: name);
  }
}
