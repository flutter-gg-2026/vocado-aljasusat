import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';
import 'package:vocado/features/task_creator/presentation/widgets/bottom_sheet_widget.dart';
import 'package:vocado/features/task_creator/presentation/widgets/filter_chip_widget.dart';
import 'package:vocado/features/task_creator/presentation/widgets/task_card_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> filteredTasks(String filter) {
      List<TaskCardWidget> allTasks = [
        TaskCardWidget(
          title: 'Update Figma Design',
          assignee: 'User 1',
          gradient: AppColors.uiUxGradient,
          onTap: () {
            context.showBottomSheet(height: 55.h, widget: BottomSheetWidget());
          },
        ),
        TaskCardWidget(
          title: 'Backend API for Gladia',
          assignee: 'User 2',
          gradient: AppColors.dotNetGradient,
          onTap: () {
            context.showBottomSheet(height: 55.h, widget: BottomSheetWidget());
          },
        ),
        TaskCardWidget(
          title: 'Backend API for Gladia',
          assignee: 'User 3',
          gradient: AppColors.scheduleCardGradient,
          onTap: () {
            context.showBottomSheet(height: 55.h, widget: BottomSheetWidget());
          },
        ),
        TaskCardWidget(
          title: 'Backend API for Gladia',
          assignee: 'User 4',
          gradient: AppColors.digitalArtGradient,
          onTap: () {
            context.showBottomSheet(height: 55.h, widget: BottomSheetWidget());
          },
        ),
      ];

      if (filter == 'All') return allTasks;
      return allTasks.where((task) => task.assignee == filter).toList();
    }

    final cubit = context.read<TaskCreatorCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BgContainer(
        child: BlocBuilder<TaskCreatorCubit, TaskCreatorState>(
          builder: (context, state) {
            if (state is TaskCreatorLoadingState) {
              return LoadingWidget();
            }

            final currentFilter = (state is TaskCreatorSuccessState)
                ? state.selectedFilter
                : 'All';

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
                            children:
                                [
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

                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildListDelegate(
                      filteredTasks(currentFilter),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
