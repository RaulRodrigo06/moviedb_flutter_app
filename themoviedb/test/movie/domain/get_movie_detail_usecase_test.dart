import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/movies/data/model/genres_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_video_usecase.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMovieDetailUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieDetailUsecase(repository: repository);
  });

  const tGenres = [
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
    )
  ];
  const tMovieDetail = MovieDetailEntity(
    tagline: '',
    overview:
        'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
    genresEntity: tGenres,
    movieVideo: '',
    posterPath: '/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
    originalTitle: 'Venom: Let There Be Carnage',
  );
  
  test('should get MovieDetailEntity for a given date from the repository',
      () async {
    when(
      () => repository.getMovieDetails(
        id: 1,
      ),
    ).thenAnswer(
      (_) async => const Right(
        tMovieDetail,
      ),
    );

    final result = await usecase.call(id: 1);

    expect(result, const Right<Erro, MovieDetailEntity>(tMovieDetail));
    verify(() => repository.getMovieDetails(id: 1)).called(1);
  });

  test('should return a error when don\'t succeed', () async {
    when(() => repository.getMovieDetails(id: 1)).thenAnswer(
      (_) async => Left<Erro, MovieDetailEntity>(
        Erro(statusMessage: ''),
      ),
    );
    final result = await usecase(id: 1);
    expect(result, isA<Left<Erro, MovieDetailEntity>>());
    verify(() => repository.getMovieDetails(id: 1)).called(1);
  });
}
