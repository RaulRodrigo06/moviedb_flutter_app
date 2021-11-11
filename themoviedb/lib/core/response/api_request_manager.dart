import 'package:dio/dio.dart';
import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/response/states/api_result.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';

class ApiRequestManager implements IApiRequestManager, InterceptorsWrapper {
  final Dio dio = Dio();

  ApiRequestManager() {
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(this);
  }

  @override
  Future<ApiResult> getAsync(
    String url,
  ) async {
    try {
      final response = await dio.get(
        url,
      );

      return Future<Success>.value(
        Success(data: response.data, statusCode: response.statusCode),
      );
    } on DioError catch (error) {
      return Future<Erro>.value(
        Erro(
            statusMessage: error.message,
            statusCode: error.response?.statusCode),
      );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.message);
    print(err.response);
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.realUri);
    print('----------------------');
    print(response.statusCode);
    print('----------------------');
    print(response.data);
    handler.next(response);
  }
}
