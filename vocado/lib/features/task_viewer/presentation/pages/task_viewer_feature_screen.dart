import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/task_tabs.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/top_task_card.dart';



class TaskViewerFeatureScreen extends StatelessWidget {
   const TaskViewerFeatureScreen({super.key});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.backgroundGradient,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return LoadingWidget();
              }

              if (state is TaskLoaded) {
                final tasks = state.tasks;

                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidget.text(text: "Hello", fontSize: 20),
                            Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppWidget.text(
                                  text: "${tasks.length} New tasks today",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<TaskViewerCubit>().getTasks();
                                  },
                                  child: AppWidget.text(text: "Refresh"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 160,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: tasks.length,
                          separatorBuilder: (_, __) => SizedBox(width: 12),
                          itemBuilder: (_, index) {
                            final task = tasks[index];
                            return TopTaskCard(
                              id: task.id,
                              title: task.title,
                              date: task.deadlineFormatted,
                              status: task.status,
                            );
                          },
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 20)),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: AppWidget.text(text: "All Tasks", fontSize: 20),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 10)),

                    SliverToBoxAdapter(
                      child: SizedBox(height: 500, child: TaskTabs()),
                    ),
                  ],
                );
              }

             return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
