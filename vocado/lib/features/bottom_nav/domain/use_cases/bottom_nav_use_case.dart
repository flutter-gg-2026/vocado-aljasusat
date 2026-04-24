import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/bottom_nav/domain/entities/bottom_nav_entity.dart';
import 'package:vocado/features/bottom_nav/domain/repositories/bottom_nav_repository_domain.dart';


@lazySingleton
class BottomNavUseCase {
  final BottomNavRepositoryDomain _repositoryData;

  BottomNavUseCase(this._repositoryData);

   Future<Result<BottomNavEntity, Failure>> getBottomNav() async {
    return _repositoryData.getBottomNav();
  }
}
