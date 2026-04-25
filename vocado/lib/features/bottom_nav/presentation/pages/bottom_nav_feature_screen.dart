import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';
import 'package:vocado/features/bottom_nav/presentation/cubit/bottom_nav_state.dart';
import 'package:vocado/features/bottom_nav/presentation/widgets/bottom_nav_widget.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:vocado/features/voice_task/presentation/pages/voice_task_feature_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final PageController pageController = PageController();

  final List<Widget> screens = const [
    AdminHomeScreen(),
    VoiceTaskFeatureScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is BottomNavChangedState) {
          currentIndex = state.index;
        }
        return Scaffold(
          backgroundColor: AppColors.background,
          extendBody: true,

          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              context.read<BottomNavCubit>().changePage(index);
            },
            children: screens,
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 90, right: 90),
            child: Container(
              height: 70,
              width: 50.sw,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.homeNavButtonGradient,
                  begin: .bottomLeft,
                  end: .topRight,
                  stops: [0.0, 0.35],
                ),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: AppColors.borderLight, width: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItemWidget(
                    icon: Icons.grid_view_rounded,
                    index: 0,
                    currentIndex: currentIndex,
                    pageController: pageController,
                  ),
                  NavItemWidget(
                    icon: Icons.mic_rounded,
                    index: 1,
                    currentIndex: currentIndex,
                    pageController: pageController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
