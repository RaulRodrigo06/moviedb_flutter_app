import 'package:equatable/equatable.dart';
import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';

class MovieVideoListEntity extends Equatable {
  const MovieVideoListEntity({required this.listMovieVideoEntity});
  final List<MovieVideoEntity> listMovieVideoEntity;

  
  @override
  List<Object?> get props => [listMovieVideoEntity];
}
