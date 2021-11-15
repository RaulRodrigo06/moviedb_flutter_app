import 'package:themoviedb/movies/domain/entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    required int id,
    required String genre,
  }) : super(
          id: id,
          genre: genre,
        );

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      genre: json['name'],
    );
  }
}
