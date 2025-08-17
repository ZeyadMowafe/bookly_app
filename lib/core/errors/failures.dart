import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with apiServer');

      case DioExceptionType.badCertificate:
        throw UnimplementedError();

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Requst to apiServer was cancld');
      case DioExceptionType.connectionError:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure("internetConnection");
        }
        return ServerFailure("No Internet Connection ");
      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an Error , please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic respons) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respons['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your Request Not Found , please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Server error , please try later');
    } else {
      return ServerFailure('Opps there was an Error , please try again');
    }
  }
}
