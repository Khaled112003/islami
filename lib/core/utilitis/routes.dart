import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/home/data/repo/implement_repo.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';
import 'package:islami/Features/home/presentation/views/dashboard_page.dart';
import 'package:islami/core/utilitis/singleton_pattern.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => PrayerTimeCubit(getIt.get<ImplementionPrayerTimeRepo>()),
        child: const DashoardPage(),
      ),
    ),
  ],
);
