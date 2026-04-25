import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';

abstract class TaskFilterRepositoryDomain {
   Future<Result<List<TaskFilterEntity>, Failure>> getTaskFilter();
}