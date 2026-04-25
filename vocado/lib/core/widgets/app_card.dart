import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child, this.onTap, this.height});

  final Widget child;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      width: 85.sw,
      height: height,
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(24),
      blur: 15,
      borderColor: AppColors.textMain.withValues(alpha: 0.2),
    );
  }
}
