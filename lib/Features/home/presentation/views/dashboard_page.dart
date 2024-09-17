import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/views/quran-page.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';
import 'package:islami/Features/home/presentation/views/widgets/dashboard_body.dart';
import 'package:islami/Features/libarary/presentation/views/libarary.dart';
import 'package:islami/core/constant/my_color.dart';

class DashoardPage extends StatelessWidget {
  const DashoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
           
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PageView(
              controller: state.pageController,
              onPageChanged: (index) => context.read<DashboardCubit>().changepage(index),
              children: const [
                DashboardBody(),
                QuranPage(),
                LibararyPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) => context.read<DashboardCubit>().changepage(index),
            selectedItemColor: Colors.green,
            backgroundColor: Mycolors.myWhite,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_outlined), label: 'library'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: 'profile'),
            ],
          ),
        );
      },
    );
  }
}
