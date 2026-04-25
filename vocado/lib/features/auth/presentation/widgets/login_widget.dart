import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/utils/validators.dart';
import 'package:vocado/core/widgets/app_widget.dart';

class LoginContentWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onTap;

  const LoginContentWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppWidget.input(
          hint: 'Email',
          controller: emailController,
          icon: Icons.email_outlined,
          validator: Validators.validateEmail,
        ),
        Gap(15),
        AppWidget.input(
          hint: 'Password',
          controller: passwordController,
          icon: Icons.lock_outline,
          obscureText: true,
          validator: Validators.validatePassword,
        ),
        const Gap(25),
        AppWidget.button(
          title: 'Log in', 
          onTap: onTap,
          isLoading: isLoading,
        ),
      ],
    );
  }
}