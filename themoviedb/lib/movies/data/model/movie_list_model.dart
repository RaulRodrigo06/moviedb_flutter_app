import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';

class MovieListModel extends MovieListEntity {
  const MovieListModel({
    required List<MovieEntity> movieList,
    required int pageNumber,
    required int totalPages,
  }) : super(
          movieList: movieList,
          totalPages: totalPages,
          pageNumber: pageNumber,
        );

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      movieList: (json['results'] as List)
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'],
      pageNumber: json['page'],
    );
  }
}
