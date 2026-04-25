import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';

abstract class TaskCreatorRepositoryDomain {
  Future<Result<List<TaskCreatorEntity>, Failure>> getTaskCreator();
  Future<Result<void, Failure>> deleteTask(int id);

  Future<Result<void, Failure>> updateTask({
    required int id,
    required String name,
    required String description,
    required String dueDate,
  });
  Future<String> getCurrentUserName();
}
