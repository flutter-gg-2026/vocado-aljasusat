import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:vocado/features/auth/presentation/widgets/login_widget.dart';
import 'package:vocado/features/auth/presentation/widgets/signup_content_widget.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = useState(true);

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.sw,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.backgroundGradient,
            begin: .bottomLeft,
            end: .topRight,
            stops: [0.0, 0.35, 0.7, 1.0],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: .bottomLeft,
              radius: 2,
              colors: [
                Color.fromARGB(255, 252, 255, 61).withValues(alpha: 0.15),
                Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: GlassContainer.frostedGlass(
              width: 85.sw,
              height: 50.h,
              padding: EdgeInsets.all(20),
              borderRadius: BorderRadius.circular(24),
              blur: 15,
              borderColor: Colors.white.withValues(alpha: 0.2),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  AuthSwitchWidget(
                    isLogin: isLogin.value,
                    onLoginTap: () {
                      isLogin.value = true;
                    },
                    onSignUpTap: () {
                      isLogin.value = false;
                    },
                  ),
                  Gap(20),
                  Text(
                    isLogin.value ? 'Welcome Back' : 'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  Text(
                    isLogin.value
                        ? 'Log in to continue'
                        : 'Sign up to create your account',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: isLogin.value
                          ? LoginContentWidget()
                          : SignUpContentWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
