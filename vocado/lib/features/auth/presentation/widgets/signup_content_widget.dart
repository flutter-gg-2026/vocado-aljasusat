import 'package:flutter/material.dart';
import 'package:vocado/core/utils/validators.dart';
import 'package:vocado/core/widgets/app_widget.dart';

class SignUpContentWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onTap;
  final bool isLoading;
  const SignUpContentWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppWidget.input(
          hint: 'Full Name',
          controller: nameController,
          icon: Icons.person_outline,
          validator: Validators.validateFullName,
        ),
        AppWidget.input(
          hint: 'Email',
          controller: emailController,
          icon: Icons.email_outlined,
          validator: Validators.validateEmail,
        ),
        AppWidget.input(
          hint: 'Password',
          controller: passwordController,
          icon: Icons.lock_outline,
          obscureText: true,
          validator: Validators.validatePassword,
        ),
        AppWidget.button(title: 'Sign up', onTap: onTap, isLoading: isLoading),
      ],
    );
  }
}
