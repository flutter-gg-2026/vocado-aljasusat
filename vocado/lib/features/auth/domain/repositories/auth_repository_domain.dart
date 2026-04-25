import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepositoryDomain {
  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  });
  Future<Result<UserEntity, Failure>> signUp({
    required String email,
    required String password,
    required String name,
  });
}
