import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/domain/use_cases/task_creator_use_case.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorCubit extends Cubit<TaskCreatorState> {
  final TaskCreatorUseCase _taskCreatorUseCase;

  TaskCreatorCubit(this._taskCreatorUseCase) : super(TaskCreatorInitialState());

  List<TaskCreatorEntity> allTasks = [];
  String userName = 'User';


  Future<void> getTaskCreatorMethod() async {
    emit(TaskCreatorLoadingState());

    final tasksResult = await _taskCreatorUseCase.getTaskCreator();
    final name = await _taskCreatorUseCase.getCurrentUserName();

    tasksResult.when(
      (success) {
        allTasks = success;
        userName = name;

        emit(
          TaskCreatorSuccessState(
            tasks: allTasks,
            selectedFilter: 'All',
            userName: userName,
          ),
        );
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
