
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/sub/login/domain/entities/login_entity.dart';

import 'package:vocado/features/auth/sub/login/data/datasources/login_remote_data_source.dart';
import 'package:vocado/features/auth/sub/login/data/models/login_model.dart';
import 'package:vocado/features/auth/sub/login/domain/repositories/login_repository_domain.dart';

@LazySingleton(as: LoginRepositoryDomain)
class LoginRepositoryData implements LoginRepositoryDomain{
  final BaseLoginRemoteDataSource remoteDataSource;


  LoginRepositoryData(this.remoteDataSource);

@override
  Future<Result<LoginEntity, Failure>> getLogin() async {
    try {
      final response = await remoteDataSource.getLogin();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
