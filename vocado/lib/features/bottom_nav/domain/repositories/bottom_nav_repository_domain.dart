import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/bottom_nav/domain/entities/bottom_nav_entity.dart';

abstract class BottomNavRepositoryDomain {
    Future<Result<BottomNavEntity, Failure>> getBottomNav();
}
