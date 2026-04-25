import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/top_task_card.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/pages/task_filter_feature_widget.dart';

class TaskViewerFeatureScreen extends StatefulWidget {
  const TaskViewerFeatureScreen({super.key});

  @override
  State<TaskViewerFeatureScreen> createState() =>
      _TaskViewerFeatureScreenState();
}

class _TaskViewerFeatureScreenState extends State<TaskViewerFeatureScreen> {
  @override
  void initState() {
    context.read<TaskViewerCubit>().getTasks();
    super.initState();
  }

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
              if (state is TaskViewerLoadingState) {
                return LoadingWidget();
              }

              if (state is TaskViewerSuccessState) {
                final tasks = state.tasks;

                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidget.text(
                              text: "Hello, ${state.user.name}",
                              fontSize: 20,
                            ),
                            Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppWidget.text(
                                  text: "${tasks.length} New tasks today",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TaskViewerCubit>()
                                        .toggleViewAll();
                                  },
                                  child: AppWidget.text(text: "View all"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: state.isExpanded
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              itemCount: tasks.length,
                              itemBuilder: (_, index) {
                                final task = tasks[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: TopTaskCard(
                                    id: task.id,
                                    title: task.title,
                                    date: task.date,
                                    status: task.status,
                                  ),
                                );
                              },
                            )
                          : SizedBox(
                              height: 160,
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: tasks.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: 12),
                                itemBuilder: (_, index) {
                                  final task = tasks[index];
                                  return TopTaskCard(
                                    id: task.id,
                                    title: task.title,
                                    date: task.date,
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
                      child: SizedBox(
                        height: 500,
                        child: TaskFilterFeatureWidget(),
                      ),
                    ),
                  ],
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
