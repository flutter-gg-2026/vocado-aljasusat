
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/sign/domain/entities/sign_entity.dart';

import 'package:vocado/features/auth/sub/sign/data/datasources/sign_remote_data_source.dart';
import 'package:vocado/features/auth/sub/sign/data/models/sign_model.dart';
import 'package:vocado/features/auth/sub/sign/domain/repositories/sign_repository_domain.dart';

@LazySingleton(as: SignRepositoryDomain)
class SignRepositoryData implements SignRepositoryDomain{
  final BaseSignRemoteDataSource remoteDataSource;


  SignRepositoryData(this.remoteDataSource);

@override
  Future<Result<SignEntity, Failure>> getSign() async {
    try {
      final response = await remoteDataSource.getSign();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
