import 'package:flutter/material.dart';

enum AppAvatarType { user, group }

class AppAvatar extends StatelessWidget {
  final AppAvatarType type;
  final String? name;

  const AppAvatar._({
    required this.type,
    this.name,
  });

  factory AppAvatar.user({String? name}) {
    return AppAvatar._(
      type: AppAvatarType.user,
      name: name,
    );
  }

  factory AppAvatar.group() {
    return const AppAvatar._(
      type: AppAvatarType.group,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppAvatarType.user:
        return CircleAvatar(
          child: Text(name != null ? name![0] : "U"),
        );
      case AppAvatarType.group:
        return const CircleAvatar(
          child: Icon(Icons.group),
        );
    }
  }
}