import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/cubit/task_viewer_cubit.dart';

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
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withAlpha(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(date, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: status,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              items: const [
                DropdownMenuItem(value: "Pending", child: Text("Pending")),
                DropdownMenuItem(
                  value: "In Progress",
                  child: Text("In Progress"),
                ),
                DropdownMenuItem(value: "Completed", child: Text("Completed")),
                DropdownMenuItem(value: "Late", child: Text("Late")),
              ],
              onChanged: (value) {
                if (value == null) return;
                context.read<TaskViewerCubit>().updateStatus(id, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
