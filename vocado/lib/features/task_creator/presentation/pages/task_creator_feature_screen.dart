import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/widgets/filter_chip_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskCreatorCubit>();

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Container(
        height: 100.h,
        width: 100.sw,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.backgroundGradient,
            begin: .bottomLeft,
            end: .topRight,
            stops: [0.0, 0.35, 0.7, 1.0],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: .bottomLeft,
              radius: 2,
              colors: [
                Color.fromARGB(255, 252, 255, 61).withValues(alpha: 0.15),
                Colors.transparent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Gap(80),
                Text(
                  'Good Morning, Layan!',
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontWeight: .bold,
                    fontSize: 30,
                  ),
                ),
                Gap(15),
                Text(
                  'What task is on your mind today?',
                  style: TextStyle(
                    color: AppColors.textMain.withValues(alpha: 0.6),
                    fontSize: 18,
                  ),
                ),
                Gap(30),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChipWidget(label: 'All', isSelected: true),
                      FilterChipWidget(label: 'Drafts', isSelected: false),
                      FilterChipWidget(label: 'Approved', isSelected: false),
                      FilterChipWidget(label: 'Completed', isSelected: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
