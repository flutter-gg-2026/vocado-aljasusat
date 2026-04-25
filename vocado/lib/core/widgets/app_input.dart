import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
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
      style: const TextStyle(color: AppColors.textMain),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textSecondary),

        prefixIcon: Icon(
          icon,
          color: AppColors.textSecondary,
        ),

        filled: true,
        fillColor: AppColors.cardBackground,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.accentAccent),
        ),
      ),
    );
  }
}