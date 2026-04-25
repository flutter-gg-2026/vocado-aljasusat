
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/bottom_nav/domain/entities/bottom_nav_entity.dart';

import 'package:vocado/features/bottom_nav/data/datasources/bottom_nav_remote_data_source.dart';
import 'package:vocado/features/bottom_nav/data/models/bottom_nav_model.dart';
import 'package:vocado/features/bottom_nav/domain/repositories/bottom_nav_repository_domain.dart';

@LazySingleton(as: BottomNavRepositoryDomain)
class BottomNavRepositoryData implements BottomNavRepositoryDomain{
  final BaseBottomNavRemoteDataSource remoteDataSource;


  BottomNavRepositoryData(this.remoteDataSource);

@override
  Future<Result<BottomNavEntity, Failure>> getBottomNav() async {
    try {
      final response = await remoteDataSource.getBottomNav();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
