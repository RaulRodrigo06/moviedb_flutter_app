import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/core/response/api_result.dart';
import 'package:themoviedb/core/response/states/api_error/api_error.dart';
import 'package:themoviedb/core/response/states/internal_error.dart';
import 'package:themoviedb/core/response/states/no_internet.dart';

class Erro extends ApiResult {
  Erro({
    this.statusMessage,
    this.statusCode,
  });

  final int? statusCode;
  final String? statusMessage;

  static Erro makeError(ApiResult result) {
    if (result is ApiError) {
      return Erro(
        statusMessage: result.error.statusMessage,
        statusCode: result.statusCode,
      );
    }
    if (result is NoInternet) {
      return Erro(
        statusMessage: Strings.noConnection,
      );
    }

    final InternalError internalError = result as InternalError;
    return Erro(
      statusMessage: internalError.message,
      statusCode: internalError.statusCode,
    );
  }
}
