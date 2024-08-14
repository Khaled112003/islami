import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboardbody_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
}
