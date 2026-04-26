import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>, Failure>> getTasks();

  Future<Result<void, Failure>> updateStatus({
    required int id,
    required String status,
  });
}