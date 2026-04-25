import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';

class BottomSheetWidget extends StatelessWidget {
  final TaskCreatorEntity task;

  const BottomSheetWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
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
            task.name,
            style: TextStyle(
              color: AppColors.calendarSelection,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(30),
          DetailRow(
            icon: Icons.person_outline,
            label: 'Assignee',
            value: task.userId
          ),
          Gap(20),
          DetailRow(
            icon: Icons.calendar_today_outlined,
            label: 'Due Date',
            value: task.dueDate,
          ),
          Gap(20),
          DetailRow(
            icon: Icons.label_outline,
            label: 'Status',
            value: task.status,
          ),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: AppColors.textButton, fontSize: 12),
              ),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
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
