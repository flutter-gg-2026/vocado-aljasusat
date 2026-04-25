import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';
import 'package:vocado/features/task_creator/presentation/widgets/bottom_sheet_widget.dart';
import 'package:vocado/features/task_creator/presentation/widgets/filter_chip_widget.dart';
import 'package:vocado/features/task_creator/presentation/widgets/task_card_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  List<Color> getTaskGradient(int index) {
    final gradients = [
      AppColors.uiUxGradient,
      AppColors.dotNetGradient,
      AppColors.scheduleCardGradient,
      AppColors.digitalArtGradient,
    ];

    return gradients[index % gradients.length];
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCreatorCubit>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BgContainer(
        child: BlocBuilder<TaskCreatorCubit, TaskCreatorState>(
          builder: (context, state) {
            if (state is TaskCreatorLoadingState) {
              return LoadingWidget();
            }

            if (state is TaskCreatorErrorState) {
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

            final List<TaskCreatorEntity> tasks =
                state is TaskCreatorSuccessState ? state.tasks : [];

            final String currentFilter =
                state is TaskCreatorSuccessState ? state.selectedFilter : 'All';

            final List<TaskCreatorEntity> filteredTasks = currentFilter == 'All'
                ? tasks
                : tasks
                    .where((task) => task.status == currentFilter)
                    .toList();

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(80),
                        Text(
                          'Good Morning, Layan!',
                          style: TextStyle(
                            color: AppColors.textMain,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Gap(10),
                        Text(
                          'What task is on your mind today?',
                          style: TextStyle(
                            color: AppColors.textMain.withValues(alpha: 0.6),
                            fontSize: 18,
                          ),
                        ),
                        Gap(20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              'All',
                              'Completed',
                              'Pending',
                              'In Progress',
                              'Late',
                            ].map((filter) {
                              return FilterChipWidget(
                                label: filter,
                                isSelected: currentFilter == filter,
                                onTap: () => cubit.changeFilter(filter),
                              );
                            }).toList(),
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                ),

                if (filteredTasks.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'No tasks found',
                        style: TextStyle(
                          color: AppColors.textMain.withValues(alpha: 0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.85,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final task = filteredTasks[index];

                          return TaskCardWidget(
                            title: task.name,
                            assignee: task.assignedBy!,
                            gradient: getTaskGradient(index),
                            onTap: () {
                              context.showBottomSheet(
                                height: 55.h,
                                widget: BottomSheetWidget(task: task),
                              );
                            },
                          );
                        },
                        childCount: filteredTasks.length,
                      ),
                    ),
                  ),

                SliverToBoxAdapter(
                  child: Gap(120),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}