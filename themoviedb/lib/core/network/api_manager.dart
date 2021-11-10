import 'package:themoviedb/core/network/dio_provider.dart';
import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/network_provider.dart';
import 'package:themoviedb/core/network/network_response.dart';
import 'package:themoviedb/core/response/api_result.dart';
import 'package:themoviedb/core/response/states/api_error/api_error.dart';
import 'package:themoviedb/core/response/states/internal_error.dart';
import 'package:themoviedb/core/response/states/sucess.dart';

class ApiManager {
  static final NetworkProvider _networkProvider = DioProvider();

  static Future<ApiResult> request({
    required Endpoint endpoint,
  }) async {
    try {
      final NetworkResponse response = await endpoint.httpMethod.request(
        http: _networkProvider,
        endpoint: endpoint,
      );

      if (response.status! >= 200 && response.status! <= 400) {
        return Future<Success>.value(
          Success(data: response.data, statusCode: response.status!),
        );
      }

      return Future<ApiError>.value(ApiError(
        statusCode: response.status,
        error: response.data,
      ));
    } catch (_) {
      return InternalError(
        statusCode: 502,
        message: 'Sorry, we had a problem. Please try again later',
      );
    }
  }
}
