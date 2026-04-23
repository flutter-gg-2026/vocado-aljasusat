import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/sign/domain/entities/sign_entity.dart';
import 'package:vocado/features/auth/sub/sign/domain/repositories/sign_repository_domain.dart';


@lazySingleton
class SignUseCase {
  final SignRepositoryDomain _repositoryData;

  SignUseCase(this._repositoryData);

   Future<Result<SignEntity, Failure>> getSign() async {
    return _repositoryData.getSign();
  }
}
