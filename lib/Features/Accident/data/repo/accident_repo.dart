import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class AccidentRepo {
  final ApiService apiService;

  AccidentRepo(this.apiService);

  Future<Either<Failure, List<AccidentModel>>> fetchHadithByIndex(int index) async {
    try {
      var data = await apiService.get(
          url:
              'https://hadithapi.com/public/api/hadiths?page=$index&apiKey=\$2y\$10\$7B0n20A1CApXVyJuIuhruRi7XOvB7iArjApOzKQkzTwrN7BxrFmq');

      if (data['data'] != null) {
        List<AccidentModel> hadiths = [];
        for (var element in data['items']) {
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
