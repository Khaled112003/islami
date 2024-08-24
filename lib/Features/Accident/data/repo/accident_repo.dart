

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class AccidentRepo {
  final ApiService apiService;

  AccidentRepo(this.apiService);
  Future<Either<Failure, List<AccidentModel>>> fetchHadithByIndex(
      int index) async {
    try {
      var data = await apiService.get(
          url:
              'https://hadithapi.com/public/api/hadiths?page=$index&apiKey=\$2y\$10\$7B0n20A1CApXVyJuIuhruRi7XOvB7iArjApOzKQkzTwrN7BxrFmq&paginate=50');

      
      print('Response Data: $data');

      if (data['hadiths'] != null && data['hadiths']['data'] != null) {
        List<AccidentModel> hadiths = [];

        
        print('Hadiths Data: ${data['hadiths']['data']}');

        for (var element in data['hadiths']['data']) {
          hadiths.add(AccidentModel.fromJson(element));
        }

        return right(hadiths);
      } else {
        return left(ServerFailure("No Hadiths available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
