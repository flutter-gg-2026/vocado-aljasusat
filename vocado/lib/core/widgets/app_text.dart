import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const AppText({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textMain,
        fontSize: fontSize,
        fontWeight: .bold,
      ),
    );
  }
}
