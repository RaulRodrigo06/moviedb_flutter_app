import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetPopularMovieUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetPopularMovieUsecase(repository: repository);
  });
  const tMovieEntity = MovieEntity(
    id: 631843,
    originalTitle: 'Old',
    posterPath: '/vclShucpUmPhdAOmKgf3B3Z4POD.jpg',
    overview: 'A group of families.',
    releaseDate: '2021-07-21',
    voteAverage: 6.7,
  );
  const tMovieListEntity = MovieListEntity(
    movieList: [tMovieEntity],
    pageNumber: 4,
    totalPages: 500,
  );
  test('should get ListMovieEntity for a given date from the repository',
      () async {
    when(
      () => repository.getPopularMovieList(
        page: 1,
      ),
    ).thenAnswer(
      (_) async => const Right(
        tMovieListEntity,
      ),
    );

    final result = await usecase.call(page: 1);

    expect(result, const Right<Erro, MovieListEntity>(tMovieListEntity));
    verify(() => repository.getPopularMovieList(page: 1)).called(1);
  });

  test('should return a error when don\'t succeed', () async {
    when(() => repository.getPopularMovieList(page: 1)).thenAnswer(
      (_) async => Left<Erro, MovieListEntity>(
        Erro(statusMessage: ''),
      ),
    );
    final result = await usecase(page: 1);
    expect(result, isA<Left<Erro, MovieListEntity>>());
    verify(() => repository.getPopularMovieList(page: 1)).called(1);
  });
}
