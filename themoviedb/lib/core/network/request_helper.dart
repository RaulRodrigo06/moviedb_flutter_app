import 'package:dio/dio.dart';
import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/network_response.dart';

abstract class RequestHelper {
  Future<NetworkResponse> makeRequestHelper({
    required Endpoint endpoint,
    required Dio httpProvider,
  });
}
