import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.id,
    required this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.poster,
  });

  final String? posterPath;
  final String? overview;
  final String? releaseDate;
  final int id;
  final String originalTitle;
  final double? voteAverage;
  final Image? poster;

  @override
  List<dynamic> get props => [
        posterPath,
        overview,
        releaseDate,
        id,
        originalTitle,
        voteAverage,
        poster
      ];
}
