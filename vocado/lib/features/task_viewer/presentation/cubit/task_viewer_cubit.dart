import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';

@injectable
class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _useCase;

  TaskViewerCubit(this._useCase) : super(TaskViewerInitialState()){
     getTasks();
  }


  bool isExpanded = false;

  Future<void> getTasks() async {
    emit(TaskViewerLoadingState());

    final result = await _useCase.getTaskViewer();

    result.when(
      (success) {
        final (user, tasks) = success;

        emit(TaskViewerSuccessState(
          user: user,
          tasks: tasks,
          isExpanded: isExpanded,
        ));
      },
      (error) {
        emit(const TaskViewerErrorState(message: "Something went wrong"));
      },
    );
  }

  void toggleViewAll() {
    if (state is TaskViewerSuccessState) {
      final current = state as TaskViewerSuccessState;

      isExpanded = !isExpanded;

      emit(TaskViewerSuccessState(
        user: current.user,
        tasks: current.tasks,
        isExpanded: isExpanded,
      ));
    }
  }

  void updateStatus(int id, String status) {
    if (state is TaskViewerSuccessState) {
      final current = state as TaskViewerSuccessState;

      final updatedTasks = current.tasks.map((task) {
        if (task.id == id) {
          return TaskEntity(
            id: task.id,
            title: task.title,
            date: task.date,
            status: status,
          );
        }
        return task;
      }).toList();

      emit(TaskViewerSuccessState(
        user: current.user,
        tasks: updatedTasks,
        isExpanded: current.isExpanded,
      ));
    }
  }
}