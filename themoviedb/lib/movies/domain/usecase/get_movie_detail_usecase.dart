import 'package:themoviedb/core/response/states/erro.dart';
import 'package:dartz/dartz.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';

class GetMovieDetailUsecase {
  const GetMovieDetailUsecase({
    required IMovieRepository repository,
  }) : _repository = repository;
  final IMovieRepository _repository;

  Future<Either<Erro, MovieDetailEntity>> call({required int id}) async {
    return _repository.getMovieDetails(id: id);
  }
}
