import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';
import 'package:vocado/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:vocado/features/auth/presentation/widgets/login_widget.dart';
import 'package:vocado/features/auth/presentation/widgets/signup_content_widget.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = useState(true);
    final cubit = context.read<AuthCubit>();

    final emailLoginController = useTextEditingController(
      text: 'amaal0088@gmail.com',
    );
    final passwordLoginController = useTextEditingController(
      text: 'Amaal0852@',
    );

// amaal0088@gmail.com
// Amaal0852@

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      body: BgContainer(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              if (state.role == 'admin') {
                context.go(Routes.bottomNav);
              } else {
                context.go(Routes.taskViewer);
              }
            }
            if (state is AuthErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoadingState;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  key: formKey,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: SizedBox(
                      width: 85.sw,
                      child: GlassContainer.frostedGlass(
                        width: 85.sw,
                        height: isLogin.value ? 48.h : 55.h,
                        padding: const EdgeInsets.all(20),
                        borderRadius: BorderRadius.circular(24),
                        blur: 15,
                        borderColor: AppColors.textMain.withValues(alpha: 0.2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthSwitchWidget(
                              isLogin: isLogin.value,
                              onLoginTap: () => isLogin.value = true,
                              onSignUpTap: () => isLogin.value = false,
                            ),
                            const Gap(20),

                            Text(
                              isLogin.value ? 'Welcome Back' : 'Create Account',
                              style: TextStyle(
                                color: AppColors.textMain,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const Gap(10),

                            Text(
                              isLogin.value
                                  ? 'Log in to continue'
                                  : 'Sign up to create your account',
                              style: TextStyle(
                                color: AppColors.textMain.withValues(
                                  alpha: 0.7,
                                ),
                                fontSize: 14,
                              ),
                            ),

                            const Gap(25),

                            if (isLogin.value)
                              LoginContentWidget(
                                emailController: emailLoginController,
                                passwordController: passwordLoginController,
                                isLoading: isLoading,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(
                                      email: emailLoginController.text.trim(),
                                      password: passwordLoginController.text
                                          .trim(),
                                    );
                                  }
                                },
                              )
                            else
                              SignUpContentWidget(
                                nameController: nameController,
                                emailController: emailController,
                                passwordController: passwordController,
                                isLoading: isLoading,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.signUp(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
