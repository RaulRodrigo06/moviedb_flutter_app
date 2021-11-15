import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/response/states/api_result.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';

class MovieDatasource implements IMovieDatasource {
  MovieDatasource({required this.iApiRequestManager});
  final IApiRequestManager iApiRequestManager;

  String _urlMoviesMostPopular({required int page}) {
    return 'https://api.themoviedb.org/3/movie/popular?api_key=8d61230b01928fe55a53a48a41dc839b&language=en-US&page=$page';
  }

  String _urlMoviesByRate({required int page}) {
    return 'https://api.themoviedb.org/3/movie/top_rated?api_key=8d61230b01928fe55a53a48a41dc839b&language=en-US&page=$page';
  }

  String _urlMoviesDetailed({required int id}) {
    return 'https://api.themoviedb.org/3/movie/$id?api_key=8d61230b01928fe55a53a48a41dc839b&language=en-USh';
  }

  String _urlMoviesVideo({required int id}) {
    return 'https://api.themoviedb.org/3/movie/$id/videos?api_key=8d61230b01928fe55a53a48a41dc839b&language=en-US';
  }

  @override
  Future<ApiResult> getMoviesMostPopular({required int page}) async {
    return await iApiRequestManager.getAsync(
      _urlMoviesMostPopular(
        page: page,
      ),
    );
  }

  @override
  Future<ApiResult> getMoviesByRate({required int page}) async {
    return await iApiRequestManager.getAsync(
      _urlMoviesByRate(
        page: page,
      ),
    );
  }

  @override
  Future<ApiResult> getMovieDetails({required int id}) async {
    return await iApiRequestManager.getAsync(
      _urlMoviesDetailed(
        id: id,
      ),
    );
  }

  @override
  Future<ApiResult> getMovieVideo({required int id}) async {
    return await iApiRequestManager.getAsync(
      _urlMoviesVideo(
        id: id,
      ),
    );
  }
}
