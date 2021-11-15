import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/movies/domain/entities/movie_video_list_entity.dart';
import 'package:themoviedb/movies/domain/entities/movies_video_entity.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_video_usecase.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMovieVideoUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieVideoUsecase(repository: repository);
  });

  const tMovieVideo = MovieVideoEntity(
    key: 'XK-MIqHz5tU',
    type: 'Clip',
    title: 'VENOM: LET THERE BE CARNAGE - Burj Khalifa Takeover',
  );

  const tMovieListVideo =
      MovieVideoListEntity(listMovieVideoEntity: [tMovieVideo]);
  test('should get MovieListVideoEntity for a given date from the repository',
      () async {
    when(
      () => repository.getMovieVideo(
        id: 1,
      ),
    ).thenAnswer(
      (_) async => const Right(
        tMovieListVideo,
      ),
    );

    final result = await usecase.call(id: 1);

    expect(result, const Right<Erro, MovieVideoListEntity>(tMovieListVideo));
    verify(() => repository.getMovieVideo(id: 1)).called(1);
  });

  test('should return a error when don\'t succeed', () async {
    when(() => repository.getMovieVideo(id: 1)).thenAnswer(
      (_) async => Left<Erro, MovieVideoListEntity>(
        Erro(statusMessage: ''),
      ),
    );
    final result = await usecase(id: 1);
    expect(result, isA<Left<Erro, MovieVideoListEntity>>());
    verify(() => repository.getMovieVideo(id: 1)).called(1);
  });
}
