import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  final TaskCreatorEntity task;

  const BottomSheetWidget({super.key, required this.task});

  Future<void> _showDeleteDialog(BuildContext context) async {
    final cubit = context.read<TaskCreatorCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
                await cubit.deleteTask(task.id);
              },
              child: Text('Delete', style: TextStyle(color: AppColors.error)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context) async {
    final cubit = context.read<TaskCreatorCubit>();

    final nameController = TextEditingController(text: task.name);
    final descriptionController = TextEditingController(
      text: task.description ?? '',
    );
    final dueDateController = TextEditingController(text: task.dueDate);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Task Name'),
                ),
                Gap(12),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                Gap(12),
                TextField(
                  controller: dueDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                    suffixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: dialogContext,
                      initialDate:
                          DateTime.tryParse(task.dueDate!) ?? DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2035),
                    );

                    if (selectedDate != null) {
                      dueDateController.text = selectedDate
                          .toIso8601String()
                          .split('T')
                          .first;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                Navigator.pop(context);

                await cubit.updateTask(
                  id: task.id,
                  name: nameController.text.trim(),
                  description: descriptionController.text.trim(),
                  dueDate: dueDateController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.calendarSelection,
              ),
              child: Text('Save', style: TextStyle(color: AppColors.textMain)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Details',
              style: TextStyle(
                color: AppColors.textButton,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(10),
            Text(
              task.name ?? 'Untitled',
              style: TextStyle(
                color: AppColors.calendarSelection,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(15),
            DetailRow(
              icon: Icons.description_outlined,
              label: 'Description',
              value: task.description ?? 'No Description',
            ),
            Gap(20),
            DetailRow(
              icon: Icons.person_outline,
              label: 'Assignee',
              value: task.assigneeName ?? task.userId,
            ),
            Gap(20),
            DetailRow(
              icon: Icons.calendar_today_outlined,
              label: 'Due Date',
              value: task.dueDate!,
            ),
            Gap(20),
            DetailRow(
              icon: Icons.label_outline,
              label: 'Status',
              value: task.status,
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _showDeleteDialog(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.error),
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: AppColors.error,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Gap(8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showEditDialog(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.calendarSelection,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: AppColors.textMain,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(50),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.calendarSelection, size: 24),
        Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                label,
                style: TextStyle(color: AppColors.textButton, fontSize: 12),
              ),
              Text(
                value,
                style: TextStyle(
                  color: AppColors.textButton,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
