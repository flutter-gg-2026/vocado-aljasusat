import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

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

        emit(TaskLoaded(tasks: allTasks));
      },
      (failure) {
        emit(TaskError(message: failure.message));
      },
    );
  }

  Future<void> updateStatus({required int id, required String status}) async {
    final result = await useCase.updateStatus(id: id, status: status);

    result.when(
      (success) {
        allTasks = allTasks.map((task) {
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

        emit(TaskLoaded(tasks: allTasks));
      },
      (failure) {
        emit(TaskError(message: failure.message));
      },
    );
  }

  List<TaskEntity> filterTasks(String status) {
    return allTasks.where((task) {
      return task.status == status;
    }).toList();
  }
}
