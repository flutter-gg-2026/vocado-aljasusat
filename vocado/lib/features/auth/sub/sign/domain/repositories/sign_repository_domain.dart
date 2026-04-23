import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/sign/domain/entities/sign_entity.dart';

abstract class SignRepositoryDomain {
    Future<Result<SignEntity, Failure>> getSign();
}
