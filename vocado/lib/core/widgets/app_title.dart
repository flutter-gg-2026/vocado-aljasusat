import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_color.dart';

class AppTitle extends StatelessWidget {
  const AppTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textMain,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}