import 'package:flutter/material.dart';
import 'package:vocado/core/theme/app_color.dart';
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
final int? maxLines;
final TextOverflow? overflow;
final double? fontSize;
final FontWeight? fontWeight;
final Color? color;
const AppWidget._({
  required this.type,
  this.title,
  this.hint,
  this.child,
  this.onTap,
  this.controller,
  this.maxLines,
  this.overflow,
  this.fontSize,
  this.fontWeight,
  this.color,
});

  factory AppWidget.card({required Widget child, String? title , VoidCallback? onTap,}) {
    return AppWidget._(
      type: AppWidgetType.card,
      child: child,
      title: title,
      onTap: onTap,
    );
  }

  factory AppWidget.button({
    required String title,
    required VoidCallback onTap,
  }) {
    return AppWidget._(
      type: AppWidgetType.button,
      title: title,
      onTap: onTap,
    );
  }

  factory AppWidget.input({
    required String hint,
    TextEditingController? controller,
  }) {
    return AppWidget._(
      type: AppWidgetType.input,
      hint: hint,
      controller: controller,
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
                AppText(title!),
                const SizedBox(height: 10),
              ],
              child!,
            ],
          ),
        );

      case AppWidgetType.button:
        return AppButton(
          title: title!,
          onTap: onTap!,
        );

      case AppWidgetType.input:
        return AppInput(
          hint: hint!,
          controller: controller,
        );
case AppWidgetType.text:
  return AppText(
    title!,
    maxLines: maxLines,
    overflow: overflow,
    fontSize: fontSize ?? 15,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.textMain,
  );
    }
  }
}