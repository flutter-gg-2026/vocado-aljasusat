import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState());

  bool isLogin = true;

  void changeAuthMode(bool value) {
    isLogin = value;
    emit(AuthModeChangedState(isLogin: isLogin));
  }

  Future<void> getAuthMethod() async {
    emit(AuthLoadingState());

    final result = await _authUseCase.getAuth();

    result.when(
      (success) {
        emit(AuthSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  @override
  // ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }
}
