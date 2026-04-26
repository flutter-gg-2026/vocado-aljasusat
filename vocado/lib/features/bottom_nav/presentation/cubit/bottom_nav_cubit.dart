import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/bottom_nav/domain/use_cases/bottom_nav_use_case.dart';
import 'package:vocado/features/bottom_nav/presentation/cubit/bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  final BottomNavUseCase _bottomNavUseCase;

  BottomNavCubit(this._bottomNavUseCase) : super(BottomNavChangedState(0));

  void changePage(int index) {
    emit(BottomNavChangedState(index));
  }

  Future<void> getBottomNavMethod() async {
    emit(BottomNavLoadingState());

    final result = await _bottomNavUseCase.getBottomNav();

    result.when(
      (success) {
        emit(BottomNavChangedState(0));
      },
      (whenError) {
        emit(BottomNavErrorState(message: whenError.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}