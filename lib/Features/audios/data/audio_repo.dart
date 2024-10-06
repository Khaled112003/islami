import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/Features/audios/data/model/audio_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/utilitis/api_server.dart';

class AudioRepo {
  final ApiService apiService;

  AudioRepo(this.apiService);
  Future<Either<Failure, List<AudioModel>>> fetchAudio() async {
    try {
      var data = await apiService.get(
          url: 'https://mp3quran.net/api/v3/radios?language=ar');
 print(data);
      if (data['radios'] != null) {
        print(data['radios']);
        List<AudioModel> audio = [];

        for (var element in data['radios']) {
          audio.add(AudioModel.fromJson(element));
        }

        return right(audio);
      } else {
        return left(ServerFailure("No surah available"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }}