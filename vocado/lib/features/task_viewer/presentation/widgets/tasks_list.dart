import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final TaskStatus filter;

  const TaskList({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskViewerCubit, TaskViewerState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          final tasks = context.read<TaskViewerCubit>().filterTasks(filter);

          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks"));
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: TaskItem(task: tasks[i]),
              );
            },
          );
        }

        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return const SizedBox();
      },
    );
  }
}