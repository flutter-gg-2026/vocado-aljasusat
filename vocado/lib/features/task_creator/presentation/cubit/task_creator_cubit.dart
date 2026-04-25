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
        print('TASKS COUNT: ${success.length}');
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
}
