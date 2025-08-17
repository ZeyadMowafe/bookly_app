// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiServive {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiServive(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var reuslt = await _dio.get('$_baseUrl$endpoint');

    return reuslt.data;
  }
}
