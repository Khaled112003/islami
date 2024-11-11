import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void nextPage() {
    if (state < 2) emit(state + 1);
  }

  void previousPage() {
    if (state > 0) emit(state - 1);
  }

  void skipToEnd() {
    emit(2);
  }
}
