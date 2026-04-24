import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/domain/use_cases/login_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthCubit(this._loginUseCase) : super(AuthInitialState());

  bool isLogin = true;

  void changeAuthMode(bool value) {
    isLogin = value;
    emit(AuthModeChangedState(isLogin: isLogin));
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    final result = await _loginUseCase.login(email: email, password: password);

    result.when(
      (user) => emit(AuthSuccessState()),
      (failure) => emit(AuthErrorState(message: failure.message)),
    );
  }

  @override
  // ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }
}
