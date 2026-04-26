import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/tasks_list.dart';

class TaskTabs extends StatelessWidget {
  const TaskTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: .min,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: AppColors.textMain,
            unselectedLabelColor: AppColors.textMain.withValues(alpha: 0.5),
            indicatorColor: AppColors.textMain,
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'In Progress'),
              Tab(text: 'Completed'),
              Tab(text: 'Late'),
            ],
          ),
      
          SizedBox(
            height: 70.h,
            child: TabBarView(
              children: [
                TaskList(filter: 'Pending'),
                TaskList(filter: 'In Progress'),
                TaskList(filter: 'Completed'),
                TaskList(filter: 'Late'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
