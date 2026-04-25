import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamEntity member;
  final int index;

  const TeamMemberCard({super.key, required this.member, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.uiUxGradient,
      AppColors.dotNetGradient,
      AppColors.scheduleCardGradient,
      AppColors.digitalArtGradient,
    ];

    final gradient = colors[index % colors.length];

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.borderLight.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 15.w,
            height: 15.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  gradient[0].withValues(alpha: 0.9),
                  gradient[1].withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                member.name.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Gap(14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Gap(4),
                Text(
                  member.role,
                  style: TextStyle(
                    color: AppColors.textMain.withValues(alpha: 0.55),
                    fontSize: 13,
                  ),
                ),
                Gap(10),
                
              ],
            ),
          ),

          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.3),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                color: AppColors.textMain,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
