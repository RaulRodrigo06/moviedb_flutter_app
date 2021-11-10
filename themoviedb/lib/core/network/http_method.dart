import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/network_provider.dart';
import 'package:themoviedb/core/network/network_response.dart';

abstract class HttpMethod {
  Future<NetworkResponse> request({
    required NetworkProvider http,
    required Endpoint endpoint,
  });
}
