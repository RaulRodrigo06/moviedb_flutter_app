import 'package:themoviedb/core/response/api_result.dart';

class Success implements ApiResult {
  Success({
    required this.statusCode,
    required this.data,
  });

  final int statusCode;
  final dynamic data;
}
