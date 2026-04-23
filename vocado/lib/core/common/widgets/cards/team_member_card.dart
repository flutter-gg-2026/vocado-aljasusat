import 'package:flutter/material.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;

  const TeamMemberCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}