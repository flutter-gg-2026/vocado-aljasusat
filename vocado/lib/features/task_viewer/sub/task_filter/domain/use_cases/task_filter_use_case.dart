import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/repositories/task_filter_repository_domain.dart';


@lazySingleton
class TaskFilterUseCase {
  final TaskFilterRepositoryDomain _repositoryData;

  TaskFilterUseCase(this._repositoryData);

   Future<Result<List<TaskFilterEntity>, Failure>> getTaskFilter() async {
    return _repositoryData.getTaskFilter();
  }
}