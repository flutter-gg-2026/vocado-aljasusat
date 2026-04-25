import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/use_cases/task_filter_use_case.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_state.dart';

class TaskFilterCubit extends Cubit<TaskFilterState> {
  final TaskFilterUseCase _taskFilterUseCase;

  TaskFilterCubit(this._taskFilterUseCase) : super(TaskFilterInitialState());

  Future<void> getTaskFilterMethod() async {
    final result = await _taskFilterUseCase.getTaskFilter();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
