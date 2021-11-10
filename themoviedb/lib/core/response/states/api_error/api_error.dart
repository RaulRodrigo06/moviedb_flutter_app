import 'package:themoviedb/core/response/api_result.dart';
import 'package:themoviedb/core/response/states/api_error/map_api_error.dart';

class ApiError implements ApiResult {
  ApiError({
    required this.error,
    this.statusCode,
    this.path,
  });
  final int? statusCode;
  final MapApiError error;
  final String? path;
}
