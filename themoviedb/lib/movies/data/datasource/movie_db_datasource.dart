import 'package:themoviedb/core/network/api_manager.dart';
import 'package:themoviedb/core/network/endpoint.dart';
import 'package:themoviedb/core/network/get.dart';
import 'package:themoviedb/core/response/api_result.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_db_datasource.dart';

class MovieDbDatasource implements IMovieDbDatasource {
  String _urlMoviesMostPopular({required int page}) {
    return 'https://api.themoviedb.org/3/movie/popular?api_key=8e1f3490365a847b0355d560842ce17e&language=en-US&page=$page';
  }

  String _urlMoviesByRate({required int page}) {
    return 'https://api.themoviedb.org/3/movie/top_rated?api_key=8e1f3490365a847b0355d560842ce17e&language=en-US&page=$page';
  }

  @override
  Future<ApiResult> getMoviesMostPopular({required int page}) async {
    final endpoint = Endpoint(
      path: _urlMoviesMostPopular(page: page),
      httpMethod: Get(),
    );

    return await ApiManager.request(endpoint: endpoint);
  }

  @override
  Future<ApiResult> getMoviesByRate({required int page}) async {
    final endpoint = Endpoint(
      path: _urlMoviesByRate(page: page),
      httpMethod: Get(),
    );

    return await ApiManager.request(endpoint: endpoint);
  }
}
