import 'package:flutter/material.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/tasks_list.dart';

class TaskTabs extends StatelessWidget {
  const TaskTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "In Progress"),
              Tab(text: "Completed"),
              Tab(text: "Late"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TaskList(filter: TaskStatus.Pending),
                TaskList(filter: TaskStatus.InProgress),
                TaskList(filter: TaskStatus.Completed),
                TaskList(filter: TaskStatus.Late),
              ],
            ),
          ),
        ],
      ),
    );
  }
}