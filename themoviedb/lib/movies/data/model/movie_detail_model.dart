import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/domain/entities/genres_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  const MovieDetailModel({
    required String tagline,
    required String overview,
    required List<GenresEntity> genresEntity,
    required String movieVideo,
    required String posterPath,
    required String originalTitle,
  }) : super(
          tagline: tagline,
          overview: overview,
          genresEntity: genresEntity,
          movieVideo: movieVideo,
          posterPath: posterPath,
          originalTitle: originalTitle,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      tagline: json['tagline'],
      genresEntity: (json['genres'] as List)
          .map(
            (e) => GenresModel.fromJson(e),
          )
          .toList(),
      movieVideo: '',
    );
  }
}
