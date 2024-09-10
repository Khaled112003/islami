import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';
import 'package:islami/Features/Accident/data/repo/doaaa_repo.dart';
import 'package:islami/core/utilitis/api_server.dart';
import '../../Features/home/data/repo/implement_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<ImplementionPrayerTimeRepo>(
      ImplementionPrayerTimeRepo(getIt.get<ApiService>()));

  getIt.registerSingleton<AccidentRepo>(AccidentRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<DoaaRepository>(DoaaRepository());
}
