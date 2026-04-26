import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:vocado/features/task_viewer/data/models/task_model.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final BaseTaskRemoteDataSource remote;

  TaskRepositoryImpl(this.remote);

  @override
  Future<Result<List<TaskEntity>, Failure>> getTasks() async {
    try {
      final data = await remote.getTasks();
      final tasks = data.map((task) => task.toEntity()).toList();

      return Success(tasks);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> updateStatus({
    required int id,
    required String status,
  }) async {
    try {
      await remote.updateStatus(
        id: id,
        status: status,
      );

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}