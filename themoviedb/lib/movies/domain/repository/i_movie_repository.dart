import 'package:dartz/dartz.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';

abstract class IMovieRepository {
  Future<Either<Erro, MovieListEntity>> getPopularMovieList(
      {required int page});
  Future<Either<Erro, MovieListEntity>> getTopRatedMovieList(
      {required int page});
}
