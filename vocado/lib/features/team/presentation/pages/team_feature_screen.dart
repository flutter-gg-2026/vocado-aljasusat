import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';
import 'package:vocado/features/team/presentation/widgets/team_member_card.dart';
import 'package:vocado/features/team/presentation/widgets/team_stat_item.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BgContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: BlocBuilder<TeamCubit, TeamState>(
              builder: (context, state) {
                if (state is TeamLoadingState) {
                  return LoadingWidget();
                }

                if (state is TeamErrorState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: AppColors.textMain),
                    ),
                  );
                }

                if (state is TeamSuccessState) {
                  final teamMembers = state.teamMembers;


                  if (teamMembers.isEmpty) {
                    return Center(
                      child: Text(
                        'No team members found',
                        style: TextStyle(color: AppColors.textMain),
                      ),
                    );
                  }

                  return Column(
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
                          color: AppColors.cardBackground.withValues(
                            alpha: 0.35,
                          ),
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
                  );
                }

                return Center(
                  child: Text(
                    'Something went wrong!',
                    style: TextStyle(color: AppColors.textMain),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
