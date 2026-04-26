import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/auth/sub/login/presentation/cubit/login_cubit.dart';


class LoginFeatureWidget extends StatelessWidget {
  const LoginFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<LoginCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
