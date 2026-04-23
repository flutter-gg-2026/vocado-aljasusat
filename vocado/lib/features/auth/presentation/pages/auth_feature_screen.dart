import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_color.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/sub/login/presentation/pages/login_feature_widget.dart';

class AuthFeatureScreen extends StatelessWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<AuthCubit>();

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
          child: Column(
            spacing: 20,
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: AnyImageView(imagePath: 'assets/images/bg.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: .centerStart,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: AppColors.textMain, fontSize: 45),
                      children: <TextSpan>[
                        TextSpan(text: 'Transform\nyour '),
                        TextSpan(
                          text: 'voice',
                          style: TextStyle(fontWeight: .bold),
                        ),
                        TextSpan(text: ' into productive '),
                        TextSpan(
                          text: 'action.',
                          style: TextStyle(fontWeight: .bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginFeatureWidget(),
                    ),
                  );
                },
                child: Container(
                  height: 20.h,
                  width: 20.sw,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: AppColors.textMain,
                  ),
                  child: Icon(Icons.arrow_forward, size: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
