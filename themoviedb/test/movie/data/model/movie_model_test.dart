import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';

import '../../../mocks/movie_mock.dart';

void main() {
  const tMovieModel = MovieModel(
    id: 631843,
    originalTitle: 'Old',
    posterPath: '/vclShucpUmPhdAOmKgf3B3Z4POD.jpg',
    overview:
        'A group of families.',
    releaseDate: '2021-07-21',
    voteAverage: 6.7,
  );
  test('should be a subclass of MovieEntity', () {
    expect(tMovieModel, isA<MovieEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(tMovieMock);
    final result = MovieModel.fromJson(jsonMap);
    expect(result, tMovieModel);
  });
  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "id":631843,
      "original_title":"Old",
      "overview":"A group of families.",
      "vote_average":6.7,
      "release_date":"2021-07-21",
      "poster_path":"/vclShucpUmPhdAOmKgf3B3Z4POD.jpg",
    };
    // Act
    final result = tMovieModel.toDataBase();
    // Assert
    expect(result, expectedMap);
  });
}
