import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_video_usecase.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_detail_cubit.dart';

class _MockGetMovieDetailUsecase extends Mock implements GetMovieDetailUsecase {
}

class _MockGetMovieVideoUseCase extends Mock implements GetMovieVideoUsecase {}

void main() {
  late GetMovieDetailUsecase mockGeMovieDetailUsecase;
  late GetMovieVideoUsecase mockGetMovieVideoUsecase;
  late MovieDetailCubit cubit;

  setUp(
    () {
      mockGeMovieDetailUsecase = _MockGetMovieDetailUsecase();
      mockGetMovieVideoUsecase = _MockGetMovieVideoUseCase();

      cubit = MovieDetailCubit(
        getMovieDetailUsecase: mockGeMovieDetailUsecase,
        getMovieVideoUsecase: mockGetMovieVideoUsecase,
      );
    },
  );

  const tMovieDetailEntity = MovieDetailEntity(
    overview:
        'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
    genresEntity: [
      GenresModel(
        id: 878,
        genre: 'Science Fiction',
      ),
      GenresModel(
        id: 28,
        genre: 'Action',
      ),
      GenresModel(
        id: 12,
        genre: 'Adventure',
      ),
    ],
    movieVideo: '',
    posterPath: '/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
    originalTitle: 'Venom: Let There Be Carnage',
    tagline: '',
  );

  const tMovieVideo = MovieVideoEntity(
    key: 'XK-MIqHz5tU',
    type: 'Clip',
    title: 'VENOM: LET THERE BE CARNAGE - Burj Khalifa Takeover',
  );

  const tMovieListVideo =
      MovieVideoListEntity(listMovieVideoEntity: [tMovieVideo]);

  group('Test MovieDetailCubit', () {
    test('Should return MovieDetailInitial as initial state', () {
      expect(cubit.state, MovieDetailInitial());
    });
    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit LoadedState cubit',
      build: () {
        when(() => mockGeMovieDetailUsecase.call(id: 1)).thenAnswer(
          (_) async => const Right(
            tMovieDetailEntity,
          ),
        );

        when(() => mockGetMovieVideoUsecase.call(id: 1)).thenAnswer(
          (_) async => const Right(
            tMovieListVideo,
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.getMovieDetail(id: 1),
      expect: () => <dynamic>[
        MovieDetailLoading(),
        MovieDetailLoaded(
          movieDetailEntity: MovieDetailEntity(
            tagline: tMovieDetailEntity.tagline,
            overview: tMovieDetailEntity.overview,
            genresEntity: tMovieDetailEntity.genresEntity,
            movieVideo: tMovieListVideo.listMovieVideoEntity.first.key,
            posterPath: tMovieDetailEntity.posterPath,
            originalTitle: tMovieDetailEntity.originalTitle,
          ),
        ),
      ],
    );
  });
}
