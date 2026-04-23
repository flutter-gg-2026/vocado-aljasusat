import 'package:flutter/material.dart';
import 'package:vocado/core/widgets/app_widget.dart';

class SignUpContentWidget extends StatelessWidget {
  const SignUpContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppWidget.input(hint: 'Full Name', icon: Icons.person_outline),
        AppWidget.input(hint: 'Email', icon: Icons.email_outlined),
        AppWidget.input(
          hint: 'Password',
          icon: Icons.lock_outline,
          obscureText: true,
        ),
        AppWidget.input(
          hint: 'Confirm Password',
          icon: Icons.lock_outline,
          obscureText: true,
        ),

        AppWidget.button(title: 'Sign up', onTap: () {}),
      ],
    );
  }
}
