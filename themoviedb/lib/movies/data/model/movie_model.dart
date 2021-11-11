import 'package:themoviedb/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required int id,
    String? posterPath,
    String? overview,
    String? releaseDate,
    required String originalTitle,
    double? voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          overview: overview,
          releaseDate: releaseDate,
          originalTitle: originalTitle,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        originalTitle: json['original_title'],
        voteAverage: json['vote_average'].toDouble());
  }
}
