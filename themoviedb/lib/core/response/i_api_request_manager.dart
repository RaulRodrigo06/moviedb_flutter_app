import 'package:themoviedb/core/response/states/api_result.dart';

abstract class IApiRequestManager {
  Future<ApiResult> getAsync(
    String url,
  );
}
