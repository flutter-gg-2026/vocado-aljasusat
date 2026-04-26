import 'package:multiple_result/multiple_result.dart';
import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>, Failure>> getTasks();
  Future<void> updateStatus(int id, String status);
}