import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'app_card.dart';
import 'app_button.dart';
import 'app_input.dart';
import 'app_text.dart';

enum AppWidgetType { card, button, input, text }

class AppWidget extends StatelessWidget {
  final AppWidgetType type;
  final String? title;
  final String? hint;
  final Widget? child;

  final VoidCallback? onTap;
  final TextEditingController? controller;

  final IconData? icon;
  final bool obscureText;

  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  final String? Function(String?)? validator;
  final bool isLoading;

  const AppWidget._({
    required this.type,
    this.title,
    this.hint,
    this.child,
    this.onTap,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.validator,
    this.isLoading = false,
    this.maxLines,
    this.overflow,
  });

  factory AppWidget.card({
    required Widget child,
    String? title,
    VoidCallback? onTap,
  }) {
    return AppWidget._(
      type: AppWidgetType.card,
      title: title,
      onTap: onTap,
      child: child,
    );
  }

  factory AppWidget.button({
    required String title,
    VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return AppWidget._(
      type: AppWidgetType.button,
      title: title,
      onTap: onTap,
      isLoading: isLoading,
    );
  }

  factory AppWidget.input({
    required String hint,
    TextEditingController? controller,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return AppWidget._(
      type: AppWidgetType.input,
      hint: hint,
      controller: controller,
      icon: icon,
      obscureText: obscureText,
      validator: validator,
    );
  }

  factory AppWidget.text({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppWidget._(
      type: AppWidgetType.text,
      title: text,
      maxLines: maxLines,
      overflow: overflow,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppWidgetType.card:
        return AppCard(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                AppText(
                  text: title!,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
              ],
              child!,
            ],
          ),
        );

      case AppWidgetType.button:
        return AppButton(
          title: title!,
          onTap: onTap,
          isLoading: isLoading,
        );

      case AppWidgetType.input:
        return AppInput(
          hint: hint!,
          controller: controller,
          icon: icon!,
          obscureText: obscureText,
          validator: validator,
        );

      case AppWidgetType.text:
        return AppText(
          text: title!,
          maxLines: maxLines,
          overflow: overflow,

          fontSize: fontSize ?? 15,
          fontWeight: fontWeight ?? FontWeight.bold,

          color: color ?? AppColors.textMain,
        );
    }
  }
}