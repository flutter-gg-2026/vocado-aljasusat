import 'package:injectable/injectable.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/data/models/task_filter_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskFilterRemoteDataSource {
  Future<List<TaskFilterModel>> getTaskFilter();
}

@LazySingleton(as: BaseTaskFilterRemoteDataSource)
class TaskFilterRemoteDataSource implements BaseTaskFilterRemoteDataSource {
  @override
  Future<List<TaskFilterModel>> getTaskFilter() async {
    try {
      return [
        TaskFilterModel(
          id: 1,
          title: "Fix UI bugs",
          description: "Fix layout issues",
          assignedBy: "amaal",
          deadline: DateTime(2025, 10, 27),
          status: "inProgress",
        ),
        TaskFilterModel(
          id: 2,
          title: "Client Meeting",
          description: "Discuss new features",
          assignedBy: "amaal",
          deadline: DateTime(2025, 10, 28),
          status: "done",
        ),
        TaskFilterModel(
          id: 2,
          title: "Client Meeting",
          description: "Discuss new features",
          assignedBy: "amaal",
          deadline: DateTime(2026, 10, 28),
          status: "done",
        ),
        TaskFilterModel(
          id: 2,
          title: "Client Meeting",
          description: "Discuss new features",
          assignedBy: "amaal",
          deadline: DateTime(2026, 10, 28),
          status: "inProgress",
        ),
      ];
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
