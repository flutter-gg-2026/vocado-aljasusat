import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/presentation/cubit/task_filter_cubit.dart';


class TaskFilterFeatureWidget extends StatelessWidget {
  const TaskFilterFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskFilterCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<TaskFilterCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
