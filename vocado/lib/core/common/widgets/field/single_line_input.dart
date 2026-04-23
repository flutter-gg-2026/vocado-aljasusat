import 'package:flutter/material.dart';

class SingleLineInput extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;

  const SingleLineInput({
    super.key,
    required this.label,
    this.hint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}