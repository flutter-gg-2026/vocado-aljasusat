import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/sub/sign/domain/use_cases/sign_use_case.dart';
import 'package:vocado/features/auth/sub/sign/presentation/cubit/sign_state.dart';

class SignCubit extends Cubit<SignState> {
  final SignUseCase _signUseCase;

  SignCubit(this._signUseCase) : super(SignInitialState());

  Future<void> getSignMethod() async {
    final result = await _signUseCase.getSign();
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
