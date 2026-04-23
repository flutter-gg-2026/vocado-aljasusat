import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';


class SignUpFeatureWidget extends StatelessWidget {
  const SignUpFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<SignUpCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
