import 'package:dio/dio.dart';
import 'package:themoviedb/core/response/api_result.dart';

class InternalError implements ApiResult {
  InternalError({
    required this.statusCode,
    this.message,
    this.typeError,
  });
  final int statusCode;
  final String? message;
  final DioErrorType? typeError;
}
