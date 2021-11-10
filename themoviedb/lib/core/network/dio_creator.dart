import 'package:dio/dio.dart';

class DioCreator {
  static Future<Dio> create() async {
    int _milliseconds = 1000;
    int _timeOutDuration = 30;
    final Dio dioCreator = Dio()
      ..options.connectTimeout = _timeOutDuration * _milliseconds
      ..options.receiveTimeout = _timeOutDuration * _milliseconds;
    return dioCreator;
  }
}
