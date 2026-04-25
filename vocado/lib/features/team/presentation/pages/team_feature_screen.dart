import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<TeamCubit>();

    return Scaffold(
      body: BgContainer(
        child: Padding(
          padding:  EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Gap(80),
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
                'sub header',
                style: TextStyle(
                  color: AppColors.textMain.withValues(alpha: 0.6),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
