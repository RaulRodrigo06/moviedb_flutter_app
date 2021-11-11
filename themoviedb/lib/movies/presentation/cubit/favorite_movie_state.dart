part of 'favorite_movie_cubit.dart';

@immutable
abstract class FavoriteMovieState extends Equatable {}

class FavoriteMovieInitialState extends FavoriteMovieState {
  @override
  List<Object?> get props => [];
}

class FavoriteMovieLoadingState extends FavoriteMovieState {
  @override
  List<Object?> get props => [];
}

class FavoriteMovieLoadedState extends FavoriteMovieState {
  FavoriteMovieLoadedState(this.movieListEntity);
  final List<MovieEntity> movieListEntity;

  @override
  List<Object?> get props => [movieListEntity];
}
