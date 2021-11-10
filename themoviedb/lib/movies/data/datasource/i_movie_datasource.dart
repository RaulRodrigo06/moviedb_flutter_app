import 'package:themoviedb/core/response/api_result.dart';

abstract class IMovieDatasource {
  Future<ApiResult> getMoviesMostPopular({required int page});
  Future<ApiResult> getMoviesByRate({required int page});
}
