import 'package:flutter/material.dart';
import 'primary_button.dart';
import 'secondary_button.dart';
import 'icon_action_button.dart';
import 'voice_action_button.dart';

enum AppButtonType { primaryAction, secondaryAction, iconAction, voiceAction }

class AppButton extends StatelessWidget {
  final AppButtonType type;
  final String? text;
  final VoidCallback? onTap;
  final IconData? icon;

  const AppButton._({
    required this.type,
    this.text,
    this.onTap,
    this.icon,
  });

  factory AppButton.primaryAction({
    required String text,
    required VoidCallback onTap,
  }) {
    return AppButton._(
      type: AppButtonType.primaryAction,
      text: text,
      onTap: onTap,
    );
  }

  factory AppButton.secondaryAction({
    required String text,
    required VoidCallback onTap,
  }) {
    return AppButton._(
      type: AppButtonType.secondaryAction,
      text: text,
      onTap: onTap,
    );
  }

  factory AppButton.iconAction({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return AppButton._(
      type: AppButtonType.iconAction,
      icon: icon,
      onTap: onTap,
    );
  }

  factory AppButton.voiceAction({
    required VoidCallback onTap,
  }) {
    return AppButton._(
      type: AppButtonType.voiceAction,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppButtonType.primaryAction:
        return PrimaryButton(
          text: text!,
          onTap: onTap!,
        );
      case AppButtonType.secondaryAction:
        return SecondaryButton(
          text: text!,
          onTap: onTap!,
        );
      case AppButtonType.iconAction:
        return IconActionButton(
          icon: icon!,
          onTap: onTap!,
        );
      case AppButtonType.voiceAction:
        return VoiceActionButton(
          onTap: onTap!,
        );
    }
  }
}