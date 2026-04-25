import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';

class AppText extends StatelessWidget {

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColors.textMain,
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}