import 'package:themoviedb/core/network/http_method.dart';

class Endpoint {
  Endpoint({
    required this.path,
    required this.httpMethod,
  });
  final String path;
  final HttpMethod httpMethod;
}
