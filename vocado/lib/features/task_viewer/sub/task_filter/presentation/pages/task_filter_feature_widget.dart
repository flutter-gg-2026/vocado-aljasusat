import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_cubit.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/widgets/tasks_list.dart';

class TaskFilterFeatureWidget extends StatelessWidget {
  const TaskFilterFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskFilterCubit(GetIt.I.get())..getTaskFilterMethod(),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "In Progress"),
                Tab(text: "Done"),
                Tab(text: "Late"),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [
                  TasksList(filter: TaskFilter.inProgress),
                  TasksList(filter: TaskFilter.done),
                  TasksList(filter: TaskFilter.late),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
