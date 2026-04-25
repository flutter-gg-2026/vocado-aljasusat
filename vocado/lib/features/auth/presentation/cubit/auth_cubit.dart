import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/auth/domain/use_cases/login_use_case.dart';
import 'package:vocado/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthCubit(this._loginUseCase, this._signUpUseCase)
    : super(AuthInitialState());

  bool isLogin = true;

  void changeAuthMode(bool value) {
    isLogin = value;
    emit(AuthModeChangedState(isLogin: isLogin));
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    final result = await _loginUseCase.login(email: email, password: password);

    result.when(
      (user) => emit(AuthSuccessState(role: user.role)),
      (failure) => emit(AuthErrorState(message: failure.message)),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoadingState());

    final result = await _signUpUseCase.signUp(
      email: email,
      password: password,
      name: name,
    );

    result.when(
      (user) {
        emit(AuthSuccessState(role: user.role));
      },
      (failure) {
        emit(AuthErrorState(message: failure.message));
      },
    );
  }

  @override
  // ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }
}
