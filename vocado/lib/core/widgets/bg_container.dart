import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';

class BgContainer extends StatelessWidget {
  final Widget? child;
  const BgContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backgroundGradient,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.35, 0.7, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.bottomLeft,
            radius: 2,
            colors: [
              Color.fromARGB(255, 252, 255, 61).withValues(alpha: 0.15),
              Colors.transparent,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
