import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/domain/repositories/task_creator_repository_domain.dart';

@lazySingleton
class TaskCreatorUseCase {
  final TaskCreatorRepositoryDomain _repositoryData;

  TaskCreatorUseCase(this._repositoryData);

  Future<Result<List<TaskCreatorEntity>, Failure>> getTaskCreator() async {
    return _repositoryData.getTaskCreator();
  }

  Future<Result<void, Failure>> deleteTask(int id) async {
    return _repositoryData.deleteTask(id);
  }

  Future<Result<void, Failure>> updateTask({
    required int id,
    required String name,
    required String description,
    required String dueDate,
  }) async {
    return _repositoryData.updateTask(
      id: id,
      name: name,
      description: description,
      dueDate: dueDate,
    );
  }

  Future<String> getCurrentUserName() async {
  return _repositoryData.getCurrentUserName();
}
}
