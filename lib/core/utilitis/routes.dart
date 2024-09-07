import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';
import 'package:islami/Features/Accident/data/repo/doaaa_repo.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/accident.dart';
import 'package:islami/Features/Accident/presentation/views/doaa.dart';

import 'package:islami/Features/Tasbih/presentation/views/Tasbih.dart';
import 'package:islami/Features/home/data/repo/implement_repo.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';
import 'package:islami/Features/home/presentation/views/dashboard_page.dart';
import 'package:islami/Features/libarary/presentation/views/quran-page.dart';

import 'package:islami/core/utilitis/singleton_pattern.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider(
      create: (context) =>
          PrayerTimeCubit(getIt.get<ImplementionPrayerTimeRepo>()),
      child: const DashoardPage(),
    ),
  ),
  GoRoute(
    path: '/Tasbih',
    builder: (context, state) => const Tasbih(),
  ),
  GoRoute(
    path: '/Accident',
    builder: (context, state) => BlocProvider(
      create: (context) => AccidentCubit(getIt.get<AccidentRepo>()),
      child: const Accident(),
    ),
  ),
  GoRoute(
    path: '/Doaa',
    builder: (context, state) => BlocProvider(
      create: (context) => DoaaCubit(getIt.get<DoaaRepository>()),
      child: const Doaa(),
    ),
  ),
   GoRoute(
      path: '/QuranPage', // Adjusted path to match '/QuranPge' in your navigation
      builder: (context, state) =>const QuranPage(),
    ),
]);
