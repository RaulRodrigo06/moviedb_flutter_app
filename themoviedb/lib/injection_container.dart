import 'package:get_it/get_it.dart';
import 'package:themoviedb/core/response/api_request_manager.dart';
import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/sqflite/database.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';
import 'package:themoviedb/movies/data/datasource/movie_datasource.dart';
import 'package:themoviedb/movies/data/repository/movie_repository.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory<IApiRequestManager>(
    () => ApiRequestManager(),
  );
  injector.registerLazySingleton<IMovieDatasource>(
    () => MovieDatasource(
      iApiRequestManager: injector(),
    ),
  );

  injector.registerLazySingleton<IMovieRepository>(
    () => MovieRepository(
      datasource: injector(),
    ),
  );

  injector.registerLazySingleton(
    () => GetPopularMovieUsecase(
      repository: injector(),
    ),
  );
  injector.registerFactory(
    () => MovieCubit(
      getPopularMovieUsecase: injector(),
    ),
  );
  injector.registerLazySingleton<IDataBase>(
    () => DataBase(),
  );
  injector.registerFactory(
    () => FavoriteMovieCubit(),
  );
}
