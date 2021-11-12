import 'package:themoviedb/core/response/states/erro.dart';
import 'package:dartz/dartz.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';

class GetTopRatedMovieUsecase {
  const GetTopRatedMovieUsecase({
    required IMovieRepository repository,
  }) : _repository = repository;
  final IMovieRepository _repository;

  Future<Either<Erro, MovieListEntity>> call({required int page}) async {
    return _repository.getTopRatedMovieList(page: page);
  }
}
