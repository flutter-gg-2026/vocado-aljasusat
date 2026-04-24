import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_cubit.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_state.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/widgets/task_item.dart';

enum TaskFilter { inProgress, done, late }

class TasksList extends StatelessWidget {
  final TaskFilter filter;

  const TasksList({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFilterCubit, TaskFilterState>(
      builder: (context, state) {
        if (state is TaskFilterLoadedState) {
          final now = DateTime.now();

          final filteredTasks = state.tasks.where((task) {
            final diff = task.deadline.difference(now);

            final isLate = diff.isNegative;
            final isDone = task.status == "done";
            final isInProgress = !isLate && !isDone;
            switch (filter) {
              case TaskFilter.inProgress:
                return isInProgress;
              case TaskFilter.done:
                return isDone;
              case TaskFilter.late:
                return isLate && !isDone;
            }
          }).toList();

          if (filteredTasks.isEmpty) {
            return const Center(child: Text("No tasks found"));
          }

          return ListView.builder(
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: TaskItem(task: filteredTasks[index]),
              );
            },
          );
        }

        if (state is TaskFilterErrorState) {
          return const Center(child: Text("Something went wrong"));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
