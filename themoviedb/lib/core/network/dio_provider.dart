import 'package:dio/dio.dart';
import 'package:themoviedb/core/network/dio_creator.dart';
import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/get_helper.dart';
import 'package:themoviedb/core/network/network_provider.dart';
import 'package:themoviedb/core/network/network_response.dart';
import 'package:themoviedb/core/network/request_helper.dart';

class DioProvider implements NetworkProvider {
  Dio? _provider;

  Future<NetworkResponse> _safeRequest({
    required RequestHelper requestHelper,
    required Endpoint endpoint,
  }) async {
    try {
      return await requestHelper.makeRequestHelper(
        endpoint: endpoint,
        httpProvider: _provider ?? await DioCreator.create(),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return NetworkResponse(
          data: e.response?.data,
          status: e.response?.statusCode,
          errorType: e.type,
        );
      } else {
        return NetworkResponse(
          data: null,
          message: e.message,
          status: 520,
          errorType: e.type,
        );
      }
    }
  }

  @override
  Future<NetworkResponse> get({required Endpoint endpoint}) {
    final GetHelper requestHelper = GetHelper();
    return _safeRequest(
      requestHelper: requestHelper,
      endpoint: endpoint,
    );
  }
}
