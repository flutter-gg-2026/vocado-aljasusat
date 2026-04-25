import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<TeamCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Team Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
