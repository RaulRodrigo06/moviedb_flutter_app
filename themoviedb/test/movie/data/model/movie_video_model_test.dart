import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/movies/data/model/movie_video_list_model.dart';
import 'package:themoviedb/movies/data/model/movie_video_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';

import '../../../mocks/movie_video_mock.dart';

void main() {
  const tMovieVideoModel = MovieVideoModel(
    key: 'XK-MIqHz5tU',
    type: 'Clip',
    title: 'VENOM: LET THERE BE CARNAGE - Burj Khalifa Takeover',
  );

  const tMovieVideoListModel =
      MovieVideoListModel(listMovieVideoList: [tMovieVideoModel]);

  test('should be a subclass of MovieVideoEntity', () {
    expect(tMovieVideoListModel, isA<MovieVideoListEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(tMovieVideoMock);
    final result = MovieVideoListModel.fromJson(jsonMap);
    expect(result, tMovieVideoListModel);
  });
}
