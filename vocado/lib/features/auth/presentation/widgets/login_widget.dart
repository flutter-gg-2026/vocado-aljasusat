import 'package:flutter/material.dart';
import 'package:vocado/core/widgets/app_widget.dart';

class LoginContentWidget extends StatelessWidget {
  const LoginContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppWidget.input(hint: 'Email', icon: Icons.email_outlined),

        AppWidget.input(
          hint: 'Password',
          icon: Icons.lock_outline,
          obscureText: true,
        ),
        AppWidget.button(title: 'Log in', onTap: () {}),
      ],
    );
  }
}
