import 'package:themoviedb/core/response/states/api_result.dart';

class Success implements ApiResult {
  Success({
    this.statusCode,
    this.statusMessage,
    required this.data,
  });
  @override
  final int? statusCode;
  final dynamic data;
  @override
  final String? statusMessage;
}
