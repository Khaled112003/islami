import 'package:dio/dio.dart';

class ApiService {
  final _baseurl = "https://muslimsalat.com/";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String url,
  }) async {
    var response = await _dio.get('$url');
    return response.data;
  }
}
