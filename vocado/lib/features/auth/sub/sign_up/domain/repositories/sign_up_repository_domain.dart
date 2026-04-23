import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpRepositoryDomain {
    Future<Result<SignUpEntity, Failure>> getSignUp();
}
