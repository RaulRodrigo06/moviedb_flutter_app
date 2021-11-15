import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/data/model/movie_detail_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';

import '../../../mocks/movie_detail_mock.dart';

void main() {
  const tMovieDetailModel = MovieDetailModel(
    overview:
        'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
    genresEntity: [
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
      ),
    ],
    movieVideo: '',
    posterPath: '/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
    originalTitle: 'Venom: Let There Be Carnage',
    tagline: '',
  );

  test('should be a subclass of MovieDetailEntity', () {
    expect(tMovieDetailModel, isA<MovieDetailEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(tMovieDetailMock);
    final result = MovieDetailModel.fromJson(jsonMap);
    expect(result, tMovieDetailModel);
  });
}
