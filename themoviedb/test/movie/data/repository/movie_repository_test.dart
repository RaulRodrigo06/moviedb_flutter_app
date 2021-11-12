import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';
import 'package:themoviedb/movies/data/model/movie_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/data/repository/movie_repository.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';

import '../../../mocks/list_movie_mock.dart';

class MockStarWarsDatasource extends Mock implements IMovieDatasource {}

void main() {
  late MovieRepository repository;
  late IMovieDatasource datasource;
  setUp(() {
    datasource = MockStarWarsDatasource();
    repository = MovieRepository(datasource: datasource);
  });
  const tMovieModel = MovieModel(
    id: 631843,
    originalTitle: 'Old',
    posterPath: '/vclShucpUmPhdAOmKgf3B3Z4POD.jpg',
    overview: 'A group of families.',
    releaseDate: '2021-07-21',
    voteAverage: 6.7,
  );
  const tMovieListModel = MovieListModel(
    movieList: [tMovieModel],
    pageNumber: 4,
    totalPages: 500,
  );
  test('Retorna uma lista de MovieEntity', () async {
    when(
      () => datasource.getMoviesMostPopular(
        page: 1,
      ),
    ).thenAnswer(
      (_) async => (Future<Success>.value(
        Future<Success>.value(
          Success(
            data: jsonDecode(tListMovieMock),
            statusCode: 200,
          ),
        ),
      )),
    );

    final result = await repository.getPopularMovieList(page: 1);
    expect(result, const Right(tMovieListModel));
    verify(() => datasource.getMoviesMostPopular(page: 1)).called(1);
  });

  test('Retorna um exception', () async {
    when(() => datasource.getMoviesMostPopular(page: 1)).thenAnswer(
      (_) => Future<Erro>.value(
        Erro(
          statusMessage: '',
          statusCode: 400,
        ),
      ),
    );
    final result = await repository.getPopularMovieList(page: 1);
    expect(result, isA<Left<Erro, MovieListEntity>>());
    verify(() => datasource.getMoviesMostPopular(page: 1)).called(1);
  });
}
