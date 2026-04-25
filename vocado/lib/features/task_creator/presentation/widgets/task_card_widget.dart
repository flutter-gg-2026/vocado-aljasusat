import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String assignee;
  final List<Color> gradient;
  final void Function()? onTap;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.assignee,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              gradient[0].withValues(alpha: 0.8),
              gradient[1].withValues(alpha: 0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      assignee,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textMain,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.textMain,
                  child: const Icon(
                    Icons.arrow_outward,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textMain,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}