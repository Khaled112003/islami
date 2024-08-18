import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

import '../model/prayer_time_model/prayer_time_model.dart';

class ImplementionPrayerTimeRepo extends PrayerTimeRepo {
  final ApiService apiService;

  ImplementionPrayerTimeRepo(this.apiService);

  @override
  Future<Either<Failure, List<PrayerTimeModel>>> fetchPrayerTime() async {
    try {
      var data = await apiService.get(endpoint: 'cairo/daily/true.json');

      // print("API Response: $data");

      if (data['items'] != null) {
        print(' dljndlkjdl  ${data['items'][0]}');
        List <PrayerTimeModel> adhan=[];
        for (var element in data['items'] ) {
          adhan.add(PrayerTimeModel.fromJson(element));
          
        }
        
        print(adhan[0].asr);
        return right(adhan);
      } else {
        return left(ServerFailure("No prayer times available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
