import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;

  const SearchInput({
    super.key,
    this.hint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint ?? "Search...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}