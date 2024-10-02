part of 'dashboardbody_cubit.dart';

abstract class DashboardState extends Equatable {
  final int currentIndex;

  const DashboardState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class DashboardInitial extends DashboardState {
  DashboardInitial({required int currentIndex})
      : super(currentIndex: currentIndex);
}

class DashboardPageChanged extends DashboardState {
  DashboardPageChanged({required int currentIndex})
      : super(currentIndex: currentIndex);
}
