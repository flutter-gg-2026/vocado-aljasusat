import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@lazySingleton
class TaskUseCase {
  final TaskRepository _repository;

  TaskUseCase(this._repository);

  Future<Result<List<TaskEntity>, Failure>> getTasks() async {
    return _repository.getTasks();
  }

  Future<Result<void, Failure>> updateStatus({
    required int id,
    required String status,
  }) async {
    return _repository.updateStatus(
      id: id,
      status: status,
    );
  }
}