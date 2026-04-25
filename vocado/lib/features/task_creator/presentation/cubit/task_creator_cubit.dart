import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/domain/use_cases/task_creator_use_case.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorCubit extends Cubit<TaskCreatorState> {
  final TaskCreatorUseCase _taskCreatorUseCase;

  TaskCreatorCubit(this._taskCreatorUseCase) : super(TaskCreatorInitialState());

  List<TaskCreatorEntity> allTasks = [];

  Future<void> getTaskCreatorMethod() async {
    emit(TaskCreatorLoadingState());

    final result = await _taskCreatorUseCase.getTaskCreator();

    result.when(
      (success) {
        allTasks = success;
        emit(TaskCreatorSuccessState(tasks: allTasks));
      },
      (failure) {
        emit(TaskCreatorErrorState(message: failure.message));
      },
    );
  }

  void changeFilter(String filter) {
    emit(TaskCreatorSuccessState(tasks: allTasks, selectedFilter: filter));
  }

  Future<void> deleteTask(int id) async {
    emit(TaskCreatorLoadingState());

    final result = await _taskCreatorUseCase.deleteTask(id);

    result.when(
      (success) async {
        await getTaskCreatorMethod();
      },
      (failure) {
        emit(TaskCreatorErrorState(message: failure.message));
      },
    );
  }

  Future<void> updateTask({
    required int id,
    required String name,
    required String description,
    required String dueDate,
  }) async {
    emit(TaskCreatorLoadingState());

    final result = await _taskCreatorUseCase.updateTask(
      id: id,
      name: name,
      description: description,
      dueDate: dueDate,
    );

    result.when(
      (success) async {
        await getTaskCreatorMethod();
      },
      (failure) {
        emit(TaskCreatorErrorState(message: failure.message));
      },
    );
  }
}
