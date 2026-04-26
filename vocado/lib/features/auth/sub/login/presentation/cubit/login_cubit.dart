import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/sub/login/domain/use_cases/login_use_case.dart';
import 'package:vocado/features/auth/sub/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  Future<void> getLoginMethod() async {
    final result = await _loginUseCase.getLogin();
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
