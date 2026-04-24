
import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  const FilterChipWidget({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentAccent.withValues(alpha: 0.9)
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight, width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : AppColors.accentAccent,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
