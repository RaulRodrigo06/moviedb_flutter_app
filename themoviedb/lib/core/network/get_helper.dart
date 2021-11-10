import 'package:dio/dio.dart';
import 'package:themoviedb/core/network/network_response.dart';
import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/request_helper.dart';

class GetHelper implements RequestHelper {
  @override
  Future<NetworkResponse> makeRequestHelper({
    required Endpoint endpoint,
    required Dio httpProvider,
  }) async {
    final Response<dynamic> response =
        await httpProvider.get<dynamic>(endpoint.path);
    return NetworkResponse(
      data: response.data,
      status: response.statusCode,
    );
  }
}
