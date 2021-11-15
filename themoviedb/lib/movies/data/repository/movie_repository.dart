import 'package:dartz/dartz.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/core/mixins/decode_model_mixin.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';
import 'package:themoviedb/movies/data/model/movie_detail_model.dart';
import 'package:themoviedb/movies/data/model/movie_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_video_list_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';

class MovieRepository with DecodeModelMixin implements IMovieRepository {
  final IMovieDatasource datasource;
  MovieRepository({required this.datasource});

  @override
  Future<Either<Erro, MovieListEntity>> getPopularMovieList(
      {required int page}) async {
    final result = await datasource.getMoviesMostPopular(page: page);

    if (result is Success) {
      return tryDecode(() async {
        final movieList = MovieListModel.fromJson(result.data);
        return Right(movieList);
      }, orElse: (dynamic _) {
        return Left(
          Erro(
            statusMessage: Strings.standardErrorMessage,
          ),
        );
      });
    } else {
      return Left(
        Erro(
          statusMessage: result.statusMessage!,
          statusCode: result.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Erro, MovieListEntity>> getTopRatedMovieList(
      {required int page}) async {
    final result = await datasource.getMoviesByRate(page: page);

    if (result is Success) {
      return tryDecode(() async {
        final movieList = MovieListModel.fromJson(result.data);
        return Right(movieList);
      }, orElse: (dynamic _) {
        return Left(
          Erro(
            statusMessage: Strings.standardErrorMessage,
          ),
        );
      });
    } else {
      return Left(
        Erro(
          statusMessage: result.statusMessage!,
          statusCode: result.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Erro, MovieDetailEntity>> getMovieDetails(
      {required int id}) async {
    final result = await datasource.getMovieDetails(id: id);

    if (result is Success) {
      return tryDecode(() async {
        final movieList = MovieDetailModel.fromJson(result.data);
        return Right(movieList);
      }, orElse: (dynamic _) {
        return Left(
          Erro(
            statusMessage: Strings.standardErrorMessage,
          ),
        );
      });
    } else {
      return Left(
        Erro(
          statusMessage: result.statusMessage!,
          statusCode: result.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Erro, MovieVideoListEntity>> getMovieVideo(
      {required int id}) async {
    final result = await datasource.getMovieVideo(id: id);

    if (result is Success) {
      return tryDecode(() async {
        final movieList = MovieVideoListModel.fromJson(result.data);
        return Right(movieList);
      }, orElse: (dynamic _) {
        return Left(
          Erro(
            statusMessage: Strings.standardErrorMessage,
          ),
        );
      });
    } else {
      return Left(
        Erro(
          statusMessage: result.statusMessage!,
          statusCode: result.statusCode,
        ),
      );
    }
  }
}
