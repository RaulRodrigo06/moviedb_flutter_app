import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/response/states/api_result.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';

class ApiRequestManager implements IApiRequestManager, InterceptorsWrapper {
  final Dio dio = Dio();

  ApiRequestManager() {
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(this);
  }

  @override
  Future<ApiResult> getAsync(
    String url,
  ) async {
    try {
      final response = await dio.get(
        url,
      );

      return Future<Success>.value(
        Success(data: response.data, statusCode: response.statusCode),
      );
    } on DioError catch (error) {
      if (error.error is SocketException) {
        return Future<Erro>.value(
          Erro(
            statusMessage: Strings.noConnection,
            statusCode: 400,
          ),
        );
      }
      return Future<Erro>.value(
        Erro(
            statusMessage: error.message,
            statusCode: error.response?.statusCode),
      );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message.toString());
    debugPrint(err.response.toString());
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('${response.realUri}');
    debugPrint('----------------------');
    debugPrint('${response.statusCode}');
    debugPrint('----------------------');
    debugPrint(response.data.toString());
    handler.next(response);
  }
}
