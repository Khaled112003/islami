import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';
import 'package:islami/Features/Accident/data/repo/doaaa_repo.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';
import 'package:islami/Features/audios/data/audio_repo.dart';
import 'package:islami/Features/authentication/data/repo/auth_repo.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';
import 'package:islami/Features/video/data/repo/video_repo.dart';
import 'package:islami/core/utilitis/api_server.dart';
import '../../Features/forget_pass/data/repo/forget_pass_repo.dart';
import '../../Features/home/data/repo/implement_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<ImplementionPrayerTimeRepo>(
      ImplementionPrayerTimeRepo(getIt.get<ApiService>()));

  getIt.registerSingleton<AccidentRepo>(AccidentRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<DoaaRepository>(DoaaRepository());
  getIt.registerSingleton<SurahRepo>(SurahRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<VideoRepo>(VideoRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<AudioRepo>(AudioRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<AuthRepo>(AuthRepo());
  getIt.registerSingleton<ForgetPassRepo>(ForgetPassRepo());
  getIt.registerSingleton<ProfileRepo>(ProfileRepo());
}
