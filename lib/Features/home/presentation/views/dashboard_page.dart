import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';
import 'package:islami/Features/home/presentation/views/widgets/dashboard_body.dart';

class DashoardPage extends StatelessWidget {
  const DashoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PageView(
                controller: state.pageController, 
                onPageChanged: context.read<DashboardCubit>().changepage,
                children: const [
                  DashboardBody(),
                  Text('data')
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: context.read<DashboardCubit>().changepage,
              selectedItemColor: Colors.green,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books_outlined),
                    label: 'library'),
                    BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: 'profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}

