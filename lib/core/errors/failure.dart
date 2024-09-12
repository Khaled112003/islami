import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassage;

  const Failure(
    this.errorMassage,
  );
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMassage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        // Use null check to avoid errors
        if (dioException.response != null) {
          return ServerFailure.fromResponse(
            dioException.response!.statusCode, 
            dioException.response!.data,
          );
        } else {
          return ServerFailure('Received invalid response from server');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioException.message != null && dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops, there was an error. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // Check if the response structure matches the expected one
    if (response is Map<String, dynamic> && response['error'] != null && response['error']['message'] != null) {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(response['error']['message']);
      } else if (statusCode == 404) {
        return ServerFailure('Your request was not found, Please try later!');
      } else if (statusCode == 500) {
        return ServerFailure('Internal Server error, Please try later');
      } else {
        return ServerFailure('Oops, there was an error. Please try again.');
      }
    } else {
      return ServerFailure('Unexpected response structure.');
    }
  }
}

