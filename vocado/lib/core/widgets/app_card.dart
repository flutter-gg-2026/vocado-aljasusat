import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:vocado/core/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.useGlass = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool useGlass;

  @override
  Widget build(BuildContext context) {
    if (useGlass) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  /// glass effect
                  color: Colors.white.withAlpha(16),
                  border: Border.all(color: Colors.white.withAlpha(40)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ),
      );
    }

    /// fallback (design system)
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: child,

    );
  }
}