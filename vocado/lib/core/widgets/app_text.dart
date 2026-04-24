

import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_color.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.maxLines,
    this.overflow,
    this.fontSize = 15,
    this.fontWeight = FontWeight.bold,
    this.color = AppColors.textMain,
  });

  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}