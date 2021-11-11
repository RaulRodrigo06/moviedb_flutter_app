import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  FavoriteMovieCubit() : super(FavoriteMovieInitialState());
  List<MovieEntity> movieListEntity = [];
  Future<void> addFavoriteMovie(MovieEntity movieEntity) async {
    if (movieListEntity.contains(movieEntity)) {
      movieListEntity.remove(movieEntity);
    } else {
      movieListEntity.add(movieEntity);
    }

    emit(
      FavoriteMovieLoadedState(
        movieListEntity,
      ),
    );
    emit(FavoriteMovieInitialState());
  }
}
