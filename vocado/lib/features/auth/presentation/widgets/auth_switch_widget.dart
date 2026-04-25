import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/features/auth/presentation/widgets/auth_tab_item.dart';

class AuthSwitchWidget extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;

  const AuthSwitchWidget({
    super.key,
    required this.isLogin,
    required this.onLoginTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: AuthTabItem(
              title: 'Log In',
              isSelected: isLogin,
              onTap: onLoginTap,
            ),
          ),
          Expanded(
            child: AuthTabItem(
              title: 'Sign Up',
              isSelected: !isLogin,
              onTap: onSignUpTap,
            ),
          ),
        ],
      ),
    );
  }
}
