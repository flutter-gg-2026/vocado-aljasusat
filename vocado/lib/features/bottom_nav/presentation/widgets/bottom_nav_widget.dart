import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';

class NavItemWidget extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final PageController pageController;
  const NavItemWidget({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    return InkWell(
      onTap: () {
        context.read<BottomNavCubit>().changePage(index);
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.calendarSelection.withValues(alpha: 0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? AppColors.calendarSelection
              : AppColors.textSecondary,
          size: isSelected ? 35 : 26,
        ),
      ),
    );
  }
}
