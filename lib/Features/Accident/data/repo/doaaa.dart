

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class DoaaRepo {
  final ApiService apiService;

  DoaaRepo(this.apiService);
  Future<Either<Failure, List<DoaaModel>>> fetchHadithByIndex(
      int index) async {
    try {
      var data = await apiService.get(
          url:
              'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json');

      print('Response Data: ');

      if (data['أدعية قرآنية'] != null ) {
        List<DoaaModel> doaa = [];

        print('doaa Data: ${data['أدعية قرآنية']}');

        for (var element in data['أدعية قرآنية']) {
          doaa.add(DoaaModel.fromJson(element));
        }

        return right(doaa);
      } else {
        return left(ServerFailure("No doaa available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
