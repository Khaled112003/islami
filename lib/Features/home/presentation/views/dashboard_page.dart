import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/views/quran-page.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';
import 'package:islami/Features/home/presentation/views/widgets/dashboard_body.dart';
import 'package:islami/Features/libarary/presentation/views/libarary.dart';
import 'package:islami/core/constant/my_color.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          final List<Widget> pages = [
            const DashboardBody(),
            const QuranPage(),
            LibararyPage()
          ];

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: pages[state.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Mycolors.green,
              currentIndex: state.currentIndex,
              onTap: (index) {
                context.read<DashboardCubit>().changePage(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.book), label: "Qur'an"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.square_grid_2x2), label: 'More'),
              ],
            ),
          );
        },
      ),
    );
  }
}
