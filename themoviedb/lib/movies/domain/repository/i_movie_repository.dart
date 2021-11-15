import 'package:dartz/dartz.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';

abstract class IMovieRepository {
  Future<Either<Erro, MovieListEntity>> getPopularMovieList(
      {required int page});
  Future<Either<Erro, MovieListEntity>> getTopRatedMovieList(
      {required int page});
      Future<Either<Erro, MovieDetailEntity>> getMovieDetails(
      {required int id});
      Future<Either<Erro, MovieVideoListEntity>> getMovieVideo(
      {required int id});
}
