import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/theme/app_color.dart';
import 'package:vocado/core/widgets/app_widget.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';


class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskViewerCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidget.text(text: "Tasks"),
            const SizedBox(height: 10),
        
            AppWidget.card(
              title: "Add Task",
              child: Column(
        children: [
          AppWidget.input(hint: "Enter task"),
          const SizedBox(height: 10),
          AppWidget.button(
            title: "Save",
            onTap: () {},
          ),
        ],
              ),
            ),
          ],
        ),
        ),
    ),
    
    );
  }
}