import 'package:themoviedb/movies/data/model/movie_video_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';

class MovieVideoListModel extends MovieVideoListEntity {
  const MovieVideoListModel({
    required List<MovieVideoEntity> listMovieVideoList,
  }) : super(
          listMovieVideoEntity: listMovieVideoList,
        );

  factory MovieVideoListModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoListModel(
      listMovieVideoList: (json['results'] as List)
          .map(
            (e) => MovieVideoModel.fromJson(e),
          )
          .toList(),
    );
  }
}
