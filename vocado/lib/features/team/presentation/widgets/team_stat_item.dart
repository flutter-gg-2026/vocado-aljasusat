import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';

class TeamStatItem extends StatelessWidget {
  final String title;
  final String value;

  const TeamStatItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: AppColors.textMain,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(4),
        Text(
          title,
          style: TextStyle(
            color: AppColors.textMain.withValues(alpha: 0.55),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
