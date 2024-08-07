import 'package:dio/dio.dart';

class ApiService{
  final _baseurl ="https://muslimsalat.com/cairo/";
  final Dio _dio;
  ApiService( this._dio);

  Future<Map<String,dynamic>> get ({required String endpoint})async{
   var response=await _dio.get('$_baseurl$endpoint');
   return response.data;
    
  }
}