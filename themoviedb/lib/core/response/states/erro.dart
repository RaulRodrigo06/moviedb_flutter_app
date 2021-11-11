import 'package:themoviedb/core/response/states/api_result.dart';

class Erro implements ApiResult {
  Erro({
    required this.statusMessage,
    this.statusCode,
  });
  @override
  final String statusMessage;
  @override
  final int? statusCode;
}
