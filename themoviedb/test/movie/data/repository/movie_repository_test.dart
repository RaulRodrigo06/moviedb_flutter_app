import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';
import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/data/model/movie_detail_model.dart';
import 'package:themoviedb/movies/data/model/movie_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/data/model/movie_video_model.dart';
import 'package:themoviedb/movies/data/repository/movie_repository.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';

import '../../../mocks/list_movie_mock.dart';
import '../../../mocks/movie_detail_mock.dart';
import '../../../mocks/movie_video_mock.dart';

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

  const tMovieVideo = MovieVideoModel(
    key: 'XK-MIqHz5tU',
    type: 'Clip',
    title: 'VENOM: LET THERE BE CARNAGE - Burj Khalifa Takeover',
  );
  const tGenres = [
    GenresModel(
      id: 878,
      genre: 'Science Fiction',
    ),
    GenresModel(
      id: 28,
      genre: 'Action',
    ),
    GenresModel(
      id: 12,
      genre: 'Adventure',
    )
  ];
  const tMovieDetail = MovieDetailModel(
    tagline: '',
    overview:
        'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
    genresEntity: tGenres,
    movieVideo: '',
    posterPath: '/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
    originalTitle: 'Venom: Let There Be Carnage',
  );
  test('Return a list of MovieListEntity', () async {
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

  test('Return a list of MovieVideoEntity', () async {
    when(
      () => datasource.getMovieVideo(
        id: 1,
      ),
    ).thenAnswer(
      (_) async => (Future<Success>.value(
        Future<Success>.value(
          Success(
            data: jsonDecode(tMovieVideoMock),
            statusCode: 200,
          ),
        ),
      )),
    );

    final result = await repository.getPopularMovieList(page: 1);
    expect(result, const Right(tMovieVideo));
    verify(() => datasource.getMoviesMostPopular(page: 1)).called(1);
  });

  test('Return a list of MovieDetailEntity', () async {
    when(
      () => datasource.getMovieDetails(
        id: 1,
      ),
    ).thenAnswer(
      (_) async => (Future<Success>.value(
        Future<Success>.value(
          Success(
            data: jsonDecode(tMovieDetailMock),
            statusCode: 200,
          ),
        ),
      )),
    );

    final result = await repository.getPopularMovieList(page: 1);
    expect(result, const Right(tMovieDetail));
    verify(() => datasource.getMoviesMostPopular(page: 1)).called(1);
  });

  test('Throw exception', () async {
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
