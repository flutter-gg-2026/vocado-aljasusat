import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';
import 'package:vocado/features/team/presentation/widgets/team_member_card.dart';
import 'package:vocado/features/team/presentation/widgets/team_stat_item.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<TeamCubit>();

    final teamMembers = [
      TeamMemberModel(
        name: 'Layan Alsubaie',
        role: 'UI/UX Designer',
        tasks: 8,
        status: 'Active',
      ),
      TeamMemberModel(
        name: 'Rasha Ahmed',
        role: 'Flutter Developer',
        tasks: 5,
        status: 'Active',
      ),
      TeamMemberModel(
        name: 'Dana Khalid',
        role: 'Backend Developer',
        tasks: 4,
        status: 'Busy',
      ),
      TeamMemberModel(
        name: 'Amaal Alanazi',
        role: 'Project Member',
        tasks: 6,
        status: 'Active',
      ),
    ];

    return Scaffold(
      body: BgContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                Text(
                  'Meet Your Team',
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Gap(10),
                Text(
                  'View team members, roles, and current workload.',
                  style: TextStyle(
                    color: AppColors.textMain.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),
                ),
                Gap(25),

                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.borderLight.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TeamStatItem(
                        title: 'Members',
                        value: '${teamMembers.length}',
                      ),
                      TeamStatItem(title: 'Active', value: '3'),
                      TeamStatItem(title: 'Tasks', value: '23'),
                    ],
                  ),
                ),

                Gap(25),

                Expanded(
                  child: ListView.separated(
                    itemCount: teamMembers.length,
                    separatorBuilder: (_, _) => Gap(14),
                    itemBuilder: (context, index) {
                      final member = teamMembers[index];

                      return TeamMemberCard(member: member, index: index);
                    },
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
