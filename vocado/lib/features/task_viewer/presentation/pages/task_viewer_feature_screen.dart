import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/tasks_list.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/top_task_card.dart';

class TaskViewerFeatureScreen extends HookWidget {
  const TaskViewerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();

    useEffect(() {
      cubit.getTasks();
      return null;
    }, const []);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BgContainer(
          child: SafeArea(
            child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return LoadingWidget();
                }

                if (state is TaskError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: AppColors.textMain,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                if (state is TaskLoaded) {
                  final tasks = state.tasks;

                  return RefreshIndicator(
                    onRefresh: cubit.getTasks,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(50),
                                Text(
                                  'Hello',
                                  style: TextStyle(
                                    color: AppColors.textMain,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  'Here are your assigned tasks.',
                                  style: TextStyle(
                                    color: AppColors.textMain.withValues(alpha: 0.6),
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${tasks.length} Tasks',
                                      style: TextStyle(
                                        color: AppColors.textMain,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: cubit.getTasks,
                                      child: Text(
                                        'Refresh',
                                        style: TextStyle(
                                          color: AppColors.textMain,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (tasks.isNotEmpty)
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 160,
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: tasks.length,
                                separatorBuilder: (_, _) => const Gap(12),
                                itemBuilder: (context, index) {
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

                        const SliverToBoxAdapter(child: Gap(25)),

                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'All Tasks',
                              style: TextStyle(
                                color: AppColors.textMain,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SliverToBoxAdapter(
                          child: TabBar(
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
                        ),

                        SliverFillRemaining(
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
                return LoadingWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}