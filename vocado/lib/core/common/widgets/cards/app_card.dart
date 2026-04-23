import 'package:flutter/material.dart';
import 'task_item_card.dart';
import 'team_member_card.dart';
import 'info_card.dart';

enum AppCardType { taskItem, teamMember, infoCard }

class AppCard extends StatelessWidget {
  final AppCardType type;
  final String? title;
  final String? subtitle;
  final bool? isDone;
  final String? name;

  const AppCard._({
    required this.type,
    this.title,
    this.subtitle,
    this.isDone,
    this.name,
  });

  factory AppCard.taskItem({
    required String title,
    required String subtitle,
    bool isDone = false,
  }) {
    return AppCard._(
      type: AppCardType.taskItem,
      title: title,
      subtitle: subtitle,
      isDone: isDone,
    );
  }

  factory AppCard.teamMember({
    required String name,
  }) {
    return AppCard._(
      type: AppCardType.teamMember,
      name: name,
    );
  }

  factory AppCard.infoCard({
    required String title,
  }) {
    return AppCard._(
      type: AppCardType.infoCard,
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppCardType.taskItem:
        return TaskItemCard(
          title: title!,
          subtitle: subtitle!,
          isDone: isDone ?? false,
        );
      case AppCardType.teamMember:
        return TeamMemberCard(
          name: name!,
        );
      case AppCardType.infoCard:
        return InfoCard(
          title: title!,
        );
    }
  }
}