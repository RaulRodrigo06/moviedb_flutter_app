import 'package:themoviedb/core/response/states/erro.dart';
import 'package:dartz/dartz.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';

class GetMovieVideoUsecase {
  const GetMovieVideoUsecase({
    required IMovieRepository repository,
  }) : _repository = repository;
  final IMovieRepository _repository;

  Future<Either<Erro, MovieVideoListEntity>> call({required int id}) async {
    return _repository.getMovieVideo(id: id);
  }
}
