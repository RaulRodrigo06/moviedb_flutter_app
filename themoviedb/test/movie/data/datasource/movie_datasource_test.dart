import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/response/states/api_result.dart';
import 'package:themoviedb/core/response/states/erro.dart';
import 'package:themoviedb/core/response/states/success.dart';
import 'package:themoviedb/movies/data/datasource/movie_datasource.dart';

import '../../../mocks/list_movie_mock.dart';

class MockIApiRequestManager extends Mock implements IApiRequestManager {}

void main() {
  late MovieDatasource datasource;
  late IApiRequestManager iApiRequestManager;

  setUp(() {
    iApiRequestManager = MockIApiRequestManager();
    datasource = MovieDatasource(
      iApiRequestManager: iApiRequestManager,
    );
  });

  void successMock() {
    when(() => iApiRequestManager.getAsync(any())).thenAnswer(
      (_) async => Future<Success>.value(
        Success(
          data: tListMovieMock,
          statusCode: 200,
        ),
      ),
    );
  }

  void errorMock() {
    when(() => iApiRequestManager.getAsync(any())).thenAnswer(
      (_) async => Future<Erro>.value(
        Erro(
          statusCode: 400,
          statusMessage: 'error',
        ),
      ),
    );
  }

  test('should return a Sucess when the call is successful', () async {
    successMock();
    final result = await datasource.getMoviesMostPopular(page: 1);
    expect(result, isA<Success>());
  });
  test('should throw a FutureApiResult when the call is unccessful', () async {
    errorMock();
    final result = datasource.getMoviesMostPopular(page: 1);
    expect(result, isA<Future<ApiResult>>());
  });
}
