import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/core/sqflite/table_names.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  FavoriteMovieCubit({
    required this.dataBase,
  }) : super(FavoriteMovieInitialState());

  final IDataBase dataBase;
  List<MovieEntity> listFavoriteMovies = [];
  Future<void> addFavoriteMovie(MovieEntity movieEntity) async {
    emit(FavoriteMovieLoadingState());
    final favoritesFromDatabase = await dataBase.getAll(
      TableNames.favoriteTable,
      MovieModel.fromDatabase,
    );
    if (favoritesFromDatabase.contains(movieEntity)) {
      await dataBase.delete(
        TableNames.favoriteTable,
        where: 'id',
        whereArgs: [movieEntity.id],
      );
    } else {
      await dataBase.insert(
        TableNames.favoriteTable,
        MovieModel(
          id: movieEntity.id,
          originalTitle: movieEntity.originalTitle,
          posterPath: movieEntity.posterPath,
          overview: movieEntity.overview,
          releaseDate: movieEntity.releaseDate,
          voteAverage: movieEntity.voteAverage,
        ).toDataBase(),
      );
    }
    listFavoriteMovies = await dataBase.getAll(
      TableNames.favoriteTable,
      MovieModel.fromDatabase,
    );
    List<MovieEntity> generateList = List.from(listFavoriteMovies);
    emit(
      FavoriteMovieLoadedState(
        movieListEntity: generateList,
      ),
    );
  }

  Future<void> getFavoriteMovies() async {
    final favoritesFromDatabase = await dataBase.getAll(
      TableNames.favoriteTable,
      MovieModel.fromDatabase,
    );

    emit(
      FavoriteMovieLoadedState(
        movieListEntity: favoritesFromDatabase,
      ),
    );
  }
}
