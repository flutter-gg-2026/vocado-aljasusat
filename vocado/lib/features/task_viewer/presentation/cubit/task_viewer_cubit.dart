import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/use_cases/task_viewer_use_case.dart';

part 'task_viewer_state.dart';

@injectable
class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskUseCase useCase;

  TaskViewerCubit(this.useCase) : super(TaskInitial());

  List<TaskEntity> allTasks = [];

  Future<void> getTasks() async {
    emit(TaskLoading());

    final result = await useCase.getTasks();

    result.when(
      (success) {
        allTasks = success;
        emit(TaskLoaded(tasks: success));
      },
      (error) {
        emit(TaskError());
      },
    );
  }

  Future<void> updateStatus(int id, String status) async {
    await useCase.updateStatus(id, status);

    final updated = allTasks.map((task) {
      if (task.id == id) {
        return TaskEntity(
          id: task.id,
          title: task.title,
          description: task.description,
          assignedBy: task.assignedBy,
          deadline: task.deadline,
          status: status,
        );
      }
      return task;
    }).toList();

    allTasks = updated;
    emit(TaskLoaded(tasks: updated));
  }

  List<TaskEntity> filterTasks(TaskStatus filter) {
    final now = DateTime.now();

    return allTasks.where((task) {
      final isLate = task.deadline.isBefore(now);
      final isCompleted = task.status == "Completed";
      final isInProgress = task.status == "In Progress";
      final isPending = task.status == "Pending";

      switch (filter) {
        case TaskStatus.Pending:
          return isPending;

        case TaskStatus.InProgress:
          return isInProgress;

        case TaskStatus.Completed:
          return isCompleted;

        case TaskStatus.Late:
          return isLate;
      }
    }).toList();
  }
}

enum TaskStatus { Pending, InProgress, Completed, Late }
