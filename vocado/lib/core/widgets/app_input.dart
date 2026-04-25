import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.hint,
    this.controller,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  final String hint;
  final TextEditingController? controller;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(color: AppColors.accentAccent),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.textMain.withValues(alpha: 0.6)),
        prefixIcon: Icon(
          icon,
          color: AppColors.accentAccent.withValues(alpha: 0.7),
        ),
        filled: true,
        fillColor: AppColors.accentAccent.withValues(alpha: 0.07),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.accentAccent.withValues(alpha: 0.12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.accentAccent.withValues(alpha: 0.24),
          ),
        ),
      ),
    );
  }
}
