import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/video/data/videos_model/video_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class VideoRepo {
  final ApiService apiService;

  VideoRepo(this.apiService);

  Future<Either<Failure, List<VideosModel>>> fetchvideo() async {
    try {
      var data = await apiService.get(
          url:
              'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/videos/ar/ar/1/25/json');

      if (data['data'] != null) {
        List<VideosModel> video = [];
        for (var element in data['data']) {
          video.add(VideosModel.fromJson(element));
        }
        return right(video);
      } else {
        return left(ServerFailure("No video available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
