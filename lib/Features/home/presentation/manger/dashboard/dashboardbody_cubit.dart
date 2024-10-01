import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboardbody_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial(currentIndex: 0));

  void changePage(int index) {
    
    emit(DashboardPageChanged(currentIndex: index));
  }
}
