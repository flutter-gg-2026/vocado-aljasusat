import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/common/widgets/avatar/app_avatar.dart';
import 'package:vocado/core/common/widgets/button/app_button.dart';
import 'package:vocado/core/common/widgets/cards/app_card.dart';
import 'package:vocado/core/common/widgets/field/app_field.dart';
import 'package:vocado/core/common/widgets/text/app_text.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';


class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskViewerCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('VocaDo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading("Welcome Back"),
              const SizedBox(height: 8),
              AppText.body("Manage your tasks and team"),
        
              const SizedBox(height: 20),
        
              AppField.searchInput(
                hint: "Search tasks...",
              ),
        
              const SizedBox(height: 20),
        
              Row(
                children: [
                  AppAvatar.user(name: "A"),
                  const SizedBox(width: 10),
                  AppAvatar.user(name: "R"),
                  const SizedBox(width: 10),
                  AppAvatar.group(),
                ],
              ),
        
              const SizedBox(height: 20),
        
              AppCard.taskItem(
                title: "Update Figma Design",
                subtitle: "Assigned to Rasha",
              ),
        
              const SizedBox(height: 10),
        
              AppCard.taskItem(
                title: "Fix API Integration",
                subtitle: "Assigned to Ahmed",
                isDone: true,
              ),
        
              const SizedBox(height: 10),
        
              AppCard.teamMember(
                name: "Rasha",
              ),
        
              const SizedBox(height: 20),
        
              AppField.singleLineInput(
                label: "Task Title",
                hint: "Enter task name",
              ),
        
              const SizedBox(height: 10),
        
              AppField.multiLineInput(
                label: "Task Description",
              ),
        
              const SizedBox(height: 20),
        
              AppButton.primaryAction(
                text: "Create Task",
                onTap: () {},
              ),
        
              const SizedBox(height: 10),
        
              AppButton.secondaryAction(
                text: "Cancel",
                onTap: () {},
              ),
        
              const SizedBox(height: 20),
        
              Center(
                child: AppButton.voiceAction(
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}