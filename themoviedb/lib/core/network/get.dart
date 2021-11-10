import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/http_method.dart';
import 'package:themoviedb/core/network/network_response.dart';
import 'package:themoviedb/core/network/network_provider.dart';

class Get implements HttpMethod {
  @override
  Future<NetworkResponse> request(
      {required NetworkProvider http, required Endpoint endpoint}) {
    return http.get(endpoint: endpoint);
  }
}
