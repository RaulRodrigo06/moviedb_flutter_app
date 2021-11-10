import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:themoviedb/core/network/internet_connection_checker.dart';
import 'package:themoviedb/core/network/network_error_observable.dart';
import 'package:themoviedb/core/network/network_error_type.dart';

class CheckConnectionInterceptor extends Interceptor {
  CheckConnectionInterceptor({
    required this.dio,
    required this.connectionChecker,
  });

  final Dio dio;
  final InternetConnectionChecker connectionChecker;

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.error != null) {
      if (err.error is SocketException) {
        if (!await connectionChecker.isConnected()) {
          NetworkErrorObserver.instance
              .criarNotificacao(errorType: NetworkErrorType.noConnection);
        }
      }
      if (err.response?.statusCode == 404) {
        NetworkErrorObserver.instance
            .criarNotificacao(errorType: NetworkErrorType.notfound);
      }
    }
    return err;
  }
}
