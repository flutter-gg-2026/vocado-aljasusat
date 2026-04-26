import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:vocado/features/task_viewer/data/models/task_model.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_defaults.dart';
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

      if (data.isEmpty) {
        return Success([TaskDefaults.empty()]);
      }

      return Success(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Success([TaskDefaults.empty()]);
    }
  }

  @override
  Future<void> updateStatus(int id, String status) {
    return remote.updateStatus(id, status);
  }
}