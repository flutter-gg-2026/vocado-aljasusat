import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/task_viewer_repository_domain.dart';

@lazySingleton
class TaskUseCase {
  final TaskRepository repo;

  TaskUseCase(this.repo);

  Future<Result<List<TaskEntity>, Failure>> getTasks() {
    return repo.getTasks();
  }

  Future<void> updateStatus(int id, String status) {
    return repo.updateStatus(id, status);
  }
}