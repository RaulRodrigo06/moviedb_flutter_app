import 'package:themoviedb/core/response/states/api_result.dart';

abstract class IMovieDatasource {
  Future<ApiResult> getMoviesMostPopular({required int page});
  Future<ApiResult> getMoviesByRate({required int page});
  Future<ApiResult> getMovieDetails({required int id});
  Future<ApiResult> getMovieVideo({required int id});
}
