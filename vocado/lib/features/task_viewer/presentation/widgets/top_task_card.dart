import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/widgets/app_widget.dart';
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
    return SizedBox(
      width: 300,
      child: AppWidget.card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidget.text(
              text: title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(4),
            AppWidget.text(text: date),
            const Gap(4),
            DropdownButtonFormField<String>(
              isExpanded: true,
              hint: const Text(
                "Select status",
                style: TextStyle(color: Colors.white70),
              ),
              style: const TextStyle(color: Colors.white),
              dropdownColor: const Color(0xFF1E1E1E),
              items: const [
                DropdownMenuItem(
                  value: "in_progress",
                  child: Text(
                    "In Progress",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownMenuItem(
                  value: "done",
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                ),
              ],
              onChanged: (value) {
                context.read<TaskViewerCubit>().updateStatus(id, value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
