import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(fixedSize: Size(100.sw, 45)),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: .bold,
          color: AppColors.textButton,
          fontSize: 18,
        ),
      ),
    );
  }
}
