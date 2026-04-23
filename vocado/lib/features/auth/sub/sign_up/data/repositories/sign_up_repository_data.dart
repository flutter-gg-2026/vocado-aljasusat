
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/sign_up/domain/entities/sign_up_entity.dart';

import 'package:vocado/features/auth/sub/sign_up/data/datasources/sign_up_remote_data_source.dart';
import 'package:vocado/features/auth/sub/sign_up/data/models/sign_up_model.dart';
import 'package:vocado/features/auth/sub/sign_up/domain/repositories/sign_up_repository_domain.dart';

@LazySingleton(as: SignUpRepositoryDomain)
class SignUpRepositoryData implements SignUpRepositoryDomain{
  final BaseSignUpRemoteDataSource remoteDataSource;


  SignUpRepositoryData(this.remoteDataSource);

@override
  Future<Result<SignUpEntity, Failure>> getSignUp() async {
    try {
      final response = await remoteDataSource.getSignUp();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
