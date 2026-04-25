import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

class TaskDefaults {
  static TaskEntity empty() {
    return TaskEntity(
      id: 0,
      title: "No Task",
      description: "No Description",
      assignedBy: "System",
      deadline: DateTime.now(),
      status: "in_progress",
    );
  }
}
