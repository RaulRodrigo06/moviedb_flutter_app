import 'package:get_it/get_it.dart';
import 'package:themoviedb/core/response/api_request_manager.dart';
import 'package:themoviedb/core/response/i_api_request_manager.dart';
import 'package:themoviedb/core/sqflite/database.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/movies/data/datasource/i_movie_datasource.dart';
import 'package:themoviedb/movies/data/datasource/movie_datasource.dart';
import 'package:themoviedb/movies/data/repository/movie_repository.dart';
import 'package:themoviedb/movies/domain/repository/i_movie_repository.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_video_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_detail_cubit.dart';

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
    () => GetTopRatedMovieUsecase(
      repository: injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetMovieDetailUsecase(
      repository: injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetMovieVideoUsecase(
      repository: injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetPopularMovieUsecase(
      repository: injector(),
    ),
  );
  injector.registerFactory<IDataBase>(
    () => DataBase(),
  );
  injector.registerFactory(
    () => MovieCubit(
      getPopularMovieUsecase: injector(),
      getTopRatedMovieUsecase: injector(),
      dataBase: injector(),
    ),
  );

  injector.registerFactory(
    () => FavoriteMovieCubit(
      dataBase: injector(),
    ),
  );
  injector.registerFactory(
    () => MovieDetailCubit(
      getMovieDetailUsecase: injector(),
      getMovieVideoUsecase: injector(),
    ),
  );
}
