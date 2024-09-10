import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class SurahRepo {
  final ApiService apiService;

  SurahRepo(this.apiService);
  Future<Either<Failure, List<SurahModel>>> fetchSurah() async {
    try {
      var data = await apiService.get(
          url: 'http://api.alquran.cloud/v1/quran/quran-uthmani');

      if (data['data']['surahs'] != null) {
        List<SurahModel> surah = [];

        for (var element in data['data']['surahs']) {
          surah.add(SurahModel.fromJson(element));
        }

        return right(surah);
      } else {
        return left(ServerFailure("No surah available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
