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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'poster_path': posterPath,
      'overview': overview,
      'release_date': releaseDate,
      'original_title': originalTitle,
      'vote_average': voteAverage,
    };
  }
}
