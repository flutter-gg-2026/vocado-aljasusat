import 'package:flutter/material.dart';

enum AppTextType { heading, subheading, body, caption }

class AppText extends StatelessWidget {
  final AppTextType type;
  final String text;

  const AppText._({
    required this.type,
    required this.text,
  });

  factory AppText.heading(String text) {
    return AppText._(type: AppTextType.heading, text: text);
  }

  factory AppText.subheading(String text) {
    return AppText._(type: AppTextType.subheading, text: text);
  }

  factory AppText.body(String text) {
    return AppText._(type: AppTextType.body, text: text);
  }

  factory AppText.caption(String text) {
    return AppText._(type: AppTextType.caption, text: text);
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppTextType.heading:
        return Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      case AppTextType.subheading:
        return Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        );
      case AppTextType.body:
        return Text(
          text,
          style: const TextStyle(fontSize: 14),
        );
      case AppTextType.caption:
        return Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        );
    }
  }
}