import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/login/domain/entities/login_entity.dart';

abstract class LoginRepositoryDomain {
    Future<Result<LoginEntity, Failure>> getLogin();
}
