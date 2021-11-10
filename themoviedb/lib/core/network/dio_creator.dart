import 'package:dio/dio.dart';
import 'package:themoviedb/core/network/check_connection_interceptor.dart';
import 'package:themoviedb/core/network/internet_connection_checker.dart';

class DioCreator {
  static Future<Dio> create() async {
    int _milliseconds = 1000;
    int _timeOutDuration = 30;
    final Dio dioCreator = Dio()
      ..options.connectTimeout = _timeOutDuration * _milliseconds
      ..options.receiveTimeout = _timeOutDuration * _milliseconds;

    dioCreator.interceptors.add(
      CheckConnectionInterceptor(
        dio: dioCreator,
        connectionChecker: InternetConnectionCheckerImpl(),
      ),
    );
    return dioCreator;
  }
}
