import 'package:flutter/material.dart';
import 'single_line_input.dart';
import 'multi_line_input.dart';
import 'search_input.dart';

enum AppFieldType { singleLineInput, multiLineInput, searchInput }

class AppField extends StatelessWidget {
  final AppFieldType type;
  final String? label;
  final String? hint;
  final TextEditingController? controller;

  const AppField._({
    required this.type,
    this.label,
    this.hint,
    this.controller,
  });

  factory AppField.singleLineInput({
    required String label,
    String? hint,
    TextEditingController? controller,
  }) {
    return AppField._(
      type: AppFieldType.singleLineInput,
      label: label,
      hint: hint,
      controller: controller,
    );
  }

  factory AppField.multiLineInput({
    required String label,
    TextEditingController? controller,
  }) {
    return AppField._(
      type: AppFieldType.multiLineInput,
      label: label,
      controller: controller,
    );
  }

  factory AppField.searchInput({
    String? hint,
    TextEditingController? controller,
  }) {
    return AppField._(
      type: AppFieldType.searchInput,
      hint: hint,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppFieldType.singleLineInput:
        return SingleLineInput(
          label: label!,
          hint: hint,
          controller: controller,
        );
      case AppFieldType.multiLineInput:
        return MultiLineInput(
          label: label!,
          controller: controller,
        );
      case AppFieldType.searchInput:
        return SearchInput(
          hint: hint,
          controller: controller,
        );
    }
  }
}