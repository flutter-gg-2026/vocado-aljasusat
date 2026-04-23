import 'package:flutter/material.dart';
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

  const AppWidget._({
    required this.type,
    this.title,
    this.hint,
    this.child,
    this.onTap,
    this.controller,
  });

  factory AppWidget.card({required Widget child, String? title}) {
    return AppWidget._(
      type: AppWidgetType.card,
      child: child,
      title: title,
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

  factory AppWidget.text({required String text}) {
    return AppWidget._(
      type: AppWidgetType.text,
      title: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppWidgetType.card:
        return AppCard(
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
        return AppText(title!);
    }
  }
}