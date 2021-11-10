import 'package:equatable/equatable.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';

class MovieListEntity extends Equatable {
  final List<MovieEntity> movieList;
  final int pageNumber;
  final int totalPages;
  const MovieListEntity({
    required this.movieList,
    required this.pageNumber,
    required this.totalPages,
  });
  @override
  List<Object?> get props => [
        movieList,
        pageNumber,
        totalPages,
      ];
}
