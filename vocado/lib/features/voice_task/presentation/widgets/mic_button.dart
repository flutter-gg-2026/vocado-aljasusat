import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
        ),
      ),
      child: const Icon(Icons.mic, color: Colors.black, size: 35),
    );
  }
}
