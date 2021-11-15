import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/data/model/movie_detail_model.dart';
import 'package:themoviedb/movies/data/model/movie_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/data/model/movie_video_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_video_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';

import '../../../mocks/list_movie_mock.dart';

void main() {
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

  
  const tMovieDetailModel = MovieDetailModel(
    tagline: 'tagline',
    overview: 'overview',
    genresEntity: [
      GenresModel(
        id: 10,
        genre: 'genre',
      ),
    ],
    movieVideo: 'movieVideo',
    posterPath: 'posterPath',
    originalTitle: 'originalTitle',
  );
  test('should be a subclass of MovieEntity', () {
    expect(tMovieListModel, isA<MovieListEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(tListMovieMock);
    final result = MovieListModel.fromJson(jsonMap);
    expect(result, tMovieListModel);
  });
}
