import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';
import 'package:islami/Features/Accident/data/repo/doaaa_repo.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/accident.dart';
import 'package:islami/Features/Accident/presentation/views/doaa.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';

import 'package:islami/Features/Quran/presentation/manger/cubit/ayat_cubit.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/Features/Quran/presentation/views/quran-page.dart';
import 'package:islami/Features/Quran/presentation/views/surah-content.dart';

import 'package:islami/Features/Tasbih/presentation/views/Tasbih.dart';
import 'package:islami/Features/audios/data/audio_repo.dart';
import 'package:islami/Features/audios/presentation/manger/audio_cubit.dart';
import 'package:islami/Features/audios/presentation/views/audio.dart';
import 'package:islami/Features/authentication/data/repo/auth_repo.dart';
import 'package:islami/Features/authentication/presntations/manger/login/login_cubit.dart';
import 'package:islami/Features/authentication/presntations/manger/sing_up/sign_up_cubit.dart';
import 'package:islami/Features/authentication/presntations/views/login.dart';
import 'package:islami/Features/authentication/presntations/views/sign_up.dart';
import 'package:islami/Features/forget_pass/presentation/manger/email_verfiy/email_verification_cubit.dart';
import 'package:islami/Features/forget_pass/presentation/views/forger_password_page.dart';
import 'package:islami/Features/home/data/repo/implement_repo.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';
import 'package:islami/Features/home/presentation/views/dashboard_page.dart';
import 'package:islami/Features/libarary/presentation/views/libarary.dart';
import 'package:islami/Features/onboarding/presentation/manger/onbordingcubit.dart';
import 'package:islami/Features/onboarding/presentation/views/onbordingpage.dart';
import 'package:islami/Features/profile/prsentation/views/profile.dart';
import 'package:islami/Features/video/data/repo/video_repo.dart';
import 'package:islami/Features/video/presentation/manger/video/video_cubit.dart';
import 'package:islami/Features/video/presentation/views/video_page.dart';

import 'package:islami/core/utilitis/singleton_pattern.dart';


import '../../Features/forget_pass/data/repo/forget_pass_repo.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/DashboardPage',
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider<PrayerTimeCubit>(
          create: (context) =>
              PrayerTimeCubit(getIt.get<ImplementionPrayerTimeRepo>()),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(),
        ),
        BlocProvider<SurahCubit>(
          create: (context) => SurahCubit(getIt.get<SurahRepo>()),
        ),
      ],
      child: const DashboardPage(),
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
    path: '/QuranPage',
    builder: (context, state) => BlocProvider(
      create: (context) => SurahCubit(getIt.get<SurahRepo>()),
      child: const QuranPage(),
    ),
  ),
  GoRoute(
    path: '/LibararyPage',
    builder: (context, state) => const LibararyPage(),
  ),
  GoRoute(
    path: '/SurahContent',
    builder: (context, state) => BlocProvider(
      create: (context) => AyatCubit(getIt.get<SurahRepo>()),
      child: SurahContent(
        surahModel: state.extra as SurahModel,
      ),
    ),
  ),
  GoRoute(
    path: '/VideoPage',
    builder: (context, state) => BlocProvider(
      create: (context) => VideoCubit(getIt.get<VideoRepo>()),
      child: const VideoPage(),
    ),
  ),
  GoRoute(
    path: '/AudioPage',
    builder: (context, state) => BlocProvider(
      create: (context) => AudioCubit(getIt.get<AudioRepo>()),
      child: const AudioPage(),
    ),
  ),
  GoRoute(
    path: '/Loginpage',
    builder: (context, state) => BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: const Loginpage(),
    ),
  ),
  GoRoute(
    path: '/SignUpPage',
    builder: (context, state) => BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
      child: const SignUpPage(),
    ),
  ),
  GoRoute(
    path: '/ForgerPasswordPage',
    builder: (context, state) => BlocProvider(
      create: (context) => EmailVerificationCubit(getIt.get<ForgetPassRepo>()),
      child: const ForgerPasswordPage(),
    ),
  ),
  GoRoute(
    path: '/ProfilePage',
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) =>  BlocProvider(
      create: (context) => OnboardingCubit(),
      child: OnboardingScreen(),
    ),
  ),
]);
