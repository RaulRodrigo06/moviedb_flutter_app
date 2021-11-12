import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.id,
    required this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  final String? posterPath;
  final String? overview;
  final String? releaseDate;
  final int id;
  final String originalTitle;
  final double? voteAverage;

  @override
  List<dynamic> get props => [
        posterPath,
        overview,
        releaseDate,
        id,
        originalTitle,
        voteAverage,
      ];
}
