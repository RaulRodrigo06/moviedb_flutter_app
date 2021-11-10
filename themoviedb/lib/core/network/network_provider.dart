import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/network_response.dart';

abstract class NetworkProvider {
  Future<NetworkResponse> get({required Endpoint endpoint});
}
