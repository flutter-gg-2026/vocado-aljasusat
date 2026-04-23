import 'package:flutter/material.dart';

class IconActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        child: Icon(icon),
      ),
    );
  }
}