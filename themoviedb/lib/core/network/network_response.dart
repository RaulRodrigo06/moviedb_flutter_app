import 'package:dio/dio.dart';

class NetworkResponse {
  NetworkResponse({
    required this.data,
    this.status,
    this.message,
    this.errorType,
  });
  final dynamic data;
  final int? status;
  final String? message;
  final DioErrorType? errorType;
}
