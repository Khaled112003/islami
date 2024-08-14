part of 'dashboardbody_cubit.dart';

sealed class DashboardState extends Equatable {
  final PageController pageController;
  final int currentIndex;

  const DashboardState({required this.pageController, required this.currentIndex});

  @override
  List<Object> get props => [pageController, currentIndex];
}

final class DashboardInitial extends DashboardState {
  DashboardInitial({required PageController pageController, required int currentIndex})
      : super(pageController: pageController, currentIndex: currentIndex);
}
