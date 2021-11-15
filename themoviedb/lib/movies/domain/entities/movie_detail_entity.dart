import 'package:equatable/equatable.dart';
import 'package:themoviedb/movies/domain/entities/genres_entity.dart';

class MovieDetailEntity extends Equatable {
  const MovieDetailEntity({
    required this.tagline,
    required this.overview,
    required this.genresEntity,
    required this.movieVideo,
    required this.posterPath,
    required this.originalTitle,
  });
  final String tagline;
  final String overview;
  final List<GenresEntity> genresEntity;
  final String movieVideo;
  final String posterPath;
  final String originalTitle;

  @override
  List<Object?> get props => [
        tagline,
        overview,
        genresEntity,
        originalTitle,
        movieVideo,
        posterPath,
      ];
}
