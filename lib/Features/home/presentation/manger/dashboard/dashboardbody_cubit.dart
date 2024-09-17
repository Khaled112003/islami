import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'dashboardbody_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(DashboardInitial(
            pageController: PageController(), currentIndex: 0)) { // الصفحة الثانية كبداية

    // ضبط مستمع لتغيير الصفحة
    state.pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final pageIndex = state.pageController.page?.round() ?? 0;
    if (pageIndex != state.currentIndex) {
      emit(DashboardInitial(
          pageController: state.pageController, currentIndex: pageIndex));
    }
  }

  void changepage(int index) {
    final currentState = state;
    if (currentState is DashboardInitial) {
      emit(DashboardInitial(
          pageController: currentState.pageController, currentIndex: index));
      currentState.pageController.jumpToPage(index);
    }
  }
}
