
// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/home/data/model/prayer_time_model/prayer_time_model.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class ImplementionPrayerTimeRepo extends PrayerTimeRepo{
  final ApiService apiService;

  ImplementionPrayerTimeRepo({required this.apiService});
  @override
  Future<Either<Failure, List<PrayerTimeModel>>> fetchPrayerTime() async{
    try {
      var data =await apiService.get(endpoint: 'cairo/daily.json');
      
      List<PrayerTimeModel> Adhan=[];
      for (var element in data['items']) {
        Adhan.add(PrayerTimeModel.fromJson(element));
        
      }
      return right(Adhan);

      
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
      
    }
  }
    
}