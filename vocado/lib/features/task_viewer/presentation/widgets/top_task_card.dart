import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class TopTaskCard extends StatelessWidget {
  final int id;
  final String title;
  final String date;
  final String status;

  const TopTaskCard({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statuses = [
      'Pending',
      'In Progress',
      'Completed',
      'Late',
    ];

    return SizedBox(
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.borderLight.withValues(alpha: 0.35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textMain,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Gap(6),
            Text(
              date,
              style: TextStyle(
                color: AppColors.textMain.withValues(alpha: 0.65),
              ),
            ),
            const Spacer(),
            DropdownButtonFormField<String>(
              initialValue: statuses.contains(status) ? status : null,
              isExpanded: true,
              dropdownColor: AppColors.background,
              iconEnabledColor: AppColors.textMain,
              style: TextStyle(color: AppColors.textMain),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.cardBackground.withValues(alpha: 0.25),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: AppColors.borderLight.withValues(alpha: 0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: AppColors.borderLight.withValues(alpha: 0.3),
                  ),
                ),
              ),
              items: statuses.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;

                context.read<TaskViewerCubit>().updateStatus(
                      id: id,
                      status: value,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}