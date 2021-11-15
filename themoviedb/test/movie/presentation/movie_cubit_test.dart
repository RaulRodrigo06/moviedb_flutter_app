import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_list_entity.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';

class _MockGetPopularMovieUsecase extends Mock
    implements GetPopularMovieUsecase {}

class _MockGetTopRatedUseCase extends Mock implements GetTopRatedMovieUsecase {}

class _MockDataBase extends Mock implements IDataBase {}

void main() {
  late GetPopularMovieUsecase mockGetPopularMovieUsecase;
  late GetTopRatedMovieUsecase mockGetTopRatedMovieUsecase;
  late IDataBase iDataBase;
  late MovieCubit cubit;

  setUp(
    () {
      mockGetPopularMovieUsecase = _MockGetPopularMovieUsecase();
      mockGetTopRatedMovieUsecase = _MockGetTopRatedUseCase();
      iDataBase = _MockDataBase();

      cubit = MovieCubit(
        getPopularMovieUsecase: mockGetPopularMovieUsecase,
        getTopRatedMovieUsecase: mockGetTopRatedMovieUsecase,
        dataBase: iDataBase,
      );
    },
  );

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

  group('Test MovieCubit', () {
    test('Should return MovieInitialState as initial state', () {
      expect(cubit.state, MovieInitialState());
    });
    blocTest<MovieCubit, MovieState>(
      'Should emit LoadedState cubit',
      build: () {
        when(() => mockGetPopularMovieUsecase.call(page: 1)).thenAnswer(
          (_) async => const Right(
            tMovieListEntity,
          ),
        );

        when(() => mockGetTopRatedMovieUsecase.call(page: 1)).thenAnswer(
          (_) async => const Right(
            tMovieListEntity,
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.getPopularMovieList(),
      expect: () => <dynamic>[
        MovieLoadingState(),
        MovieLoadedState(tMovieListEntity.movieList),
      ],
    );
  });
}
