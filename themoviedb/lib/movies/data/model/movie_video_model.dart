import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';

class MovieVideoModel extends MovieVideoEntity {
  const MovieVideoModel({
    required String key,
    required String type,
    required String title,
  }) : super(
          key: key,
          title: title,
          type: type,
        );
  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      key: json['key'],
      title: json['name'],
      type: json['type'],
    );
  }
}
