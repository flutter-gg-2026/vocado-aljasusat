import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final String filter;

  const TaskList({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskViewerCubit, TaskViewerState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          final tasks = context.read<TaskViewerCubit>().filterTasks(filter);

          if (tasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks',
                style: TextStyle(
                  color: AppColors.textMain.withValues(alpha: 0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(task: tasks[index]);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
