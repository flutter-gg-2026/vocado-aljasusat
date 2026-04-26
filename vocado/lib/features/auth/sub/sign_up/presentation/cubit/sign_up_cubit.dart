import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/sub/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:vocado/features/auth/sub/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitialState());

  Future<void> getSignUpMethod() async {
    final result = await _signUpUseCase.getSignUp();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
