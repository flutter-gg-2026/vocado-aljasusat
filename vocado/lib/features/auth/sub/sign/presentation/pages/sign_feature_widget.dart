import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/features/auth/sub/sign/presentation/cubit/sign_cubit.dart';

class SignFeatureWidget extends StatelessWidget {
  const SignFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<SignCubit>();
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
                child: GlassContainer.frostedGlass(
                  width: 80.sw,
                  height: 50.h,
                  padding: EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
