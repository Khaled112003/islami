import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';

import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class AccidentRepo {
  final ApiService apiService;

  AccidentRepo(this.apiService);

  Future<Either<Failure, List<AccidentModel>>> fetchAccidents() async {
    try {
      var data = await apiService.get(
          url:
              'https://hadithapi.com/public/api/hadiths?page=1624&apiKey=\$2y\$10\$7B0n20A1CApXVyJuIuhruRi7XOvB7iArjApOzKQkzTwrN7BxrFmq&paginate=50');

      if (data['data'] != null) {
        List<AccidentModel> hades = [];
        for (var element in data['items']) {
          hades.add(AccidentModel.fromJson(element));
        }

        return right(hades);
      } else {
        return left(ServerFailure("No Accident available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
